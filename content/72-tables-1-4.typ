// Reference Chapter, § 2. Tables: the start of the section and Tables 1-4.
// Printed pages 292-299; page 292 begins with the end of § 1, page 299
// ends with the description of Table 5.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/dynkin.typ": bond, dynkin, gap, v

// Table 2 prints each matrix after its factor, "1/(l+1) (…)", its columns
// wider apart than a matrix of the text. TeX keeps a little space at the
// sides of a fraction (the null delimiter space); Typst sets the bar against
// the large parenthesis, so a quarter of an em follows each fraction of this
// table (all of them are such factors).
#let table-2(..args) = {
  set math.mat(column-gap: 0.8em)
  show math.frac: it => it + h(0.25em)
  book-table(..args)
}

== Tables <sec:tables>

#table-section[Weights and Roots] <tab:weights-and-roots>
The weights of the groups $B_l$, $C_l$, $D_l$ and $F_4$ are expressed in the
table in terms of an orthonormal basis $(epsilon_1, ..., epsilon_l)$ of
$frak(t)(QQ)$. The weights of the groups $A_l$, $E_7$, $E_8$ and $G_2$ are
expressed in terms of vectors
$epsilon_1, ..., epsilon_(l + 1) in frak(t)(QQ)^*$, such that
$sum epsilon_i = 0$. For these vectors
$
  (epsilon_i, epsilon_i) = l\/(l + 1), wide
  (epsilon_i, epsilon_j) = -1\/(l + 1) wide "for" quad i != j.
$
It is convenient to remember, however, that if $sum a_i = 0$, then
$(sum a_i epsilon_i, sum b_j epsilon_j) = sum a_i b_i$. The weights of $E_6$ are
expressed in terms of vectors $epsilon_1, ..., epsilon_6 in frak(t)(CC)^*$
constructed as for $A_5$ and of an auxiliary vector $epsilon in frak(t)(QQ)^*$,
which is orthogonal to all $epsilon_i$ and satisfies
$(epsilon, epsilon) = 1\/2$.

The indices $i, j, ...$ in the expression of any weight are assumed to be
different.

In all cases the Weyl group contains all permutations of the vectors
$epsilon_i$. For $B_l$, $C_l$ and $F_4$ the Weyl group contains also all
transformations of the form $epsilon_i |-> plus.minus epsilon_i$ and for $D_l$
all such transformations with an even number of minus signs. The Weyl group of
$E_6$ contains the transformation
$epsilon_i |-> epsilon_i, epsilon |-> -epsilon$. The Weyl groups of $E_7$, $E_8$
and $G_2$ contain $-id$.

In the column "Dynkin diagrams" the numbering of simple roots accepted in all
tables is given.

In the column "Simple roots" given is also the highest root $delta$ and in the
column "Fundamental weights" there is also indicated their sum (equal to the
half sum of positive roots).

