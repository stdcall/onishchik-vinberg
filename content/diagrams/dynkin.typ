// Dynkin, extended Dynkin, Kac and Satake diagrams of the book in CeTZ.
// Vertices stand on a grid; bonds, dotted gaps, arrows and labels are drawn
// from vertex border to vertex border, so only the grid is measured.
//
//   #dynkin(
//     (
//       a: v(0, 0, label: $1$),
//       b: v(1, 0, label: $2$),
//       c: v(2, 0, black: true),
//       d: v(3, 0, label: $2$, at: "below"),
//     ),
//     (bond("a", "b"), gap("b", "c"), bond("c", "d", 2, to: "d")),
//   )
//
// `v(x, y)`: x to the right, y upwards, in grid units. `black: true` is a
// filled vertex (Kac and Satake diagrams); `label` is set `at` "above"
// (default), "below", "left", "right" or a compass direction such as
// "north-west" (clear of the edges at a branch vertex).
// `bond(a, b)` is a single bond, `bond(a, b, n)` an n-fold bond (n = 2, 3);
// `to:` names the vertex the arrow of a multiple bond points to. n = 4 is the
// bond of the rank-one affine diagrams: A_1^(1) (no `to`), four lines whose
// outer two wrap round both vertices; A_2^(2) (`to:` the second vertex), the
// outer lines wrap round the first vertex and meet in an arrowhead.
// `gap(a, b)` is the "- ··· -" of a series. `pair(a, b)` is the
// double-headed arrow of a Satake diagram joining two vertices; `bend`
// curves it (degrees, positive to the left of a -> b).
#import "@preview/cetz:0.5.2"

#let v(x, y, black: false, label: none, at: "above") = (
  x: x,
  y: y,
  black: black,
  label: label,
  at: at,
)
#let bond(a, b, ..n, to: none) = (
  kind: "bond",
  a: a,
  b: b,
  n: n.pos().at(0, default: 1),
  to: to,
)
#let gap(a, b) = (kind: "gap", a: a, b: b)
#let pair(a, b, bend: 0deg) = (kind: "pair", a: a, b: b, bend: bend)

// Where a label stands and which side of it faces the vertex.
#let label-sides = (
  above: ("north", "south"),
  below: ("south", "north"),
  left: ("west", "east"),
  right: ("east", "west"),
  north: ("north", "south"),
  south: ("south", "north"),
  east: ("east", "west"),
  west: ("west", "east"),
  north-west: ("north-west", "south-east"),
  north-east: ("north-east", "south-west"),
  south-west: ("south-west", "north-east"),
  south-east: ("south-east", "north-west"),
)

#let dynkin(vertices, edges, unit: 7.5mm, radius: 0.85mm) = cetz.canvas(
  length: 1mm,
  {
    import cetz.draw: *
    set-style(stroke: 0.5pt, content: (padding: 0.9))
    let u = unit / 1mm
    let r = radius / 1mm
    let at(name) = {
      let vertex = vertices.at(name)
      (vertex.x * u, vertex.y * u)
    }
    // Direction, normal and length of the segment between two vertices.
    let frame(a, b) = {
      let (x1, y1) = at(a)
      let (x2, y2) = at(b)
      let length = calc.sqrt(calc.pow(x2 - x1, 2) + calc.pow(y2 - y1, 2))
      let d = ((x2 - x1) / length, (y2 - y1) / length)
      (from: (x1, y1), d: d, n: (-d.at(1), d.at(0)), length: length)
    }
    // Point at distance s along the segment, shifted by t along the normal.
    let along(f, s, t) = (
      f.from.at(0) + s * f.d.at(0) + t * f.n.at(0),
      f.from.at(1) + s * f.d.at(1) + t * f.n.at(1),
    )
    // Where a line at normal offset t meets the circle of a vertex.
    let inset(t) = calc.sqrt(calc.max(r * r - t * t, 0))
    // Arrowhead with its tip at distance `tip` along the segment, pointing
    // forwards (sign 1) or backwards (-1), barbs `half` off the axis.
    let arrowhead(f, tip, sign, half) = {
      let back = tip - sign * 1.5
      line(along(f, back, half), along(f, tip, 0), along(f, back, -half))
    }

    for edge in edges {
      let f = frame(edge.a, edge.b)
      if edge.kind == "bond" and edge.n <= 3 {
        let spacing = 0.42
        for i in range(edge.n) {
          let t = (i - (edge.n - 1) / 2) * spacing
          line(along(f, inset(t), t), along(f, f.length - inset(t), t))
        }
        if edge.to != none {
          // The arrowhead of a multiple bond touches the shorter root.
          let sign = if edge.to == edge.b { 1 } else { -1 }
          let tip = if sign == 1 { f.length - r - 0.25 } else { r + 0.25 }
          arrowhead(f, tip, sign, (edge.n - 1) / 2 * spacing + 0.75)
        }
      } else if edge.kind == "bond" {
        // The rank-one affine bond: four evenly spaced lines, the outer two
        // a third of the radius outside the vertices (after the book).
        let outer = 4 / 3 * r
        let inner = outer / 3
        let around(s) = arc-through(
          along(f, s, outer),
          along(f, s - outer, 0),
          along(f, s, -outer),
        )
        around(0)
        if edge.to == none {
          // A_1^(1): the outer lines close round both vertices.
          arc-through(
            along(f, f.length, outer),
            along(f, f.length + outer, 0),
            along(f, f.length, -outer),
          )
          for s in (1, -1) {
            line(along(f, 0, s * outer), along(f, f.length, s * outer))
            line(
              along(f, inset(inner), s * inner),
              along(f, f.length - inset(inner), s * inner),
            )
          }
        } else {
          // A_2^(2): the outer lines meet in an arrowhead at the second
          // vertex (`to` is taken to be the second vertex).
          let tip = f.length - r - 0.25
          let back = tip - 1.5
          let half = outer + 0.35
          let edge-at(t) = back + (tip - back) * (half - t) / half
          for s in (1, -1) {
            line(along(f, 0, s * outer), along(f, edge-at(outer), s * outer))
            line(
              along(f, inset(inner), s * inner),
              along(f, edge-at(inner), s * inner),
            )
          }
          line(along(f, back, half), along(f, tip, 0), along(f, back, -half))
        }
      } else if edge.kind == "gap" {
        let stub = calc.min(1.6, f.length / 4)
        line(along(f, r, 0), along(f, r + stub, 0))
        line(along(f, f.length - r - stub, 0), along(f, f.length - r, 0))
        for k in (-1, 0, 1) {
          circle(
            along(f, f.length / 2 + k * 1.4, 0),
            radius: 0.22,
            fill: black,
            stroke: none,
          )
        }
      } else if edge.kind == "pair" {
        // Satake arrows have filled heads in the book.
        let marks = (start: ">", end: ">", fill: black, scale: 0.55)
        let start = along(f, r + 0.6, 0)
        let end = along(f, f.length - r - 0.6, 0)
        if edge.bend == 0deg {
          line(start, end, mark: marks)
        } else {
          let middle = along(
            f,
            f.length / 2,
            calc.tan(edge.bend) * f.length / 2,
          )
          arc-through(start, middle, end, mark: marks)
        }
      }
    }
    for (name, vertex) in vertices {
      circle(
        at(name),
        radius: r,
        fill: if vertex.black { black } else { white },
        name: name,
      )
      if vertex.label != none {
        let (side, anchor) = label-sides.at(vertex.at)
        content(
          name + "." + side,
          text(size: 0.75em, vertex.label),
          anchor: anchor,
        )
      }
    }
  },
)
