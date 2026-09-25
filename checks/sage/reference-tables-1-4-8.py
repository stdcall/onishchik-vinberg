"""Exact checks of the Reference Chapter, § 1 (Useful Formulae), § 2
Tables 1-4 and Table 8 of Onishchik-Vinberg, Lie Groups and Algebraic
Groups (Springer 1990).

Pages are the printed pages of the book.  Our sources:
content/71-useful-formulae.typ, 72-tables-1-4.typ, 75-table-8.typ.  Every
expected value below was taken from the printed book and is written here as
a literal
(or, for the classical families printed with ellipses, as the formula that
expands the ellipsis -- an interpretation, checked to reproduce every
explicitly printed cell).  The Typst sources are not read.  Where the book is
wrong the printed reading is kept as a refuted check (`R.refuted`) next to
the corrected one; the run lists all refutations.

What is checked
---------------
Table 1 (printed pp. 292-295), types A_l (l <= 8), B_l, C_l
(2 <= l <= 8), D_l (3 <= l <= 8), E6, E7, E8, F4, G2, all in the book's own
coordinates (the eps_i of the paragraph before the table, with the printed
Gram matrix; E6 with the auxiliary eps, (eps, eps) = 1/2):
  the printed root sets (count = dim G - l, root-system axioms, reduced);
  the printed simple roots are a base whose Cartan matrix is the printed
  Dynkin diagram (bonds and arrows, book rule: arrow towards the shorter
  root); the book numbering against Bourbaki/Sage; delta is the highest
  root and equals the printed combination of pi_i; the printed pi_i are the
  fundamental weights, rho = sum pi_i = half the sum of positive roots;
  dim G; dim R(pi_1) and the printed weights of R(pi_1) with multiplicities
  (against Sage's character ring); the Weyl group statements of the
  paragraph (permutations, sign changes, -id for E7, E8, G2).
  Refuted: 'delta = pi_2' for B_2 (the row is headed l >= 2); delta = 2 pi_2.
  The E6 vectors eps_i, eps lie in the Q-span of the roots, i.e. in t(Q)*
  (the paragraph writes t(C)*: true, but t(Q)* is meant).
Table 2 (pp. 295-297): (A^T)^-1 with a_ij = <alpha_i|alpha_j>
  = 2(alpha_i, alpha_j)/(alpha_j, alpha_j) (the book's Cartan matrix, 4.2);
  columns = pi_i in simple roots; column d = (alpha_i, alpha_i)/2; 2 rho =
  doubled column sum = sum of positive roots; diag(d)(A^T)^-1 = Gram matrix
  of the pi_i.  Same ranks as Table 1.
Table 4 (p. 299) and 1.1 (F1)-(F8) (pp. 289-290): exponents
  from the height table of 1.1 (rows non-increasing, first row l); |W|
  (Sage), |h| = order of c = r_1 ... r_l (book numbering); (F1) |roots| =
  l sum n_i = 2 sum m_i; (F2) z = #{n_i = 1} = det A; (F3); (F5); (F6)
  charpoly of c = prod (x - zeta_h^m_i) in Q(zeta_h); c independent of the
  numbering up to conjugacy (all l! orderings, l <= 4 and F4); (F4) and (F7)
  (Molien series) summed over the conjugacy classes of W (GAP), all types
  listed.  (F8) only for consistency (degree dim G, value 2^l at 1): the
  cohomology of G is not computed.
  Refuted: D_l exponents '1, 3, 5, ..., 2l - 1, l - 1' (l + 1 numbers); the
  list is 1, 3, ..., 2l - 3, l - 1 (also Bourbaki, Lie Groups and Lie
  Algebras, Ch. 4-6, Springer 2002, VI § 4 no. 8 (IX)).
1.2 (F9)-(F11) (p. 290): (F9) in the book's model against Sage's
  dimensions (labels <= 2 for rank <= 3, <= 1 for rank 4, fundamental
  weights above); (F10) as a recursion from the printed formula, 16
  representations of A2, A3, B2, B3, C3, D4, G2, F4, E6, against Sage's
  weight multiplicities; (F11) both forms, with e_i^(k) computed in GAP's
  highest weight modules, 14 triples in A2, B2, G2, against Sage's tensor
  product decompositions.
Table 3 (pp. 297-298), all types above: invariant factors of
  P^v/Q^v; the printed generators lie in P^v and generate it; Aut G/Int G =
  automorphism group of the Dynkin diagram (order, abelian or S3); |nu| from
  -w_0; b in P^v; rho^v = 1/2 sum h_alpha = sum pi_(alpha_i^v); Lambda(b) =
  Lambda(rho^v) mod Z on the self-dual monoid; and independently of that:
  symmetric or skew invariant form from Sym^2 / Lambda^2 (Sage) for the
  self-dual generators of dimension <= 700, and no invariant form for the
  non-self-dual fundamental representations of dimension <= 700.
1.3 (pp. 290-292), real representations:
  * Explicit, independent of (F14): for the matrix realisations of Table 8
    (and the compact forms) su(p,q) (p+q <= 8), sl_n(H) (n <= 4), sl_n(R)
    (n <= 6), so(p,q) (5 <= p+q <= 12), sp_2n(R) (n <= 4), sp(p,q)
    (p+q <= 4), u*_n(H) (3 <= n <= 6): the antilinear operators commuting
    with the fundamental representations Lambda^k (primitive part for C),
    spin and half-spin (Clifford algebra) are computed exactly over Q(i);
    they decide (F13), (F12) and the index; J^2 is checked to be scalar.
    Representations of dimension > 130 are skipped (so(p,q) with
    p+q >= 10: Lambda^k for k >= 3 or 4 -- real matrices, index 1 anyway).
    Every such representation has the dimension of R(pi_i) (F9).
  * The index is a character on the monoid of Lambda with nu tau Lambda =
    Lambda (Cartan component argument, see the comment in section 8), so
    the table rows are compared on the monoid generators: the fixed pi_i
    (computed) and pi_i + pi_(nu tau i) (index 1).  Half-spin pairs are
    compared as multisets where the row is symmetric in Lambda_(l-1),
    Lambda_l; for u*_l(H) the assignment agrees with (F14) at vertex l.
  * (F14) with u = pi_j^v/2 (Kac vertex j; the vertex is tied to the
    realisation by dim k) against the explicit indices, and then against
    the corrected table for all inner forms of A_1..A_8, B, C, D up to rank
    8; the compact case against Lambda(b) in Z of Table 3.
  * Exceptional: every inner noncompact form of E6, E7, E8, F4, G2 is
    theta_j for a vertex j with the right k (components and center); (F14)
    gives the printed EVI row and 1 elsewhere on all self-conjugate
    generators.  Independently, in GAP's modules 56 and 133 of E7, 27 of E6,
    26 of F4, 7 of G2, the index for the compact and every inner noncompact
    form (and the outer E6 forms EI, EIV, identified by dim k = 36, 52) is
    computed from sigma = sigma_0 omega theta; (F12) for the 27 of E6.
  * sl_2(C) as a real algebra on V(a) (x) conj V(b), a, b <= 2 (the g_0^R
    paragraph), and the product rule on su(2)+su(2), su(2)+sl_2(R).
  Refuted, with the fixes made in the text: su_(k,2p-k): printed
  (-1)^((k+1) p Lambda_(p-1)) (and the reading Lambda_p) -> (-1)^((k+p)
  Lambda_p), e.g. su(1,3), Lambda^2 C^4 has index -1; so_(2k,2(l-k)+1):
  printed (-1)^((k + l(l-1)/2) Lambda_l) -> (-1)^((k + l(l+1)/2) Lambda_l),
  e.g. the spin representation of the split so(4,3) is real.  Also
  refuted: the so_(2k-1,2(l-k)+1) row read without the lost parenthesis,
  and the reading 2[(l-1)/2] - 1 of the last index of the sp row (the
  reading 2[(l-1)/2] + 1 = 2[(l+1)/2] - 1 holds).
Table 8 (pp. 309-311), each printed row as a real space of
  complex matrices cut out by the printed conditions: sl_n(R) n <= 6,
  'gl_n(H)' n <= 4, su(p,q) p+q <= 6, so(p,q) 3 <= p+q <= 8, sp_2n(R)
  n <= 4, sp(p,q) p+q <= 4, u*_n(H) n <= 5: real dimension = complex
  dimension of the target; contained in it (sl, so for the printed form,
  sp for J = (0 1; -1 0), so_2n for u*); g and ig meet in 0 (real form);
  closed under brackets; the printed k and p: g = k + p, [k,k] < k,
  [k,p] < p, [p,p] < k, k skew-Hermitian and p Hermitian (so theta = -X^*
  is the Cartan involution), trace form definite of the right signs; dim k
  and dim of its center = those of the printed type; the printed a lies in
  p, is abelian, Hermitian, maximal abelian in p, of dimension the real
  rank.  Refuted: the type 'gl_n(H)' (dimension 4n^2, center R E not in
  the printed algebra); the printed matrices are sl_n(H) (A. W. Knapp, Lie
  Groups Beyond an Introduction, 2nd ed., I § 8, Example 3).

What is NOT established
-----------------------
General statements are checked for the ranks named above only; the book's
proofs remain the proofs.  (F8) is not checked beyond consistency.  The
explicit indices cover the fundamental representations of the listed real
forms; other Lambda follow from the multiplicativity argument (not from a
computation), and the exceptional forms beyond the listed GAP modules rest
on (F14).  The identification of each exceptional form with a vertex rests
on the type of k.  Nothing here checks that our Typst matches the printed
book.

Run with:  sage -python checks/sage/reference-tables-1-4-8.py
"""
# ---------------------------------------------------------------------------
# 0. Harness
# ---------------------------------------------------------------------------
import time
from itertools import combinations, permutations, product

from sage.all import (QQ, ZZ, CartanType, CyclotomicField, PolynomialRing,
                      RootSystem, WeylCharacterRing, WeylGroup, block_matrix,
                      diagonal_matrix, factorial, identity_matrix, libgap,
                      matrix, prod, vector, zero_matrix)
from sage.version import version as SAGE_VERSION

SCOPE = "reference-tables-1-4-8"


class Report:
    """Counts checks. `ok` asserts a statement that must hold; `refuted`
    asserts that a printed reading FAILS (the printed text is kept as a
    refuted check next to the corrected one)."""

    def __init__(self):
        self.n = 0
        self.refutations = []
        self.sections = {}
        self.current = None

    def section(self, name):
        self.current = name
        self.sections.setdefault(name, 0)
        print(f"-- {name}", flush=True)

    def ok(self, cond, what):
        if not cond:
            raise AssertionError(f"[{self.current}] FAILED: {what}")
        self.n += 1
        self.sections[self.current] += 1

    def refuted(self, cond_printed_holds, what):
        """`cond_printed_holds` is the truth value of the printed reading;
        it must be False."""
        if cond_printed_holds:
            raise AssertionError(
                f"[{self.current}] printed reading unexpectedly holds: {what}")
        self.n += 1
        self.sections[self.current] += 1
        self.refutations.append(f"{self.current}: {what}")


R = Report()


# ---------------------------------------------------------------------------
# 1. The book's own coordinates (Table 1, printed p. 292 text, pp. 293-295
#    tables;).  Every vector below is written as printed.
# ---------------------------------------------------------------------------
def proj_eps(n, ambient=None):
    """eps_1..eps_n with sum eps_i = 0 and (eps_i, eps_i) = (n-1)/n,
    (eps_i, eps_j) = -1/n, realised as e_i - (1/n) sum e_j in QQ^n (standard
    scalar product).  `ambient` pads the vectors with zeros."""
    ambient = ambient or n
    out = []
    for i in range(n):
        v = [QQ(0)] * ambient
        for j in range(n):
            v[j] = (1 if i == j else 0) - QQ(1) / n
        out.append(vector(QQ, v))
    return out


def unit(n, i):
    v = [QQ(0)] * n
    v[i] = QQ(1)
    return vector(QQ, v)


class Model:
    """A root system in the coordinates of Table 1 (book numbering)."""

    def __init__(self, typ, l, gram, eps, roots, simple, delta, fund, rho,
                 extra=None):
        self.typ, self.l = typ, l
        self.name = f"{typ}{l}"
        self.G = gram
        self.eps = eps            # eps[0] is eps_1
        self.extra = extra        # E6: the auxiliary vector eps
        self.roots = roots
        self.simple = simple      # simple[0] is alpha_1
        self.delta = delta        # printed highest root
        self.fund = fund          # printed pi_1..pi_l
        self.rho = rho            # printed rho
        for v in roots + simple + fund + [delta, rho]:
            v.set_immutable()

    def ip(self, u, v):
        return u * self.G * v

    def pair(self, lam, alpha):
        """<lam|alpha> = 2(lam, alpha)/(alpha, alpha) (book, 4.2)."""
        return 2 * self.ip(lam, alpha) / self.ip(alpha, alpha)

    def cartan(self):
        """a_ij = <alpha_i|alpha_j> (book, Ch. 4 § 2)."""
        s = self.simple
        return matrix(QQ, self.l, self.l,
                      lambda i, j: self.pair(s[i], s[j]))

    def coeffs(self, v):
        """Coefficients of v in the simple roots (exact)."""
        return matrix(QQ, self.simple).solve_left(v)

    def positive_roots(self):
        return [a for a in self.roots if all(c >= 0 for c in self.coeffs(a))]

    def weight(self, labels):
        """sum Lambda_i pi_i with the printed fundamental weights."""
        return sum((QQ(c) * p for c, p in zip(labels, self.fund)),
                   vector(QQ, [0] * len(self.fund[0])))


def model(typ, l):
    """Build the Table 1 row of type typ_l from the printed formulas."""
    if typ == "A":
        n = l + 1
        e = proj_eps(n)
        G = identity_matrix(QQ, n)
        roots = [e[i] - e[j] for i in range(n) for j in range(n) if i != j]
        simple = [e[i] - e[i + 1] for i in range(l)]
        fund = [sum(e[:i + 1]) for i in range(l)]
        delta = e[0] - e[l]
        rho = sum((l - i) * e[i] for i in range(l))  # l eps_1 + ... + eps_l
        return Model("A", l, G, e, roots, simple, delta, fund, rho)
    if typ in "BCD":
        e = [unit(l, i) for i in range(l)]
        G = identity_matrix(QQ, l)
        roots = [s * e[i] + t * e[j] for i, j in combinations(range(l), 2)
                 for s in (1, -1) for t in (1, -1)]
        if typ == "B":
            roots += [s * e[i] for i in range(l) for s in (1, -1)]
            simple = [e[i] - e[i + 1] for i in range(l - 1)] + [e[l - 1]]
            fund = [sum(e[:i + 1]) for i in range(l - 1)] + [sum(e) / 2]
            rho = sum((2 * l - 2 * i - 1) * e[i] for i in range(l)) / 2
        elif typ == "C":
            roots += [2 * s * e[i] for i in range(l) for s in (1, -1)]
            simple = [e[i] - e[i + 1] for i in range(l - 1)] + [2 * e[l - 1]]
            fund = [sum(e[:i + 1]) for i in range(l)]
            rho = sum((l - i) * e[i] for i in range(l))
        else:
            simple = ([e[i] - e[i + 1] for i in range(l - 1)]
                      + [e[l - 2] + e[l - 1]])
            fund = ([sum(e[:i + 1]) for i in range(l - 2)]
                    + [(sum(e[:l - 1]) - e[l - 1]) / 2,
                       (sum(e[:l - 1]) + e[l - 1]) / 2])
            rho = sum((l - 1 - i) * e[i] for i in range(l))
        if typ == "C":
            delta = 2 * e[0]
        else:
            delta = e[0] + e[1]
        return Model(typ, l, G, e, roots, simple, delta, fund, rho)
    if typ == "E" and l == 6:
        e = proj_eps(6, ambient=7)
        x = unit(7, 6)                              # the auxiliary eps
        G = diagonal_matrix(QQ, [1] * 6 + [QQ(1) / 2])  # (eps, eps) = 1/2
        roots = [e[i] - e[j] for i in range(6) for j in range(6) if i != j]
        roots += [2 * x, -2 * x]
        roots += [e[i] + e[j] + e[k] + s * x
                  for i, j, k in combinations(range(6), 3) for s in (1, -1)]
        simple = [e[i] - e[i + 1] for i in range(5)] + [e[3] + e[4] + e[5] + x]
        fund = ([sum(e[:i + 1]) + min(i + 1, 6 - (i + 1)) * x
                 for i in range(5)] + [2 * x])
        delta = 2 * x
        rho = sum((5 - i) * e[i] for i in range(5)) + 11 * x
        return Model("E", 6, G, e, roots, simple, delta, fund, rho, extra=x)
    if typ == "E" and l == 7:
        e = proj_eps(8)
        G = identity_matrix(QQ, 8)
        roots = [e[i] - e[j] for i in range(8) for j in range(8) if i != j]
        roots += [sum(e[t] for t in c) for c in combinations(range(8), 4)]
        simple = [e[i] - e[i + 1] for i in range(6)] + [e[4] + e[5] + e[6] + e[7]]
        fund = ([sum(e[:i + 1]) + min(i + 1, 8 - (i + 1)) * e[7]
                 for i in range(6)] + [2 * e[7]])
        delta = -e[6] + e[7]
        rho = sum((6 - i) * e[i] for i in range(6)) + 17 * e[7]
        return Model("E", 7, G, e, roots, simple, delta, fund, rho)
    if typ == "E" and l == 8:
        e = proj_eps(9)
        G = identity_matrix(QQ, 9)
        roots = [e[i] - e[j] for i in range(9) for j in range(9) if i != j]
        roots += [s * sum(e[t] for t in c) for c in combinations(range(9), 3)
                  for s in (1, -1)]
        simple = [e[i] - e[i + 1] for i in range(7)] + [e[5] + e[6] + e[7]]
        fund = ([sum(e[:i + 1]) - min(i + 1, 15 - 2 * (i + 1)) * e[8]
                 for i in range(7)] + [-3 * e[8]])
        delta = e[0] - e[8]
        rho = sum((7 - i) * e[i] for i in range(7)) - 22 * e[8]
        return Model("E", 8, G, e, roots, simple, delta, fund, rho)
    if typ == "F":
        e = [unit(4, i) for i in range(4)]
        G = identity_matrix(QQ, 4)
        roots = [s * e[i] + t * e[j] for i, j in combinations(range(4), 2)
                 for s in (1, -1) for t in (1, -1)]
        roots += [s * e[i] for i in range(4) for s in (1, -1)]
        roots += [sum(s[t] * e[t] for t in range(4)) / 2
                  for s in product((1, -1), repeat=4)]
        simple = [(e[0] - e[1] - e[2] - e[3]) / 2, e[3], e[2] - e[3],
                  e[1] - e[2]]
        fund = [e[0], (3 * e[0] + e[1] + e[2] + e[3]) / 2,
                2 * e[0] + e[1] + e[2], e[0] + e[1]]
        delta = e[0] + e[1]
        rho = (11 * e[0] + 5 * e[1] + 3 * e[2] + e[3]) / 2
        return Model("F", 4, G, e, roots, simple, delta, fund, rho)
    if typ == "G":
        e = proj_eps(3)
        G = identity_matrix(QQ, 3)
        roots = [e[i] - e[j] for i in range(3) for j in range(3) if i != j]
        roots += [s * e[i] for i in range(3) for s in (1, -1)]
        simple = [-e[1], e[1] - e[2]]
        fund = [e[0], e[0] - e[2]]
        delta = e[0] - e[2]
        rho = 2 * e[0] - e[2]
        return Model("G", 2, G, e, roots, simple, delta, fund, rho)
    raise ValueError(typ)


