// Reference Chapter, § 2. Tables: Table 5 with its description. Printed
// pages 299-305; page 299 is shared with Table 4, page 305 with Table 6.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/73-table-5.typ": delta-pq

// Table 5 is one frame flowing over the pages. Each type has its framed head
// with a remark beside it, its formulas and the dimensions of the
// representations met in them: two columns "Λ | dim R(Λ)" under their head
// for the classical types, a row of weights over a row of dimensions for the
// exceptional ones. The framed head of a type is a header of level 2 that is
// not repeated: it ends the repetition of the dimensions head of the type
// before (statements.typ, `book-table`). The dimensions head is a header of
// level 3, repeated at the top of the next page while its list continues. The
// formulas of a type are one row, kept on one page as the book prints each
// block. The frame is closed on every page: its top is the rule under the
// caption, its bottom a footer of zero height, repeated on every page.
#let weight-width = 21%
#let rule = 0.5pt

#let table-5(..rows) = book-table(
  columns: (weight-width, 1fr),
  align: center + horizon,
  stroke: none,
  table.vline(x: 0, start: 1, stroke: rule),
  table.vline(x: 2, start: 1, stroke: rule),
  ..rows,
  table.footer(table.cell(colspan: 2, inset: 0pt, stroke: (top: rule))[]),
)

// In this table Ad = R(δ) is the adjoint representation, an object like R
// and 1 in its sums and products: two ordinary upright letters (TeX's
// \mathrm{Ad}), so that "Ad + 1" has a binary plus and "S^2 Ad" is set like
// "S^2 R". The operator Ad of main-defs.typ would make a plus after it a
// sign, and a word "Ad" would take the space of the source around it.
#let adjoint = $upright(A d)$

// The table sets the sums of its formulas at text size with the range
// underneath.
#let sum = math.limits(sym.sum)

// The lines of a block of formulas are paragraphs flush with the framed
// head; numbered lines hang their numbers in the margin. Displays and ranges
// of several lines under a sum are centred.
#let number-width = 1.6em
#let block-inset = (left: number-width + 0.3em, right: 0.5em)

// The framed type with a remark beside it: `type-head($B_l, quad l >= 2$,
// note: $(n = 2l + 1)$)`.
#let type-head(label, note: none) = table.header(
  level: 2,
  repeat: false,
  table.cell(
    colspan: 2,
    align: left,
    inset: (..block-inset, top: 0.9em, bottom: 0.4em),
    stroke: (top: rule),
    {
      box(stroke: rule, inset: (x: 1.2em, y: 0.7em), label)
      if note != none {
        h(3em)
        note
      }
    },
  ),
)

// The formulas of a type, spaced as printed.
#let formulas(body) = table.cell(
  colspan: 2,
  align: left,
  inset: (..block-inset, top: 0.4em, bottom: 0.9em),
  {
    set par(spacing: 0.8em)
    show math.equation.where(block: true): set align(center)
    show math.attach: set align(center)
    body
  },
)

// The number of a line of a block, "3a.", in the margin before the line.
#let formula(number, body) = {
  h(-number-width)
  box(width: number-width - 0.4em, h(1fr) + [#number.])
  h(0.4em)
  body
}

// The head "Λ | dim R(Λ)" of the dimensions of a classical type, divided by
// the rule of the column of weights.
#let weight-cell = table.cell.with(stroke: (right: rule))
#let dims-head = table.header(
  level: 3,
  table.cell(stroke: (bottom: rule, right: rule))[$Lambda$],
  table.cell(stroke: (bottom: rule))[$dim R(Lambda)$],
)

// Weights and dimensions of an exceptional type in two rows: across the
// table, under the column of weights of the classical types, or centred.
// Across the table a longer weight gets a wider column, as printed.
// Dimensions of five digits are grouped by a thin space, as printed.
#let dims-row(weights, dims, centred: false) = table.cell(
  colspan: 2,
  inset: 0pt,
  context {
    let number(n) = {
      let digits = str(n)
      if digits.len() < 5 { digits } else {
        [#digits.slice(0, -3)#sym.space.thin#digits.slice(-3)]
      }
    }
    let share(weight) = (measure(weight).width / 1pt + 55) * 1fr
    let rows = table(
      columns: if centred { weights.len() + 1 } else {
        (weight-width, ..weights.map(share))
      },
      inset: (x: if centred { 1.1em } else { 0.25em }, y: 0.6em),
      align: center,
      stroke: (x, y) => (
        right: if x == 0 { rule },
        bottom: if y == 0 { rule },
      ),
      $Lambda$, ..weights,
      $dim R(Lambda)$, ..dims.map(number),
    )
    if centred { align(center, rows) } else { rows }
  },
)

