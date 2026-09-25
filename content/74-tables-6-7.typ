// Reference Chapter, § 2. Tables: Tables 6 and 7 with their descriptions.
// Printed pages 305-309. Page 305 is shared with the end of Table 5 (the
// description of Table 6 is at its foot), page 309 with the description
// of Table 8.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/dynkin.typ": bond, dynkin, gap, v

// Table 6 is printed as two ruled blocks set one right under the other, so
// that their rules make a double rule: the diagrams X^(1), in two pairs of
// columns under the column heads, and the twisted diagrams X^(2), X^(3),
// whose right pair of columns holds D_4^(3) only. The table is kept on one
// page, as printed.
#let table-6-block(..cells) = book-table(
  columns: (11fr, 37fr, 7fr, 45fr),
  align: center + horizon,
  ..cells,
)
#let table-6(upper, lower) = block(
  breakable: false,
  stack(spacing: 2pt, upper, lower),
)

// Table 7: the column heads, then the automorphisms of each type under the
// row "Type I", "Type II", "Type III", a subhead repeated with the column
// heads while its rows continue on the next page (the book prints it above
// the column heads there).
#let table-7(..rows) = book-table(
  columns: (13fr, 12fr, 44fr, 14fr, 17fr),
  align: center + horizon,
  head: (
    [$frak(g)$],
    [Type of affine diagram],
    [Kac diagram of $theta$],
    [Type of $frak(g)^theta$],
    [Real form],
  ),
  ..rows,
)
#let type-row(kind) = table.header(
  level: 2,
  table.cell(colspan: 5)[Type #kind],
)

#table-section[Affine Dynkin Diagrams] <tab:affine-dynkin-diagrams>
The table lists connected affine Dynkin diagrams. On each diagram there are
indicated the coefficients of the linear relation among vectors of the
corresponding admissible system. They are positive integers normed so as to be
relatively prime (see Problem~@pr:affine-marks-positive-integers).