# The ranks covered for the families.  Exceptional types: all.
RANKS = {"A": range(1, 9), "B": range(2, 9), "C": range(2, 9),
         "D": range(3, 9)}
TYPES = ([(t, l) for t in "ABCD" for l in RANKS[t]]
         + [("E", 6), ("E", 7), ("E", 8), ("F", 4), ("G", 2)])
MODELS = {(t, l): model(t, l) for t, l in TYPES}


# Printed Dynkin diagrams of Table 1 (book numbering): edges (i, j, m, head)
# with multiplicity m and, for a multiple edge, the vertex the arrow points to.
def printed_diagram(typ, l):
    chain = [(i, i + 1, 1, None) for i in range(1, l)]
    if typ == "A":
        return chain
    if typ == "B":
        return chain[:-1] + [(l - 1, l, 2, l)]
    if typ == "C":
        return chain[:-1] + [(l - 1, l, 2, l - 1)]
    if typ == "D":
        return ([(i, i + 1, 1, None) for i in range(1, l - 1)]
                + [(l - 2, l, 1, None)])
    if (typ, l) == ("E", 6):
        return [(1, 2, 1, None), (2, 3, 1, None), (3, 4, 1, None),
                (4, 5, 1, None), (3, 6, 1, None)]
    if (typ, l) == ("E", 7):
        return [(i, i + 1, 1, None) for i in range(1, 6)] + [(4, 7, 1, None)]
    if (typ, l) == ("E", 8):
        return [(i, i + 1, 1, None) for i in range(1, 7)] + [(5, 8, 1, None)]
    if typ == "F":
        return [(1, 2, 1, None), (2, 3, 2, 2), (3, 4, 1, None)]
    if typ == "G":
        return [(1, 2, 3, 1)]
    raise ValueError


# Book numbering -> Bourbaki (= Sage, = GAP for A-E, G) numbering, read off
# the diagrams; verified below against the Cartan matrices.
BOOK_TO_BOURBAKI = {
    ("E", 6): {1: 1, 2: 3, 3: 4, 4: 5, 5: 6, 6: 2},
    ("E", 7): {1: 7, 2: 6, 3: 5, 4: 4, 5: 3, 6: 1, 7: 2},
    ("E", 8): {1: 8, 2: 7, 3: 6, 4: 5, 5: 4, 6: 3, 7: 1, 8: 2},
    ("F", 4): {1: 4, 2: 3, 3: 2, 4: 1},
    ("G", 2): {1: 1, 2: 2},
}


def to_bourbaki(typ, l):
    return BOOK_TO_BOURBAKI.get((typ, l), {i: i for i in range(1, l + 1)})


def sage_labels(typ, l, book_labels):
    """Highest-weight labels in Sage (Bourbaki) numbering."""
    m = to_bourbaki(typ, l)
    out = [0] * l
    for i, c in enumerate(book_labels, start=1):
        out[m[i] - 1] = c
    return out


# ---------------------------------------------------------------------------
# 2. Table 1
# ---------------------------------------------------------------------------
def table1():
    R.section("Table 1 (printed pp. 292-295)")
    # The paragraph before the table: Gram of eps_i for A_l, E7, E8, G2
    for (t, l), M in MODELS.items():
        if t in "AG" or (t, l) in (("E", 7), ("E", 8)):
            n = len(M.eps)
            R.ok(sum(M.eps) == 0, f"{M.name}: sum eps_i = 0")
            R.ok(all(M.ip(M.eps[i], M.eps[j]) ==
                     (QQ(n - 1) / n if i == j else -QQ(1) / n)
                     for i in range(n) for j in range(n)),
                 f"{M.name}: (eps_i,eps_i) = l/(l+1), (eps_i,eps_j) = -1/(l+1)"
                 " with l + 1 = number of vectors")
            # 'if sum a_i = 0 then (sum a_i eps_i, sum b_j eps_j) = sum a_i b_i'
            a = [QQ(k) for k in range(n)]
            a[-1] -= sum(a)
            b = [QQ(k * k + 1) for k in range(n)]
            R.ok(M.ip(sum(x * y for x, y in zip(a, M.eps)),
                      sum(x * y for x, y in zip(b, M.eps)))
                 == sum(x * y for x, y in zip(a, b)),
                 f"{M.name}: the rule (sum a_i eps_i, sum b_j eps_j) = sum a_i b_i")
    M6 = MODELS[("E", 6)]
    R.ok(all(M6.ip(M6.extra, v) == 0 for v in M6.eps)
         and M6.ip(M6.extra, M6.extra) == QQ(1) / 2,
         "E6: eps orthogonal to all eps_i, (eps, eps) = 1/2")
    # E6 printed 'eps_1..eps_6 in t(C)*': they are rational combinations of
    # roots, i.e. lie in t(Q)* (log question of 72).
    for v in M6.eps + [M6.extra]:
        c = M6.coeffs(v)
        R.ok(c * matrix(QQ, M6.simple) == v,
             "E6: eps_i and eps lie in the Q-span of the roots, i.e. in t(Q)*")

    for (t, l), M in MODELS.items():
        name = M.name
        roots = set(tuple(a) for a in M.roots)
        # dim G column: A l^2+2l, B,C 2l^2+l, D 2l^2-l, E6 78, E7 133, E8 248,
        # F4 52, G2 14.
        dimG = printed_dimG(t, l)
        R.ok(len(roots) == len(M.roots), f"{name}: printed roots distinct")
        R.ok(len(roots) + l == dimG, f"{name}: dim G = |roots| + l = {dimG}")
        # root system axioms
        integral = all(M.pair(b, a) in ZZ for a in M.roots for b in M.roots)
        R.ok(integral, f"{name}: <beta|alpha> integral")
        refl = all(tuple(b - M.pair(b, a) * a) in roots
                   for a in M.roots for b in M.roots)
        R.ok(refl, f"{name}: reflections preserve the printed root set")
        R.ok(all(tuple(2 * a) not in roots for a in M.roots),
             f"{name}: reduced")
        R.ok(matrix(QQ, M.simple).rank() == l, f"{name}: rank l")
        # printed simple roots are a base
        coeffs = [M.coeffs(a) for a in M.roots]
        R.ok(all(all(c in ZZ for c in v) and (all(c >= 0 for c in v)
                                              or all(c <= 0 for c in v))
                 for v in coeffs),
             f"{name}: printed alpha_i form a base (integral, sign-coherent)")
        R.ok(all(tuple(a) in roots for a in M.simple), f"{name}: alpha_i are roots")
        # Cartan matrix vs printed Dynkin diagram (book rule 3): arrow from
        # the longer to the shorter root.
        A = M.cartan()
        edges = {(min(i, j), max(i, j)): (m, h)
                 for i, j, m, h in printed_diagram(t, l)}
        good = True
        for i in range(1, l + 1):
            for j in range(i + 1, l + 1):
                mult = A[i - 1, j - 1] * A[j - 1, i - 1]
                m, h = edges.get((i, j), (0, None))
                if mult != m:
                    good = False
                if m > 1:
                    short = i if M.ip(M.simple[i - 1], M.simple[i - 1]) < \
                        M.ip(M.simple[j - 1], M.simple[j - 1]) else j
                    if short != h:
                        good = False
        R.ok(good, f"{name}: Cartan matrix of printed alpha_i = printed "
                   "Dynkin diagram (bonds, arrows)")
        # the numbering map to Bourbaki/Sage
        m = to_bourbaki(t, l)
        S = CartanType([t, l]).cartan_matrix()  # Sage a_ij = <alpha_j, alpha_i^v>
        R.ok(all(A[i - 1, j - 1] == S[m[j] - 1, m[i] - 1]
                 for i in range(1, l + 1) for j in range(1, l + 1)),
             f"{name}: book numbering -> Bourbaki numbering {m}")
        # highest root
        pos = M.positive_roots()
        R.ok(len(pos) * 2 == len(M.roots), f"{name}: half the roots positive")
        ht = {a: sum(M.coeffs(a)) for a in pos}
        top = max(ht.values())
        R.ok([a for a in pos if ht[a] == top] == [M.delta],
             f"{name}: printed delta is the highest root")
        # fundamental weights: <pi_i|alpha_j> = delta_ij
        R.ok(all(M.pair(M.fund[i], M.simple[j]) == (1 if i == j else 0)
                 for i in range(l) for j in range(l)),
             f"{name}: printed pi_i are the fundamental weights")
        half = sum(pos) / 2
        R.ok(M.rho == half, f"{name}: printed rho = half sum of positive roots")
        R.ok(M.rho == sum(M.fund), f"{name}: printed rho = sum of pi_i")
        # delta = printed expression in the pi_i
        if t == "A":
            printed = M.fund[0] + M.fund[l - 1]           # pi_1 + pi_l
            R.ok(M.delta == printed, f"{name}: delta = pi_1 + pi_l")
        elif t == "B":
            if l >= 3:
                R.ok(M.delta == M.fund[1], f"{name}: delta = pi_2 (l >= 3)")
            else:
                R.refuted(M.delta == M.fund[1],
                          "B2: printed delta = pi_2 (row B_l, l >= 2)")
                R.ok(M.delta == 2 * M.fund[1], "B2: delta = 2 pi_2")
        elif t == "C":
            R.ok(M.delta == 2 * M.fund[0], f"{name}: delta = 2 pi_1")
        elif t == "D":
            want = M.fund[1] if l >= 4 else M.fund[1] + M.fund[2]
            R.ok(M.delta == want, f"{name}: delta = pi_2 (l>=4), pi_2+pi_3 (l=3)")
        else:
            idx = {("E", 6): 6, ("E", 7): 6, ("E", 8): 1, ("F", 4): 4,
                   ("G", 2): 2}[(t, l)]
            R.ok(M.delta == M.fund[idx - 1], f"{name}: delta = pi_{idx}")

        # dim R(pi_1) and weights of R(pi_1), against Sage's character ring
        dimR1 = printed_dimR1(t, l)
        ch = irr(t, l, [1] + [0] * (l - 1))
        R.ok(ch.degree() == dimR1, f"{name}: dim R(pi_1) = {dimR1}")
        R.ok(weyl_dim(M, [1] + [0] * (l - 1)) == dimR1,
             f"{name}: dim R(pi_1) by (F9) in the book's model")
        got = weights_in_model(M, ch)
        R.ok(got == printed_weights_R1(M), f"{name}: printed weights of R(pi_1)"
             " with multiplicities")

        # Weyl group statements of the paragraph before Table 1
        n = len(M.eps)
        R.ok(all(tuple(M.eps[i] - M.eps[j]) in roots
                 for i in range(n) for j in range(n) if i != j),
             f"{name}: eps_i - eps_j are roots, so W contains all permutations"
             " of the eps_i (the reflection in eps_i - eps_j is the "
             "transposition)")
        refl_is_transposition = True
        for i, j in combinations(range(n), 2):
            a = M.eps[i] - M.eps[j]
            for k in range(n):
                img = M.eps[k] - M.pair(M.eps[k], a) * a
                want = M.eps[j] if k == i else M.eps[i] if k == j else M.eps[k]
                refl_is_transposition &= (img == want)
            if M.extra is not None:
                refl_is_transposition &= (
                    M.extra - M.pair(M.extra, a) * a == M.extra)
        R.ok(refl_is_transposition, f"{name}: s_(eps_i - eps_j) swaps eps_i, eps_j")
        if t in "BCF":
            sgn = all(any(tuple(M.eps[i] * c) in roots for c in (1, 2))
                      for i in range(l))
            R.ok(sgn, f"{name}: eps_i or 2 eps_i is a root, so eps_i -> -eps_i"
                      " is in W")
        if t == "D":
            R.ok(all(tuple(M.eps[i] + M.eps[j]) in roots
                     for i, j in combinations(range(l), 2)),
                 f"{name}: s_(e_i - e_j) s_(e_i + e_j) = sign change of e_i, e_j")
        if (t, l) == ("E", 6):
            a = 2 * M.extra
            R.ok(all(v - M.pair(v, a) * a == v for v in M.eps)
                 and M.extra - M.pair(M.extra, a) * a == -M.extra,
                 "E6: s_(2 eps) fixes eps_i and sends eps -> -eps")
        if t in "EG" and l != 6:
            w0 = WeylGroup(RootSystem([t, l]).root_space()).long_element().matrix()
            R.ok(w0 == -identity_matrix(w0.nrows()), f"{name}: -id in W")
        if (t, l) == ("E", 6):
            w0 = WeylGroup(RootSystem([t, l]).root_space()).long_element().matrix()
            R.ok(w0 != -identity_matrix(w0.nrows()), "E6: -id not in W "
                 "(not claimed; recorded)")


_WCR = {}


def irr(t, l, book_labels):
    """Sage's character of R(Lambda), Lambda given by book labels."""
    if (t, l) not in _WCR:
        _WCR[(t, l)] = WeylCharacterRing([t, l], style="coroots")
    W = _WCR[(t, l)]
    fw = W.fundamental_weights()
    lab = sage_labels(t, l, book_labels)
    lam = sum((c * fw[i + 1] for i, c in enumerate(lab)), 0 * fw[1])
    return W(lam)


def printed_dimG(t, l):
    """Column 'dim G' of Table 1 (pp. 293-294)."""
    if t == "A":
        return l * l + 2 * l
    if t in "BC":
        return 2 * l * l + l
    if t == "D":
        return 2 * l * l - l
    return {("E", 6): 78, ("E", 7): 133, ("E", 8): 248, ("F", 4): 52,
            ("G", 2): 14}[(t, l)]


def printed_dimR1(t, l):
    """Column 'dim R(pi_1)' of Table 1 (pp. 294-295)."""
    if t == "A":
        return l + 1
    if t == "B":
        return 2 * l + 1
    if t in "CD":
        return 2 * l
    return {("E", 6): 27, ("E", 7): 56, ("E", 8): 248, ("F", 4): 26,
            ("G", 2): 7}[(t, l)]


def weyl_dim(M, labels):
    """(F9), printed p. 290: prod_(alpha>0) (Lambda+rho, alpha)/(rho, alpha),
    in the book's model."""
    lam = M.weight(labels)
    return prod(M.ip(lam + M.rho, a) / M.ip(M.rho, a) for a in M.positive_roots())


def weights_in_model(M, ch):
    """Weight multiset of a Sage character, as vectors of the book's model."""
    t, l = M.typ, M.l
    amb = RootSystem([t, l]).ambient_space()
    cor = amb.simple_coroots()
    inv = {v: k for k, v in to_bourbaki(t, l).items()}
    out = {}
    for mu, mult in ch.weight_multiplicities().items():
        v = sum((mu.scalar(cor[j]) * M.fund[inv[j] - 1]
                 for j in range(1, l + 1)), 0 * M.fund[0])
        v.set_immutable()
        out[v] = out.get(v, 0) + mult
    return out


