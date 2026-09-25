// Reference Chapter, § 2. Tables: Table 8. Printed pages 309-311. The
// description begins at the foot of page 309 below the end of Table 7;
// the table is printed sideways on pages 310-311, one part per page.
// Page 312 begins with Table 9.
#import "main-defs.typ": *
#import "statements.typ": *

// The columns and the column heads of Table 8, shared by its two printed
// parts, each a sideways page. The columns "Matrix description" and "a"
// share the length of the page; the others are as wide as their widest
// entry, which a wider inset than the tables' keeps clear of the rules.
#let table-8(..rows) = sideways(book-table(
  columns: (auto, 1fr, auto, auto, auto, 1fr),
  align: center + horizon,
  inset: (x: 0.7em, y: 0.5em),
  head: (
    table.cell(colspan: 2)[$frak(g)$],
    table.cell(colspan: 2)[$frak(k)$],
    table.cell(rowspan: 2, align: center + bottom)[$frak(p)$],
    table.cell(rowspan: 2, align: center + bottom)[$frak(a)$],
    [Type],
    [Matrix description],
    [Type],
    [description],
  ),
  ..rows,
))

#table-section[Matrix Realizations of Classical Real Lie
  Algebras] <tab:classical-real-matrix-realizations> In the table are given
matrix realizations of real forms $frak(g)$ of classical complex Lie algebras,
their Cartan decomposition $frak(g) = frak(k) plus.o frak(p)$ and the maximal
$RR$-diagonalizable subalgebras $frak(a) subset frak(g)$. The matrices are real
for $frak(g) = frak(s l)_n (RR)$, $frak(s o)_(p, q)$, $frak(s p)_n (RR)$ and
complex otherwise.

#source(325)#table-8(
  [$frak(s l)_n (RR)$],
  [$X in frak(g l)_n (RR)$, \ $tr X = 0$],
  [$frak(s o)_n$],
  [$X^T = -X$],
  [$X^T = X$, \ $tr X = 0$],
  [$diag(x_1, ..., x_n)$, \ $x_1 + dots.c + x_n = 0$],

  [$frak(s l)_n (HH)$ \ $(n >= 2)$],
  [$ bordered(, n, n; n, X, Y; n, -overline(Y), overline(X)) $
    $Re tr X = 0$],
  [$frak(s p)_n$],
  [$overline(X)^T = -X$, \ $Y^T = Y$],
  [$overline(X)^T = X$, \ $tr X = 0$, \ $Y^T = -Y$],
  [$diag(x_1, ..., x_n, x_1, ..., x_n)$, \
    $x_i in RR$, $x_1 + dots.c + x_n = 0$],

  [$frak(s u)_(p, q)$ \ $(p <= q)$],
  [$ bordered(, p, q; p, X_1, Y; q, overline(Y)^T, X_2) $
    $overline(X)_1^T = -X_1$, $overline(X)_2^T = -X_2$, \
    $tr X_1 + tr X_2 = 0$],
  [$frak(s u)_p plus.o frak(u)_q$],
  [$Y = 0$],
  [$X_1 = 0$, \ $X_2 = 0$],
  [$limits(plus.o.big)_(1 <= j <= p) RR(E_(j, p+j) + E_(p+j, j))$],

  [$frak(s o)_(p, q)$ \ $(p <= q)$],
  [$ bordered(, p, q; p, X_1, Y; q, Y^T, X_2) $
    $X_1^T = -X_1$, $X_2^T = -X_2$],
  [$frak(s o)_p plus.o frak(s o)_q$],
  [$Y = 0$],
  [$X_1 = 0$, \ $X_2 = 0$],
  [$limits(plus.o.big)_(1 <= j <= p) RR(E_(j, p+j) + E_(p+j, j))$],
)

#source(326)#table-8(
  [$frak(s p)_(2n) (RR)$ \ $(n >= 1)$],
  [$ bordered(, n, n; n, X, Y_1; n, Y_2, -X^T) $
    $Y_1^T = Y_1$, $Y_2^T = Y_2$],
  [$frak(u)_n$],
  [$X^T = -X$, \ $Y_2 = -Y_1$],
  [$X^T = X$, \ $Y_2 = Y_1$],
  [$diag(x_1, ..., x_n, -x_1, ..., -x_n)$],

  [$frak(s p)_(p, q)$ \ $(p <= q)$],
  [$
      bordered(

        , p, q, p, q;
        p, X_(11), X_(12), X_(13), X_(14);
        q, overline(X)_(12)^T, X_(22), X_(14)^T, X_(24);
        p, -overline(X)_(13), overline(X)_(14), overline(X)_(11),
        -overline(X)_(12);
        q, overline(X)_(14)^T, -overline(X)_(24), -X_(12)^T,
        overline(X)_(22)
      )
    $
    $overline(X)_(11)^T = -X_(11)$, $overline(X)_(22)^T = -X_(22)$, \
    $X_(13)^T = X_(13)$, $X_(24)^T = X_(24)$],
  [$frak(s p)_p plus.o frak(s p)_q$],
  [$X_(12) = X_(14) = 0$],
  [$X_(11) = X_(13) = 0$ \ $X_(22) = X_(24) = 0$],
  [$
    inline(limits(plus.o.big)_(1 <= j <= p)) RR\(& E_(j, p+j) + E_(p+j, j) \
    & class("binary", -) E_(p+q+j, 2p+q+j) - E_(2p+q+j, p+q+j)\)
  $],

  [$frak(u)_n^* (HH)$],
  [$ bordered(, n, n; n, X, Y; n, -overline(Y), overline(X)) $
    $X^T = -X$, $Y^T = overline(Y)$],
  [$frak(u)_n$],
  [$overline(X) = X$, \ $overline(Y) = Y$],
  [$overline(X) = -X$, \ $overline(Y) = -Y$],
  [$
    i RR\( & E_(12) - E_(21) - E_(n+1, n+2) \
           & class("binary", +) E_(n+2, n+1)\) plus.o i RR\(E_(34) - E_(43) \
           & class("binary", -) E_(n+3, n+4) + E_(n+4, n+3)\) plus.o dots.c
  $],
)