#source(321)#table-6(
  table-6-block(
    head: ([Type], [Affine diagram], [Type], [Affine diagram]),
    [$ A_l^((1)) \ (l >= 2) $],
    dynkin(
      (
        a: v(0, 0, label: $1$, at: "below"),
        b: v(1, 0, label: $1$, at: "below"),
        c: v(3, 0, label: $1$, at: "below"),
        d: v(4, 0, label: $1$, at: "below"),
        o: v(2, 1, label: $1$),
      ),
      (
        bond("a", "b"),
        gap("b", "c"),
        bond("c", "d"),
        bond("o", "a"),
        bond("o", "d"),
      ),
    ),
    [$E_6^((1))$],
    dynkin(
      (
        a: v(0, 0, label: $1$),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $3$),
        d: v(3, 0, label: $2$),
        e: v(4, 0, label: $1$),
        f: v(2, -1, label: $2$, at: "right"),
        g: v(2, -2, label: $1$, at: "right"),
      ),
      (
        bond("a", "b"),
        bond("b", "c"),
        bond("c", "d"),
        bond("d", "e"),
        bond("c", "f"),
        bond("f", "g"),
      ),
    ),

    [$A_1^((1))$],
    dynkin(
      (
        a: v(0, 0, label: $1$, at: "left"),
        b: v(1, 0, label: $1$, at: "right"),
      ),
      (bond("a", "b", 4),),
    ),
    [$E_7^((1))$],
    dynkin(
      (
        a: v(0, 0, label: $1$),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $3$),
        d: v(3, 0, label: $4$),
        e: v(4, 0, label: $3$),
        f: v(5, 0, label: $2$),
        g: v(6, 0, label: $1$),
        h: v(3, -1, label: $2$, at: "right"),
      ),
      (
        bond("a", "b"),
        bond("b", "c"),
        bond("c", "d"),
        bond("d", "e"),
        bond("e", "f"),
        bond("f", "g"),
        bond("d", "h"),
      ),
    ),

    [$ B_l^((1)) \ (l >= 3) $],
    dynkin(
      (
        o: v(0, 0.5, label: $1$, at: "left"),
        a: v(0, -0.5, label: $1$, at: "left"),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $2$),
        d: v(4, 0, label: $2$),
        e: v(5, 0, label: $2$),
      ),
      (
        bond("o", "b"),
        bond("a", "b"),
        bond("b", "c"),
        gap("c", "d"),
        bond("d", "e", 2, to: "e"),
      ),
    ),
    [$E_8^((1))$],
    dynkin(
      (
        a: v(0, 0, label: $1$),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $3$),
        d: v(3, 0, label: $4$),
        e: v(4, 0, label: $5$),
        f: v(5, 0, label: $6$),
        g: v(6, 0, label: $4$),
        h: v(7, 0, label: $2$),
        i: v(5, -1, label: $3$, at: "right"),
      ),
      (
        bond("a", "b"),
        bond("b", "c"),
        bond("c", "d"),
        bond("d", "e"),
        bond("e", "f"),
        bond("f", "g"),
        bond("g", "h"),
        bond("f", "i"),
      ),
    ),

    [$ C_l^((1)) \ (l >= 2) $],
    dynkin(
      (
        a: v(0, 0, label: $1$, at: "left"),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $2$),
        d: v(4, 0, label: $2$),
        e: v(5, 0, label: $1$, at: "right"),
      ),
      (
        bond("a", "b", 2, to: "b"),
        bond("b", "c"),
        gap("c", "d"),
        bond("d", "e", 2, to: "d"),
      ),
    ),
    [$F_4^((1))$],
    dynkin(
      (
        a: v(0, 0, label: $2$),
        b: v(1, 0, label: $4$),
        c: v(2, 0, label: $3$),
        d: v(3, 0, label: $2$),
        e: v(4, 0, label: $1$),
      ),
      (
        bond("a", "b"),
        bond("b", "c", 2, to: "b"),
        bond("c", "d"),
        bond("d", "e"),
      ),
    ),

    [$ D_l^((1)) \ (l >= 4) $],
    dynkin(
      (
        o: v(0, 0.5, label: $1$, at: "left"),
        a: v(0, -0.5, label: $1$, at: "left"),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $2$),
        d: v(4, 0, label: $2$),
        e: v(5, 0.5, label: $1$, at: "right"),
        f: v(5, -0.5, label: $1$, at: "right"),
      ),
      (
        bond("o", "b"),
        bond("a", "b"),
        bond("b", "c"),
        gap("c", "d"),
        bond("d", "e"),
        bond("d", "f"),
      ),
    ),
    [$G_2^((1))$],
    dynkin(
      (
        a: v(0, 0, label: $3$),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $1$),
      ),
      (bond("a", "b", 3, to: "a"), bond("b", "c")),
    ),
  ),
  table-6-block(
    [$ A_(2l)^((2)) \ (l >= 2) $],
    dynkin(
      (
        a: v(0, 0, label: $1$),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $2$),
        d: v(4, 0, label: $2$),
        e: v(5, 0, label: $2$),
      ),
      (
        bond("a", "b", 2, to: "b"),
        bond("b", "c"),
        gap("c", "d"),
        bond("d", "e", 2, to: "e"),
      ),
    ),
    [$D_4^((3))$],
    dynkin(
      (
        a: v(0, 0, label: $1$),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $1$),
      ),
      (bond("a", "b"), bond("b", "c", 3, to: "b")),
    ),

    [$A_2^((2))$],
    dynkin(
      (
        a: v(0, 0, label: $1$, at: "left"),
        b: v(1, 0, label: $2$, at: "right"),
      ),
      (bond("a", "b", 4, to: "b"),),
    ),
    // Below D_4^(3) the book leaves the right pair of columns empty and
    // unruled.
    table.cell(
      colspan: 2,
      rowspan: 4,
      stroke: (left: 0.5pt, top: 0.5pt, right: none, bottom: none),
    )[],

    [$ A_(2l-1)^((2)) \ (l >= 3) $],
    dynkin(
      (
        o: v(0, 0.5, label: $1$, at: "left"),
        a: v(0, -0.5, label: $1$, at: "left"),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $2$),
        d: v(4, 0, label: $2$),
        e: v(5, 0, label: $1$),
      ),
      (
        bond("o", "b"),
        bond("a", "b"),
        bond("b", "c"),
        gap("c", "d"),
        bond("d", "e", 2, to: "d"),
      ),
    ),

    [$ D_(l+1)^((2)) \ (l >= 2) $],
    dynkin(
      (
        a: v(0, 0, label: $1$),
        b: v(1, 0, label: $1$),
        c: v(2, 0, label: $1$),
        d: v(4, 0, label: $1$),
        e: v(5, 0, label: $1$),
      ),
      (
        bond("a", "b", 2, to: "a"),
        bond("b", "c"),
        gap("c", "d"),
        bond("d", "e", 2, to: "e"),
      ),
    ),

    [$E_6^((2))$],
    dynkin(
      (
        a: v(0, 0, label: $1$),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $3$),
        d: v(3, 0, label: $2$),
        e: v(4, 0, label: $1$),
      ),
      (
        bond("a", "b"),
        bond("b", "c"),
        bond("c", "d", 2, to: "c"),
        bond("d", "e"),
      ),
    ),
  ),
)