def printed_weights_R1(M):
    """Column 'Weights of R(pi_1)' of Table 1 (pp. 294-295)."""
    t, l, e = M.typ, M.l, M.eps
    z = 0 * M.fund[0]
    ws = []
    if t == "A":
        ws = list(e)
    elif t == "B":
        ws = [s * v for v in e for s in (1, -1)] + [z]
    elif t in "CD":
        ws = [s * v for v in e for s in (1, -1)]
    elif (t, l) == ("E", 6):
        x = M.extra
        ws = [v + s * x for v in e for s in (1, -1)]
        ws += [-e[i] - e[j] for i, j in combinations(range(6), 2)]
    elif (t, l) == ("E", 7):
        ws = [s * (e[i] + e[j]) for i, j in combinations(range(8), 2)
              for s in (1, -1)]
    elif (t, l) == ("E", 8):
        ws = [e[i] - e[j] for i in range(9) for j in range(9) if i != j]
        ws += [s * (e[i] + e[j] + e[k]) for i, j, k in combinations(range(9), 3)
               for s in (1, -1)]
        ws += [z] * 8                       # 0 (of multiplicity 8)
    elif t == "F":
        ws = [s * v for v in e for s in (1, -1)]
        ws += [sum(s[k] * e[k] for k in range(4)) / 2
               for s in product((1, -1), repeat=4)]
        ws += [z] * 2                       # 0 (of multiplicity 2)
    elif t == "G":
        ws = [s * v for v in e for s in (1, -1)] + [z]
    out = {}
    for v in ws:
        v = vector(QQ, v)
        v.set_immutable()
        out[v] = out.get(v, 0) + 1
    return out
# ---------------------------------------------------------------------------
# 3. Table 2 (printed pp. 295-297)
# ---------------------------------------------------------------------------
# The classical rows are printed with ellipses.  Printed explicit cells are
# encoded as functions of l (rows/columns 1, 2, 3, l-1, l, as printed); the
# ellipsis is expanded by the entry formula `*_entry`, an interpretation that
# is checked to reproduce every explicit printed cell for l >= 6, where the
# five printed rows and columns are distinct.
def a_entry(l, i, j):          # 1/(l+1) * ...
    return min(i, j) * (l + 1 - max(i, j))


A_PRINTED = {  # (row, col) -> value, rows/cols as functions of l
    (1, 1): lambda l: l, (1, 2): lambda l: l - 1, (1, 3): lambda l: l - 2,
    (1, -2): lambda l: 2, (1, -1): lambda l: 1,
    (2, 1): lambda l: l - 1, (2, 2): lambda l: 2 * (l - 1),
    (2, 3): lambda l: 2 * (l - 2), (2, -2): lambda l: 2 * 2, (2, -1): lambda l: 2,
    (3, 1): lambda l: l - 2, (3, 2): lambda l: 2 * (l - 2),
    (3, 3): lambda l: 3 * (l - 2), (3, -2): lambda l: 3 * 2, (3, -1): lambda l: 3,
    (-2, 1): lambda l: 2, (-2, 2): lambda l: 2 * 2, (-2, 3): lambda l: 3 * 2,
    (-2, -2): lambda l: (l - 1) * 2, (-2, -1): lambda l: l - 1,
    (-1, 1): lambda l: 1, (-1, 2): lambda l: 2, (-1, 3): lambda l: 3,
    (-1, -2): lambda l: l - 1, (-1, -1): lambda l: l,
}


def b_entry(l, i, j):          # 1/2 * ...
    return 2 * min(i, j) if j < l else i


B_PRINTED = {
    (1, 1): 2, (1, 2): 2, (1, 3): 2, (1, -2): 2, (1, -1): 1,
    (2, 1): 2, (2, 2): 4, (2, 3): 4, (2, -2): 4, (2, -1): 2,
    (3, 1): 2, (3, 2): 4, (3, 3): 6, (3, -2): 6, (3, -1): 3,
    (-2, 1): 2, (-2, 2): 4, (-2, 3): 6, (-2, -2): lambda l: 2 * (l - 1),
    (-2, -1): lambda l: l - 1,
    (-1, 1): 2, (-1, 2): 4, (-1, 3): 6, (-1, -2): lambda l: 2 * (l - 1),
    (-1, -1): lambda l: l,
}


def c_entry(l, i, j):          # 1/2 * ...
    return 2 * min(i, j) if i < l else j


C_PRINTED = {
    (1, 1): 2, (1, 2): 2, (1, 3): 2, (1, -2): 2, (1, -1): 2,
    (2, 1): 2, (2, 2): 4, (2, 3): 4, (2, -2): 4, (2, -1): 4,
    (3, 1): 2, (3, 2): 4, (3, 3): 6, (3, -2): 6, (3, -1): 6,
    (-2, 1): 2, (-2, 2): 4, (-2, 3): 6, (-2, -2): lambda l: 2 * (l - 1),
    (-2, -1): lambda l: 2 * (l - 1),
    (-1, 1): 1, (-1, 2): 2, (-1, 3): 3, (-1, -2): lambda l: l - 1,
    (-1, -1): lambda l: l,
}


def d_entry(l, i, j):          # 1/4 * ...
    if i <= l - 2 and j <= l - 2:
        return 4 * min(i, j)
    if i <= l - 2:
        return 2 * i
    if j <= l - 2:
        return 2 * j
    return l if i == j else l - 2


D_PRINTED = {  # rows 1, 2, 3, l-2, l-1, l; columns 1, 2, 3, l-2, l-1, l
    (1, 1): 4, (1, 2): 4, (1, 3): 4, (1, -3): 4, (1, -2): 2, (1, -1): 2,
    (2, 1): 4, (2, 2): 8, (2, 3): 8, (2, -3): 8, (2, -2): 4, (2, -1): 4,
    (3, 1): 4, (3, 2): 8, (3, 3): 12, (3, -3): 12, (3, -2): 6, (3, -1): 6,
    (-3, 1): 4, (-3, 2): 8, (-3, 3): 12, (-3, -3): lambda l: 4 * (l - 2),
    (-3, -2): lambda l: 2 * (l - 2), (-3, -1): lambda l: 2 * (l - 2),
    (-2, 1): 2, (-2, 2): 4, (-2, 3): 6, (-2, -3): lambda l: 2 * (l - 2),
    (-2, -2): lambda l: l, (-2, -1): lambda l: l - 2,
    (-1, 1): 2, (-1, 2): 4, (-1, 3): 6, (-1, -3): lambda l: 2 * (l - 2),
    (-1, -2): lambda l: l - 2, (-1, -1): lambda l: l,
}

CLASSICAL_T2 = {  # entry, printed cells, scalar, d column, 2 rho column
    "A": (a_entry, A_PRINTED, lambda l: QQ(1) / (l + 1),
          lambda l, i: 1, lambda l, i: i * (l + 1 - i)),
    "B": (b_entry, B_PRINTED, lambda l: QQ(1) / 2,
          lambda l, i: 1 if i < l else QQ(1) / 2,
          lambda l, i: i * (2 * l - i) if i < l else l * l),
    "C": (c_entry, C_PRINTED, lambda l: QQ(1) / 2,
          lambda l, i: 1 if i < l else 2,
          lambda l, i: i * (2 * l + 1 - i) if i < l else l * (l + 1) / 2),
    "D": (d_entry, D_PRINTED, lambda l: QQ(1) / 4,
          lambda l, i: 1,
          lambda l, i: i * (2 * l - 1 - i) if i <= l - 2
          else (l - 1) * l / 2),
}
# The printed 2 rho cells used to fix the lambdas above:
#   A: l, 2(l-1), 3(l-2), ..., (l-1)2, l
#   B: 2l-1, 2(2l-2), 3(2l-3), ..., (l-1)(l+1), l^2
#   C: 2l, 2(2l-1), 3(2l-2), ..., (l-1)(l+2), l(l+1)/2
#   D: 2l-2, 2(2l-3), 3(2l-4), ..., (l-2)(l+1), (l-1)l/2, l(l-1)/2
PRINTED_2RHO_CELLS = {
    "A": {1: lambda l: l, 2: lambda l: 2 * (l - 1), 3: lambda l: 3 * (l - 2),
          -2: lambda l: (l - 1) * 2, -1: lambda l: l},
    "B": {1: lambda l: 2 * l - 1, 2: lambda l: 2 * (2 * l - 2),
          3: lambda l: 3 * (2 * l - 3), -2: lambda l: (l - 1) * (l + 1),
          -1: lambda l: l * l},
    "C": {1: lambda l: 2 * l, 2: lambda l: 2 * (2 * l - 1),
          3: lambda l: 3 * (2 * l - 2), -2: lambda l: (l - 1) * (l + 2),
          -1: lambda l: l * (l + 1) / 2},
    "D": {1: lambda l: 2 * l - 2, 2: lambda l: 2 * (2 * l - 3),
          3: lambda l: 3 * (2 * l - 4), -3: lambda l: (l - 2) * (l + 1),
          -2: lambda l: (l - 1) * l / 2, -1: lambda l: l * (l - 1) / 2},
}

EXCEPTIONAL_T2 = {  # scalar, matrix rows as printed, d, 2 rho
    ("E", 6): (QQ(1) / 3, [[4, 5, 6, 4, 2, 3], [5, 10, 12, 8, 4, 6],
                           [6, 12, 18, 12, 6, 9], [4, 8, 12, 10, 5, 6],
                           [2, 4, 6, 5, 4, 3], [3, 6, 9, 6, 3, 6]],
               [1] * 6, [16, 30, 42, 30, 16, 22]),
    ("E", 7): (QQ(1) / 2, [[3, 4, 5, 6, 4, 2, 3], [4, 8, 10, 12, 8, 4, 6],
                           [5, 10, 15, 18, 12, 6, 9],
                           [6, 12, 18, 24, 16, 8, 12],
                           [4, 8, 12, 16, 12, 6, 8], [2, 4, 6, 8, 6, 4, 4],
                           [3, 6, 9, 12, 8, 4, 7]],
               [1] * 7, [27, 52, 75, 96, 66, 34, 49]),
    ("E", 8): (QQ(1), [[2, 3, 4, 5, 6, 4, 2, 3], [3, 6, 8, 10, 12, 8, 4, 6],
                       [4, 8, 12, 15, 18, 12, 6, 9],
                       [5, 10, 15, 20, 24, 16, 8, 12],
                       [6, 12, 18, 24, 30, 20, 10, 15],
                       [4, 8, 12, 16, 20, 14, 7, 10],
                       [2, 4, 6, 8, 10, 7, 4, 5],
                       [3, 6, 9, 12, 15, 10, 5, 8]],
               [1] * 8, [58, 114, 168, 220, 270, 182, 92, 136]),
    ("F", 4): (QQ(1), [[2, 3, 4, 2], [3, 6, 8, 4], [2, 4, 6, 3], [1, 2, 3, 2]],
               [QQ(1) / 2, QQ(1) / 2, 1, 1], [22, 42, 30, 16]),
    ("G", 2): (QQ(1), [[2, 3], [1, 2]], [QQ(1) / 3, 1], [10, 6]),
}


def cell_index(l, k):
    return k if k > 0 else l + 1 + k


def table2():
    R.section("Table 2 (printed pp. 295-297)")
    for (t, l), M in MODELS.items():
        name = M.name
        A = M.cartan()
        if t in CLASSICAL_T2:
            entry, cells, scal, dcol, rcol = CLASSICAL_T2[t]
            printedM = scal(l) * matrix(QQ, l, l,
                                        lambda i, j: entry(l, i + 1, j + 1))
            if l >= 6:
                ok = all(entry(l, cell_index(l, r), cell_index(l, c))
                         == (v(l) if callable(v) else v)
                         for (r, c), v in cells.items())
                R.ok(ok, f"{name}: the expansion of the ellipses reproduces "
                         "every explicitly printed cell of (A^T)^-1")
                ok = all(rcol(l, cell_index(l, k)) == f(l)
                         for k, f in PRINTED_2RHO_CELLS[t].items())
                R.ok(ok, f"{name}: expansion of the 2 rho column reproduces "
                         "the printed cells")
            d = [QQ(dcol(l, i)) for i in range(1, l + 1)]
            two_rho = [QQ(rcol(l, i)) for i in range(1, l + 1)]
        else:
            scal, rows, d, two_rho = EXCEPTIONAL_T2[(t, l)]
            printedM = scal * matrix(QQ, rows)
            d = [QQ(x) for x in d]
            two_rho = [QQ(x) for x in two_rho]
        R.ok(printedM == (A.transpose()).inverse(),
             f"{name}: printed matrix = (A^T)^-1, a_ij = <alpha_i|alpha_j>")
        if t in "BCFG":
            R.ok(printedM != A.inverse(),
                 f"{name}: (and it is not A^-1: the transpose matters)")
        # i-th column = coefficients of pi_i in the simple roots
        R.ok(all(sum(printedM[j, i] * M.simple[j] for j in range(l))
                 == M.fund[i] for i in range(l)),
             f"{name}: column i of (A^T)^-1 expresses pi_i via alpha_j")
        R.ok(d == [M.ip(a, a) / 2 for a in M.simple],
             f"{name}: column d = (alpha_i, alpha_i)/2")
        col_sum = [2 * sum(printedM[i, j] for j in range(l)) for i in range(l)]
        R.ok(col_sum == two_rho, f"{name}: 2 rho column = doubled sum of columns")
        R.ok(list(M.coeffs(2 * M.rho)) == two_rho,
             f"{name}: 2 rho column = coefficients of the sum of positive roots")
        gram = matrix(QQ, l, l, lambda i, j: M.ip(M.fund[i], M.fund[j]))
        R.ok(diagonal_matrix(QQ, d) * printedM == gram,
             f"{name}: diag(d) (A^T)^-1 = Gram matrix of the pi_i")


# ---------------------------------------------------------------------------
# 4. Table 4 (printed p. 299) and 1.1 (F1)-(F8) (printed
#    pp. 289-290)
# ---------------------------------------------------------------------------
def printed_table4(t, l):
    """(exponents, |h|, |W|) as printed; D_l both as printed and corrected."""
    if t == "A":
        return list(range(1, l + 1)), l + 1, factorial(l + 1)
    if t in "BC":
        return list(range(1, 2 * l, 2)), 2 * l, 2 ** l * factorial(l)
    if t == "D":
        return None, 2 * (l - 1), 2 ** (l - 1) * factorial(l)
    return {("E", 6): ([1, 4, 5, 7, 8, 11], 12, 2 ** 7 * 3 ** 4 * 5),
            ("E", 7): ([1, 5, 7, 9, 11, 13, 17], 18, 2 ** 10 * 3 ** 4 * 5 * 7),
            ("E", 8): ([1, 7, 11, 13, 17, 19, 23, 29], 30,
                       2 ** 14 * 3 ** 5 * 5 ** 2 * 7),
            ("F", 4): ([1, 5, 7, 11], 12, 2 ** 7 * 3 ** 2),
            ("G", 2): ([1, 5], 6, 2 ** 2 * 3)}[(t, l)]


def d_exponents_printed(l):
    """'1, 3, 5, ..., 2l - 1, l - 1' (read literally: odd numbers up to 2l-1,
    then l - 1)."""
    return sorted(list(range(1, 2 * l, 2)) + [l - 1])


def d_exponents_corrected(l):
    """'1, 3, 5, ..., 2l - 3, l - 1'."""
    return sorted(list(range(1, 2 * l - 2, 2)) + [l - 1])


def height_table_exponents(M):
    """1.1: rows = roots of height k, aligned at the right; m_i = length of
    the i-th column from the left."""
    pos = M.positive_roots()
    heights = [sum(M.coeffs(a)) for a in pos]
    top = max(heights)
    rows = [heights.count(k) for k in range(1, top + 1)]
    l = M.l
    ok_rows = rows[0] == l and all(rows[k] >= rows[k + 1]
                                   for k in range(len(rows) - 1))
    cols = [sum(1 for r in rows if r >= l + 1 - i) for i in range(1, l + 1)]
    return ok_rows, cols


def weyl_classes(t, l):
    """Conjugacy classes of W (root-space realisation) as (rep matrix, size)."""
    W = WeylGroup(RootSystem([t, l]).root_space())
    G = libgap(W)
    out = []
    for c in G.ConjugacyClasses():
        rep = c.Representative()
        out.append((matrix(QQ, rep.sage()), int(c.Size())))
    return W, out