#source(308)
#book-table(
  columns: (12.5%, 1fr, 10%, 40%),
  align: center + horizon,
  head: (
    [type of $G$],
    [Dynkin diagrams],
    [$dim G$],
    [Roots and simple roots],
  ),
  table.cell(rowspan: 2)[$A_l$ \ $(l >= 1)$],
  table.cell(rowspan: 2, dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$),
      c: v(3, 0, label: $ell - 1$),
      d: v(4, 0, label: $ell$),
    ),
    (bond("a", "b", 1), gap("b", "c"), bond("c", "d", 1)),
  )),
  table.cell(rowspan: 2)[$l^2 + 2l$],
  [$epsilon_i - epsilon_j$],
  [$
    alpha_i & = epsilon_i - epsilon_(i + 1), \
      delta & = epsilon_1 - epsilon_(l + 1) = pi_1 + pi_l
  $],

  table.cell(rowspan: 2)[$B_l$ \ $(l >= 2)$],
  table.cell(rowspan: 2, dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$),
      c: v(3, 0, label: $ell - 1$),
      d: v(4, 0, label: $ell$),
    ),
    (bond("a", "b", 1), gap("b", "c"), bond("c", "d", 2, to: "d")),
  )),
  table.cell(rowspan: 2)[$2l^2 + l$],
  [$plus.minus epsilon_i plus.minus epsilon_j, plus.minus epsilon_i$],
  [$
    alpha_i & = epsilon_i - epsilon_(i + 1) thick (i < l), \
    alpha_l & = epsilon_l, \
      delta & = epsilon_1 + epsilon_2
              = cases(pi_2 "for" l >= 3",", 2 pi_2 "for" l = 2)
  $],

  table.cell(rowspan: 2)[$C_l$ \ $(l >= 2)$],
  table.cell(rowspan: 2, dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$),
      c: v(3, 0, label: $ell - 1$),
      d: v(4, 0, label: $ell$),
    ),
    (bond("a", "b", 1), gap("b", "c"), bond("c", "d", 2, to: "c")),
  )),
  table.cell(rowspan: 2)[$2l^2 + l$],
  [$plus.minus epsilon_i plus.minus epsilon_j, plus.minus 2 epsilon_i$],
  [$
    alpha_i & = epsilon_i - epsilon_(i + 1) thick (i < l), \
    alpha_l & = 2 epsilon_l, \
      delta & = 2 epsilon_1 = 2 pi_1
  $],

  table.cell(rowspan: 2)[$D_l$ \ $(l >= 3)$],
  table.cell(rowspan: 2, dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$),
      c: v(3, 0, label: $ell - 2$),
      d: v(4, 0.5, label: $ell - 1$),
      e: v(4, -0.5, label: $ell$, at: "below"),
    ),
    (
      bond("a", "b", 1),
      gap("b", "c"),
      bond("c", "d", 1),
      bond("c", "e", 1),
    ),
  )),
  table.cell(rowspan: 2)[$2l^2 - l$],
  [$plus.minus epsilon_i plus.minus epsilon_j$],
  [$
    alpha_i & = epsilon_i - epsilon_(i + 1) thick (i < l), \
    alpha_l & = epsilon_(l - 1) + epsilon_l, \
      delta & = epsilon_1 + epsilon_2
              = cases(pi_2 "for" l >= 4",", pi_2 + pi_3 "for" l = 3)
  $],

  table.cell(rowspan: 2)[$E_6$],
  table.cell(rowspan: 2, dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$),
      e: v(4, 0, label: $5$),
      f: v(2, -1, label: $6$, at: "below"),
    ),
    (
      bond("a", "b", 1),
      bond("b", "c", 1),
      bond("c", "d", 1),
      bond("d", "e", 1),
      bond("c", "f", 1),
    ),
  )),
  table.cell(rowspan: 2)[$78$],
  [$epsilon_i - epsilon_j, plus.minus 2 epsilon,$ \
    $epsilon_i + epsilon_j + epsilon_k plus.minus epsilon$],
  [$
    alpha_i & = epsilon_i - epsilon_(i + 1) thick (i < 6), \
    alpha_6 & = epsilon_4 + epsilon_5 + epsilon_6 + epsilon, \
      delta & = 2 epsilon = pi_6
  $],

  table.cell(rowspan: 2)[$E_7$],
  table.cell(rowspan: 2, dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$),
      e: v(4, 0, label: $5$),
      f: v(5, 0, label: $6$),
      g: v(3, -1, label: $7$, at: "below"),
    ),
    (
      bond("a", "b", 1),
      bond("b", "c", 1),
      bond("c", "d", 1),
      bond("d", "e", 1),
      bond("e", "f", 1),
      bond("d", "g", 1),
    ),
  )),
  table.cell(rowspan: 2)[$133$],
  [$epsilon_i - epsilon_j,$ \
    $epsilon_i + epsilon_j + epsilon_k + epsilon_l$],
  [$
    alpha_i & = epsilon_i - epsilon_(i + 1) thick (i < 7), \
    alpha_7 & = epsilon_5 + epsilon_6 + epsilon_7 + epsilon_8, \
      delta & = -epsilon_7 + epsilon_8 = pi_6
  $],

  table.cell(rowspan: 2)[$E_8$],
  table.cell(rowspan: 2, dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$),
      e: v(4, 0, label: $5$),
      f: v(5, 0, label: $6$),
      g: v(6, 0, label: $7$),
      h: v(4, -1, label: $8$, at: "below"),
    ),
    (
      bond("a", "b", 1),
      bond("b", "c", 1),
      bond("c", "d", 1),
      bond("d", "e", 1),
      bond("e", "f", 1),
      bond("f", "g", 1),
      bond("e", "h", 1),
    ),
  )),
  table.cell(rowspan: 2)[$248$],
  [$epsilon_i - epsilon_j, plus.minus (epsilon_i + epsilon_j + epsilon_k)$],
  [$
    alpha_i & = epsilon_i - epsilon_(i + 1) thick (i < 8), \
    alpha_8 & = epsilon_6 + epsilon_7 + epsilon_8, \
      delta & = epsilon_1 - epsilon_9 = pi_1
  $],

  table.cell(rowspan: 2)[#source(309)$F_4$],
  table.cell(rowspan: 2, dynkin(
    (
      a: v(0, 0, label: $1$),
      b: v(1, 0, label: $2$),
      c: v(2, 0, label: $3$),
      d: v(3, 0, label: $4$),
    ),
    (bond("a", "b", 1), bond("b", "c", 2, to: "b"), bond("c", "d", 1)),
  )),
  table.cell(rowspan: 2)[$52$],
  [$plus.minus epsilon_i plus.minus epsilon_j, plus.minus epsilon_i$ \
    $(plus.minus epsilon_1 plus.minus epsilon_2 plus.minus epsilon_3
      plus.minus epsilon_4)\/2$],
  [$
    alpha_1 & = (epsilon_1 - epsilon_2 - epsilon_3 - epsilon_4)\/2, \
    alpha_2 & = epsilon_4, \
    alpha_3 & = epsilon_3 - epsilon_4, \
    alpha_4 & = epsilon_2 - epsilon_3, \
      delta & = epsilon_1 + epsilon_2 = pi_4
  $],

  table.cell(rowspan: 2)[$G_2$],
  table.cell(rowspan: 2, dynkin(
    (a: v(0, 0, label: $1$), b: v(1, 0, label: $2$)),
    (bond("a", "b", 3, to: "a"),),
  )),
  table.cell(rowspan: 2)[$14$],
  [$epsilon_i - epsilon_j, plus.minus epsilon_i$],
  [$
    alpha_1 & = -epsilon_2, \
    alpha_2 & = epsilon_2 - epsilon_3 \
      delta & = epsilon_1 - epsilon_3 = pi_2
  $],
)
#book-table(
  columns: (10%, 1fr, 10%, 23.5%),
  align: center + horizon,
  head: (
    [Type \ of $G$],
    [Fundamental weights],
    [dim \ $R(pi_1)$],
    [Weights of $R(pi_1)$],
  ),
  [$A_l$ \ $(l >= 1)$],
  [$
    pi_i & = epsilon_1 + dots.c + epsilon_i, \
     rho & = l epsilon_1 + (l - 1) epsilon_2 + dots.c + epsilon_l
  $],
  [$l + 1$],
  [$epsilon_i$],

  [$B_l$ \ $(l >= 2)$],
  [$
    pi_i & = epsilon_1 + dots.c + epsilon_i quad (i < l), \
    pi_l & = (epsilon_1 + dots.c + epsilon_l)\/2 \
     rho & = [(2l - 1) epsilon_1 + (2l - 3) epsilon_2 + dots.c
             + epsilon_l]\/2
  $],
  [$2l + 1$],
  [$plus.minus epsilon_i, 0$],

  [$C_l$ \ $(l >= 2)$],
  [$
    pi_i & = epsilon_1 + dots.c + epsilon_i, \
     rho & = l epsilon_1 + (l - 1) epsilon_2 + dots.c + epsilon_l
  $],
  [$2l$],
  [$plus.minus epsilon_i$],

  [$D_l$ \ $(l >= 3)$],
  [$
          pi_i & = epsilon_1 + dots.c + epsilon_i quad (i < l - 1), \
    pi_(l - 1) & = (epsilon_1 + dots.c + epsilon_(l - 1) - epsilon_l)\/2 \
          pi_l & = (epsilon_1 + dots.c + epsilon_(l - 1) + epsilon_l)\/2 \
           rho & = (l - 1) epsilon_1 + (l - 2) epsilon_2 + dots.c
                 + epsilon_(l - 1)
  $],
  [$2l$],
  [$plus.minus epsilon_i$],

  [$E_6$],
  [$
    pi_i & = epsilon_1 + dots.c + epsilon_i + min{i, 6 - i} dot.c epsilon
           quad (i < 6), \
    pi_6 & = 2 epsilon, \
     rho & = 5 epsilon_1 + 4 epsilon_2 + dots.c + epsilon_5 + 11 epsilon
  $],
  [$27$],
  [$epsilon_i plus.minus epsilon,$ \ $-epsilon_i - epsilon_j$],

  [$E_7$],
  [$
    pi_i & = epsilon_1 + dots.c + epsilon_i + min{i, 8 - i} dot.c epsilon_8
           quad (i < 7), \
    pi_7 & = 2 epsilon_8, \
     rho & = 6 epsilon_1 + 5 epsilon_2 + dots.c + epsilon_6 + 17 epsilon_8
  $],
  [$56$],
  [$plus.minus (epsilon_i + epsilon_j)$],

  [#source(310)$E_8$],
  [$
    pi_i & = epsilon_1 + dots.c + epsilon_i - min{i, 15 - 2i} dot.c epsilon_9
           quad (i < 8), \
    pi_8 & = -3 epsilon_9, \
     rho & = 7 epsilon_1 + 6 epsilon_2 + dots.c + epsilon_7 - 22 epsilon_9
  $],
  [$248$],
  [$epsilon_i - epsilon_j,$ \
    $plus.minus (epsilon_i + epsilon_j + epsilon_k),$ \
    0 (of multiplicity 8)],

  [$F_4$],
  [$
    pi_1 & = epsilon_1, \
    pi_2 & = (3 epsilon_1 + epsilon_2 + epsilon_3 + epsilon_4)\/2 \
    pi_3 & = 2 epsilon_1 + epsilon_2 + epsilon_3, \
    pi_4 & = epsilon_1 + epsilon_2, \
     rho & = (11 epsilon_1 + 5 epsilon_2 + 3 epsilon_3 + epsilon_4)\/2
  $],
  [$26$],
  [$plus.minus epsilon_i,$ \
    $(plus.minus epsilon_1 plus.minus epsilon_2$ \
    $plus.minus epsilon_3 plus.minus epsilon_4)\/2$ \
    0 (of multiplicity 2)],

  [$G_2$],
  [$
    pi_1 & = epsilon_1, \
    pi_2 & = epsilon_1 - epsilon_3, \
     rho & = 2 epsilon_1 - epsilon_3
  $],
  [$7$],
  [$plus.minus epsilon_i, 0$],
)

