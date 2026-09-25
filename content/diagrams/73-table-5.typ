// Fig. 2 of the Reference Chapter, § 2 (page 299): the set Delta(p, q) of
// Table 5, drawn for q = 2. The printed figure gives the unit steps along
// the axes, the position of p and the lengths of the axes (millimetres of
// the printed page; the canvas enlarges them with our larger type). The
// points
// are the pairs (x, y) with x + y <= p + q, x - y >= p - q and
// x - y = p - q (mod 2); the triangle and the level q are drawn through the
// extreme ones. The book letters the axes upright; the labels here are the
// italic p, q, x, y of the text.
#import "@preview/cetz:0.5.2"

#let delta-pq = cetz.canvas(length: 1.2mm, {
  import cetz.draw: *
  let (unit-x, unit-y) = (6.6, 8.05)
  let (p, q) = (27.0, 2)
  let (width, height) = (56.0, 32.0)
  set-style(
    stroke: 0.5pt,
    line: (mark: (end: "stealth", fill: black, length: 3, width: 1.6)),
    circle: (fill: black, stroke: none, radius: 0.95),
    content: (padding: 1.2),
  )
  // The point x = p + dx, y.
  let at(dx, y) = (p + dx * unit-x, y * unit-y)

  line((0, 0), (width, 0))
  line((0, 0), (0, height))
  line((0, q * unit-y), at(0, q), mark: none)
  line(at(-q, 0), at(0, q), at(q, 0), mark: none, stroke: 0.8pt)
  for y in range(q + 1) {
    for dx in range(-q, q + 1) {
      if calc.abs(dx) + y <= q and calc.rem(dx + y + q, 2) == 0 {
        circle(at(dx, y))
      }
    }
  }

  content((0, height - 3.2), $y$, anchor: "east")
  content((0, q * unit-y), $q$, anchor: "east")
  content((width - 3, 0), $x$, anchor: "north", padding: 3.5)
  content(at(-q, 0), $p - q$, anchor: "north", padding: 2.8)
  content(at(0, 0), $p$, anchor: "north", padding: 2.8)
  content(at(q, 0), $p + q$, anchor: "north", padding: 2.8)
})