def section11():
    R.section("Table 4 and 1.1: (F1)-(F8)")
    Pt = PolynomialRing(QQ, "t")
    tt = Pt.gen()
    for (t, l), M in MODELS.items():
        name = M.name
        ex, hh, wo = printed_table4(t, l)
        ok_rows, cols = height_table_exponents(M)
        R.ok(ok_rows, f"{name}: rows of the height table non-increasing, "
                      "first row of length l")
        if t == "D":
            R.refuted(cols == d_exponents_printed(l),
                      f"D{l}: Table 4 exponents '1, 3, 5, ..., 2l - 1, l - 1'")
            R.refuted(len(d_exponents_printed(l)) == l,
                      f"D{l}: the printed list has l + 1 entries")
            ex = d_exponents_corrected(l)
        R.ok(cols == sorted(ex), f"{name}: exponents from the height table = "
                                 f"Table 4 {ex}")
        W = WeylGroup(RootSystem([t, l]).root_space())
        R.ok(W.order() == wo, f"{name}: |W| = Table 4 value {wo}")
        # n_i: coefficients of the highest root; n_0 = 1
        n = [1] + list(M.coeffs(M.delta))
        z = n.count(1)
        detA = M.cartan().det()
        R.ok(z == detA, f"{name}: (F2) z = number of 1's among n_i = "
                        f"|P/Q| = det A = {detA}")
        R.ok(len(M.roots) == l * sum(n) == 2 * sum(ex),
             f"{name}: (F1) |roots| = l sum n_i = 2 sum m_i")
        R.ok(wo == z * factorial(l) * prod(n) == prod(m + 1 for m in ex),
             f"{name}: (F3) |W| = z l! prod n_i = prod (m_i + 1)")
        R.ok(hh == sum(n) == max(ex) + 1,
             f"{name}: (F5) and Table 4: h = sum n_i = max m_i + 1 = {hh}")
        # Coxeter element c = r_1 ... r_l in the book numbering
        m = to_bourbaki(t, l)
        s = W.simple_reflections()
        c = prod(s[m[i]] for i in range(1, l + 1))
        cm = c.matrix()
        R.ok(c.order() == hh, f"{name}: (F5) the order of c is |h| = {hh}")
        K = CyclotomicField(hh)
        zeta = K.gen()
        x = PolynomialRing(K, "x").gen()
        R.ok(cm.charpoly("x").change_ring(K)
             == prod(x - zeta ** mi for mi in ex),
             f"{name}: (F6) eigenvalues of c are eps^(m_i), eps primitive "
             f"{hh}-th root of 1")
        if W.order() <= 2 * 10 ** 6 and l <= 4 or (t, l) in (("F", 4),):
            # c does not depend on the numbering up to conjugacy
            G = libgap(W)
            c0 = libgap(c)
            allconj = all(
                G.IsConjugate(c0, libgap(prod(s[m[i]] for i in perm)))
                for perm in permutations(range(1, l + 1)))
            R.ok(bool(allconj), f"{name}: all {factorial(l)} orderings of the "
                                "simple reflections give conjugate elements")
        # (F4), (F7) over the conjugacy classes
        if W.order() <= 10 ** 9:
            _, classes = weyl_classes(t, l)
            R.ok(sum(sz for _, sz in classes) == wo, f"{name}: class sizes")
            g = sum(sz * tt ** (l - (w - 1).right_kernel().dimension())
                    for w, sz in classes)
            R.ok(g == prod(1 + mi * tt for mi in ex),
                 f"{name}: (F4) sum g_k t^k = prod (1 + m_i t)")
            Ft = Pt.fraction_field()
            molien = sum(Ft(sz) / (identity_matrix(QQ, l) - tt * w).det()
                         for w, sz in classes) / wo
            R.ok(molien == 1 / prod(1 - tt ** (mi + 1) for mi in ex),
                 f"{name}: (F7) Molien series = prod 1/(1 - t^(m_i+1)), so "
                 "the basic invariants have degrees m_i + 1")
        # (F8): only consistency: degree = dim G, value at 1 = 2^l
        P = prod(1 + tt ** (2 * mi + 1) for mi in ex)
        R.ok(P.degree() == printed_dimG(t, l) and P(1) == 2 ** l,
             f"{name}: (F8) prod (1 + t^(2m_i+1)) has degree dim G and "
             "value 2^l at t = 1 (consistency only)")


# ---------------------------------------------------------------------------
# 5. 1.2 (F9)-(F11) (printed p. 290)
# ---------------------------------------------------------------------------
def dominant_boxes(l, bound):
    return [lab for lab in product(range(bound + 1), repeat=l) if any(lab)]


def lowest_weight(M, lam):
    """The antidominant element of the W-orbit of lam (= w_0 lam)."""
    mu = lam
    while True:
        a = next((a for a in M.simple if M.ip(mu, a) > 0), None)
        if a is None:
            return mu
        mu = mu - M.pair(mu, a) * a


def freudenthal(M, labels):
    """Weight multiplicities of R(Lambda) from the printed (F10):
    [(L+rho,L+rho) - (l+rho,l+rho)] m_l = 2 sum_(a>0,k>0) (l+k a, a) m_(l+k a).
    Candidates: lam - sum c_i alpha_i with 0 <= c <= coefficients of
    lam - w_0 lam (every weight lies in this box)."""
    lam = M.weight(labels)
    pos = M.positive_roots()
    b = [ZZ(c) for c in M.coeffs(lam - lowest_weight(M, lam))]
    L2 = M.ip(lam + M.rho, lam + M.rho)
    cand = sorted(product(*[range(x + 1) for x in b]), key=sum)
    Smat = matrix(QQ, M.simple)
    mult = {}
    for c in cand:
        mu = lam - vector(QQ, c) * Smat
        if not any(c):
            mult[tuple(mu)] = QQ(1)
            continue
        rhs = 0
        for a in pos:
            ca = M.coeffs(a)
            k = 1
            while all(c[i] - k * ca[i] >= 0 for i in range(M.l)):
                rhs += M.ip(mu + k * a, a) * mult.get(tuple(mu + k * a), 0)
                k += 1
        rhs *= 2
        den = L2 - M.ip(mu + M.rho, mu + M.rho)
        if den == 0:
            assert rhs == 0, "(F10) with zero left factor needs zero right side"
            mult[tuple(mu)] = QQ(0)
        else:
            mult[tuple(mu)] = rhs / den
    return {k: v for k, v in mult.items() if v != 0}


def section12():
    R.section("1.2: (F9) Weyl, (F10) Freudenthal")
    cases = []
    for (t, l) in TYPES:
        if l <= 3:
            cases += [((t, l), lab) for lab in dominant_boxes(l, 2)]
        elif l <= 4:
            cases += [((t, l), lab) for lab in dominant_boxes(l, 1)]
        else:
            cases += [((t, l), tuple(1 if j == i else 0 for j in range(l)))
                      for i in range(l)]
    for (t, l), lab in cases:
        M = MODELS[(t, l)]
        ch = irr(t, l, list(lab))
        R.ok(weyl_dim(M, lab) == ch.degree(),
             f"{M.name} {lab}: (F9) = dimension of the character")
    fcases = [(("A", 2), (1, 1)), (("A", 2), (2, 1)), (("A", 3), (1, 0, 1)),
              (("B", 2), (1, 1)), (("B", 2), (0, 2)), (("C", 3), (0, 1, 0)),
              (("C", 3), (1, 0, 1)), (("G", 2), (1, 0)), (("G", 2), (0, 1)),
              (("G", 2), (1, 1)), (("F", 4), (1, 0, 0, 0)),
              (("F", 4), (0, 0, 0, 1)), (("D", 4), (0, 1, 0, 0)),
              (("E", 6), (1, 0, 0, 0, 0, 0)), (("E", 6), (0, 0, 0, 0, 0, 1)),
              (("B", 3), (0, 0, 2))]
    for (t, l), lab in fcases:
        M = MODELS[(t, l)]
        got = freudenthal(M, lab)
        want = weights_in_model(M, irr(t, l, list(lab)))
        R.ok({tuple(k): v for k, v in want.items()} == got,
             f"{M.name} {lab}: (F10) multiplicities = those of the character")


def gap_module(typ, rank, gap_labels):
    """GAP's highest weight module; matrices of the canonical generators
    x_i, y_i, h_i (column action, checked to be a representation)."""
    L = libgap.SimpleLieAlgebra(typ, rank, libgap.Rationals)
    Rt = libgap.RootSystem(L)
    x, y, h = libgap.CanonicalGenerators(Rt)
    V = libgap.HighestWeightModule(L, list(gap_labels))
    B = libgap.Basis(V)

    def mat(u):
        return matrix(QQ, libgap.MatrixOfAction(B, u).sage())
    e = [mat(u) for u in x]
    f = [mat(u) for u in y]
    hh = [mat(u) for u in h]
    for i in range(rank):
        assert e[i] * f[i] - f[i] * e[i] == hh[i]
        assert hh[i].is_diagonal()
    return e, f, hh


def gap_cartan(typ, rank):
    """C_ij = alpha_j(h_i) for GAP's canonical generators."""
    e, f, h = gap_module(typ, rank, [1] + [0] * (rank - 1))
    # use the adjoint-free route: eigenvalues of h_i on e_j via commutators
    C = matrix(QQ, rank, rank)
    for i in range(rank):
        for j in range(rank):
            br = h[i] * e[j] - e[j] * h[i]
            k = next(((a, b) for a in range(e[j].nrows())
                      for b in range(e[j].ncols()) if e[j][a, b] != 0))
            C[i, j] = br[k] / e[j][k]
    return C


def section12_f11():
    R.section("1.2: (F11) tensor product multiplicities")
    for (t, l), triples in [
            (("A", 2), [((1, 0), (1, 0), (2, 0)), ((1, 0), (1, 0), (0, 1)),
                        ((1, 1), (1, 1), (1, 1)), ((1, 1), (1, 1), (0, 0)),
                        ((2, 1), (1, 1), (2, 1)), ((1, 1), (2, 0), (1, 2))]),
            (("B", 2), [((0, 1), (0, 1), (1, 0)), ((1, 1), (0, 1), (1, 1)),
                        ((1, 1), (1, 1), (0, 2)), ((0, 2), (1, 0), (1, 0))]),
            (("G", 2), [((1, 0), (1, 0), (1, 0)), ((1, 0), (1, 0), (0, 1)),
                        ((0, 1), (1, 0), (1, 1)), ((1, 1), (1, 0), (1, 1))])]:
        # labels here are in Sage (Bourbaki) numbering; GAP numbering matched
        Cs = CartanType([t, l]).cartan_matrix()
        Cg = gap_cartan(t, l)
        perm = next(p for p in permutations(range(l))
                    if all(Cg[i, j] == Cs[p[i], p[j]]
                           for i in range(l) for j in range(l)))
        W = WeylCharacterRing([t, l], style="coroots")
        fw = W.fundamental_weights()
        for lamL, muL, nuL in triples:
            def to_gap(lab):
                return [lab[perm[i]] for i in range(l)]

            def chr_(lab):
                return W(sum((c * fw[i + 1] for i, c in enumerate(lab)),
                             0 * fw[1]))
            want = (chr_(lamL) * chr_(muL)).monomial_coefficients().get(
                chr_(nuL).support()[0], 0)
            # first form: v in V_(N - Lambda)(M) with e_i^(Lambda_i + 1) v = 0
            got1 = f11_dim(t, l, to_gap(muL), to_gap(nuL), to_gap(lamL), Cg)
            # second form: v in V_(Lambda - M')(N), e_i^(M'_i + 1) v = 0
            muD = dual_labels(t, l, muL)
            got2 = f11_dim(t, l, to_gap(nuL), to_gap(lamL), to_gap(muD), Cg)
            R.ok(got1 == want, f"{t}{l}: (F11) first form, "
                               f"R{nuL} in R{lamL} x R{muL}: {want}")
            R.ok(got2 == want, f"{t}{l}: (F11) second form, "
                               f"R{nuL} in R{lamL} x R{muL}: {want}")


def dual_labels(t, l, lab):
    """Labels of the dual representation (Sage numbering) via -w_0."""
    W = WeylCharacterRing([t, l], style="coroots")
    fw = W.fundamental_weights()
    ch = W(sum((c * fw[i + 1] for i, c in enumerate(lab)), 0 * fw[1]))
    hw = ch.dual().support()[0]
    amb = RootSystem([t, l]).ambient_space()
    cor = amb.simple_coroots()
    return [hw.scalar(cor[j]) for j in range(1, l + 1)]


def f11_dim(t, l, module_labels, target_labels, cutoff_labels, Cg):
    """dim {v in V_(target - cutoff)(module): e_i^(cutoff_i + 1) v = 0}
    (weights and labels in GAP numbering)."""
    e, f, h = gap_module(t, l, module_labels)
    # a weight is recorded by its labels (lambda(h_1), ..., lambda(h_l));
    # labels are additive, so N - Lambda has labels N_i - Lambda_i.
    want = [a - b for a, b in zip(target_labels, cutoff_labels)]
    idx = [k for k in range(e[0].nrows())
           if [h[i][k, k] for i in range(l)] == want]
    if not idx:
        return 0
    rows = []
    for i in range(l):
        P = e[i] ** (cutoff_labels[i] + 1)
        rows.append(P.matrix_from_columns(idx))
    K = block_matrix([[r] for r in rows]).right_kernel()
    return K.dimension()
# ---------------------------------------------------------------------------
# 6. Table 3 (printed pp. 297-298)
# ---------------------------------------------------------------------------
def coroot(M, i):
    """h_i = alpha_i^v = 2 alpha_i / (alpha_i, alpha_i), in the model."""
    a = M.simple[i - 1]
    return 2 * a / M.ip(a, a)


def hsum(M, coeffs):
    """sum c_i h_i for coeffs = {i: c_i}."""
    return sum((QQ(c) * coroot(M, i) for i, c in coeffs.items()),
               0 * M.simple[0])


def printed_table3(t, l):
    """(center orders, generators {i: coeff}, |Aut/Int| structure, |nu|,
    b {i: coeff}) as printed."""
    odd = {i: QQ(1) / 2 for i in range(1, l + 1, 2)}
    if t == "A" and l > 1:
        return ([l + 1], [{i: QQ(i) / (l + 1) for i in range(1, l + 1)}],
                "Z2", 2, odd if l % 2 == 1 else {})
    if t == "A":
        return ([2], [{1: QQ(1) / 2}], "e", 1, {1: QQ(1) / 2})
    if t == "B":
        return ([2], [{l: QQ(1) / 2}], "e", 1,
                {l: QQ(1) / 2} if l % 4 in (1, 2) else {})
    if t == "C":
        return ([2], [odd], "e", 1, odd)
    if t == "D" and l % 2 == 1:
        g = {i: QQ(1) / 2 for i in range(1, l - 1, 2)}
        g[l - 1] = QQ(1) / 4
        g[l] = -QQ(1) / 4
        return ([4], [g], "Z2", 2,
                {l - 1: QQ(1) / 2, l: QQ(1) / 2} if l % 4 == 3 else {})
    if t == "D":
        g1 = {i: QQ(1) / 2 for i in range(1, l, 2)}
        g2 = {l - 1: QQ(1) / 2, l: QQ(1) / 2}
        return ([2, 2], [g1, g2], "S3" if l == 4 else "Z2", 1,
                g2 if l % 4 == 2 else {})
    if (t, l) == ("E", 6):
        return ([3], [{1: QQ(1) / 3, 2: -QQ(1) / 3, 4: QQ(1) / 3,
                       5: -QQ(1) / 3}], "Z2", 2, {})
    if (t, l) == ("E", 7):
        g = {1: QQ(1) / 2, 3: QQ(1) / 2, 7: QQ(1) / 2}
        return ([2], [g], "e", 1, g)
    # E8, F4, G2: 'not mentioned in the table': trivial center and outer
    # automorphisms, every representation orthogonal.
    return ([], [], "e", 1, {})


def nu_book(t, l):
    """nu = -w_0 on the simple roots, in the book numbering."""
    W = WeylGroup(RootSystem([t, l]).root_space())
    w0 = W.long_element()
    m = to_bourbaki(t, l)
    inv = {v: k for k, v in m.items()}
    rs = RootSystem([t, l]).root_space()
    al = rs.simple_roots()
    out = {}
    for i in range(1, l + 1):
        img = -(w0.action(al[m[i]]))
        j = next(j for j in range(1, l + 1) if img == al[j])
        out[i] = inv[j]
    return out


def self_dual_generators(t, l, nu):
    gens = []
    for i in range(1, l + 1):
        j = nu[i]
        lab = [0] * l
        lab[i - 1] += 1
        if j == i:
            gens.append(tuple(lab))
        elif i < j:
            lab[j - 1] += 1
            gens.append(tuple(lab))
    return gens


def elementary_divisors_of(M):
    A = M.cartan()
    return [d for d in A.change_ring(ZZ).elementary_divisors() if d != 1]


def table3():
    R.section("Table 3 (printed pp. 297-298)")
    for (t, l), M in MODELS.items():
        name = M.name
        Zord, gens, outer, nuord, b = printed_table3(t, l)
        A = M.cartan()
        R.ok(elementary_divisors_of(M) == Zord,
             f"{name}: Z(G) = P^v/Q^v has invariant factors {Zord}")
        # printed generators lie in P^v and generate P^v/Q^v
        pairing = lambda X: [M.ip(a, X) for a in M.simple]
        R.ok(all(all(c in ZZ for c in pairing(hsum(M, g))) for g in gens),
             f"{name}: printed generators lie in P^v")
        rows = [list(pairing(coroot(M, i))) for i in range(1, l + 1)]
        rows += [list(pairing(hsum(M, g))) for g in gens]
        L = matrix(QQ, rows)
        # index of the generated lattice in P^v (coordinates in the basis of
        # fundamental coweights are the pairings with alpha_j)
        H = L.change_ring(ZZ).echelon_form()
        idx = abs(H.matrix_from_rows(range(l)).det())
        R.ok(idx == 1, f"{name}: they generate P^v/Q^v")
        if t == "D" and l % 2 == 0:
            g1, g2 = gens
            R.ok(all(c in ZZ for c in pairing(2 * hsum(M, g1))) and
                 all(c in ZZ for c in pairing(2 * hsum(M, g2))),
                 f"{name}: both generators have order 2 (Z2 x Z2)")
        # Aut G / Int G = automorphisms of the Dynkin diagram
        from sage.all import DiGraph
        Dg = DiGraph([(i, j, A[i, j]) for i in range(l) for j in range(l)
                      if i != j and A[i, j] != 0], loops=False,
                     multiedges=False)
        Dg.add_vertices(range(l))
        Aut = Dg.automorphism_group(edge_labels=True)
        want = {"e": (1, True), "Z2": (2, True), "S3": (6, False)}[outer]
        R.ok((Aut.order(), Aut.is_abelian()) == want,
             f"{name}: Aut G/Int G = diagram automorphisms = {outer}")
        # |nu| and nu itself
        nu = nu_book(t, l)
        ordnu = 1 if all(nu[i] == i for i in nu) else 2
        R.ok(ordnu == nuord, f"{name}: |nu| = {nuord}")
        # b in P^v; Lambda(b) = Lambda(rho^v) mod Z for self-dual Lambda
        bv = hsum(M, b)
        R.ok(all(c in ZZ for c in pairing(bv)), f"{name}: b in P^v")
        rho_v = sum(M.fund[i] / (M.ip(M.simple[i], M.simple[i]) / 2)
                    for i in range(l))  # sum of fundamental coweights
        half_sum_coroots = sum(2 * a / M.ip(a, a)
                               for a in M.positive_roots()) / 2
        R.ok(rho_v == half_sum_coroots,
             f"{name}: rho^v = 1/2 sum h_alpha = sum pi_(alpha_i^v) "
             "(printed p. 291)")
        gens_sd = self_dual_generators(t, l, nu)
        R.ok(all((M.ip(M.weight(g), bv) - M.ip(M.weight(g), rho_v)) in ZZ
                 for g in gens_sd),
             f"{name}: Lambda(b) = Lambda(rho^v) mod Z on all self-dual "
             "Lambda (checked on the generators of the monoid)")
        # independent: symmetric or skew form from Sym^2 / Lambda^2
        tested = 0
        for g in gens_sd + [tuple(x + y for x, y in zip(g1, g2))
                            for g1, g2 in combinations(gens_sd, 2)][:6]:
            ch = irr(t, l, list(g))
            if ch.degree() > 700:
                continue
            triv = irr(t, l, [0] * l)
            key = triv.support()[0]
            sym = ch.symmetric_square().monomial_coefficients().get(key, 0)
            alt = ch.exterior_square().monomial_coefficients().get(key, 0)
            symmetric = M.ip(M.weight(g), bv) in ZZ
            R.ok((sym, alt) == ((1, 0) if symmetric else (0, 1)),
                 f"{name} {g}: invariant form is "
                 f"{'symmetric' if symmetric else 'skew'} iff Lambda(b) in Z")
            tested += 1
        R.ok(tested >= 1, f"{name}: at least one self-dual representation "
                          "tested by Sym^2/Lambda^2")
        # non-self-dual fundamental weights have no invariant form
        for i in range(1, l + 1):
            if nu[i] != i:
                lab = [0] * l
                lab[i - 1] = 1
                ch = irr(t, l, lab)
                if ch.degree() > 700:
                    continue
                key = irr(t, l, [0] * l).support()[0]
                R.ok(ch.symmetric_square().monomial_coefficients().get(key, 0)
                     == 0 == ch.exterior_square().monomial_coefficients()
                     .get(key, 0), f"{name} pi_{i}: not self-dual, no "
                                   "invariant bilinear form")
