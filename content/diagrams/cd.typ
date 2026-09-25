// Commutative diagrams of the book in CeTZ: objects on a grid, arrows from
// border to border with a label beside their middle. The geometry is the
// grid; every arrow end and label position is derived from it.
//
//   #cd(
//     (
//       G: (0, 0, $G times X$),
//       X: (0, 2, $X$),
//       Q: (1, 0, $G\/N times X$),
//     ),
//     (
//       ar("G", "X"),
//       ar("G", "Q", label: $p times id$, side: "right"),
//       ar("Q", "X", dashed: true),
//     ),
//   )
//
// A node is (row, column, body); rows go down, columns right, both may be
// fractional. An arrow `ar(from, to)` takes an optional `label` set on the
// `side` "left" or "right" of the direction of travel (default "left"),
// `kind` ("->" arrow, "|->" maps-to, "hook" embedding, "->>" onto, "--" no
// head), `dashed: true`, `dotted: true` (rational maps; the head stays
// solid) and `shift` (mm, to the left of the direction of travel) for two
// parallel arrows between the same objects. An arrow that would meet another
// at the same point of its target ends at a named anchor of the target box
// instead, `end: "south-west"`, as the book draws it (the hint to Problem
// 32 of Chapter 5, § 3). `column` and `row` set the grid spacing.
#import "@preview/cetz:0.5.2"

#let ar(
  from,
  to,
  label: none,
  side: "left",
  kind: "->",
  dashed: false,
  dotted: false,
  shift: 0,
  end: none,
) = (
  from: from,
  to: to,
  label: label,
  side: side,
  kind: kind,
  dashed: dashed,
  dotted: dotted,
  shift: shift,
  end: end,
)

#let arrow-marks = (
  "->": (end: "straight"),
  "|->": (start: "|", end: "straight"),
  "hook": (start: "hook", end: "straight"),
  "->>": (end: ("straight", "straight")),
  "--": none,
)

#let cd(nodes, arrows, column: 24mm, row: 18mm) = cetz.canvas(
  length: 1mm,
  {
    import cetz.draw: *
    set-style(
      stroke: 0.5pt,
      mark: (scale: 0.75, fill: black, stroke: (dash: "solid")),
      content: (padding: 1.2),
    )
    let point(name) = {
      let node = nodes.at(name)
      (node.at(1) * column / 1mm, -node.at(0) * row / 1mm)
    }
    for (name, node) in nodes {
      content(point(name), node.at(2), name: name)
    }
    for arrow in arrows {
      let (x1, y1) = point(arrow.from)
      let (x2, y2) = point(arrow.to)
      let direction = calc.atan2(x2 - x1, y2 - y1)
      let offset = (
        arrow.shift * calc.cos(direction + 90deg),
        arrow.shift * calc.sin(direction + 90deg),
      )
      let dash = if arrow.dashed { "dashed" } else if arrow.dotted {
        "dotted"
      } else { "solid" }
      line(
        (rel: offset, to: (name: arrow.from, anchor: direction)),
        (
          rel: offset,
          to: (
            name: arrow.to,
            anchor: if arrow.end == none { direction + 180deg } else {
              arrow.end
            },
          ),
        ),
        mark: arrow-marks.at(arrow.kind),
        stroke: (dash: dash, thickness: 0.5pt),
        name: "arrow",
      )
      if arrow.label != none {
        // The label stands on the chosen side of the direction of travel;
        // its anchor is the side of the label box facing the arrow.
        let normal = (
          direction
            + if arrow.side == "left" { 90deg } else {
              -90deg
            }
        )
        // Eight directions: a label beside a diagonal arrow sits off its
        // corner, clear of the line.
        let sectors = (
          "west",
          "south-west",
          "south",
          "south-east",
          "east",
          "north-east",
          "north",
          "north-west",
        )
        let turn = calc.rem-euclid(normal / 1deg + 22.5, 360)
        let anchor = sectors.at(int(turn / 45))
        content("arrow.mid", text(size: 0.8em, arrow.label), anchor: anchor)
      }
    }
  },
)
