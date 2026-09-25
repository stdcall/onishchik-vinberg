// Diagrams of Theorem 8 in Chapter 2, § 1 (pages 70-71). The book
// sets rational maps as dotted arrows, and the proof has two opposite
// arrows between L and N (cd.typ: `dotted`, `shift`).
#import "cd.typ": ar, cd

// Theorem 8: the rational map g closes the triangle, h = g f.
#let factorization = cd(
  (M: (0, 0, $M$), P: (0, 2, $P$), N: (1, 1, $N$)),
  (
    ar("M", "P", label: $h$),
    ar("M", "N", label: $f$, side: "right"),
    ar("N", "P", label: $g$, side: "right", dotted: true),
  ),
  column: 11mm,
  row: 20mm,
)

// Proof of Theorem 8: L is the closure of the image of l = (f, h), k is
// inverse to p_1, and g = p_2 k.
#let factorization-proof = cd(
  (
    M: (0, 0, $M$),
    P: (0, 2, $P$),
    L: (1, 1, $L$),
    N: (2.5, 1, $N$),
  ),
  (
    ar("M", "P", label: $h$),
    ar("M", "L", label: $l$),
    ar("L", "P", label: $p_2$),
    ar("M", "N", label: $f$, side: "right"),
    ar("L", "N", label: $p_1$, side: "right", shift: -0.8),
    ar("N", "L", label: $k$, side: "right", dotted: true, shift: -0.8),
    ar("N", "P", label: $g$, side: "right", dotted: true),
  ),
  column: 24mm,
  row: 14mm,
)