# ---------------------------------------------------------------------------
# 7. Table 8 (printed pp. 309-311): the printed matrix
#    descriptions, built as real vector spaces of complex matrices.
# ---------------------------------------------------------------------------
KI = CyclotomicField(4)
I = KI.gen()                     # the imaginary unit


def conj(x):
    return x.conjugate()


class Lin:
    """A matrix depending real-linearly on real parameters p_k:
    X(p) = sum_k p_k terms[k]."""

    def __init__(self, terms, r, c):
        self.terms = {k: v for k, v in terms.items() if v != 0}
        self.r, self.c = r, c

    def _map(self, f, r=None, c=None):
        return Lin({k: f(v) for k, v in self.terms.items()},
                   self.r if r is None else r, self.c if c is None else c)

    @property
    def T(self):
        return self._map(lambda v: v.transpose(), self.c, self.r)

    def bar(self):
        return self._map(lambda v: v.conjugate())

    def __neg__(self):
        return self._map(lambda v: -v)

    def __add__(self, o):
        keys = set(self.terms) | set(o.terms)
        z = zero_matrix(KI, self.r, self.c)
        return Lin({k: self.terms.get(k, z) + o.terms.get(k, z) for k in keys},
                   self.r, self.c)

    def __sub__(self, o):
        return self + (-o)

    def scale(self, s):
        return self._map(lambda v: s * v)

    def trace(self):
        return self._map(lambda v: matrix(KI, [[v.trace()]]), 1, 1)

    def eval(self, p):
        out = zero_matrix(KI, self.r, self.c)
        for k, v in self.terms.items():
            if p[k] != 0:
                out += p[k] * v
        return out


def blocks(rows):
    """Block matrix of Lin's."""
    rs = [row[0].r for row in rows]
    cs = [b.c for b in rows[0]]
    keys = set()
    for row in rows:
        for b in row:
            keys |= set(b.terms)
    out = {}
    for k in keys:
        out[k] = block_matrix(KI, [[b.terms.get(k, zero_matrix(KI, b.r, b.c))
                                    for b in row] for row in rows],
                              subdivide=False)
    return Lin(out, sum(rs), sum(cs))


class Alloc:
    def __init__(self):
        self.m = 0

    def block(self, r, c, cplx):
        terms = {}
        for a in range(r):
            for b in range(c):
                for u in ((1, I) if cplx else (1,)):
                    M = zero_matrix(KI, r, c)
                    M[a, b] = u
                    terms[self.m] = M
                    self.m += 1
        return Lin(terms, r, c)


def real_rows(lin, m):
    """Rows over QQ expressing Re and Im of every entry of lin(p) in p."""
    rows = []
    for a in range(lin.r):
        for b in range(lin.c):
            re = [QQ(0)] * m
            im = [QQ(0)] * m
            nz = False
            for k, v in lin.terms.items():
                x = v[a, b]
                if x != 0:
                    nz = True
                    re[k] = QQ((x + conj(x)) / 2)
                    im[k] = QQ((x - conj(x)) / (2 * I))
            if nz:
                rows += [re, im]
    return rows


def solve_space(X, conds, m):
    """Real basis (as matrices) of {X(p) : all conds vanish}."""
    rows = []
    for c in conds:
        rows += real_rows(c, m)
    if rows:
        K = matrix(QQ, rows).right_kernel_matrix()
    else:
        K = identity_matrix(QQ, m)
    return [X.eval(list(v)) for v in K.rows()]


def realvec(M):
    return vector(QQ, [QQ((x + conj(x)) / 2) for x in M.list()]
                  + [QQ((x - conj(x)) / (2 * I)) for x in M.list()])


def real_dim(mats):
    return matrix(QQ, [realvec(M) for M in mats]).rank() if mats else 0


_SPANS = {}


def in_real_span(M, mats):
    key = id(mats)
    if key not in _SPANS or _SPANS[key][0] is not mats:
        V = matrix(QQ, [realvec(X) for X in mats]).row_space()
        _SPANS[key] = (mats, V)
    return realvec(M) in _SPANS[key][1]


def complex_rank(mats):
    return matrix(KI, [M.list() for M in mats]).rank()


def br(X, Y):
    return X * Y - Y * X


def herm(M):
    return M.conjugate().transpose()


def E(n, a, b):
    M = zero_matrix(KI, n, n)
    M[a, b] = 1
    return M


class RealForm:
    """A printed row of Table 8 with the objects built from it."""

    def __init__(self, family, params, g, k, p, a, N, target, dim_target,
                 ktype_dim, kcenter, rank_R, typ, l):
        self.family, self.params = family, params
        self.g, self.k, self.p, self.a = g, k, p, a
        self.N, self.target, self.dim_target = N, target, dim_target
        self.ktype_dim, self.kcenter, self.rank_R = ktype_dim, kcenter, rank_R
        self.typ, self.l = typ, l

    @property
    def name(self):
        return f"{self.family}{self.params}"