#table-section[Matrices Inverse to Cartan
  Matrices] <tab:inverse-cartan-matrices>
The matrix $(A^T)^(-1)$ inverse to the transposed Cartan matrix $A$ is the
matrix of the passage from a system of simple roots to the system of fundamental
weights, i.e. its $i$-th column contains the coefficients of the expression of
$pi_i$ via simple roots. In particular, the doubled sum of all of its columns
(shown in the last column of the table) contains the coefficients of the
expression of the sum $2 rho$ of positive roots via simple roots. The matrix
$diag{d_1, ..., d_l} (A^T)^(-1)$, where $d_i = (alpha_i, alpha_i)\/2$ (these
numbers are indicated in the column "$d$") is the Gram matrix of the system of
fundamental weights.

#table-2(
  columns: (9.5%, 1fr, 8.5%, 18%),
  align: center + horizon,
  head: ([type \ of $G$], [$(A^T)^(-1)$], [$d$], [$2 rho$]),
  [$A_l$],
  [$
    1/(l + 1) mat(
      l, l - 1, l - 2, ..., 2, 1;
      l - 1, 2(l - 1), 2(l - 2), ..., 2 dot.c 2, 2;
      (l - 2), 2(l - 2), 3(l - 2), ..., 3 dot.c 2, 3;
      ..., ..., ..., ..., ..., ...;
      2, 2 dot.c 2, 3 dot.c 2, ..., (l - 1)2, l - 1;
      1, 2, 3, ..., l - 1, l
    )
  $],
  [$ mat(delim: #none, 1; 1; 1; ...; 1; 1) $],
  [$ mat(delim: #none, l; 2(l - 1); 3(l - 2); ...; (l - 1)2; l) $],

  [#source(311)$B_l$],
  [$
    1/2 mat(
      2, 2, 2, ..., 2, 1;
      2, 4, 4, ..., 4, 2;
      2, 4, 6, ..., 6, 3;
      ..., ..., ..., ..., ..., ...;
      2, 4, 6, ..., 2(l - 1), l - 1;
      2, 4, 6, ..., 2(l - 1), l
    )
  $],
  [$ mat(delim: #none, 1; 1; 1; ...; 1; 1\/2) $],
  [$
    mat(
      delim: #none,
      2l - 1; 2(2l - 2); 3(2l - 3); ...; (l - 1)(l + 1); l^2
    )
  $],

  [$C_l$],
  [$
    1/2 mat(
      2, 2, 2, ..., 2, 2;
      2, 4, 4, ..., 4, 4;
      2, 4, 6, ..., 6, 6;
      ..., ..., ..., ..., ..., ...;
      2, 4, 6, ..., 2(l - 1), 2(l - 1);
      1, 2, 3, ..., l - 1, l
    )
  $],
  [$ mat(delim: #none, 1; 1; 1; ...; 1; 2) $],
  [$
    mat(
      delim: #none,
      2l; 2(2l - 1); 3(2l - 2); ...; (l - 1)(l + 2); l(l + 1)\/2
    )
  $],

  [$D_l$],
  [$
    1/4 mat(
      4, 4, 4, ..., 4, 2, 2;
      4, 8, 8, ..., 8, 4, 4;
      4, 8, 12, ..., 12, 6, 6;
      ..., ..., ..., ..., ..., ..., ...;
      4, 8, 12, ..., 4(l - 2), 2(l - 2), 2(l - 2);
      2, 4, 6, ..., 2(l - 2), l, l - 2;
      2, 4, 6, ..., 2(l - 2), l - 2, l
    )
  $],
  [$ mat(delim: #none, 1; 1; 1; ...; 1; 1; 1) $],
  [$
    mat(
      delim: #none,
      2l - 2; 2(2l - 3); 3(2l - 4); ...; (l - 2)(l + 1);
      (l - 1)l\/2; l(l - 1)\/2
    )
  $],

  [$E_6$],
  [$
    1/3 mat(
      align: #right,
      4, 5, 6, 4, 2, 3;
      5, 10, 12, 8, 4, 6;
      6, 12, 18, 12, 6, 9;
      4, 8, 12, 10, 5, 6;
      2, 4, 6, 5, 4, 3;
      3, 6, 9, 6, 3, 6
    )
  $],
  [$ mat(delim: #none, 1; 1; 1; 1; 1; 1) $],
  [$ mat(delim: #none, align: #right, 16; 30; 42; 30; 16; 22) $],

  [$E_7$],
  [$
    1/2 mat(
      align: #right,
      3, 4, 5, 6, 4, 2, 3;
      4, 8, 10, 12, 8, 4, 6;
      5, 10, 15, 18, 12, 6, 9;
      6, 12, 18, 24, 16, 8, 12;
      4, 8, 12, 16, 12, 6, 8;
      2, 4, 6, 8, 6, 4, 4;
      3, 6, 9, 12, 8, 4, 7
    )
  $],
  [$ mat(delim: #none, 1; 1; 1; 1; 1; 1; 1) $],
  [$ mat(delim: #none, align: #right, 27; 52; 75; 96; 66; 34; 49) $],

  [#source(312)$E_8$],
  [$
    mat(
      align: #right,
      2, 3, 4, 5, 6, 4, 2, 3;
      3, 6, 8, 10, 12, 8, 4, 6;
      4, 8, 12, 15, 18, 12, 6, 9;
      5, 10, 15, 20, 24, 16, 8, 12;
      6, 12, 18, 24, 30, 20, 10, 15;
      4, 8, 12, 16, 20, 14, 7, 10;
      2, 4, 6, 8, 10, 7, 4, 5;
      3, 6, 9, 12, 15, 10, 5, 8
    )
  $],
  [$ mat(delim: #none, 1; 1; 1; 1; 1; 1; 1; 1) $],
  [$
    mat(
      delim: #none,
      align: #right,
      58; 114; 168; 220; 270; 182; 92; 136
    )
  $],

  [$F_4$],
  [$
    mat(
      2, 3, 4, 2;
      3, 6, 8, 4;
      2, 4, 6, 3;
      1, 2, 3, 2
    )
  $],
  [$ mat(delim: #none, 1\/2; 1\/2; 1; 1) $],
  [$ mat(delim: #none, align: #right, 22; 42; 30; 16) $],

  [$G_2$],
  [$ mat(2, 3; 1, 2) $],
  [$ mat(delim: #none, 1\/3; 1) $],
  [$ mat(delim: #none, align: #right, 10; 6) $],
)

#table-section[Centers, Outer Automorphisms and Bilinear
  Invariants] <tab:centers-outer-automorphisms>
Here there are listed centers and groups of outer automorphisms of simply
connected simple complex Lie groups.

The fifth column contains the order of the automorphism $nu$ of the Dynkin
diagram that transforms the numerical labels of the highest weight of an
irreducible representation into the numerical labels of the highest weight of
the dual representation (see Exercise~@exc:opposition-involution).

In the space of the representation $R(Lambda)$, there exists a nondegenerate
symmetric or skew-symmetric invariant bilinear form if and only if $R(Lambda)$
is self-dual, i.e. $Lambda_(nu(i)) = Lambda_i$ for $i = 1, ..., l$ (see
Exercises~@exc:self-dual-iff-invariant-form and
@exc:self-dual-irreducible-criterion). This form is symmetric if and only if
$Ker R(Lambda)$ contains the element of the center $Z(G) tilde.eq P^or \/ Q^or$
corresponding to the element $b in P^or$, indicated in the last column, i.e. if
$Lambda(b) in ZZ$ (see Exercises~@exc:orthogonal-symplectic-parity and
@exc:orthogonal-symplectic-black-vertices).

For the groups $E_8$, $F_4$ and $G_2$ not mentioned in the table the centers and
the groups of outer automorphisms are trivial and any of their linear
representations possesses a nondegenerate symmetric invariant bilinear form.

#source(313)
#sideways(
  book-table(
    columns: (10.5fr, 11.5fr, 31fr, 12fr, 5fr, 30fr),
    align: center + horizon,
    head: (
      [Type of $G$],
      [$Z(G)$ \ $tilde.eq P^or \/ Q^or$],
      [The generators of $P^or \/ Q^or$],
      [$Aut G \/ Int G$],
      [$abs(nu)$],
      [$b$],
    ),
    [$A_l$ \ $(l > 1)$],
    [$ZZ_(l + 1)$],
    [$(h_1 + 2 h_2 + dots.c + l h_l)\/(l + 1)$],
    [$ZZ_2$],
    [2],
    [$(h_1 + h_3 + dots.c + h_l)\/2$ for $l = 2q + 1$, \ 0 otherwise],

    [$A_1$],
    [$ZZ_2$],
    [$h_1\/2$],
    [${e}$],
    [1],
    [$h_1\/2$],

    [$B_l$],
    [$ZZ_2$],
    [$h_l\/2$],
    [${e}$],
    [1],
    [$h_l\/2$ for $l = 4q + 1, 4q + 2$, \ 0 otherwise],

    [$C_l$],
    [$ZZ_2$],
    [$(h_1 + h_3 + h_5 + dots.c)\/2$],
    [${e}$],
    [1],
    [$(h_1 + h_3 + h_5 + dots.c)\/2$],

    [$D_l$ \ ($l$ odd)],
    [$ZZ_4$],
    [$(h_1 + h_3 + dots.c + h_(l - 2))\/2 + (h_(l - 1) - h_l)\/4$],
    [$ZZ_2$],
    [2],
    [$(h_(l - 1) + h_l)\/2$ for $l = 4q + 3$, \ 0 otherwise],

    [$D_l$ \ ($l$ even)],
    [$ZZ_2 times ZZ_2$],
    [$(h_1 + h_3 + dots.c + h_(l - 1))\/2$, \ $(h_(l - 1) + h_l)\/2$],
    [$ZZ_2$ for $l > 4$ \ $S_3$ for $l = 4$],
    [1],
    [$(h_(l - 1) + h_l)\/2$ for $l = 4q + 2$, \ 0 otherwise],

    [$E_6$],
    [$ZZ_3$],
    [$(h_1 - h_2 + h_4 - h_5)\/3$],
    [$ZZ_2$],
    [2],
    [0],

    [$E_7$],
    [$ZZ_2$],
    [$(h_1 + h_3 + h_7)\/2$],
    [${e}$],
    [1],
    [$(h_1 + h_3 + h_7)\/2$],
  ),
)

#table-section[Exponents] <tab:exponents>
#source(314)On exponents $m_1, ..., m_l$ see @ss:weyl-groups-and-exponents[°].
Besides the exponents, the table contains the order $abs(h)$ of the
Killing-Coxeter element and the order $abs(W)$ of the Weyl group.

#book-table(
  columns: (1fr, 2fr, 1fr, 1.25fr),
  align: center + horizon,
  head: (
    [Type of $frak(g)$],
    [$m_1, m_2, ..., m_l$],
    [$abs(h)$],
    [$abs(W)$],
  ),
  [$A_l$],
  [$1, 2, 3, ..., l$],
  [$l + 1$],
  [$(l + 1)!$],
  [$B_l, C_l$],
  [$1, 3, 5, ..., 2l - 1$],
  [$2l$],
  [$2^l dot.c l!$],
  [$D_l$],
  [$1, 3, 5, ..., 2l - 3, l - 1$],
  [$2(l - 1)$],
  [$2^(l - 1) dot.c l!$],

  [$E_6$],
  [$1, 4, 5, 7, 8, 11$],
  [$12$],
  [$2^7 dot.c 3^4 dot.c 5$],
  [$E_7$],
  [$1, 5, 7, 9, 11, 13, 17$],
  [$18$],
  [$2^10 dot.c 3^4 dot.c 5 dot.c 7$],

  [$E_8$],
  [$1, 7, 11, 13, 17, 19, 23, 29$],
  [$30$],
  [$2^14 dot.c 3^5 dot.c 5^2 dot.c 7$],

  [$F_4$],
  [$1, 5, 7, 11$],
  [$12$],
  [$2^7 dot.c 3^2$],
  [$G_2$],
  [$1, 5$],
  [$6$],
  [$2^2 dot.c 3$],
)
