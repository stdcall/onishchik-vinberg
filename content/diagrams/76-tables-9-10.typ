// Satake diagrams of the real forms E II and E III of E_6 (Table 9, page
// 315). Their double-headed arrows arch over the chain
// 1-2-3-4-5: from above vertex 1 to above vertex 5 and from above vertex 2
// to above vertex 4. The `pair(bend: ...)` of dynkin.typ starts and ends its
// arc on the chord between the two vertices, so over a chain its heads would
// lie on the bonds next to the end vertices; here the arcs start above the
// vertices, as in the book. Vertices, bonds, labels and arrowheads are drawn
// as in dynkin.typ. Geometry from the book (grid units): the tips stand
// 0.25 above the vertex line and 0.1 inside the end vertices; the outer arc
// rises to 0.85, the inner one to 0.45.
#import "@preview/cetz:0.5.2"

// `filled`: the black vertices; `labels`: vertex -> side of its number
// ("south", "south-east", "east", ...); `arcs`: (from, to, height) triples.
// Vertices are numbered as in Table 1: 1-5 in a row, 6 below 3.
#let e6-arched(
  filled: (),
  labels: (:),
  arcs: (),
  unit: 7.5mm,
  radius: 0.85mm,
) = cetz.canvas(length: 1mm, {
  import cetz.draw: *
  set-style(stroke: 0.5pt, content: (padding: 0.9))
  let u = unit / 1mm
  let r = radius / 1mm
  let grid = (
    "1": (0, 0),
    "2": (1, 0),
    "3": (2, 0),
    "4": (3, 0),
    "5": (4, 0),
    "6": (2, -1),
  )
  let at(name) = grid.at(name).map(c => c * u)
  for (a, b) in (("1", "2"), ("2", "3"), ("3", "4"), ("4", "5"), ("3", "6")) {
    line(at(a), at(b))
  }
  for (a, b, height) in arcs {
    let (x1, _) = at(a)
    let (x2, _) = at(b)
    arc-through(
      (x1 + 0.1 * u, 0.25 * u),
      ((x1 + x2) / 2, height * u),
      (x2 - 0.1 * u, 0.25 * u),
      mark: (start: ">", end: ">", fill: black, scale: 0.55),
    )
  }
  let facing = (
    south: "north",
    south-east: "north-west",
    east: "west",
    north: "south",
  )
  for (name, _) in grid {
    circle(
      at(name),
      radius: r,
      fill: if name in filled { black } else { white },
      name: "v" + name,
    )
    if name in labels {
      let side = labels.at(name)
      content(
        "v" + name + "." + side,
        text(size: 0.75em, name),
        anchor: facing.at(side),
      )
    }
  }
})
