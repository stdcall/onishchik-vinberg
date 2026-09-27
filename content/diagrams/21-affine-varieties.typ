// Diagrams of Theorem 8 in Chapter 2, § 1 (pages 70-71). The book
// sets rational maps as dotted arrows, and the proof has two opposite
// arrows between L and N.
#import "commutative.typ": cd, edge, node

// Theorem 8: the rational map g closes the triangle, h = g f.
#let factorization = cd(
  cell-size: (11mm, 20mm),
  $M & & P \ & N$,
  edge((0, 0), "rr", $h$, "->"),
  edge((0, 0), "dr", $f$, "->", label-side: right),
  edge((1, 1), "ur", $g$, "..>", label-side: right),
)

// Proof of Theorem 8: L is the closure of the image of l = (f, h), k is
// inverse to p_1, and g = p_2 k. N stands lower than the grid to leave room
// for the two arrows between L and N. Three arrows end at P and two at the
// top of N: the ends of p_2, g and f are moved apart along the borders.
#let factorization-proof = cd(
  cell-size: (24mm, 14mm),
  node((0, 0), $M$),
  node((2, 0), $P$),
  node((1, 1), $L$),
  node((1, 2.5), $N$),
  edge((0, 0), (2, 0), $h$, "->"),
  edge((0, 0), (1, 1), $l$, "->", label-side: left),
  edge((1, 1), (2, 0), $p_2$, "->", label-side: left, shift: (0pt, -2pt)),
  edge((0, 0), (1, 2.5), $f$, "->", label-side: right, shift: (0pt, -3pt)),
  edge((1, 1), (1, 2.5), $p_1$, "->", label-side: right, shift: -0.8mm),
  edge((1, 2.5), (1, 1), $k$, "..>", label-side: right, shift: -0.8mm),
  edge((1, 2.5), (2, 0), $g$, "..>", label-side: right, shift: (0pt, -3pt)),
)