#table-section[Decomposition of Tensor Products and Dimensions of Certain
  Representations] <tab:tensor-product-decompositions>
This table contains the decomposition into the irreducible components of tensor
products and also of exterior and symmetric powers of certain irreducible linear
representations of simple complex Lie groups. Besides, there are listed the
dimensions of all the irreducible representations occurring in the formulas of
the table. The following notation is used:

$R = R(pi_1)$ the simplest representation,

$n = dim R = l + 1, 2l + 1, 2l, 2l$ for the groups $A_l$, $B_l$, $C_l$, $D_l$,
respectively,

$adjoint = R(delta)$ the adjoint representation,

$1 = R(0)$ the unit (trivial) representation,

$Delta(p, q)$, $p >= q >= 0$ the set of pairs $(x, y) in ZZ_+^2$ such that
$x + y <= p + q$, $x - y >= p - q$, $x - y equiv p - q thick (mod 2)$, see
Fig.~@fig:delta-pq-region.

If a representation on the right-hand side of a formula is denoted by a
meaningless symbol (e.g., $R(-pi_1 + pi_2)$) it is meant to be zero.

#book-figure(delta-pq) <fig:delta-pq-region>

#source(315)#table-5(
  type-head($A_1$),
  formulas[
    #formula(1)[$S^p R = R(p pi_1)$.]

    #formula(2)[$R(p pi_1) R(q pi_1)
      = sum_(0 <= i <= q) R((p + q - 2i) pi_1)$, $quad p >= q$;]

    $S^2 R(p pi_1) = sum_(i >= 0) R((2p - 4i) pi_1)$.

    $dim R(p pi_1) = p + 1$
  ],

  type-head($A_l, quad l >= 2$, note: $(n = l + 1)$),
  formulas[
    In the right-hand sides of formulas we assume that $pi_0 = pi_n = 0$.

    #formula(1)[$and.big^p R = R(pi_p)$.]

    #formula(2)[$S^p R = R(p pi_1)$.]

    #formula(3)[$R(pi_p) R(pi_q) = sum_(i >= 0) R(pi_(p + i) + pi_(q - i))$,
      $quad p >= q$;]

    $S^2 R(pi_p) = sum_(i >= 0) R(pi_(p + 2i) + pi_(p - 2i))$.

    #formula(4)[$R(p pi_1) R(pi_q) = R(p pi_1 + pi_q)
      + R((p - 1) pi_1 + pi_(q + 1))$.]

    #formula(5)[$R(p pi_1) R(q pi_1)
      = sum_(0 <= i <= q) R((p + q - 2i) pi_1 + i pi_2)$, $quad p >= q$;]

    $S^2 R(p pi_1) = sum_(i >= 0) R((2p - 4i) pi_1 + 2i pi_2)$.

    #formula(6)[$R(p pi_1) adjoint = R((p + 1) pi_1 + pi_l) + R(p pi_1)
    + R((p - 1) pi_1 + pi_2 + pi_l)$]
    $ class("binary", +) R((p - 2) pi_1 + pi_2). $

    #formula(7)[$R(pi_p) adjoint = R(pi_1 + pi_p + pi_l)
      + R(pi_1 + pi_(p - 1)) + R(pi_(p + 1) + pi_l) + R(pi_p)$,
      $quad 2 <= p <= l - 1$.]

    #formula(8)[$R(p pi_1) R(q pi_l)
      = sum_(i >= 0) R((p - i) pi_1 + (q - i) pi_l)$.]

    #formula(9)[$and.big^2 adjoint = R(2 pi_1 + pi_(l - 1)) + R(pi_2 + 2 pi_l)
      + adjoint$;]
    $
      S^2 adjoint = cases(
        R(2 pi_1 + 2 pi_l) + R(pi_2 + pi_(l - 1)) + adjoint + 1\,
        quad l >= 3\,,
        R(2 pi_1 + 2 pi_2) + adjoint + 1\, quad l = 2.
      )
    $
  ],
  dims-head,
  weight-cell[$pi_p$],
  $ binom(n, p) $,
  weight-cell[$p pi_1$],
  $ binom(n + p - 1, p) $,
  weight-cell[$pi_p + pi_q$],
  $ (p - q + 1)/(p + 1) binom(n, p) binom(n + 1, q), quad p >= q $,
  weight-cell[$p pi_1 + pi_q$],
  $ q/(p + q) binom(n + p, p) binom(n, q) $,
  weight-cell[$p pi_1 + q pi_l$],
  $ (n + p + q - 1)/(n - 1) binom(n + p - 2, p) binom(n + q - 2, q) $,
  weight-cell[$p pi_1 + q pi_2$],
  $ (p + 1)/(p + q + 1) binom(n + p + q - 1, p + q) binom(n + q - 2, q) $,
  weight-cell[$p pi_1 + pi_q + pi_l$],
  $ (n(n - q) q)/((p + q)(n + p)) binom(n + p + 1, p) binom(n + 1, q) $,

  type-head($B_l, quad l >= 2$, note: $(n = 2l + 1)$),
  formulas[
    #source(316)Notation:
    $
      hat(pi)_p = cases(
        pi_p & quad "for" 1 <= p <= l - 1\,,
        2 pi_l & quad "for" p = l\, l + 1\,,
        pi_(n - p) & quad "for" l + 2 <= p <= 2l\,
      )
      wide hat(pi)_0 = hat(pi)_n = 0.
    $

    #formula(1)[$and.big^p R = R(hat(pi)_p)$.]

    #formula(2)[$S^p R = sum_(i >= 0) R((p - 2i) pi_1)$.]

    #formula(3)[$R(hat(pi)_p) R(hat(pi)_q)
      = sum_((x, y) in Delta(p, q)) R(hat(pi)_x + hat(pi)_y)$,
      $quad q <= p <= l$;]

    $S^2 R(hat(pi)_p) = sum_((x, y) in Delta(p, p) \ x equiv y (mod 4))
    R(hat(pi)_x + hat(pi)_y)$, $quad p <= l$.

    #formula(4)[$R(p pi_1) R(hat(pi)_q) = R(p pi_1 + hat(pi)_q)
    + R((p - 1) pi_1 + hat(pi)_(q - 1))$]
    $
      class("binary", +) R((p - 1) pi_1 + hat(pi)_(q + 1))
      + R((p - 2) pi_1 + hat(pi)_q), quad 2 <= q <= n - 2.
    $

    #formula(5)[$R(p pi_1) R(q pi_1)
      = sum_((x, y) in Delta(p, q)) R((x - y) pi_1 + y hat(pi)_2)$;]

    $S^2 R(p pi_1)
    = sum_((x, y) in Delta(p, p) \ x equiv y equiv 0 (mod 2))
    R((x - y) pi_1 + y hat(pi)_2)$.

    #formula(6)[$R(hat(pi)_p) R(pi_l)
      = sum_(0 <= i <= p) R(hat(pi)_(p - i) + pi_l)$, $quad p <= l$.]

    #formula(7)[$R(p pi_1) R(pi_l) = R(p pi_1 + pi_l)
      + R((p - 1) pi_1 + pi_l)$.]

    #formula(8)[$R(pi_l)^2 = sum_(0 <= i <= l) R(hat(pi)_(l - i))$;]

    $S^2 R(pi_l) = sum_(0 <= i <= l; i equiv 0, 3 (mod 4))
    R(hat(pi)_(l - i))$.
  ],
  dims-head,
  weight-cell[$hat(pi)_p$],
  $ binom(n, p) $,
  weight-cell[$p pi_1$],
  $ (n + 2p - 2)/(n + p - 2) binom(n + p - 2, p) $,
  weight-cell[$hat(pi)_p + hat(pi)_q$],
  $
    ((p - q + 1)(n - p - q + 1))/((p + 1)(n - p + 1))
    binom(n, p) binom(n + 2, q), quad q <= p <= l
  $,
  weight-cell[$p pi_1 + hat(pi)_q$],
  $
    ((n + 2p) q)/((p + q)(n + p - q)) binom(n + p - 1, p) binom(n - 1, q),
    quad 1 <= q <= n - 1
  $,
  weight-cell[$(p - q) pi_1 + q hat(pi)_2$],
  $
    ((p - q + 1)(n + 2p - 2)(n + p + q - 3)(n + 2q - 4))
    /((p + 1)(n - 2)(n - 3)(n - 4)) \
    class("binary", dot) binom(n + p - 4, p) binom(n + q - 5, q)
  $,
  weight-cell[$pi_l$],
  $ 2^l $,
  weight-cell[$hat(pi)_p + pi_l$],
  $ 2^l (n - 2p + 1)/(n - p + 1) binom(n, p), quad p <= l $,
  weight-cell[$p pi_1 + pi_l$],
  $ 2^l binom(n + p - 2, p) $,

  type-head($C_l, quad l >= 2$, note: $(n = 2l)$),
  formulas[
    #source(317)In the right-hand sides of formulas we assume that $pi_0 = 0$.

    #formula(1)[$and.big^p R = sum_(i >= 0) R(pi_(p - 2i))$, $quad p <= l$.]

    #formula(2)[$S^p R = R(p pi_1)$.]

    #formula(3)[$R(pi_p) R(pi_q)
      = sum_((x, y) in Delta(p, q) \ x - y <= n - p - q) R(pi_x + pi_y)$,
      $quad p >= q$;]

    $S^2 R(pi_p)
    = sum_((x, y) in Delta(p, p) \ x - y <= n - 2p
    \ x equiv y equiv p (mod 2))
    R(pi_x + pi_y)$.

    #formula(4)[$R(p pi_1) R(pi_q) = R(p pi_1 + pi_q)
    + R((p - 1) pi_1 + pi_(q + 1))$]
    $
      class("binary", +) R((p - 1) pi_1 + pi_(q - 1))
      + R((p - 2) pi_1 + pi_q), quad 2 <= q <= l.
    $

    #formula(5)[$R(p pi_1) R(q pi_1)
      = sum_((x, y) in Delta(p, q)) R((x - y) pi_1 + y pi_2)$;]

    $S^2 R(p pi_1) = sum_((x, y) in Delta(p, p) \ x - y equiv 2p (mod 4))
    R((x - y) pi_1 + y pi_2)$.
  ],
  dims-head,
  weight-cell[$pi_p$],
  $ (n - 2p + 2)/(n - p + 2) binom(n + 1, p) $,
  weight-cell[$p pi_1$],
  $ binom(n + p - 1, p) $,
  weight-cell[$pi_p + pi_q$],
  $
    ((p - q + 1)(n - 2p + 2)(n - p - q + 3)(n - 2q + 4))
    /((p + 1)(n - p + 2)(n - p + 3)(n - q + 4)) \
    class("binary", dot) binom(n + 1, p) binom(n + 3, q), quad p >= q
  $,
  weight-cell[$p pi_1 + pi_q$],
  $
    ((n - 2q + 2) q)/((p + q)(n + p - q + 2)) binom(n + p + 1, p)
    binom(n + 1, q)
  $,
  weight-cell[$(p - q) pi_1 + q pi_2$],
  $
    ((p - q + 1)(n + p + q - 1))/((p + 1)(n - 1)) binom(n + p - 2, p)
    binom(n + q - 3, q)
  $,

  type-head($D_l, quad l >= 3$, note: $(n = 2l)$),
  formulas[
    Notation:
    $
      & hat(pi)_p = cases(
          pi_p & quad "for" 1 <= p <= l - 2\,,
          pi_(l - 1) + pi_l & quad "for" p = l - 1\, l + 1\,,
          pi_(n - p) & quad "for" l + 2 <= p <= 2l - 1\,
        )
        wide hat(pi)_0 = hat(pi)_n = 0, \
      & R(hat(pi)_l) = R(2 pi_(l - 1)) + R(2 pi_l), \
      & R(hat(pi)_l + Lambda) = R(2 pi_(l - 1) + Lambda)
        + R(2 pi_l + Lambda), \
      & R(2 hat(pi)_l) = R(4 pi_(l - 1)) + R(4 pi_l).
    $

    Formulas 1--5 are the same as for $B_l$.

    #source(318)#formula("3a")[$R(2 pi_l) R(hat(pi)_p)
      = sum_(i >= 0) R(2 pi_l + hat(pi)_(p - 2i))
      + sum_((x, y) in Delta(l, p) \ x < l) R(hat(pi)_x + hat(pi)_y)$,
      $quad p <= l - 1$.]

    #formula("3b")[$R(2 pi_l) R(2 pi_(l - 1))
      = sum_(y <= x < l \ x equiv y equiv l - 1 (mod 2))
      R(hat(pi)_x + hat(pi)_y)$.]

    #formula("3c")[$R(2 pi_l)^2 = R(4 pi_l)
      + sum_(i >= 1) R(2 pi_l + hat(pi)_(l - 2i))
      + sum_(y <= x < l \ x equiv y equiv l (mod 2))
      R(hat(pi)_x + hat(pi)_y)$;]

    $S^2 R(2 pi_l) = R(4 pi_l) + sum_(i >= 1) R(2 pi_l + hat(pi)_(l - 4i))
    + sum_(y <= x < l \ x equiv y equiv l (mod 2) \ x equiv y (mod 4))
    R(hat(pi)_x + hat(pi)_y)$.

    #formula("4a")[$R(p pi_1) R(2 pi_l) = R(p pi_1 + 2 pi_l)
      + R((p - 1) pi_1 + hat(pi)_(l - 1)) + R((p - 2) pi_1 + 2 pi_(l - 1))$.]

    #formula(6)[$R(hat(pi)_p) R(pi_l)
      = sum_(i >= 0) R(hat(pi)_(p - 2i) + pi_l)
      + sum_(i >= 0) R(hat(pi)_(p - 2i - 1) + pi_(l - 1))$, $quad p <= l - 1$.]

    #formula("6a")[$R(2 pi_l) R(pi_l)
      = R(3 pi_l) + sum_(i >= 1) R(hat(pi)_(l - 2i) + pi_l)$.]

    #formula(7)[$R(p pi_1) R(pi_l) = R(p pi_1 + pi_l)
      + R((p - 1) pi_1 + pi_(l - 1))$.]

    #formula(8)[$R(pi_l) R(pi_(l - 1))
      = sum_(i >= 0) R(hat(pi)_(l - 2i - 1))$.]

    #formula(9)[$R(pi_l)^2 = R(2 pi_l) + sum_(i >= 1) R(hat(pi)_(l - 2i))$;]

    $S^2 R(pi_l) = R(2 pi_l) + sum_(i >= 1) R(hat(pi)_(l - 4i))$.
  ],
  dims-head,
  weight-cell[$hat(pi)_p$],
  $ binom(n, p) $,
  weight-cell[$p pi_1$],
  $ (n + 2p - 2)/(n + p - 2) binom(n + p - 2, p) $,
  weight-cell[$hat(pi)_p + hat(pi)_q$],
  $
    ((p - q + 1)(n - p - q + 1))/((p + 1)(n - p + 1))
    binom(n, p) binom(n + 2, q), quad q <= p <= l
  $,
  weight-cell[$p pi_1 + hat(pi)_q$],
  $
    ((n + 2p) q)/((p + q)(n + p - q)) binom(n + p - 1, p) binom(n - 1, q),
    quad 1 <= q <= n - 1
  $,
  weight-cell[$(p - q) pi_1 + q hat(pi)_2$],
  $
    ((p - q + 1)(n + 2p - 2)(n + p + q - 3)(n + 2q - 4))
    /((p + 1)(n - 2)(n - 3)(n - 4)) \
    class("binary", dot) binom(n + p - 4, p) binom(n + q - 5, q)
  $,
  weight-cell[$2 pi_l$],
  $ binom(n - 1, l - 1) $,
  weight-cell[$2 pi_l + hat(pi)_p$],
  $
    (2(l - p + 1)^2)/((l + 1)(n - p + 2)) binom(n - 1, l - 1)
    binom(n + 1, p), quad p <= l - 1
  $,
  weight-cell[$4 pi_l$],
  $ 2/((l + 1)(l + 2)) binom(n - 1, l - 1) binom(n + 1, l) $,
  weight-cell[$p pi_1 + 2 pi_l$],
  $ l/(l + p) binom(n - 1, l - 1) binom(n + p - 1, p) $,
  weight-cell[#source(319)$pi_l$],
  $ 2^(l - 1) $,
  weight-cell[$hat(pi)_p + pi_l$],
  $ 2^(l - 1) dot (n - 2p + 1)/(n - p + 1) binom(n, p), quad p <= l - 1 $,
  weight-cell[$p pi_1 + pi_l$],
  $ 2^(l - 1) binom(n + p - 2, p) $,
  weight-cell[$3 pi_l$],
  $ 2^l dot 1/(l + 1) binom(n - 1, l - 1) $,

  type-head($E_6$),
  formulas[
    #formula(1)[$and.big^2 R = R(pi_2)$;]

    $S^2 R = R(2 pi_1) + R^*$.

    #formula(2)[$R R^* = R(pi_1 + pi_5) + adjoint + 1$.]

    #formula(3)[$R dot adjoint = R(pi_1 + pi_6) + R(pi_2)^* + R$.]

    #formula(4)[$and.big^2 adjoint = R(pi_3) + adjoint$;]

    $S^2 adjoint = R(2 pi_6) + R(pi_1 + pi_5) + 1$.

    $(R = R(pi_1), quad adjoint = R(pi_6).)$
  ],
  dims-row(
    (
      $pi_1$,
      $pi_6$,
      $pi_2$,
      $2 pi_1$,
      $pi_1 + pi_5$,
      $pi_1 + pi_6$,
      $2 pi_6$,
      $pi_3$,
    ),
    (27, 78, 351, 351, 650, 1728, 2430, 2925),
  ),

  type-head($E_7$),
  formulas[
    #formula(1)[$and.big^2 R = R(pi_2) + 1$;]

    $S^2 R = R(2 pi_1) + adjoint$.

    #formula(2)[$R dot adjoint = R(pi_1 + pi_6) + R(pi_7) + R$.]

    #formula(3)[$and.big^2 adjoint = R(pi_5) + adjoint$;]

    $S^2 adjoint = R(2 pi_6) + R(pi_2) + 1$.

    $(R = R(pi_1), quad adjoint = R(pi_6).)$
  ],
  dims-row(
    (
      $pi_1$,
      $pi_6$,
      $pi_7$,
      $2 pi_1$,
      $pi_2$,
      $pi_1 + pi_6$,
      $2 pi_6$,
      $pi_5$,
    ),
    (56, 133, 912, 1463, 1539, 6480, 7371, 8645),
  ),

  type-head($E_8$),
  formulas[
    #formula(1)[$and.big^2 R = R(pi_2) + R$;]

    $S^2 R = R(2 pi_1) + R(pi_7) + 1$.

    $(R = adjoint = R(pi_1).)$
  ],
  dims-row(
    ([#source(320)$pi_1$], $pi_7$, $2 pi_1$, $pi_2$),
    (248, 3875, 27000, 30380),
    centred: true,
  ),

  type-head($F_4$),
  formulas[
    #formula(1)[$and.big^2 R = R(pi_2) + adjoint$;]

    $S^2 R = R(2 pi_1) + R + 1$.

    #formula(2)[$R dot adjoint = R(pi_1 + pi_4) + R(pi_2) + R$.]

    #formula(3)[$and.big^2 adjoint = R(pi_3) + adjoint$;]

    $S^2 adjoint = R(2 pi_4) + R(2 pi_1) + 1$.

    $(R = R(pi_1), quad adjoint = R(pi_4).)$
  ],
  dims-row(
    ($pi_1$, $pi_4$, $pi_2$, $2 pi_1$, $pi_1 + pi_4$, $2 pi_4$, $pi_3$),
    (26, 52, 273, 324, 1053, 1053, 1274),
  ),

  type-head($G_2$),
  formulas[
    #formula(1)[$and.big^2 R = adjoint + R$;]

    $S^2 R = R(2 pi_1) + 1$.

    #formula(2)[$R dot adjoint = R(pi_1 + pi_2) + R(2 pi_1) + R$.]

    #formula(3)[$and.big^2 adjoint = R(3 pi_1) + adjoint$;]

    $S^2 adjoint = R(2 pi_2) + R(2 pi_1) + 1$.

    #formula(4)[$R(2 pi_1) dot R = R(3 pi_1) + R(pi_1 + pi_2)
      + R(2 pi_1) + adjoint + R$.]

    $(R = R(pi_1), quad adjoint = R(pi_2).)$
  ],
  dims-row(
    ($pi_1$, $pi_2$, $2 pi_1$, $pi_1 + pi_2$, $2 pi_2$, $3 pi_1$),
    (7, 14, 27, 64, 77, 77),
    centred: true,
  ),
)