#table-section[Involutive Automorphisms of Complex Simple Lie
  Algebras] <tab:involutive-automorphisms>
#source(322)In the table there are listed all the Kac diagrams of all order 2
automorphisms $theta$ of complex simple Lie algebras $frak(g)$ (up to conjugacy
in the group $Aut frak(g)$). Since all the nonzero numerical labels of Kac
diagrams of automorphisms of order 2 equal $1\/2$, it suffices to distinguish
the vertices of the corresponding affine Dynkin diagram endowed with nonzero
numerical labels. Therefore the numerical labels are omitted and the vertices
with nonzero labels are black, the others being white. The vertices of an affine
Dynkin diagram $L_n^((k))$ are numbered so that if
$Psi = {alpha_0, alpha_1, ..., alpha_l}$ is the corresponding numbered
admissible system of vectors then
$Pi^tau = {(alpha_0, 1\/k), (alpha_1, 0), ..., (alpha_l, 0)}$ is the system of
simple roots of the pair $(frak(g), tau)$, where $tau = eta(theta) in Aut Pi$,
and $Pi_0 = {alpha_1, ..., alpha_l}$ is the system of simple roots of
$frak(g)^hat(tau)$ numbered as in Table~@tab:weights-and-roots. There are also
indicated: the type of $frak(g)^theta$ and the real form of $frak(g)$
corresponding to $theta$. The automorphisms $theta$ are divided into the
following three types (see Problem~@pr:involution-kac-diagram-types): type
I---the inner automorphisms with a semisimple $frak(g)^theta$, type II---the
inner automorphisms with a nonsemisimple $frak(g)^theta$, type III---the outer
automorphisms.