def form_slR(n):
    al = Alloc()
    X = al.block(n, n, False)
    g = solve_space(X, [X.trace()], al.m)
    k = solve_space(X, [X.trace(), X.T + X], al.m)            # X^T = -X
    p = solve_space(X, [X.trace(), X.T - X], al.m)            # X^T = X, tr 0
    a = [E(n, j, j) - E(n, j + 1, j + 1) for j in range(n - 1)]
    return RealForm("sl_R", (n,), g, k, p, a, n,
                    lambda M: M.trace() == 0, n * n - 1,
                    n * (n - 1) // 2, 1 if n == 2 else 0, n - 1, "A", n - 1)


def form_slH(n):
    """Printed row 'gl_n(H) (n >= 2)': [[X, Y], [-Y-bar, X-bar]],
    Re tr X = 0."""
    al = Alloc()
    X = al.block(n, n, True)
    Y = al.block(n, n, True)
    M = blocks([[X, Y], [-Y.bar(), X.bar()]])
    re_tr = (X.trace() + X.trace().bar()).scale(QQ(1) / 2)
    g = solve_space(M, [re_tr], al.m)
    k = solve_space(M, [re_tr, X.bar().T + X, Y.T - Y], al.m)
    p = solve_space(M, [re_tr, X.bar().T - X, X.trace(), Y.T + Y], al.m)
    a = [E(2 * n, j, j) - E(2 * n, j + 1, j + 1) + E(2 * n, n + j, n + j)
         - E(2 * n, n + j + 1, n + j + 1) for j in range(n - 1)]
    return RealForm("sl_H", (n,), g, k, p, a, 2 * n,
                    lambda M: M.trace() == 0, 4 * n * n - 1,
                    n * (2 * n + 1), 0, n - 1, "A", 2 * n - 1)


def form_su(pp, q):
    al = Alloc()
    X1 = al.block(pp, pp, True)
    X2 = al.block(q, q, True)
    Y = al.block(pp, q, True)
    M = blocks([[X1, Y], [Y.bar().T, X2]])
    conds = [X1.bar().T + X1, X2.bar().T + X2, X1.trace() + X2.trace()]
    g = solve_space(M, conds, al.m)
    k = solve_space(M, conds + [Y], al.m)
    p = solve_space(M, conds + [X1, X2], al.m)
    n = pp + q
    a = [E(n, j, pp + j) + E(n, pp + j, j) for j in range(pp)]
    return RealForm("su", (pp, q), g, k, p, a, n,
                    lambda M: M.trace() == 0, n * n - 1,
                    (pp * pp - 1 if pp else 0) + q * q, 1 if pp * q else 0,
                    pp, "A", n - 1)


def form_so(pp, q):
    al = Alloc()
    X1 = al.block(pp, pp, False)
    X2 = al.block(q, q, False)
    Y = al.block(pp, q, False)
    M = blocks([[X1, Y], [Y.T, X2]])
    conds = [X1.T + X1, X2.T + X2]
    g = solve_space(M, conds, al.m)
    k = solve_space(M, conds + [Y], al.m)
    p = solve_space(M, conds + [X1, X2], al.m)
    n = pp + q
    eta = diagonal_matrix(KI, [1] * pp + [-1] * q)
    a = [E(n, j, pp + j) + E(n, pp + j, j) for j in range(pp)]
    l = n // 2
    return RealForm("so", (pp, q), g, k, p, a, n,
                    lambda M: M.transpose() * eta + eta * M == 0,
                    n * (n - 1) // 2,
                    pp * (pp - 1) // 2 + q * (q - 1) // 2,
                    (1 if pp == 2 else 0) + (1 if q == 2 else 0), pp,
                    "B" if n % 2 else "D", l)


def J2(n):
    return block_matrix(KI, [[zero_matrix(KI, n), identity_matrix(KI, n)],
                             [-identity_matrix(KI, n), zero_matrix(KI, n)]],
                        subdivide=False)


def form_spR(n):
    al = Alloc()
    X = al.block(n, n, False)
    Y1 = al.block(n, n, False)
    Y2 = al.block(n, n, False)
    M = blocks([[X, Y1], [Y2, -X.T]])
    conds = [Y1.T - Y1, Y2.T - Y2]
    g = solve_space(M, conds, al.m)
    k = solve_space(M, conds + [X.T + X, Y2 + Y1], al.m)
    p = solve_space(M, conds + [X.T - X, Y2 - Y1], al.m)
    a = [E(2 * n, j, j) - E(2 * n, n + j, n + j) for j in range(n)]
    Jn = J2(n)
    return RealForm("sp_R", (n,), g, k, p, a, 2 * n,
                    lambda M: M.transpose() * Jn + Jn * M == 0,
                    n * (2 * n + 1), n * n, 1, n, "C", n)


def form_sp(pp, q):
    """The printed 4 x 4 block matrix of sp_(p,q) (blocks p, q, p, q)."""
    al = Alloc()
    X11 = al.block(pp, pp, True)
    X12 = al.block(pp, q, True)
    X13 = al.block(pp, pp, True)
    X14 = al.block(pp, q, True)
    X22 = al.block(q, q, True)
    X24 = al.block(q, q, True)
    M = blocks([
        [X11, X12, X13, X14],
        [X12.bar().T, X22, X14.T, X24],
        [-X13.bar(), X14.bar(), X11.bar(), -X12.bar()],
        [X14.bar().T, -X24.bar(), -X12.T, X22.bar()]])
    conds = [X11.bar().T + X11, X22.bar().T + X22, X13.T - X13, X24.T - X24]
    g = solve_space(M, conds, al.m)
    k = solve_space(M, conds + [X12, X14], al.m)
    p = solve_space(M, conds + [X11, X13, X22, X24], al.m)
    n = pp + q
    N = 2 * n
    a = [E(N, j, pp + j) + E(N, pp + j, j) - E(N, n + j, n + pp + j)
         - E(N, n + pp + j, n + j) for j in range(pp)]
    Jn = J2(n)
    return RealForm("sp", (pp, q), g, k, p, a, N,
                    lambda M: M.transpose() * Jn + Jn * M == 0,
                    n * (2 * n + 1), pp * (2 * pp + 1) + q * (2 * q + 1), 0,
                    pp, "C", n)


def form_ustar(n):
    al = Alloc()
    X = al.block(n, n, True)
    Y = al.block(n, n, True)
    M = blocks([[X, Y], [-Y.bar(), X.bar()]])
    conds = [X.T + X, Y.T - Y.bar()]
    g = solve_space(M, conds, al.m)
    k = solve_space(M, conds + [X.bar() - X, Y.bar() - Y], al.m)
    p = solve_space(M, conds + [X.bar() + X, Y.bar() + Y], al.m)
    N = 2 * n
    a = [I * (E(N, 2 * j, 2 * j + 1) - E(N, 2 * j + 1, 2 * j)
              - E(N, n + 2 * j, n + 2 * j + 1) + E(N, n + 2 * j + 1, n + 2 * j))
         for j in range(n // 2)]
    return RealForm("u*_H", (n,), g, k, p, a, N,
                    lambda M: M.transpose() + M == 0, n * (2 * n - 1),
                    n * n, 1, n // 2, "D", n)


def table8_forms():
    forms = [form_slR(n) for n in range(2, 7)]
    forms += [form_slH(n) for n in range(2, 5)]
    forms += [form_su(pp, n - pp) for n in range(2, 7)
              for pp in range(1, n // 2 + 1)]
    forms += [form_so(pp, n - pp) for n in range(3, 9)
              for pp in range(1, n // 2 + 1)]
    forms += [form_spR(n) for n in range(1, 5)]
    forms += [form_sp(pp, n - pp) for n in range(2, 5)
              for pp in range(1, n // 2 + 1)]
    forms += [form_ustar(n) for n in range(2, 6)]
    return forms


def center_dim(basis):
    """Dimension of the center of the real Lie algebra spanned by basis."""
    m = len(basis)
    rows = []
    for Y in basis:
        cols = [realvec(br(X, Y)) for X in basis]
        rows.append(matrix(QQ, cols))
    # sum_k c_k [X_k, Y] = 0 for all Y
    A = block_matrix(QQ, [[r.transpose()] for r in rows], subdivide=False)
    return A.right_kernel().dimension()


def closed(basis):
    return all(in_real_span(br(X, Y), basis) for X, Y in
               combinations(basis, 2))


def trace_gram(basis):
    return matrix(QQ, [[QQ(((X * Y).trace() + conj((X * Y).trace())) / 2)
                        for Y in basis] for X in basis])


def table8():
    R.section("Table 8 (printed pp. 309-311)")
    for F in table8_forms():
        nm = F.name
        g, k, p, a = F.g, F.k, F.p, F.a
        R.ok(len(g) == real_dim(g) == F.dim_target,
             f"{nm}: real dim of the printed g = complex dim of the target "
             f"= {F.dim_target}")
        R.ok(all(F.target(X) for X in g),
             f"{nm}: printed matrices lie in the complex classical algebra")
        R.ok(complex_rank(g) == len(g),
             f"{nm}: g and i g meet in 0, so g is a real form of the target")
        R.ok(closed(g), f"{nm}: printed g closed under the bracket")
        R.ok(len(k) + len(p) == len(g) and real_dim(k + p) == len(g),
             f"{nm}: g = k + p (direct)")
        R.ok(closed(k), f"{nm}: k is a subalgebra")
        R.ok(all(in_real_span(br(X, Y), p) for X in k for Y in p),
             f"{nm}: [k, p] in p")
        R.ok(all(in_real_span(br(X, Y), k) for X, Y in combinations(p, 2)),
             f"{nm}: [p, p] in k")
        R.ok(all(herm(X) == -X for X in k) and all(herm(X) == X for X in p),
             f"{nm}: k skew-Hermitian, p Hermitian, so theta(X) = -X^* is the "
             "Cartan involution (trace form negative on k, positive on p)")
        Gk = trace_gram(k)
        Gp = trace_gram(p)
        R.ok((-Gk).is_positive_definite() and Gp.is_positive_definite(),
             f"{nm}: Re tr(XY) negative definite on k, positive on p")
        R.ok(len(k) == F.ktype_dim,
             f"{nm}: dim k = dim of the printed type = {F.ktype_dim}")
        R.ok(center_dim(k) == F.kcenter,
             f"{nm}: dim of the center of k = {F.kcenter}")
        R.ok(all(in_real_span(A, p) for A in a), f"{nm}: printed a in p")
        R.ok(all(br(A, B) == 0 for A, B in combinations(a, 2)),
             f"{nm}: printed a abelian")
        R.ok(all(herm(A) == A for A in a),
             f"{nm}: a Hermitian, hence R-diagonalizable")
        R.ok(real_dim(a) == len(a) == F.rank_R,
             f"{nm}: dim a = {F.rank_R}")
        # maximal abelian in p: centraliser of a in p is a
        m = len(p)
        rows = []
        for A in a:
            rows.append(matrix(QQ, [realvec(br(X, A)) for X in p]).transpose())
        cent = (block_matrix(QQ, [[r] for r in rows], subdivide=False)
                .right_kernel().dimension() if rows else m)
        R.ok(cent == len(a), f"{nm}: a maximal abelian in p, real rank "
                             f"{F.rank_R}")
        if F.family == "sl_H":
            n = F.params[0]
            R.refuted(len(g) == 4 * n * n,
                      f"sl_H({n}): printed type 'gl_n(H)': dim gl_n(H) = "
                      f"{4 * n * n} but the printed matrices form {len(g)}")
            R.refuted(in_real_span(identity_matrix(KI, 2 * n), g),
                      f"sl_H({n}): the center R E of gl_n(H) is not in the "
                      "printed algebra")
            # the printed algebra is sl_n(H) = {Re tr = 0} inside the image
            # of gl_n(H) (Knapp, Lie groups beyond an introduction, I.8 Ex. 3)
            al = Alloc()
            X = al.block(n, n, True)
            Y = al.block(n, n, True)
            glH = solve_space(blocks([[X, Y], [-Y.bar(), X.bar()]]), [], al.m)
            R.ok(len(glH) == 4 * n * n and all(in_real_span(Z, glH) for Z in g)
                 and all(((Z.trace() + conj(Z.trace())) == 0) for Z in g),
                 f"sl_H({n}): printed algebra = sl_n(H) inside gl_n(H)")
# ---------------------------------------------------------------------------
# 8. 1.3: real representations, (F12)-(F14) and the table of indices
#    (printed pp. 290-292)
# ---------------------------------------------------------------------------
# Method (independent of (F14)).  For a real form g given by explicit
# matrices and a representation rho of g built from them, the antilinear
# operators commuting with rho(g) are J = T o conj, where T solves
#     T conj(rho(X)) = rho(X) T      for X in a set generating g
# (a complex-linear system).  rho(g)-irreducible => the solutions form a
# complex line or 0; J^2 = T conj(T) = c E with c real, epsilon = sign c.
# Between two representations A, B the same system (T: V_A -> V_B) decides
# whether conj(rho_A) = rho_B (F12).  A generic element H of g diagonal in
# the chosen basis restricts T: T_ab = 0 unless d_B[a] = conj(d_A[b]).
#
# Multiplicativity (used to pass from the generators to all Lambda): if
# rho(Lambda), rho(M) admit J_L, J_M then J_L (x) J_M preserves the
# multiplicity-one component R(Lambda + M) of R(Lambda) (x) R(M), so
# eps(Lambda + M) = eps(Lambda) eps(M); and if conj(R(pi_i)) = R(pi_j), j != i,
# then R(pi_i + pi_j) sits once in V (x) conj(V), where J(v (x) w) = w (x) v
# squares to +1, so eps(pi_i + pi_j) = 1.  Hence epsilon is determined by its
# values on the fundamental weights fixed by nu tau, which are computed.
# The printed formulas are of the form (-1)^(linear form in Lambda), so they
# agree with epsilon for every Lambda iff they agree on these generators.

def pseudo_random_element(basis, seed):
    import random
    rnd = random.Random(seed)
    cs = [rnd.randint(-3, 3) for _ in basis]
    return sum((c * X for c, X in zip(cs, basis)), 0 * basis[0])


def lie_closure_dim(gens):
    """Real dimension of the Lie algebra generated by gens (closure of the
    span under ad of the generators, round by round)."""
    basis = list(gens)
    vecs = [realvec(X) for X in basis]
    piv = matrix(QQ, vecs).pivot_rows()
    basis = [basis[i] for i in piv]
    vecs = [vecs[i] for i in piv]
    frontier = list(basis)
    while frontier:
        cand = [br(s, v) for s in gens for v in frontier]
        allv = vecs + [realvec(X) for X in cand]
        piv = matrix(QQ, allv).pivot_rows()
        new = [cand[i - len(vecs)] for i in piv if i >= len(vecs)]
        basis += new
        vecs = [allv[i] for i in piv]
        frontier = new
    return len(basis)


def eigenbasis(H):
    """P with P^-1 H P diagonal (H diagonalisable over Q(i))."""
    cols = []
    for ev, vecs, mult in H.eigenvectors_right():
        assert len(vecs) == mult
        cols += vecs
    P = matrix(KI, cols).transpose()
    D = P.inverse() * H * P
    assert D.is_diagonal()
    return P


def sort_sign(J):
    J = list(J)
    sign = 1
    for i in range(len(J)):
        for j in range(len(J) - 1 - i):
            if J[j] > J[j + 1]:
                J[j], J[j + 1] = J[j + 1], J[j]
                sign = -sign
    return sign, tuple(J)


def wedge(X, k, subsets, index):
    """Sparse matrix {(row, col): value} of X acting on Lambda^k."""
    n = X.nrows()
    nz = {}
    for (b, a) in X.nonzero_positions():
        nz.setdefault(a, []).append((b, X[b, a]))
    out = {}
    for col, S in enumerate(subsets):
        Sset = set(S)
        for pos, a in enumerate(S):
            for b, x in nz.get(a, ()):
                if b != a and b in Sset:
                    continue
                J = list(S)
                J[pos] = b
                sign, Js = sort_sign(J)
                key = (index[Js], col)
                out[key] = out.get(key, 0) + sign * x
    return {k: v for k, v in out.items() if v != 0}


def dense(sp, N):
    M = zero_matrix(KI, N, N)
    for (a, b), v in sp.items():
        M[a, b] = v
    return M


def clifford(eta, pairs, single):
    """gamma_a (sparse, on bit strings of length len(pairs)) with
    gamma_a gamma_b + gamma_b gamma_a = 2 eta_a delta_ab."""
    r = len(pairs)
    states = list(product((0, 1), repeat=r))
    idx = {s: i for i, s in enumerate(states)}
    gam = {}
    for t, (a, b) in enumerate(pairs):
        for coord, kind in ((a, "X"), (b, "Y")):
            G = {}
            for s in states:
                sign = (-1) ** sum(s[:t])
                s2 = list(s)
                s2[t] = 1 - s[t]
                if kind == "X":
                    val = sign
                else:
                    val = sign * (I if s[t] == 0 else -I)
                G[(idx[tuple(s2)], idx[s])] = val * (1 if eta[coord] == 1 else I)
            gam[coord] = G
    if single is not None:
        G = {}
        for s in states:
            G[(idx[s], idx[s])] = (-1) ** sum(s) * (1 if eta[single] == 1 else I)
        gam[single] = G
    return states, gam


def spmul(A, B):
    rows = {}
    for (a, b), v in B.items():
        rows.setdefault(a, []).append((b, v))
    out = {}
    for (i, a), u in A.items():
        for b, v in rows.get(a, ()):
            out[(i, b)] = out.get((i, b), 0) + u * v
    return {k: v for k, v in out.items() if v != 0}


def spadd(A, B, s=1):
    out = dict(A)
    for k, v in B.items():
        out[k] = out.get(k, 0) + s * v
    return {k: v for k, v in out.items() if v != 0}


def spin_rep(X, eta, gam):
    """rho(X) = sum_(a<b) (X[a,b]/eta_b) (1/2) gamma_a gamma_b."""
    out = {}
    n = X.nrows()
    for a in range(n):
        for b in range(a + 1, n):
            if X[a, b] != 0:
                term = spmul(gam[a], gam[b])
                c = X[a, b] / eta[b] / 2
                out = spadd(out, {k: c * v for k, v in term.items()})
    return out


def restrict(sp, keep):
    pos = {k: i for i, k in enumerate(keep)}
    out = {}
    for (a, b), v in sp.items():
        if a in pos and b in pos:
            out[(pos[a], pos[b])] = v
        else:
            assert not ((a in pos) ^ (b in pos)), "subspace not invariant"
    return out


class Rep:
    def __init__(self, label, gens, diag):
        self.label, self.gens, self.diag = label, gens, diag
        self.N = len(diag)


def intertwiners(A, B):
    """Basis of {T : T conj(rho_A(X)) = rho_B(X) T for the generators}."""
    allowed = [(a, b) for a in range(B.N) for b in range(A.N)
               if B.diag[a] == conj(A.diag[b])]
    var = {ab: i for i, ab in enumerate(allowed)}
    if not allowed:
        return []
    eqs = {}
    for g, (XA, XB) in enumerate(zip(A.gens, B.gens)):
        Arows = {}
        for (b, c), v in XA.items():
            Arows.setdefault(b, []).append((c, conj(v)))
        Bcols = {}
        for (a2, a), v in XB.items():
            Bcols.setdefault(a, []).append((a2, v))
        for (a, b), i in var.items():
            for c, v in Arows.get(b, ()):
                row = eqs.setdefault((g, a, c), {})
                row[i] = row.get(i, 0) + v
            for a2, v in Bcols.get(a, ()):
                row = eqs.setdefault((g, a2, b), {})
                row[i] = row.get(i, 0) - v
    rows = [r for r in eqs.values() if any(x != 0 for x in r.values())]
    # complex-linear system in T = X + i Y, solved over QQ: for a coefficient
    # a + i b, Re: a x - b y, Im: b x + a y (x at column i, y at nv + i)
    nv = len(allowed)
    ent = {}
    for ri, r in enumerate(rows):
        for i, v in r.items():
            a, b = QQ((v + conj(v)) / 2), QQ((v - conj(v)) / (2 * I))
            for (row, col, val) in ((2 * ri, i, a), (2 * ri, nv + i, -b),
                                    (2 * ri + 1, i, b), (2 * ri + 1, nv + i, a)):
                if val != 0:
                    ent[(row, col)] = ent.get((row, col), 0) + val
    if not rows:
        Kq = identity_matrix(QQ, 2 * nv)
    else:
        Kq = matrix(QQ, 2 * len(rows), 2 * nv, ent,
                    sparse=True).right_kernel_matrix()
    # the real solution space is a complex subspace: its real dimension is
    # even; a complex basis is every other vector after echelonisation
    assert Kq.nrows() % 2 == 0
    sols = [[Kq[r, i] + I * Kq[r, nv + i] for i in range(nv)]
            for r in range(Kq.nrows())]
    if not sols:
        return []
    Ck = matrix(KI, sols)
    basis = Ck.row_space().basis() if Ck.rank() else []
    assert 2 * len(basis) == Kq.nrows()
    return [{allowed[i]: x for i, x in enumerate(v) if x != 0}
            for v in basis]


def index_of(A):
    """None if conj(rho) is not rho, else epsilon = +-1."""
    sols = intertwiners(A, A)
    assert len(sols) <= 1, f"{A.label}: reducible? {len(sols)}"
    if not sols:
        return None
    T = sols[0]
    Tb = {k: conj(v) for k, v in T.items()}
    TT = spmul(T, Tb)
    c = TT.get((0, 0), 0)
    assert c != 0 and conj(c) == c
    assert TT == {(a, a): c for a in range(A.N)}, "J^2 not scalar"
    return 1 if QQ(c) > 0 else -1


# -- the real forms, their generators and representations --------------------
def compact_su(n):
    al = Alloc()
    X = al.block(n, n, True)
    g = solve_space(X, [X.bar().T + X, X.trace()], al.m)
    return RealForm("su", (0, n), g, g, [], [], n, lambda M: M.trace() == 0,
                    n * n - 1, n * n - 1, 0, 0, "A", n - 1)


def compact_so(n):
    al = Alloc()
    X = al.block(n, n, False)
    g = solve_space(X, [X.T + X], al.m)
    return RealForm("so", (0, n), g, g, [], [], n,
                    lambda M: M.transpose() + M == 0, n * (n - 1) // 2,
                    n * (n - 1) // 2, 0, 0, "B" if n % 2 else "D", n // 2)


def compact_sp(n):
    al = Alloc()
    X = al.block(n, n, True)
    Y = al.block(n, n, True)
    M = blocks([[X, Y], [-Y.bar(), X.bar()]])
    g = solve_space(M, [X.bar().T + X, Y.T - Y], al.m)
    Jn = J2(n)
    return RealForm("sp", (0, n), g, g, [], [], 2 * n,
                    lambda M: M.transpose() * Jn + Jn * M == 0,
                    n * (2 * n + 1), n * (2 * n + 1), 0, 0, "C", n)


# powers of 3: signed sums of distinct terms are distinct, so H is as
# generic as the weight multiplicities allow
GEN = [3 ** j for j in range(1, 20)]


def cartan_element(F):
    """A generic element H of g, diagonalisable over Q(i); for so and u*
    also the pairing of coordinates used by the spin construction."""
    fam, N = F.family, F.N
    if fam in ("su",):
        c = [GEN[j] for j in range(N - 1)]
        c.append(-sum(c))
        return diagonal_matrix(KI, [I * x for x in c]), None
    if fam == "sl_R":
        c = [GEN[j] for j in range(N - 1)]
        c.append(-sum(c))
        return diagonal_matrix(KI, c), None
    if fam == "sl_H":
        n = N // 2
        x = [GEN[j] for j in range(n - 1)]
        x.append(-sum(x))
        y = [GEN[n + j] for j in range(n)]
        return diagonal_matrix(KI, [x[j] + I * y[j] for j in range(n)]
                               + [x[j] - I * y[j] for j in range(n)]), None
    if fam in ("sp_R",):
        n = N // 2
        x = [GEN[j] for j in range(n)]
        return diagonal_matrix(KI, x + [-v for v in x]), None
    if fam == "sp":
        n = N // 2
        y = [GEN[j] for j in range(n)]
        return diagonal_matrix(KI, [I * v for v in y]
                               + [-I * v for v in y]), None
    if fam == "so":
        pp, q = F.params
        eta = [1] * pp + [-1] * q
        pairs = [(2 * t, 2 * t + 1) for t in range(N // 2)]
        H = zero_matrix(KI, N, N)
        for t, (a, b) in enumerate(pairs):
            H += GEN[t] * (E(N, a, b) * eta[b] - E(N, b, a) * eta[a])
        return H, pairs
    if fam == "u*_H":
        n = N // 2
        pairs = [(j, n + j) for j in range(n)]
        H = zero_matrix(KI, N, N)
        for t, (a, b) in enumerate(pairs):
            H += GEN[t] * (E(N, a, b) - E(N, b, a))
        return H, pairs
    raise ValueError(fam)


def primitive_basis(n, k, omega, subsets, index, diagH):
    """Kernel of the contraction Lambda^k -> Lambda^(k-2) with omega,
    weight block by weight block (diagH: eigenvalue of each e_I)."""
    if k < 2:
        return None
    lower = list(combinations(range(n), k - 2))
    lidx = {S: i for i, S in enumerate(lower)}
    C = {}
    for col, S in enumerate(subsets):
        for r, s in combinations(range(k), 2):
            w = omega[S[r], S[s]]
            if w == 0:
                continue
            rest = tuple(x for t, x in enumerate(S) if t not in (r, s))
            key = (lidx[rest], col)
            C[key] = C.get(key, 0) + (-1) ** (r + s + 1) * w
    blocks_ = {}
    for col, d in enumerate(diagH):
        blocks_.setdefault(d, []).append(col)
    basis = []
    for d, cols in blocks_.items():
        rows = sorted({r for (r, c) in C if c in set(cols)})
        if not rows:
            for c in cols:
                v = {c: KI(1)}
                basis.append((d, v))
            continue
        Mt = matrix(KI, len(rows), len(cols),
                    {(rows.index(r), cols.index(c)): v
                     for (r, c), v in C.items() if c in set(cols)})
        for v in Mt.right_kernel_matrix().rows():
            basis.append((d, {cols[i]: x for i, x in enumerate(v) if x != 0}))
    return basis


def restrict_to_basis(sp, basis, Nfull):
    """Matrix of an operator (sparse, on the full space) on the invariant
    subspace with the given basis (list of sparse vectors)."""
    B = matrix(KI, Nfull, len(basis))
    for j, (d, v) in enumerate(basis):
        for i, x in v.items():
            B[i, j] = x
    Xd = dense(sp, Nfull)
    Y = B.solve_right(Xd * B)
    assert B * Y == Xd * B, "subspace not invariant"
    return {(a, b): Y[a, b] for (a, b) in Y.nonzero_positions()}


def representations(F, maxdim=130):
    """Fundamental representations of the real form F in book labels:
    list of (label, Rep); half-spins get labels 'S0', 'S1'."""
    t, l, N = F.typ, F.l, F.N
    H, pairs = cartan_element(F)
    assert in_real_span(H, F.g), f"{F.name}: H in g"
    seed = 1
    while True:
        X1 = pseudo_random_element(F.g, seed)
        X2 = pseudo_random_element(F.g, seed + 1000)
        if lie_closure_dim([H, X1, X2]) == len(F.g):
            break
        seed += 1
        assert seed < 20, f"{F.name}: generation"
    gens = [X1, X2]
    out = []
    if F.family in ("so", "u*_H"):
        pp, q = F.params if F.family == "so" else (N, 0)
        eta = [1] * pp + [-1] * q
        single = N - 1 if N % 2 else None
        states, gam = clifford(eta, pairs, single)
        for a in range(N):
            for b in range(N):
                ab = spadd(spmul(gam[a], gam[b]), spmul(gam[b], gam[a]))
                want = {(s, s): 2 * eta[a] for s in range(len(states))} \
                    if a == b else {}
                assert ab == want, "Clifford relations"
        rH = spin_rep(H, eta, gam)
        assert all(a == b for (a, b) in rH), "spin(H) diagonal"
        dH = [rH.get((s, s), KI(0)) for s in range(len(states))]
        sg = [spin_rep(X, eta, gam) for X in gens]
        # homomorphism on the generators
        lhs = spin_rep(br(X1, X2), eta, gam)
        rhs = spadd(spmul(sg[0], sg[1]), spmul(sg[1], sg[0]), -1)
        assert lhs == rhs, "spin representation is a homomorphism"
        if N % 2:
            out.append((l, Rep(f"{F.name} spin", sg, dH)))
        else:
            for par in (0, 1):
                keep = [i for i, s in enumerate(states) if sum(s) % 2 == par]
                out.append((f"S{par}", Rep(f"{F.name} half-spin {par}",
                                           [restrict(X, keep) for X in sg],
                                           [dH[i] for i in keep])))
    # exterior powers in an eigenbasis of H
    P = eigenbasis(H)
    Pi = P.inverse()
    Hd = Pi * H * P
    gd = [Pi * X * P for X in gens]
    if F.typ == "A":
        ks = range(1, l + 1)
    elif F.typ == "B":
        ks = range(1, l)
    elif F.typ == "C":
        ks = range(1, l + 1)
    else:
        ks = range(1, l - 1)
    for k in ks:
        subsets = list(combinations(range(N), k))
        if len(subsets) > maxdim * (3 if F.typ == "C" else 1):
            continue
        index = {S: i for i, S in enumerate(subsets)}
        dH = [sum(Hd[a, a] for a in S) for S in subsets]
        wg = [wedge(X, k, subsets, index) for X in gd]
        if F.typ == "C" and k >= 2:
            omega = P.transpose() * J2(N // 2) * P
            basis = primitive_basis(N, k, omega, subsets, index, dH)
            if len(basis) > maxdim:
                continue
            wg = [restrict_to_basis(X, basis, len(subsets)) for X in wg]
            dH = [d for d, v in basis]
        out.append((k, Rep(f"{F.name} fund {k}", wg, dH)))
    return out
# -- printed rows of the index table (printed p. 292) -------------
def sgn(e):
    assert e in ZZ, e
    return 1 if ZZ(e) % 2 == 0 else -1


def odd_sum(L, top):
    return sum(L[i - 1] for i in range(1, top + 1, 2))


def row_for(F):
    """(row name, printed formula, corrected formula, extra refuted readings)
    for a noncompact real form; formulas take book labels L (0-based list).
    Forms not mentioned in the table get the constant 1."""
    fam, l = F.family, F.l
    one = (lambda L: 1)
    if fam == "su":
        pp, q = F.params
        n = pp + q
        if pp == 0:
            return None
        if n % 2:
            return ("not mentioned (su_(k,n-k), n odd)", one, one, [])
        P, k = n // 2, pp
        printed = ((lambda L: sgn((k + 1) * P * L[P - 2])) if P >= 2 else None)
        return (f"su_(k,2p-k), k={k}, p={P}", printed,
                lambda L: sgn((k + P) * L[P - 1]),
                [("reading Lambda_p", lambda L: sgn((k + 1) * P * L[P - 1]))])
    if fam == "sl_H":
        P = F.params[0]
        f = (lambda L: sgn(odd_sum(L, 2 * P - 1)))
        return (f"sl_p(H), p={P}", f, f, [])
    if fam in ("sl_R", "sp_R"):
        return ("not mentioned (split)", one, one, [])
    if fam == "sp":
        pp, q = F.params
        if pp == 0:
            return None
        top = 2 * ((l - 1) // 2) + 1
        assert top == 2 * ((l + 1) // 2) - 1  # the two readings agree
        f = (lambda L: sgn(odd_sum(L, top)))
        wrong = 2 * ((l - 1) // 2) - 1
        return (f"sp_(k,l-k), k={pp}, l={l}", f, f,
                [("reading 2[(l-1)/2] - 1", lambda L: sgn(odd_sum(L, wrong)))])
    if fam == "u*_H":
        top = 2 * (l // 2) - 1
        f = (lambda L: sgn(odd_sum(L, top)))
        return (f"u*_l(H), l={l}", f, f, [])
    if fam == "so":
        pp, q = F.params
        if pp == 0:
            return None
        n = pp + q
        if n % 2:
            k = (pp if pp % 2 == 0 else q) // 2
            return (f"so_(2k,2(l-k)+1), k={k}, l={l}",
                    lambda L: sgn((k + l * (l - 1) / 2) * L[l - 1]),
                    lambda L: sgn((k + l * (l + 1) / 2) * L[l - 1]), [])
        if pp % 2 == 0:
            if l % 2:
                return ("not mentioned (so_(2k,2(l-k)), l odd)", one, one, [])
            k, P = pp // 2, l // 2
            f = (lambda L: sgn((k + P) * (L[2 * P - 2] + L[2 * P - 1])))
            return (f"so_(2k,2(2p-k)), k={k}, p={P}", f, f, [])
        k = (pp + 1) // 2
        f = (lambda L: sgn(((k + 1) + (l - 1) * (l - 2) / 2)
                           * (L[l - 2] + L[l - 1])))
        literal = (lambda L: sgn((k + 1) + (l - 1) * (l - 2) / 2
                                 * (L[l - 2] + L[l - 1])))
        return (f"so_(2k-1,2(l-k)+1), k={k}, l={l}", f, f,
                [("literal, parenthesis not restored", literal)])
    raise ValueError(fam)


def sigma_prime(F):
    """nu tau on the book labels (a dict)."""
    t, l = F.typ, F.l
    ident = {i: i for i in range(1, l + 1)}
    flipA = {i: l + 1 - i for i in range(1, l + 1)}
    swapD = dict(ident)
    if t == "D":
        swapD[l - 1], swapD[l] = l, l - 1
    fam = F.family
    if t == "A":
        if fam == "su":
            return flipA                       # inner: nu
        return ident                           # outer: nu tau = id
    if t in "BC":
        return ident
    if fam == "so" and F.params[0] % 2 == 1:   # so(odd, odd): outer
        return swapD if l % 2 == 0 else ident
    return swapD if l % 2 == 1 else ident      # inner: nu


def f14_vertex(F):
    """The vertex j with theta = exp(2 pi i ad u), u = pi_j^v / 2, for the
    inner forms (Kac's description); 0 for the compact form."""
    fam = F.family
    if fam == "su":
        return F.params[0]
    if fam == "so":
        pp, q = F.params
        if (pp + q) % 2:
            return (pp if pp % 2 == 0 else q) // 2
        if pp % 2:
            return None            # so(odd, odd): outer type
        return pp // 2
    if fam == "sp":
        return F.params[0]
    if fam == "sp_R":
        return F.l
    if fam == "u*_H":
        return F.l
    if fam == "sl_R" and F.l == 1:
        return 1
    return None


def f14(M, L, j):
    """(F14): (-1)^(2 Lambda(2u + rho^v)), u = pi_j^v / 2 (u = 0 if j = 0);
    Lambda(pi_k^v) = (Lambda, pi_k)/d_k."""
    lam = M.weight(L)
    d = [M.ip(a, a) / 2 for a in M.simple]
    rho_v = sum(M.ip(lam, M.fund[k]) / d[k] for k in range(M.l))
    u2 = M.ip(lam, M.fund[j - 1]) / d[j - 1] if j else 0
    e = 2 * u2 + 2 * rho_v
    return sgn(e)


def k_dim_from_vertex(M, j):
    """dim of the fixed algebra of theta_j: l + #{roots with even
    coefficient at alpha_j}."""
    if not j:
        return len(M.roots) + M.l
    return M.l + sum(1 for a in M.roots if M.coeffs(a)[j - 1] % 2 == 0)


def generators_of(sig, l):
    gens = []
    for i in range(1, l + 1):
        j = sig[i]
        L = [0] * l
        L[i - 1] += 1
        if j == i:
            gens.append(("fixed", i, L))
        elif i < j:
            L[j - 1] += 1
            gens.append(("pair", (i, j), L))
    return gens


def index_forms():
    forms = []
    for n in range(2, 9):
        forms.append(compact_su(n))
        forms += [form_su(pp, n - pp) for pp in range(1, n // 2 + 1)]
    forms += [form_slH(n) for n in range(2, 5)]
    forms += [form_slR(n) for n in range(2, 7)]
    for n in range(5, 13):
        forms.append(compact_so(n))
        forms += [form_so(pp, n - pp) for pp in range(1, n // 2 + 1)]
    forms += [form_spR(n) for n in range(2, 5)]
    for n in range(2, 5):
        forms.append(compact_sp(n))
        forms += [form_sp(pp, n - pp) for pp in range(1, n // 2 + 1)]
    forms += [form_ustar(n) for n in range(3, 7)]
    return forms


def section13_classical():
    R.section("1.3: indices, classical forms (explicit matrices)")
    wrong_seen = {}
    for F in index_forms():
        t, l = F.typ, F.l
        if l < 2 and t != "A":
            continue
        M = MODELS[(t, l)]
        t0 = time.time()
        reps = dict(representations(F))
        eps = {lab: index_of(r) for lab, r in reps.items()}
        print(f"   {F.name}: " + ", ".join(
            f"{lab}:{'-' if e is None else e}" for lab, e in eps.items())
            + f"  ({time.time() - t0:.1f}s)", flush=True)
        for lab, r in reps.items():
            if isinstance(lab, int):
                L = [0] * l
                L[lab - 1] = 1
                R.ok(r.N == weyl_dim(M, L), f"{F.name}: rep {lab} has the "
                     "dimension of R(pi_i)")
        sig = sigma_prime(F)
        # (F13): self-conjugate iff nu tau fixes the label
        for lab, e in eps.items():
            if isinstance(lab, int):
                R.ok((e is not None) == (sig[lab] == lab),
                     f"{F.name}: (F13) for pi_{lab}")
        halves = [eps[s] for s in ("S0", "S1") if s in eps]
        if halves:
            swapped = sig[l] != l
            R.ok(all((e is None) == swapped for e in halves),
                 f"{F.name}: (F13) for the half-spin representations")
        # (F12): conj R(pi_i) = R(pi_(nu tau i))
        for lab, r in reps.items():
            if isinstance(lab, int) and sig[lab] != lab and sig[lab] in reps:
                R.ok(len(intertwiners(r, reps[sig[lab]])) == 1,
                     f"{F.name}: (F12) conj R(pi_{lab}) = R(pi_{sig[lab]})")
        if halves and sig[l] != l:
            R.ok(len(intertwiners(reps["S0"], reps["S1"])) == 1,
                 f"{F.name}: (F12) the half-spin representations are "
                 "conjugate to each other")
        # F14 vertex <-> the realisation
        j = f14_vertex(F)
        if j is not None:
            R.ok(k_dim_from_vertex(M, j) == F.ktype_dim,
                 f"{F.name}: theta of vertex {j} has dim k = {F.ktype_dim}")
        # generators of the self-conjugate monoid: computed epsilon
        comp = {}
        for kind, what, L in generators_of(sig, l):
            if kind == "pair":
                comp[tuple(L)] = 1          # by the V (x) conj V lemma
            elif what in eps:
                comp[tuple(L)] = eps[what]
        half_pair = None
        if halves and sig[l] == l:
            half_pair = sorted(halves)
            Ls = []
            for i in (l - 1, l):
                L = [0] * l
                L[i - 1] = 1
                Ls.append(tuple(L))
        # the printed / corrected formulas and (F14)
        row = row_for(F)
        fns = []
        if row is not None:
            name, printed, corrected, extras = row
            fns.append(("corrected", corrected, True))
            if printed is not None and printed is not corrected:
                fns.append(("printed", printed, None))
            for nm, fn in extras:
                fns.append((nm, fn, None))
        if j is not None:
            fns.append(("F14", lambda L: f14(M, list(L), j), True))
        for nm, fn, must in fns:
            agree = all(fn(list(L)) == e for L, e in comp.items())
            if half_pair is not None:
                agree = agree and sorted(fn(list(L)) for L in Ls) == half_pair
            if must:
                R.ok(agree, f"{F.name}: {nm} formula"
                     f"{' (' + row[0] + ')' if row and nm != 'F14' else ''} "
                     "= computed index on all generators")
            else:
                key = (row[0].split(",")[0], nm)
                wrong_seen.setdefault(key, [])
                if agree:
                    R.ok(True, f"{F.name}: {nm} ({row[0]}) happens to agree")
                else:
                    wrong_seen[key].append(F.name)
                    R.refuted(agree, f"{F.name}: {nm} reading of the row "
                                     f"{row[0]}")
        if F.family == "u*_H" and half_pair is not None:
            # the assignment itself: F14 with vertex l matches the printed row
            R.ok([row[1](list(L)) for L in Ls] == [f14(M, list(L), l)
                                                    for L in Ls],
                 f"{F.name}: printed u* row and (F14) with vertex l assign the "
                 "same index to pi_(l-1) and pi_l")
    # every printed reading that failed somewhere is wrong as a statement
    for key, bad in wrong_seen.items():
        print(f"   printed reading {key} fails for: {', '.join(bad) or '-'}")
    R.ok(bool(wrong_seen.get(("su_(k", "printed"))),
         "su row as printed fails for some su_(k,2p-k)")
    R.ok(bool(wrong_seen.get(("so_(2k", "printed"))),
         "so_(2k,2(l-k)+1) row as printed fails for some form")
    R.ok(bool(wrong_seen.get(("su_(k", "reading Lambda_p"))),
         "su row with index p instead of p - 1 fails as well")
    R.ok(bool(wrong_seen.get(("sp_(k", "reading 2[(l-1)/2] - 1"))),
         "sp row: the reading 2[(l-1)/2] - 1 of the last index fails")
    R.ok(bool(wrong_seen.get(("so_(2k-1", "literal, parenthesis not "
                                          "restored"))),
         "so_(2k-1,...) row read literally (lost parenthesis) fails")


def section13_f14_ranks():
    """(F14) against the corrected table on the generators, all inner forms
    of the classical types up to rank 8 (the explicit check above covers the
    small ranks; here (F14) is the independent side)."""
    R.section("1.3: the table against (F14), ranks up to 8")
    for (t, l), M in MODELS.items():
        if t not in "ABCD":
            continue
        cases = []
        if t == "A":
            n = l + 1
            for k in range(0, n // 2 + 1):
                if n % 2 == 0 and k >= 1:
                    P = n // 2
                    cases.append((k, f"su_({k},{n - k})",
                                  lambda L, k=k, P=P: sgn((k + P) * L[P - 1]),
                                  (lambda L, k=k, P=P:
                                   sgn((k + 1) * P * L[P - 2]))
                                  if P >= 2 else None))
                elif k >= 1:
                    cases.append((k, f"su_({k},{n - k})", lambda L: 1, None))
            sig = {i: l + 1 - i for i in range(1, l + 1)}
        elif t == "B":
            for k in range(1, l + 1):
                cases.append((k, f"so_({2 * k},{2 * (l - k) + 1})",
                              lambda L, k=k: sgn((k + l * (l + 1) / 2)
                                                 * L[l - 1]),
                              lambda L, k=k: sgn((k + l * (l - 1) / 2)
                                                 * L[l - 1])))
            sig = {i: i for i in range(1, l + 1)}
        elif t == "C":
            top = 2 * ((l - 1) // 2) + 1
            for k in range(1, l):
                cases.append((k, f"sp_({k},{l - k})",
                              lambda L: sgn(odd_sum(L, top)), None))
            cases.append((l, f"sp_{2 * l}(R)", lambda L: 1, None))
            sig = {i: i for i in range(1, l + 1)}
        else:
            for k in range(1, l // 2 + 1):
                if l % 2 == 0:
                    P = l // 2
                    f = (lambda L, k=k, P=P: sgn((k + P) * (L[2 * P - 2]
                                                            + L[2 * P - 1])))
                else:
                    f = (lambda L: 1)
                cases.append((k, f"so_({2 * k},{2 * (l - k)})", f, None))
            top = 2 * (l // 2) - 1
            cases.append((l, f"u*_{l}(H)", lambda L: sgn(odd_sum(L, top)),
                          None))
            sig = {i: i for i in range(1, l + 1)}
            if l % 2:
                sig[l - 1], sig[l] = l, l - 1
        gens = generators_of(sig, l)
        for j, name, corrected, printed in cases:
            vals = [(L, f14(M, L, j)) for _, _, L in gens]
            R.ok(all(corrected(L) == v for L, v in vals),
                 f"{M.name} {name}: table (as corrected) = (F14) on all "
                 "generators")
            if printed is not None:
                pv = [printed(L) for L, v in vals]
                if all(p == v for p, (L, v) in zip(pv, vals)):
                    R.ok(True, f"{M.name} {name}: printed row agrees here")
                else:
                    R.refuted(False, f"{M.name} {name}: printed row")
        # the compact form: (F14) with u = 0 is the Sym^2/Lambda^2 test of
        # Table 3 (checked there); here: agrees with Lambda(b) in Z.
        Zord, gens3, outer, nuord, b = printed_table3(t, l)
        bv = hsum(M, b)
        R.ok(all((f14(M, L, 0) == 1) == (M.ip(M.weight(L), bv) in ZZ)
                 for _, _, L in gens),
             f"{M.name}: compact form, (F14) = +1 iff Lambda(b) in Z "
             "(Exercise 4.3.12 as quoted)")


def subsystem_signature(M, j):
    """Components (rank, #roots) of the fixed algebra of theta_j and the
    dimension of its center."""
    roots = [a for a in M.roots if M.coeffs(a)[j - 1] % 2 == 0]
    pos = [a for a in roots if all(c >= 0 for c in M.coeffs(a))]
    posset = set(tuple(a) for a in pos)
    simple = [a for a in pos if not any(tuple(a - b) in posset for b in pos)]
    r = len(simple)
    adj = {i: [k for k in range(r) if k != i and M.ip(simple[i], simple[k]) != 0]
           for i in range(r)}
    seen, comps = set(), []
    for i in range(r):
        if i in seen:
            continue
        stack, comp = [i], []
        seen.add(i)
        while stack:
            x = stack.pop()
            comp.append(x)
            for y in adj[x]:
                if y not in seen:
                    seen.add(y)
                    stack.append(y)
        span = matrix(QQ, [simple[x] for x in comp]).row_space()
        nroots = sum(1 for a in roots if a in span)
        comps.append((len(comp), nroots))
    return sorted(comps), M.l - r


EXCEPTIONAL_FORMS = {
    # name: (type, k components (rank, #roots), center dim, printed index)
    ("E", 6): {"EII": ([(1, 2), (5, 30)], 0), "EIII": ([(5, 40)], 1)},
    ("E", 7): {"EV": ([(7, 56)], 0), "EVI": ([(1, 2), (6, 60)], 0),
               "EVII": ([(6, 72)], 1)},
    ("E", 8): {"EVIII": ([(8, 112)], 0), "EIX": ([(1, 2), (7, 126)], 0)},
    ("F", 4): {"FI": ([(1, 2), (3, 18)], 0), "FII": ([(4, 32)], 0)},
    ("G", 2): {"G": ([(1, 2), (1, 2)], 0)},
}


def section13_exceptional_f14():
    R.section("1.3: exceptional inner forms, (F14)")
    for (t, l), forms in EXCEPTIONAL_FORMS.items():
        M = MODELS[(t, l)]
        nu = nu_book(t, l)
        gens = generators_of(nu, l)
        found = {}
        for j in range(1, l + 1):
            sig = subsystem_signature(M, j)
            for nm, want in forms.items():
                if sig == (sorted(want[0]), want[1]):
                    found.setdefault(nm, []).append(j)
        R.ok(set(found) == set(forms),
             f"{M.name}: every inner noncompact form is theta_j for some j: "
             f"{found}")
        for nm, js in found.items():
            for j in js:
                vals = [f14(M, L, j) for _, _, L in gens]
                if nm == "EVI":
                    want = [sgn(L[0] + L[2] + L[6]) for _, _, L in gens]
                else:
                    want = [1] * len(gens)
                R.ok(vals == want, f"{M.name} {nm} (vertex {j}): (F14) = "
                     f"{'(-1)^(L1+L3+L7)' if nm == 'EVI' else '1'} on all "
                     "self-conjugate generators")
# -- exceptional forms by GAP modules (independent of (F14)) ----------------
# For the Chevalley Q-form: sigma_0 = conjugation of coefficients; omega the
# Chevalley involution (e_i -> -f_i, f_i -> -e_i); theta = gamma o
# exp(pi i ad pi_S^v) on the generators: e_i -> c_i e_(gamma i),
# f_i -> c_i f_(gamma i), c_i = -1 for i in S.  sigma = sigma_0 omega theta
# is the conjugation of a real form with Cartan involution theta
# (tau_c = sigma_0 omega is the compact one and commutes with theta).  On a
# rational module, J = T o conj commutes with rho(g_sigma) iff
#     T rho(e_i) = -c_i rho(f_(gamma i)) T,  T rho(f_i) = -c_i rho(e_(gamma i)) T,
# and J^2 = T^2.  T maps the weight lambda to -gamma(lambda).

def gap_intertwiners(modA, modB, c, gamma):
    eA, fA, hA = modA
    eB, fB, hB = modB
    l = len(eA)
    wA = [tuple(hA[i][k, k] for i in range(l)) for k in range(eA[0].nrows())]
    wB = [tuple(hB[i][k, k] for i in range(l)) for k in range(eB[0].nrows())]
    ginv = {gamma[i]: i for i in range(l)}
    target = lambda w: tuple(-w[ginv[j]] for j in range(l))
    allowed = [(a, b) for b in range(len(wA)) for a in range(len(wB))
               if wB[a] == target(wA[b])]
    var = {ab: i for i, ab in enumerate(allowed)}
    rows = []
    for i in range(l):
        for XA, XB in ((eA[i], fB[gamma[i]]), (fA[i], eB[gamma[i]])):
            # T XA + c_i XB T = 0
            eq = {}
            for (a, b), v in var.items():
                for cc in XA.nonzero_positions_in_row(b):
                    key = (a, cc)
                    eq.setdefault(key, {})
                    eq[key][v] = eq[key].get(v, 0) + XA[b, cc]
                for a2 in XB.nonzero_positions_in_column(a):
                    key = (a2, b)
                    eq.setdefault(key, {})
                    eq[key][v] = eq[key].get(v, 0) + c[i] * XB[a2, a]
            rows += [r for r in eq.values() if any(x != 0 for x in r.values())]
    ent = {(ri, j): v for ri, r in enumerate(rows) for j, v in r.items()
           if v != 0}
    K = matrix(QQ, len(rows), len(allowed), ent, sparse=True).right_kernel_matrix()
    return [({allowed[j]: x for j, x in enumerate(v) if x != 0}) for v in K.rows()]


def gap_index(mod, c, gamma):
    sols = gap_intertwiners(mod, mod, c, gamma)
    assert len(sols) <= 1
    if not sols:
        return None
    T = sols[0]
    TT = spmul(T, T)
    N = mod[0][0].nrows()
    c0 = TT[(0, 0)]
    assert TT == {(a, a): c0 for a in range(N)}
    return 1 if c0 > 0 else -1


def fixed_dim(Bs, gens, imgs, dim):
    """dim of the fixed space of the automorphism theta given on Lie algebra
    generators: theta is extended to iterated brackets (theta[u, v] =
    [theta u, theta v]); the two coordinate matrices must describe a linear
    map (checked: equal rows give equal images)."""
    coords = lambda u: vector(QQ, list(libgap.Coefficients(Bs, u)))
    pairs = list(zip(gens, imgs))
    A = matrix(QQ, [coords(u) for u, _ in pairs])
    span = A.row_space()
    frontier = list(pairs)
    while span.dimension() < dim:
        new = []
        for u, tu in frontier:
            for g, tg in zip(gens, imgs):
                w = g * u
                cw = coords(w)
                if cw != 0 and cw not in span:
                    span = span + matrix(QQ, [cw]).row_space()
                    new.append((w, tg * tu))
        pairs += new
        frontier = new
        assert new, "generation failed"
    Am = matrix(QQ, [coords(u) for u, _ in pairs])
    Bm = matrix(QQ, [coords(tu) for _, tu in pairs])
    idx = Am.pivot_rows()
    A0 = Am.matrix_from_rows(idx)
    B0 = Bm.matrix_from_rows(idx)
    M = A0.inverse() * B0      # coords(theta v) = coords(v) M
    assert Am * M == Bm, "theta well defined on all generated elements"
    assert M * M == identity_matrix(QQ, dim), "theta is an involution"
    return (M - 1).kernel().dimension()


def gap_perm(t, l):
    """GAP index -> Sage (Bourbaki) index, by the Cartan matrices."""
    Cs = CartanType([t, l]).cartan_matrix()
    Cg = gap_cartan(t, l)
    return next(p for p in permutations(range(l))
                if all(Cg[i, j] == Cs[p[i], p[j]]
                       for i in range(l) for j in range(l)))


def section13_gap():
    R.section("1.3: exceptional forms, explicit (GAP modules)")
    # (type, book labels of the module, real forms: name -> book vertex set
    #  S for theta, outer or not, expected epsilon per the table)
    plan = [
        ("E", 7, [1, 0, 0, 0, 0, 0, 0], "56"),
        ("E", 7, [0, 0, 0, 0, 0, 1, 0], "133"),
        ("E", 6, [1, 0, 0, 0, 0, 0], "27"),
        ("F", 4, [1, 0, 0, 0], "26"),
        ("G", 2, [1, 0], "7"),
    ]
    for t, l, book_lab, dimname in plan:
        M = MODELS[(t, l)]
        perm = gap_perm(t, l)                     # gap i -> sage perm[i]
        b2s = to_bourbaki(t, l)                   # book i -> sage b2s[i]
        s2g = {perm[i] + 1: i for i in range(l)}  # sage -> gap (0-based)
        book2gap = {i: s2g[b2s[i]] for i in range(1, l + 1)}
        gap_lab = [0] * l
        for i, v in enumerate(book_lab, start=1):
            gap_lab[book2gap[i]] = v
        mod = gap_module(t, l, gap_lab)
        R.ok(mod[0][0].nrows() == int(dimname) == weyl_dim(M, book_lab),
             f"{M.name}: GAP module of dimension {dimname}")
        ident = list(range(l))
        # the compact form
        e0 = gap_index(mod, [1] * l, ident)
        nu = nu_book(t, l)
        selfdual = all(nu[i] == i or book_lab[i - 1] == book_lab[nu[i] - 1]
                       for i in range(1, l + 1))
        R.ok((e0 is not None) == selfdual,
             f"{M.name} compact, R({dimname}): (F13) self-conjugate iff "
             "self-dual")
        if e0 is not None:
            R.ok(e0 == f14(M, book_lab, 0), f"{M.name} compact, R({dimname}): "
                 f"index {e0} = (F14) with u = 0")
        # inner noncompact forms: vertex j of each type of k
        for nm, (comps, cdim) in EXCEPTIONAL_FORMS[(t, l)].items():
            js = [j for j in range(1, l + 1)
                  if subsystem_signature(M, j) == (sorted(comps), cdim)]
            for j in js:
                c = [1] * l
                c[book2gap[j]] = -1
                e = gap_index(mod, c, ident)
                R.ok((e is not None) == selfdual,
                     f"{M.name} {nm} (vertex {j}), R({dimname}): (F13)")
                if e is None:
                    continue
                want = (sgn(book_lab[0] + book_lab[2] + book_lab[6])
                        if nm == "EVI" else 1)
                R.ok(e == want, f"{M.name} {nm} (vertex {j}), R({dimname}): "
                     f"index {e} as in the table")
                R.ok(e == f14(M, book_lab, j),
                     f"{M.name} {nm} (vertex {j}), R({dimname}): = (F14)")
        if (t, l) == ("E", 6):
            # outer forms: theta = gamma o signs, gamma the diagram symmetry
            gamma_book = {1: 5, 2: 4, 3: 3, 4: 2, 5: 1, 6: 6}
            gamma = [0] * l
            for i in range(1, l + 1):
                gamma[book2gap[i]] = book2gap[gamma_book[i]]
            L = libgap.SimpleLieAlgebra("E", 6, libgap.Rationals)
            x, y, h = libgap.CanonicalGenerators(libgap.RootSystem(L))
            Bs = libgap.Basis(L)
            found = {}
            stable = [S for r in range(0, 7) for S in combinations(range(1, 7), r)
                      if set(gamma_book[i] for i in S) == set(S)]
            for S in stable:
                c = [1] * l
                for i in S:
                    c[book2gap[i]] = -1
                imgs = ([c[i] * x[gamma[i]] for i in range(l)]
                        + [c[i] * y[gamma[i]] for i in range(l)])
                dimk = fixed_dim(Bs, list(x) + list(y), imgs, 78)
                found.setdefault(dimk, []).append((S, c))
            R.ok(52 in found and 36 in found,
                 "E6: outer involutions with k = F4 (dim 52, EIV) and k = C4 "
                 "(dim 36, EI) found")
            for dimk, nm in ((52, "EIV"), (36, "EI")):
                for S, c in found[dimk]:
                    e = gap_index(mod, c, gamma)
                    R.ok(e == 1, f"E6 {nm} (theta = gamma, signs at {S}), "
                                 f"R(27): self-conjugate with index +1")
        # (F12) for E6: conj R(pi_1) = R(pi_5) for the inner forms
        if (t, l) == ("E", 6):
            dual_lab = [0] * l
            dual_lab[book2gap[5]] = 1
            modD = gap_module(t, l, dual_lab)
            for c in [[1] * l] + [
                    [(-1 if book2gap[j] == i else 1) for i in range(l)]
                    for j in (1, 6)]:
                R.ok(len(gap_intertwiners(mod, modD, c, ident)) == 1,
                     "E6 compact/EIII/EII: (F12) conj R(pi_1) = R(pi_5)")


def section13_other():
    """g_0^R and the direct-sum rule of the last two paragraphs of 1.3."""
    R.section("1.3: complex simple algebras as real ones; direct sums")
    # sl_2(C) as a real Lie algebra acting on V(a) (x) conj V(b)
    E2 = E(2, 0, 1)
    F2 = E(2, 1, 0)
    Hc = E(2, 0, 0) - E(2, 1, 1)
    basis = [Hc, E2, F2, I * Hc, I * E2, I * F2]
    H = (1 + 2 * I) * Hc
    gens = [E2 + 3 * F2 + I * Hc, I * E2 - F2]
    assert lie_closure_dim([H] + gens) == 6

    def sym_power(X, a):
        # action on homogeneous polynomials of degree a in x, y
        # basis x^(a-k) y^k; X acts by the derivation of (x, y) -> X (x, y)
        N = a + 1
        out = {}
        for k in range(N):
            # d/dt (x + t X x)^(a-k) (y + t X y)^k at t = 0 with
            # X x = X[0,0] x + X[1,0] y, X y = X[0,1] x + X[1,1] y
            for (coef, dk) in (((a - k) * X[0, 0], 0), ((a - k) * X[1, 0], 1),
                               (k * X[0, 1], -1), (k * X[1, 1], 0)):
                if coef != 0 and 0 <= k + dk <= a:
                    key = (k + dk, k)
                    out[key] = out.get(key, 0) + coef
        return {kk: v for kk, v in out.items() if v != 0}

    def tensor(A, B, NA, NB):
        out = {}
        for (a, b), v in A.items():
            for j in range(NB):
                out[(a * NB + j, b * NB + j)] = out.get((a * NB + j, b * NB + j),
                                                        0) + v
        for (a, b), v in B.items():
            for i in range(NA):
                out[(i * NB + a, i * NB + b)] = out.get((i * NB + a, i * NB + b),
                                                        0) + v
        return {k: v for k, v in out.items() if v != 0}

    def cj(A):
        return {k: conj(v) for k, v in A.items()}

    reps = {}
    for a in range(3):
        for b in range(3):
            NA, NB = a + 1, b + 1
            g = [tensor(sym_power(X, a), cj(sym_power(X, b)), NA, NB)
                 for X in gens]
            dH = tensor(sym_power(H, a), cj(sym_power(H, b)), NA, NB)
            assert all(i == j for i, j in dH)
            diag = [dH.get((i, i), KI(0)) for i in range(NA * NB)]
            reps[(a, b)] = Rep(f"V({a}) x conj V({b})", g, diag)
    for (a, b), r in reps.items():
        e = index_of(r)
        R.ok((e is not None) == (a == b),
             f"sl_2(C)^R, V({a}) x conj V({b}): self-conjugate iff "
             "Lambda_1 = Lambda^1")
        if e is not None:
            R.ok(e == 1, f"sl_2(C)^R, V({a}) x conj V({a}): index 1")
    # direct sums: su(2) + su(2), su(2) + sl_2(R) on C^2 (x) C^2
    su2 = [I * Hc, E2 - F2, I * (E2 + F2)]
    sl2R = [Hc, E2, F2]
    for name, g2, want in (("su(2)+su(2)", su2, 1), ("su(2)+sl_2(R)", sl2R, -1)):
        H1, H2 = I * Hc, (g2[0] if name.endswith("sl_2(R)") else I * Hc)
        Hs = (3 * H1, 5 * H2)
        g1gens = [su2[1] + su2[2], su2[1]]
        g2gens = [g2[1] + g2[2], g2[1]]
        z = zero_matrix(KI, 2)
        gens_ = [(g1gens[0], z), (z, g2gens[0]), (g1gens[1], z), (z, g2gens[1])]
        bd = [block_matrix(KI, [[X, z], [z, Y]], subdivide=False)
              for X, Y in gens_]
        Hb = block_matrix(KI, [[Hs[0], z], [z, Hs[1]]], subdivide=False)
        assert lie_closure_dim([Hb] + bd) == 6
        g = [tensor({k: v for k, v in zip(X.nonzero_positions(),
                                           [X[p] for p in X.nonzero_positions()])},
                    {k: v for k, v in zip(Y.nonzero_positions(),
                                           [Y[p] for p in Y.nonzero_positions()])},
                    2, 2) for X, Y in gens_]
        dH = tensor({(i, i): Hs[0][i, i] for i in range(2)},
                    {(i, i): Hs[1][i, i] for i in range(2)}, 2, 2)
        diag = [dH.get((i, i), KI(0)) for i in range(4)]
        e = index_of(Rep(name, g, diag))
        R.ok(e == want, f"{name} on C^2 (x) C^2: index {want} = product of "
                        "the indices of the factors")


# ---------------------------------------------------------------------------
# main
# ---------------------------------------------------------------------------
def main():
    from datetime import datetime, timezone
    start = time.time()
    table1()
    table2()
    section11()
    section12()
    section12_f11()
    table3()
    table8()
    section13_classical()
    section13_f14_ranks()
    section13_exceptional_f14()
    section13_gap()
    section13_other()
    print("refuted printed readings (kept as checks):")
    for r in R.refutations:
        print("  " + r)
    print("checks per section:")
    for s, n in R.sections.items():
        print(f"  {n:5d}  {s}")
    print(f"Sage {SAGE_VERSION}, "
          f"{datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M UTC')}, "
          f"{time.time() - start:.0f} s")
    print(f"ok {SCOPE}: {R.n} checks")


if __name__ == "__main__":
    main()
