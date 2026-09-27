// Reference Chapter, § 2. Tables: Tables 6 and 7 with their descriptions.
// Printed pages 305-309. Page 305 is shared with the end of Table 5 (the
// description of Table 6 is at its foot), page 309 with the description
// of Table 8.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/dynkin.typ": affine, dynkin, v

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
      affine("A", 5),
      (
        "1": v(0, 0, at: "below"),
        "2": v(1, 0, at: "below"),
        "4": v(3, 0, at: "below"),
        "5": v(4, 0, at: "below"),
        "0": v(2, 1),
      ),
      marks: true,
    ),
    [$E_6^((1))$],
    dynkin(
      affine("E", 6),
      (
        "1": v(0, 0),
        "2": v(1, 0),
        "3": v(2, 0),
        "4": v(3, 0),
        "5": v(4, 0),
        "6": v(2, -1, at: "right"),
        "0": v(2, -2, at: "right"),
      ),
      marks: true,
    ),

    [$A_1^((1))$],
    dynkin(
      affine("A", 1),
      ("0": v(0, 0, at: "left"), "1": v(1, 0, at: "right")),
      marks: true,
    ),
    [$E_7^((1))$],
    dynkin(
      affine("E", 7),
      (
        "1": v(0, 0),
        "2": v(1, 0),
        "3": v(2, 0),
        "4": v(3, 0),
        "5": v(4, 0),
        "6": v(5, 0),
        "0": v(6, 0),
        "7": v(3, -1, at: "right"),
      ),
      marks: true,
    ),

    [$ B_l^((1)) \ (l >= 3) $],
    dynkin(
      affine("B", 6),
      (
        "0": v(0, 0.5, at: "left"),
        "1": v(0, -0.5, at: "left"),
        "2": v(1, 0),
        "3": v(2, 0),
        "5": v(4, 0),
        "6": v(5, 0),
      ),
      marks: true,
    ),
    [$E_8^((1))$],
    dynkin(
      affine("E", 8),
      (
        "0": v(0, 0),
        "1": v(1, 0),
        "2": v(2, 0),
        "3": v(3, 0),
        "4": v(4, 0),
        "5": v(5, 0),
        "6": v(6, 0),
        "7": v(7, 0),
        "8": v(5, -1, at: "right"),
      ),
      marks: true,
    ),

    [$ C_l^((1)) \ (l >= 2) $],
    dynkin(
      affine("C", 5),
      (
        "0": v(0, 0, at: "left"),
        "1": v(1, 0),
        "2": v(2, 0),
        "4": v(4, 0),
        "5": v(5, 0, at: "right"),
      ),
      marks: true,
    ),
    [$F_4^((1))$],
    dynkin(
      affine("F", 4),
      ("1": v(0, 0), "2": v(1, 0), "3": v(2, 0), "4": v(3, 0), "0": v(4, 0)),
      marks: true,
    ),

    [$ D_l^((1)) \ (l >= 4) $],
    dynkin(
      affine("D", 7),
      (
        "0": v(0, 0.5, at: "left"),
        "1": v(0, -0.5, at: "left"),
        "2": v(1, 0),
        "3": v(2, 0),
        "5": v(4, 0),
        "6": v(5, 0.5, at: "right"),
        "7": v(5, -0.5, at: "right"),
      ),
      marks: true,
    ),
    [$G_2^((1))$],
    dynkin(
      affine("G", 2),
      ("1": v(0, 0), "2": v(1, 0), "0": v(2, 0)),
      marks: true,
    ),
  ),
  table-6-block(
    [$ A_(2l)^((2)) \ (l >= 2) $],
    dynkin(
      affine("A", 10, k: 2),
      ("0": v(0, 0), "1": v(1, 0), "2": v(2, 0), "4": v(4, 0), "5": v(5, 0)),
      marks: true,
    ),
    [$D_4^((3))$],
    dynkin(
      affine("D", 4, k: 3),
      ("0": v(0, 0), "1": v(1, 0), "2": v(2, 0)),
      marks: true,
    ),

    [$A_2^((2))$],
    dynkin(
      affine("A", 2, k: 2),
      ("0": v(0, 0, at: "left"), "1": v(1, 0, at: "right")),
      marks: true,
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
      affine("A", 11, k: 2),
      (
        "0": v(0, 0.5, at: "left"),
        "1": v(0, -0.5, at: "left"),
        "2": v(1, 0),
        "3": v(2, 0),
        "5": v(4, 0),
        "6": v(5, 0),
      ),
      marks: true,
    ),

    [$ D_(l+1)^((2)) \ (l >= 2) $],
    dynkin(
      affine("D", 6, k: 2),
      ("0": v(0, 0), "1": v(1, 0), "2": v(2, 0), "4": v(4, 0), "5": v(5, 0)),
      marks: true,
    ),

    [$E_6^((2))$],
    dynkin(
      affine("E", 6, k: 2),
      ("0": v(0, 0), "1": v(1, 0), "2": v(2, 0), "3": v(3, 0), "4": v(4, 0)),
      marks: true,
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
      affine("B", 8),
      (
        "0": v(0, 0.5, label: $0$, at: "left"),
        "1": v(0, -0.5, label: $1$, at: "left"),
        "2": v(1, 0, label: $2$),
        "3": v(2, 0, label: $3$),
        "5": v(4, 0, label: $p$, black: true),
        "7": v(6, 0, label: $ell - 1$),
        "8": v(7, 0, label: $ell$),
      ),
      order: 2,
    )
    $(2 <= p <= ell)$],
  [$D_p plus.o B_(l-p)$],
  [$frak(s o)_(2p, 2(l-p)+1)$],

  [$ frak(s p)_(2l) (CC) \ (l >= 2) $],
  [$C_l^((1))$],
  [#dynkin(
      affine("C", 6),
      (
        "0": v(0, 0, label: $0$),
        "1": v(1, 0, label: $1$),
        "3": v(3, 0, label: $p$, black: true),
        "5": v(5, 0, label: $ell - 1$),
        "6": v(6, 0, label: $ell$),
      ),
      order: 2,
    )
    $(1 <= p <= [ell\/2])$],
  [$C_p plus.o C_(l-p)$],
  [$frak(s p)_(p, l-p)$],

  [$ frak(s o)_(2l) (CC) \ (l >= 4) $],
  [$D_l^((1))$],
  [#dynkin(
      affine("D", 8),
      (
        "0": v(0, 0.5, label: $0$, at: "left"),
        "1": v(0, -0.5, label: $1$, at: "left"),
        "2": v(1, 0, label: $2$),
        "4": v(3, 0, label: $p$, black: true),
        "6": v(5, 0, label: $ell - 2$),
        "7": v(6, 0.5, label: $ell - 1$, at: "right"),
        "8": v(6, -0.5, label: $ell$, at: "right"),
      ),
      order: 2,
    )
    $(2 <= p <= [ell\/2])$],
  [$D_p plus.o D_(l-p)$],
  [$frak(s o)_(2p, 2(l-p))$],

  [$E_6$],
  [$E_6^((1))$],
  dynkin(
    affine("E", 6),
    (
      "1": v(0, 0, label: $1$),
      "2": v(1, 0, label: $2$, black: true),
      "3": v(2, 0, label: $3$),
      "4": v(3, 0, label: $4$),
      "5": v(4, 0, label: $5$),
      "6": v(2, -1, label: $6$, at: "right"),
      "0": v(2, -2, label: $0$, at: "right"),
    ),
    order: 2,
  ),
  [$A_1 plus.o A_5$],
  real-form("EII"),

  table.cell(rowspan: 2)[#source(323)$E_7$],
  table.cell(rowspan: 2)[$E_7^((1))$],
  dynkin(
    affine("E", 7),
    (
      "1": v(0, 0, label: $1$),
      "2": v(1, 0, label: $2$),
      "3": v(2, 0, label: $3$),
      "4": v(3, 0, label: $4$),
      "5": v(4, 0, label: $5$),
      "6": v(5, 0, label: $6$),
      "0": v(6, 0, label: $0$),
      "7": v(3, -1, label: $7$, at: "right", black: true),
    ),
    order: 2,
  ),
  [$A_7$],
  real-form("EV"),

  dynkin(
    affine("E", 7),
    (
      "1": v(0, 0, label: $1$),
      "2": v(1, 0, label: $2$, black: true),
      "3": v(2, 0, label: $3$),
      "4": v(3, 0, label: $4$),
      "5": v(4, 0, label: $5$),
      "6": v(5, 0, label: $6$),
      "0": v(6, 0, label: $0$),
      "7": v(3, -1, label: $7$, at: "right"),
    ),
    order: 2,
  ),
  [$A_1 plus.o D_6$],
  real-form("EVI"),

  table.cell(rowspan: 2)[$E_8$],
  table.cell(rowspan: 2)[$E_8^((1))$],
  dynkin(
    affine("E", 8),
    (
      "0": v(0, 0, label: $0$),
      "1": v(1, 0, label: $1$),
      "2": v(2, 0, label: $2$),
      "3": v(3, 0, label: $3$),
      "4": v(4, 0, label: $4$),
      "5": v(5, 0, label: $5$),
      "6": v(6, 0, label: $6$),
      "7": v(7, 0, label: $7$, black: true),
      "8": v(5, -1, label: $8$, at: "right"),
    ),
    order: 2,
  ),
  [$D_8$],
  real-form("EVIII"),

  dynkin(
    affine("E", 8),
    (
      "0": v(0, 0, label: $0$),
      "1": v(1, 0, label: $1$, black: true),
      "2": v(2, 0, label: $2$),
      "3": v(3, 0, label: $3$),
      "4": v(4, 0, label: $4$),
      "5": v(5, 0, label: $5$),
      "6": v(6, 0, label: $6$),
      "7": v(7, 0, label: $7$),
      "8": v(5, -1, label: $8$, at: "right"),
    ),
    order: 2,
  ),
  [$A_1 plus.o E_7$],
  real-form("EIX"),

  table.cell(rowspan: 2)[$F_4$],
  table.cell(rowspan: 2)[$F_4^((1))$],
  dynkin(
    affine("F", 4),
    (
      "1": v(0, 0, label: $1$),
      "2": v(1, 0, label: $2$),
      "3": v(2, 0, label: $3$),
      "4": v(3, 0, label: $4$, black: true),
      "0": v(4, 0, label: $0$),
    ),
    order: 2,
  ),
  [$C_3 plus.o A_1$],
  real-form("FI"),

  dynkin(
    affine("F", 4),
    (
      "1": v(0, 0, label: $1$, black: true),
      "2": v(1, 0, label: $2$),
      "3": v(2, 0, label: $3$),
      "4": v(3, 0, label: $4$),
      "0": v(4, 0, label: $0$),
    ),
    order: 2,
  ),
  [$B_4$],
  real-form("FII"),

  [$G_2$],
  [$G_2^((1))$],
  dynkin(
    affine("G", 2),
    (
      "1": v(0, 0, label: $1$),
      "2": v(1, 0, label: $2$, black: true),
      "0": v(2, 0, label: $0$),
    ),
    order: 2,
  ),
  [$A_1 plus.o A_1$],
  real-form("G"),

  type-row("II"),
  [$ frak(s l)_(l+1) (CC) \ (l >= 2) $],
  [$A_l^((1))$],
  [#dynkin(
      affine("A", 6),
      (
        "1": v(0, 0, label: $1$, at: "below"),
        "2": v(1, 0, label: $2$, at: "below"),
        "4": v(3, 0, label: $p$, at: "below", black: true),
        "6": v(5, 0, label: $ell$, at: "below"),
        "0": v(2.5, 1, label: $0$, black: true),
      ),
      order: 2,
    )
    $(1 <= p <= [(ell + 1)\/2])$],
  [$ A_(p-1) plus.o \ A_(l-p) plus.o CC $],
  [$frak(s u)_(p, l+1-p)$],

  [$frak(s l)_2 (CC)$],
  [$A_1^((1))$],
  dynkin(
    affine("A", 1),
    (
      "0": v(0, 0, label: $0$, black: true),
      "1": v(1, 0, label: $1$, black: true),
    ),
    order: 2,
  ),
  [$CC$],
  [$frak(s u)_(1, 1)$],

  [$ frak(s o)_(2l+1) (CC) \ (l >= 3) $],
  [$B_l^((1))$],
  dynkin(
    affine("B", 6),
    (
      "0": v(0, 0.5, label: $0$, at: "left", black: true),
      "1": v(0, -0.5, label: $1$, at: "left", black: true),
      "2": v(1, 0, label: $2$),
      "3": v(2, 0, label: $3$),
      "5": v(4, 0, label: $ell - 1$),
      "6": v(5, 0, label: $ell$),
    ),
    order: 2,
  ),
  [$B_(l-1) plus.o CC$],
  [$frak(s o)_(2, 2l-1)$],

  [$ frak(s p)_(2l) (CC) \ (l >= 2) $],
  [$C_l^((1))$],
  dynkin(
    affine("C", 4),
    (
      "0": v(0, 0, label: $0$, at: "left", black: true),
      "1": v(1, 0, label: $1$),
      "3": v(3, 0, label: $ell - 1$),
      "4": v(4, 0, label: $ell$, at: "right", black: true),
    ),
    order: 2,
  ),
  [$A_(l-1) plus.o CC$],
  [$frak(s p)_(2l) (RR)$],

  table.cell(rowspan: 2)[#source(324)$ frak(s o)_(2l) (CC) \ (l >= 4) $],
  table.cell(rowspan: 2)[$D_l^((1))$],
  dynkin(
    affine("D", 8),
    (
      "0": v(0, 0.5, label: $0$, at: "left", black: true),
      "1": v(0, -0.5, label: $1$, at: "left", black: true),
      "2": v(1, 0, label: $2$),
      "3": v(2, 0, label: $3$),
      "5": v(4, 0, label: $ell - 3$),
      "6": v(5, 0, label: $ell - 2$),
      "7": v(6, 0.5, label: $ell - 1$, at: "right"),
      "8": v(6, -0.5, label: $ell$, at: "right"),
    ),
    order: 2,
  ),
  [$D_(l-1) plus.o CC$],
  [$frak(s o)_(2, 2l-2)$],

  dynkin(
    affine("D", 8),
    (
      "0": v(0, 0.5, label: $0$, at: "left", black: true),
      "1": v(0, -0.5, label: $1$, at: "left"),
      "2": v(1, 0, label: $2$),
      "3": v(2, 0, label: $3$),
      "5": v(4, 0, label: $ell - 3$),
      "6": v(5, 0, label: $ell - 2$),
      "7": v(6, 0.5, label: $ell - 1$, at: "right"),
      "8": v(6, -0.5, label: $ell$, at: "right", black: true),
    ),
    order: 2,
  ),
  [$A_(l-1) plus.o CC$],
  [$frak(u)_l^* (HH)$],

  [$E_6$],
  [$E_6^((1))$],
  dynkin(
    affine("E", 6),
    (
      "1": v(0, 0, label: $1$, at: "left", black: true),
      "2": v(1, 0, label: $2$),
      "3": v(2, 0, label: $3$),
      "4": v(3, 0, label: $4$),
      "5": v(4, 0, label: $5$),
      "6": v(2, -1, label: $6$, at: "right"),
      "0": v(2, -2, label: $0$, at: "right", black: true),
    ),
    order: 2,
  ),
  [$D_5 plus.o CC$],
  real-form("EIII"),

  [$E_7$],
  [$E_7^((1))$],
  dynkin(
    affine("E", 7),
    (
      "1": v(0, 0, label: $1$, black: true),
      "2": v(1, 0, label: $2$),
      "3": v(2, 0, label: $3$),
      "4": v(3, 0, label: $4$),
      "5": v(4, 0, label: $5$),
      "6": v(5, 0, label: $6$),
      "0": v(6, 0, label: $0$, at: "right", black: true),
      "7": v(3, -1, label: $7$, at: "right"),
    ),
    order: 2,
  ),
  [$E_6 plus.o CC$],
  real-form("EVII"),

  type-row("III"),
  [$ frak(s l)_(2l+1) (CC) \ (l >= 2) $],
  [$A_(2l)^((2))$],
  dynkin(
    affine("A", 10, k: 2),
    (
      "0": v(0, 0, label: $0$, black: true),
      "1": v(1, 0, label: $1$),
      "2": v(2, 0, label: $2$),
      "4": v(4, 0, label: $ell - 1$),
      "5": v(5, 0, label: $ell$),
    ),
    order: 2,
  ),
  [$B_l$],
  [$frak(s l)_(2l+1) (RR)$],

  [$frak(s l)_3 (CC)$],
  [$A_2^((2))$],
  dynkin(
    affine("A", 2, k: 2),
    ("0": v(0, 0, label: $0$, black: true), "1": v(1, 0, label: $1$)),
    order: 2,
  ),
  [$A_1$],
  [$frak(s l)_3 (RR)$],

  table.cell(rowspan: 2)[$ frak(s l)_(2l) (CC) \ (l >= 3) $],
  table.cell(rowspan: 2)[$A_(2l-1)^((2))$],
  dynkin(
    affine("A", 11, k: 2),
    (
      "0": v(0, 0.5, label: $0$, at: "left"),
      "1": v(0, -0.5, label: $1$, at: "left"),
      "2": v(1, 0, label: $2$),
      "3": v(2, 0, label: $3$),
      "5": v(4, 0, label: $ell - 1$),
      "6": v(5, 0, label: $ell$, black: true),
    ),
    order: 2,
  ),
  [$D_l$],
  [$frak(s l)_(2l) (RR)$],

  dynkin(
    affine("A", 11, k: 2),
    (
      "0": v(0, 0.5, label: $0$, at: "left", black: true),
      "1": v(0, -0.5, label: $1$, at: "left"),
      "2": v(1, 0, label: $2$),
      "3": v(2, 0, label: $3$),
      "5": v(4, 0, label: $ell - 1$),
      "6": v(5, 0, label: $ell$),
    ),
    order: 2,
  ),
  [$C_l$],
  [$frak(s l)_l (HH)$],

  [$ frak(s o)_(2l+2) (CC) \ (l >= 2) $],
  [$D_(l+1)^((2))$],
  [#dynkin(
      affine("D", 7, k: 2),
      (
        "0": v(0, 0, label: $0$),
        "1": v(1, 0, label: $1$),
        "3": v(3, 0, label: $p$, black: true),
        "5": v(5, 0, label: $ell - 1$),
        "6": v(6, 0, label: $ell$),
      ),
      order: 2,
    )
    $(0 <= p <= [ell\/2])$],
  [$B_p plus.o B_(l-p)$],
  [$frak(s o)_(2p+1, 2(l-p)+1)$],

  table.cell(rowspan: 2)[$E_6$],
  table.cell(rowspan: 2)[$E_6^((2))$],
  dynkin(
    affine("E", 6, k: 2),
    (
      "0": v(0, 0, label: $0$),
      "1": v(1, 0, label: $1$),
      "2": v(2, 0, label: $2$),
      "3": v(3, 0, label: $3$),
      "4": v(4, 0, label: $4$, black: true),
    ),
    order: 2,
  ),
  [$C_4$],
  real-form("EI"),

  dynkin(
    affine("E", 6, k: 2),
    (
      "0": v(0, 0, label: $0$, black: true),
      "1": v(1, 0, label: $1$),
      "2": v(2, 0, label: $2$),
      "3": v(3, 0, label: $3$),
      "4": v(4, 0, label: $4$),
    ),
    order: 2,
  ),
  [$F_4$],
  real-form("EIV"),
)