#table-7(
  type-row("I"),
  [$ frak(s o)_(2l+1) (CC) \ (l >= 3) $],
  [$B_l^((1))$],
  [#dynkin(
      (
        o: v(0, 0.5, label: $0$, at: "left"),
        a: v(0, -0.5, label: $1$, at: "left"),
        b: v(1, 0, label: $2$),
        c: v(2, 0, label: $3$),
        p: v(4, 0, label: $p$, black: true),
        d: v(6, 0, label: $ell - 1$),
        e: v(7, 0, label: $ell$),
      ),
      (
        bond("o", "b"),
        bond("a", "b"),
        bond("b", "c"),
        gap("c", "p"),
        gap("p", "d"),
        bond("d", "e", 2, to: "e"),
      ),
    )
    $(2 <= p <= ell)$],
  [$D_p plus.o B_(l-p)$],
  [$frak(s o)_(2p, 2(l-p)+1)$],

  [$ frak(s p)_(2l) (CC) \ (l >= 2) $],
  [$C_l^((1))$],
  [#dynkin(
      (
        a: v(0, 0, label: $0$),
        b: v(1, 0, label: $1$),
        p: v(3, 0, label: $p$, black: true),
        c: v(5, 0, label: $ell - 1$),
        d: v(6, 0, label: $ell$),
      ),
      (
        bond("a", "b", 2, to: "b"),
        gap("b", "p"),
        gap("p", "c"),
        bond("c", "d", 2, to: "c"),
      ),
    )
    $(1 <= p <= [ell\/2])$],
  [$C_p plus.o C_(l-p)$],
  [$frak(s p)_(p, l-p)$],

  [$ frak(s o)_(2l) (CC) \ (l >= 4) $],
  [$D_l^((1))$],
  [#dynkin(
      (
        o: v(0, 0.5, label: $0$, at: "left"),
        a: v(0, -0.5, label: $1$, at: "left"),
        b: v(1, 0, label: $2$),
        p: v(3, 0, label: $p$, black: true),
        c: v(5, 0, label: $ell - 2$),
        d: v(6, 0.5, label: $ell - 1$, at: "right"),
        e: v(6, -0.5, label: $ell$, at: "right"),
      ),
      (
        bond("o", "b"),
        bond("a", "b"),
        gap("b", "p"),
        gap("p", "c"),
        bond("c", "d"),
        bond("c", "e"),
      ),
    )
    $(2 <= p <= [ell\/2])$],
  [$D_p plus.o D_(l-p)$],
  [$frak(s o)_(2p, 2(l-p))$],

  [$E_6$],
  [$E_6^((1))$],
  dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$, black: true),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$),
      e: v(4, 0, label: $5$),
      f: v(2, -1, label: $6$, at: "right"),
      g: v(2, -2, label: $0$, at: "right"),
    ),
    (
      bond("a", "b"),
      bond("b", "c"),
      bond("c", "d"),
      bond("d", "e"),
      bond("c", "f"),
      bond("f", "g"),
    ),
  ),
  [$A_1 plus.o A_5$],
  real-form("EII"),

  table.cell(rowspan: 2)[#source(323)$E_7$],
  table.cell(rowspan: 2)[$E_7^((1))$],
  dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$),
      e: v(4, 0, label: $5$),
      f: v(5, 0, label: $6$),
      g: v(6, 0, label: $0$),
      h: v(3, -1, label: $7$, at: "right", black: true),
    ),
    (
      bond("a", "b"),
      bond("b", "c"),
      bond("c", "d"),
      bond("d", "e"),
      bond("e", "f"),
      bond("f", "g"),
      bond("d", "h"),
    ),
  ),
  [$A_7$],
  real-form("EV"),

  dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$, black: true),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$),
      e: v(4, 0, label: $5$),
      f: v(5, 0, label: $6$),
      g: v(6, 0, label: $0$),
      h: v(3, -1, label: $7$, at: "right"),
    ),
    (
      bond("a", "b"),
      bond("b", "c"),
      bond("c", "d"),
      bond("d", "e"),
      bond("e", "f"),
      bond("f", "g"),
      bond("d", "h"),
    ),
  ),
  [$A_1 plus.o D_6$],
  real-form("EVI"),

  table.cell(rowspan: 2)[$E_8$],
  table.cell(rowspan: 2)[$E_8^((1))$],
  dynkin(
    (
      a: v(0, 0, label: $0$),
      b: v(1, 0, label: $1$),
      c: v(2, 0, label: $2$),
      d: v(3, 0, label: $3$),
      e: v(4, 0, label: $4$),
      f: v(5, 0, label: $5$),
      g: v(6, 0, label: $6$),
      h: v(7, 0, label: $7$, black: true),
      i: v(5, -1, label: $8$, at: "right"),
    ),
    (
      bond("a", "b"),
      bond("b", "c"),
      bond("c", "d"),
      bond("d", "e"),
      bond("e", "f"),
      bond("f", "g"),
      bond("g", "h"),
      bond("f", "i"),
    ),
  ),
  [$D_8$],
  real-form("EVIII"),

  dynkin(
    (
      a: v(0, 0, label: $0$),
      b: v(1, 0, label: $1$, black: true),
      c: v(2, 0, label: $2$),
      d: v(3, 0, label: $3$),
      e: v(4, 0, label: $4$),
      f: v(5, 0, label: $5$),
      g: v(6, 0, label: $6$),
      h: v(7, 0, label: $7$),
      i: v(5, -1, label: $8$, at: "right"),
    ),
    (
      bond("a", "b"),
      bond("b", "c"),
      bond("c", "d"),
      bond("d", "e"),
      bond("e", "f"),
      bond("f", "g"),
      bond("g", "h"),
      bond("f", "i"),
    ),
  ),
  [$A_1 plus.o E_7$],
  real-form("EIX"),

  table.cell(rowspan: 2)[$F_4$],
  table.cell(rowspan: 2)[$F_4^((1))$],
  dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$, black: true),
      e: v(4, 0, label: $0$),
    ),
    (
      bond("a", "b"),
      bond("b", "c", 2, to: "b"),
      bond("c", "d"),
      bond("d", "e"),
    ),
  ),
  [$C_3 plus.o A_1$],
  real-form("FI"),

  dynkin(
    (
      a: v(0, 0, label: $1$, black: true),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$),
      e: v(4, 0, label: $0$),
    ),
    (
      bond("a", "b"),
      bond("b", "c", 2, to: "b"),
      bond("c", "d"),
      bond("d", "e"),
    ),
  ),
  [$B_4$],
  real-form("FII"),

  [$G_2$],
  [$G_2^((1))$],
  dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$, black: true),
      c: v(2, 0, label: $0$),
    ),
    (bond("a", "b", 3, to: "a"), bond("b", "c")),
  ),
  [$A_1 plus.o A_1$],
  real-form("G"),

  type-row("II"),
  [$ frak(s l)_(l+1) (CC) \ (l >= 2) $],
  [$A_l^((1))$],
  [#dynkin(
      (
        a: v(0, 0, label: $1$, at: "below"),
        b: v(1, 0, label: $2$, at: "below"),
        p: v(3, 0, label: $p$, at: "below", black: true),
        c: v(5, 0, label: $ell$, at: "below"),
        o: v(2.5, 1, label: $0$, black: true),
      ),
      (
        bond("a", "b"),
        gap("b", "p"),
        gap("p", "c"),
        bond("o", "a"),
        bond("o", "c"),
      ),
    )
    $(1 <= p <= [(ell + 1)\/2])$],
  [$ A_(p-1) plus.o \ A_(l-p) plus.o CC $],
  [$frak(s u)_(p, l+1-p)$],

  [$frak(s l)_2 (CC)$],
  [$A_1^((1))$],
  dynkin(
    (
      a: v(0, 0, label: $0$, black: true),
      b: v(1, 0, label: $1$, black: true),
    ),
    (bond("a", "b", 4),),
  ),
  [$CC$],
  [$frak(s u)_(1, 1)$],

  [$ frak(s o)_(2l+1) (CC) \ (l >= 3) $],
  [$B_l^((1))$],
  dynkin(
    (
      o: v(0, 0.5, label: $0$, at: "left", black: true),
      a: v(0, -0.5, label: $1$, at: "left", black: true),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(4, 0, label: $ell - 1$),
      e: v(5, 0, label: $ell$),
    ),
    (
      bond("o", "b"),
      bond("a", "b"),
      bond("b", "c"),
      gap("c", "d"),
      bond("d", "e", 2, to: "e"),
    ),
  ),
  [$B_(l-1) plus.o CC$],
  [$frak(s o)_(2, 2l-1)$],

  [$ frak(s p)_(2l) (CC) \ (l >= 2) $],
  [$C_l^((1))$],
  dynkin(
    (
      a: v(0, 0, label: $0$, at: "left", black: true),
      b: v(1, 0, label: $1$),
      c: v(3, 0, label: $ell - 1$),
      d: v(4, 0, label: $ell$, at: "right", black: true),
    ),
    (
      bond("a", "b", 2, to: "b"),
      gap("b", "c"),
      bond("c", "d", 2, to: "c"),
    ),
  ),
  [$A_(l-1) plus.o CC$],
  [$frak(s p)_(2l) (RR)$],

  table.cell(rowspan: 2)[#source(324)$ frak(s o)_(2l) (CC) \ (l >= 4) $],
  table.cell(rowspan: 2)[$D_l^((1))$],
  dynkin(
    (
      o: v(0, 0.5, label: $0$, at: "left", black: true),
      a: v(0, -0.5, label: $1$, at: "left", black: true),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(4, 0, label: $ell - 3$),
      e: v(5, 0, label: $ell - 2$),
      f: v(6, 0.5, label: $ell - 1$, at: "right"),
      g: v(6, -0.5, label: $ell$, at: "right"),
    ),
    (
      bond("o", "b"),
      bond("a", "b"),
      bond("b", "c"),
      gap("c", "d"),
      bond("d", "e"),
      bond("e", "f"),
      bond("e", "g"),
    ),
  ),
  [$D_(l-1) plus.o CC$],
  [$frak(s o)_(2, 2l-2)$],

  dynkin(
    (
      o: v(0, 0.5, label: $0$, at: "left", black: true),
      a: v(0, -0.5, label: $1$, at: "left"),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(4, 0, label: $ell - 3$),
      e: v(5, 0, label: $ell - 2$),
      f: v(6, 0.5, label: $ell - 1$, at: "right"),
      g: v(6, -0.5, label: $ell$, at: "right", black: true),
    ),
    (
      bond("o", "b"),
      bond("a", "b"),
      bond("b", "c"),
      gap("c", "d"),
      bond("d", "e"),
      bond("e", "f"),
      bond("e", "g"),
    ),
  ),
  [$A_(l-1) plus.o CC$],
  [$frak(u)_l^* (HH)$],

  [$E_6$],
  [$E_6^((1))$],
  dynkin(
    (
      a: v(0, 0, label: $1$, at: "left", black: true),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$),
      e: v(4, 0, label: $5$),
      f: v(2, -1, label: $6$, at: "right"),
      g: v(2, -2, label: $0$, at: "right", black: true),
    ),
    (
      bond("a", "b"),
      bond("b", "c"),
      bond("c", "d"),
      bond("d", "e"),
      bond("c", "f"),
      bond("f", "g"),
    ),
  ),
  [$D_5 plus.o CC$],
  real-form("EIII"),

  [$E_7$],
  [$E_7^((1))$],
  dynkin(
    (
      a: v(0, 0, label: $1$, black: true),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$),
      e: v(4, 0, label: $5$),
      f: v(5, 0, label: $6$),
      g: v(6, 0, label: $0$, at: "right", black: true),
      h: v(3, -1, label: $7$, at: "right"),
    ),
    (
      bond("a", "b"),
      bond("b", "c"),
      bond("c", "d"),
      bond("d", "e"),
      bond("e", "f"),
      bond("f", "g"),
      bond("d", "h"),
    ),
  ),
  [$E_6 plus.o CC$],
  real-form("EVII"),

  type-row("III"),
  [$ frak(s l)_(2l+1) (CC) \ (l >= 2) $],
  [$A_(2l)^((2))$],
  dynkin(
    (
      a: v(0, 0, label: $0$, black: true),
      b: v(1, 0, label: $1$),
      c: v(2, 0, label: $2$),
      d: v(4, 0, label: $ell - 1$),
      e: v(5, 0, label: $ell$),
    ),
    (
      bond("a", "b", 2, to: "b"),
      bond("b", "c"),
      gap("c", "d"),
      bond("d", "e", 2, to: "e"),
    ),
  ),
  [$B_l$],
  [$frak(s l)_(2l+1) (RR)$],

  [$frak(s l)_3 (CC)$],
  [$A_2^((2))$],
  dynkin(
    (a: v(0, 0, label: $0$, black: true), b: v(1, 0, label: $1$)),
    (bond("a", "b", 4, to: "b"),),
  ),
  [$A_1$],
  [$frak(s l)_3 (RR)$],

  table.cell(rowspan: 2)[$ frak(s l)_(2l) (CC) \ (l >= 3) $],
  table.cell(rowspan: 2)[$A_(2l-1)^((2))$],
  dynkin(
    (
      o: v(0, 0.5, label: $0$, at: "left"),
      a: v(0, -0.5, label: $1$, at: "left"),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(4, 0, label: $ell - 1$),
      e: v(5, 0, label: $ell$, black: true),
    ),
    (
      bond("o", "b"),
      bond("a", "b"),
      bond("b", "c"),
      gap("c", "d"),
      bond("d", "e", 2, to: "d"),
    ),
  ),
  [$D_l$],
  [$frak(s l)_(2l) (RR)$],

  dynkin(
    (
      o: v(0, 0.5, label: $0$, at: "left", black: true),
      a: v(0, -0.5, label: $1$, at: "left"),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(4, 0, label: $ell - 1$),
      e: v(5, 0, label: $ell$),
    ),
    (
      bond("o", "b"),
      bond("a", "b"),
      bond("b", "c"),
      gap("c", "d"),
      bond("d", "e", 2, to: "d"),
    ),
  ),
  [$C_l$],
  [$frak(s l)_l (HH)$],

  [$ frak(s o)_(2l+2) (CC) \ (l >= 2) $],
  [$D_(l+1)^((2))$],
  [#dynkin(
      (
        a: v(0, 0, label: $0$),
        b: v(1, 0, label: $1$),
        p: v(3, 0, label: $p$, black: true),
        c: v(5, 0, label: $ell - 1$),
        d: v(6, 0, label: $ell$),
      ),
      (
        bond("a", "b", 2, to: "a"),
        gap("b", "p"),
        gap("p", "c"),
        bond("c", "d", 2, to: "d"),
      ),
    )
    $(0 <= p <= [ell\/2])$],
  [$B_p plus.o B_(l-p)$],
  [$frak(s o)_(2p+1, 2(l-p)+1)$],

  table.cell(rowspan: 2)[$E_6$],
  table.cell(rowspan: 2)[$E_6^((2))$],
  dynkin(
    (
      a: v(0, 0, label: $0$),
      b: v(1, 0, label: $1$),
      c: v(2, 0, label: $2$),
      d: v(3, 0, label: $3$),
      e: v(4, 0, label: $4$, black: true),
    ),
    (
      bond("a", "b"),
      bond("b", "c"),
      bond("c", "d", 2, to: "c"),
      bond("d", "e"),
    ),
  ),
  [$C_4$],
  real-form("EI"),

  dynkin(
    (
      a: v(0, 0, label: $0$, black: true),
      b: v(1, 0, label: $1$),
      c: v(2, 0, label: $2$),
      d: v(3, 0, label: $3$),
      e: v(4, 0, label: $4$),
    ),
    (
      bond("a", "b"),
      bond("b", "c"),
      bond("c", "d", 2, to: "c"),
      bond("d", "e"),
    ),
  ),
  [$F_4$],
  real-form("EIV"),
)
