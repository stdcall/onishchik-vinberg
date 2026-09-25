"""Table 5: decomposition of tensor products and dimensions.

Onishchik and Vinberg, *Lie Groups and Algebraic Groups* (Springer, 1990),
Reference Chapter, § 2, Table 5 "Decomposition of Tensor Products and
Dimensions of Certain Representations": printed pp. 299-305.  Our text:
content/73-table-5.typ.

What is checked
---------------
1. The notation (p. 299): n = dim R(pi_1) for A_l, B_l, C_l, D_l; the set
   Delta(p, q), and Fig. 2 read as the picture of Delta(p, 2); Ad = R(delta)
   and "R = R(pi_1), Ad = R(pi_k)" of the exceptional blocks, with the
   adjoint character built from the roots.
2. Every formula line of every block, the tensor product and the exterior
   or symmetric square beside it, for every parameter value in the ranges
   below: Sage computes the left-hand side, the right-hand side is the
   printed one.
3. Every entry of the dimension lists: the printed formula against Sage's
   degree for every parameter value in the ranges below, and the printed
   numbers of E_6, E_7, E_8, F_4, G_2.
4. For the exceptional types: the numbering of the book (Table 1) against
   Bourbaki's, which Sage uses, and the claim of p. 299 that the dimension
   of every irreducible representation occurring in the formulas is listed
   (up to duality: E_6 lists pi_1, pi_2, not their duals pi_5, pi_4).

Where the expected values come from
-----------------------------------
From the printed book, not from our Typst source.  Each printed right-hand
side is transcribed below as a Python function of the parameters
(classical types) or as a literal (exceptional types), under a comment with
the printed page and the number of the line; the printed dimensions are
formulas or literal numbers.  The conventions of the table are implemented
once, in `Group.R`: a meaningless symbol (an index outside the range of the
notation, or a weight that is not dominant, e.g. R(-pi_1 + pi_2)) is zero
(p. 299); pi_0 = pi_n = 0 for A_l (p. 300) and pi_0 = 0 for C_l (p. 302) in
right-hand sides; the notation hat(pi)_p of B_l (p. 301) and D_l (p. 302),
with R(hat(pi)_l + L) = R(2 pi_(l-1) + L) + R(2 pi_l + L) and
R(2 hat(pi)_l) = R(4 pi_(l-1)) + R(4 pi_l) for D_l.  Sums "i >= 0" run over
all i: the terms become meaningless, hence zero, for large i.

Sage (WeylCharacterRing, style "coroots") computes the left-hand sides:
tensor products, exterior powers, symmetric powers, degrees (Weyl's
dimension formula).  Its numbering of simple roots is Bourbaki's, which is
the book's for A_l, B_l, C_l, D_l (Table 1, printed p. 293: alpha_l =
eps_l, 2 eps_l, eps_(l-1) + eps_l).  For the exceptional types the book
numbers the chain of the diagram from one end (Table 1, printed
pp. 293-294); BOOK_TO_BOURBAKI below is checked against the printed diagrams.
For E_6 the printed diagram fixes the numbering up to the symmetry of the
diagram, which exchanges R and R*; the E_6 block is checked with both.

Findings: printed readings refuted, kept beside the corrections
----------------------------------------------------------------
F1  D_l 3a (p. 303): the second sum runs over Delta(l, q), but q does
    not occur in the formula.  For every p, of q = 0..l only q = p gives
    the identity: Delta(l, p).
F2  D_l 4a (p. 303): the last term R((p - 2) pi_1 + 2 pi_l) is refuted for
    every p >= 2; R((p - 2) pi_1 + 2 pi_(l-1)) holds.
F3  D_l 6 (p. 303), printed for p <= l: at p = l both sums contain
    R(2 pi_(l-1) + pi_l), and the right-hand side exceeds the product by
    exactly one copy of it.  Holds for p <= l - 1 (the product
    R(hat(pi)_l) R(pi_l) contains R(2 pi_l) R(pi_l), which is formula 6a).
F4  D_l, dimension of hat(pi)_p + pi_l (p. 304), printed for p <= l:
    at p = l the formula gives dim R(3 pi_l), not dim R(hat(pi)_l + pi_l) =
    dim R(2 pi_(l-1) + pi_l) + dim R(3 pi_l).  Holds for p <= l - 1.
F5  C_l 4 (p. 302), printed without a range of q: at q = 1 the second
    and the third term are both R((p - 1) pi_1), and the right-hand side
    exceeds the product by exactly one copy of it (q = 1 is formula 5).
    Holds for 2 <= q <= l.
F6  B_l 5 with its S^2 (p. 301), taken over by D_l ("Formulas 1-5 are
    the same as for B_l"), and the dimension row (p - q) pi_1 + q pi_2 of
    B_l and D_l (pp. 301, 303): with pi_2 they fail for B_2 and D_3, where
    pi_2 != hat(pi)_2; with hat(pi)_2 they hold for every rank checked
    (pi_2 = hat(pi)_2 for B_l, l >= 3, and D_l, l >= 4).  With hat(pi)_2,
    formula 5 at p = q = 1 agrees with formula 1: R^2 = S^2 R + wedge^2 R and
    wedge^2 R = R(hat(pi)_2).
Every refuted reading is also refuted, and every correction confirmed, a
second way for the smallest ranks: by the formal characters (weights with
multiplicities), the product computed as a convolution of the weights of
the factors, independently of Sage's multiplication of characters.

Ranks and parameters covered
----------------------------
A_1; A_l, l = 2..8; B_l, l = 2..8; C_l, l = 2..8; D_l, l = 3..8; E_6,
E_7, E_8, F_4, G_2.  Indices of fundamental weights run over their whole
range (0 <= p <= n for exterior powers, q <= p <= l in formula 3 and so on);
multiples p, q of pi_1 run up to P_MAX = 4 in the formulas (A_1: 8) and up
to DIM_P_MAX = 6 in the dimension rows.  The symmetric squares (the S^2
lines of the classical blocks) are checked up to rank SYM2_MAX_RANK = 7
only; in rank 8 only the tensor products, the exterior and the symmetric
powers of R and the dimensions (S^2 there takes Sage minutes).  The findings
are checked for every rank and parameter above where they apply; the second
method, by formal characters, only for B_2, C_2, C_3, D_3, D_4.

What this does NOT establish
----------------------------
* The formulas for other ranks and larger parameters: a finite check is not
  a proof of the general statements.
* That our typeset text matches the printed book.
* The claim of p. 299 that every irreducible representation occurring in the
  formulas has its dimension listed, for the classical types (the rows are
  families; checked for the exceptional types only).

Run with:  sage -python checks/sage/table-5.py   (SageMath 10.9)
"""
from collections import Counter
from itertools import permutations

from sage.all import QQ, WeylCharacterRing, binomial

RANKS = {
    "A": range(2, 9),
    "B": range(2, 9),
    "C": range(2, 9),
    "D": range(3, 9),
}
P_MAX = 4
DIM_P_MAX = 6
SYM2_MAX_RANK = 7
EVERY_I = range(40)  # "i >= 0": larger i give meaningless symbols here

COUNT = [0]


def holds(label, computed, printed):
    """The printed right-hand side equals the computed left-hand side."""
    assert computed == printed, (
        f"{label}:\n  computed: {computed}\n  printed:  {printed}")
    COUNT[0] += 1


def refuted(label, computed, printed):
    """A printed reading refuted by the computation (kept beside its
    correction)."""
    assert computed != printed, f"{label}: the printed reading holds"
    COUNT[0] += 1


def C(a, b):
    return binomial(a, b)


def Delta(p, q):
    """Delta(p, q), p >= q >= 0 (p. 299): (x, y) in Z_+^2 with
    x + y <= p + q, x - y >= p - q, x - y = p - q (mod 2)."""
    assert p >= q >= 0
    return [(x, y) for x in range(p + q + 1) for y in range(p + q + 1)
            if x + y <= p + q and x - y >= p - q
            and (x - y - (p - q)) % 2 == 0]


class HatL:
    """hat(pi)_l of D_l: R(hat(pi)_l + L) = R(2 pi_(l-1) + L) +
    R(2 pi_l + L), R(2 hat(pi)_l) = R(4 pi_(l-1)) + R(4 pi_l) (p. 302)."""

    def __repr__(self):
        return "hat(pi)_l"


HAT_L = HatL()


class Group:
    """A simple group of type `family` and rank l, with the conventions of
    Table 5 for the right-hand sides of its formulas."""

    def __init__(self, family, l):
        self.family, self.l = family, l
        self.ring = WeylCharacterRing([family, l], style="coroots")
        self.space = self.ring.space()
        self.w = self.ring.fundamental_weights()
        self.zero = self.space.zero()
        self.one = self.ring(self.zero)
        self.n = {"A": l + 1, "B": 2 * l + 1, "C": 2 * l, "D": 2 * l,
                  "E": None, "F": None, "G": None}[family]
        self.name = f"{family}_{l}"

    def pi(self, i):
        """pi_i; pi_0 = 0; None (meaningless) outside 0..l."""
        if i < 0 or i > self.l:
            return None
        return self.zero if i == 0 else self.w[i]

    def dominant(self, weight):
        return all(weight.scalar(c) >= 0
                   for c in self.space.simple_coroots())

    def irreducible(self, weight):
        if not self.dominant(weight):
            return self.ring.zero()  # a meaningless symbol
        return self.ring(weight)

    def R(self, *parts):
        """R(parts[0] + parts[1] + ...), with the conventions of the
        table (see the docstring of the module)."""
        if any(part is None for part in parts):
            return self.ring.zero()
        hats = sum(1 for part in parts if part is HAT_L)
        base = sum((part for part in parts if part is not HAT_L), self.zero)
        if hats == 0:
            return self.irreducible(base)
        l, w = self.l, self.w
        if hats == 1:
            return (self.irreducible(base + 2 * w[l - 1])
                    + self.irreducible(base + 2 * w[l]))
        assert hats == 2 and base == self.zero, "not defined by the table"
        return self.irreducible(4 * w[l - 1]) + self.irreducible(4 * w[l])

    def sum(self, terms):
        return sum(terms, self.ring.zero())

    def dual(self, chi):
        """chi*: the character with the weights negated."""
        return self.ring.char_from_weights(
            {-weight: m for weight, m in chi.weight_multiplicities().items()})

    def adjoint(self):
        """Ad, built from the roots: the roots and l times the zero
        weight."""
        weights = {root: 1 for root in self.space.roots()}
        weights[self.zero] = self.l
        return self.ring.char_from_weights(weights)


class GroupA(Group):
    def pi(self, i):
        """pi_i with pi_0 = pi_n = 0 (A_l, p. 300)."""
        if i < 0 or i > self.n:
            return None
        return self.zero if i in (0, self.n) else self.w[i]


class Orthogonal(Group):
    """B_l or D_l with the notation hat(pi)_p."""

    def hat(self, p):
        l, n, w = self.l, self.n, self.w
        if p < 0 or p > n:
            return None
        if p in (0, n):
            return self.zero
        if self.family == "B":  # p. 301
            if p <= l - 1:
                return w[p]
            if p in (l, l + 1):
                return 2 * w[l]
            return w[n - p]
        if p <= l - 2:  # D_l, p. 302
            return w[p]
        if p in (l - 1, l + 1):
            return w[l - 1] + w[l]
        if p == l:
            return HAT_L
        return w[n - p]


def sym2(chi):
    """S^2 chi = (chi^2 + psi^2 chi)/2, psi^2 the Adams operation; Sage's
    own symmetric_square is several times slower for large chi (checked
    equal to it in `check_sym2_route`)."""
    doubled = chi * chi + chi.adams_operation(2)
    halves = {}
    for weight, c in doubled.monomial_coefficients().items():
        assert c % 2 == 0
        halves[weight] = c // 2
    return chi.parent().sum_of_terms(halves.items())


def holds_sym2(label, chi, printed):
    """S^2 chi against the printed right-hand side, in rank at most
    SYM2_MAX_RANK: in rank 8 the constituents of psi^2 chi are large and
    Sage needs up to a minute for each of their weights."""
    if chi.parent().cartan_type().rank() <= SYM2_MAX_RANK:
        holds(label, sym2(chi), printed)


# --- second method for the findings: formal characters ------------------

def weights(chi):
    return Counter(chi.weight_multiplicities())


def weights_of_product(a, b):
    out = Counter()
    for u, m in a.weight_multiplicities().items():
        for v, k in b.weight_multiplicities().items():
            out[u + v] += m * k
    return out


def weights_of_sym2(a):
    doubled = weights_of_product(a, a)
    for u, m in a.weight_multiplicities().items():
        doubled[2 * u] += m
    assert all(c % 2 == 0 for c in doubled.values())
    return Counter({u: c // 2 for u, c in doubled.items()})


def by_weights(label, product_weights, printed, corrected):
    """F1-F6 again, by formal characters: the printed reading differs from
    the product, the corrected one equals it."""
    assert product_weights != weights(printed), f"{label}: printed holds"
    assert product_weights == weights(corrected), f"{label}: correction"
    COUNT[0] += 2


# =========================================================================
# Notation, p. 299
# =========================================================================

def check_notation():
    # Fig. 2, read as Delta(p, 2): the points (p-2, 0), (p, 0), (p+2, 0),
    # (p-1, 1), (p+1, 1), (p, 2).
    for p in range(2, 9):
        figure = {(p - 2, 0), (p, 0), (p + 2, 0), (p - 1, 1), (p + 1, 1),
                  (p, 2)}
        holds(f"Fig. 2, Delta({p}, 2)", set(Delta(p, 2)), figure)
    # n = dim R = l + 1, 2l + 1, 2l, 2l.
    printed_n = {"A": lambda l: l + 1, "B": lambda l: 2 * l + 1,
                 "C": lambda l: 2 * l, "D": lambda l: 2 * l}
    for family, ranks in RANKS.items():
        for l in ranks:
            G = Group(family, l)
            holds(f"{G.name}: n = dim R", G.R(G.w[1]).degree(),
                  printed_n[family](l))


def check_sym2_route():
    """The Adams route of `sym2` against Sage's symmetric_square."""
    for family, l in (("A", 3), ("B", 3), ("C", 3), ("D", 4), ("G", 2)):
        G = Group(family, l)
        for i in range(1, l + 1):
            chi = G.R(G.w[i])
            holds(f"{G.name}: sym2 route, pi_{i}", sym2(chi),
                  chi.symmetric_square())


# =========================================================================
# A_1, printed p. 300
# =========================================================================

def check_A1():
    G = Group("A", 1)
    R, w1 = G.R(G.w[1]), G.w[1]
    for p in range(0, 9):
        # 1. S^p R = R(p pi_1).
        holds(f"A_1 formula 1, p={p}", R.symmetric_power(p), G.R(p * w1))
        # 2. R(p pi_1) R(q pi_1) = sum_(0 <= i <= q) R((p + q - 2i) pi_1),
        #    p >= q.
        for q in range(0, p + 1):
            holds(f"A_1 formula 2, p={p}, q={q}",
                  G.R(p * w1) * G.R(q * w1),
                  G.sum(G.R((p + q - 2 * i) * w1) for i in range(q + 1)))
        #    S^2 R(p pi_1) = sum_(i >= 0) R((2p - 4i) pi_1).
        holds_sym2(f"A_1 formula 2, S^2, p={p}", G.R(p * w1),
                   G.sum(G.R((2 * p - 4 * i) * w1) for i in EVERY_I))
    for p in range(0, 11):
        # dim R(p pi_1) = p + 1.
        holds(f"A_1 dim p pi_1, p={p}", G.R(p * w1).degree(), p + 1)


# =========================================================================
# A_l, l >= 2 (n = l + 1), printed p. 300;
# pi_0 = pi_n = 0 in the right-hand sides.
# =========================================================================

def A_3(G, p, q):
    """3. R(pi_p) R(pi_q) = sum_(i >= 0) R(pi_(p+i) + pi_(q-i)), p >= q."""
    return G.sum(G.R(G.pi(p + i), G.pi(q - i)) for i in EVERY_I)


def A_3_sym2(G, p):
    """S^2 R(pi_p) = sum_(i >= 0) R(pi_(p+2i) + pi_(p-2i))."""
    return G.sum(G.R(G.pi(p + 2 * i), G.pi(p - 2 * i)) for i in EVERY_I)


def A_4(G, p, q):
    """4. R(p pi_1) R(pi_q) = R(p pi_1 + pi_q) + R((p-1) pi_1 + pi_(q+1))."""
    w1 = G.w[1]
    return G.R(p * w1, G.pi(q)) + G.R((p - 1) * w1, G.pi(q + 1))


def A_5(G, p, q):
    """5. R(p pi_1) R(q pi_1)
    = sum_(0 <= i <= q) R((p + q - 2i) pi_1 + i pi_2), p >= q."""
    w1, w2 = G.w[1], G.w[2]
    return G.sum(G.R((p + q - 2 * i) * w1, i * w2) for i in range(q + 1))


def A_5_sym2(G, p):
    """S^2 R(p pi_1) = sum_(i >= 0) R((2p - 4i) pi_1 + 2i pi_2)."""
    w1, w2 = G.w[1], G.w[2]
    return G.sum(G.R((2 * p - 4 * i) * w1, 2 * i * w2) for i in EVERY_I)


def A_6(G, p):
    """6. R(p pi_1) Ad = R((p+1) pi_1 + pi_l) + R(p pi_1)
    + R((p-1) pi_1 + pi_2 + pi_l) + R((p-2) pi_1 + pi_2)."""
    w, l = G.w, G.l
    return (G.R((p + 1) * w[1], w[l]) + G.R(p * w[1])
            + G.R((p - 1) * w[1], w[2], w[l]) + G.R((p - 2) * w[1], w[2]))


def A_7(G, p):
    """7. R(pi_p) Ad = R(pi_1 + pi_p + pi_l) + R(pi_1 + pi_(p-1))
    + R(pi_(p+1) + pi_l) + R(pi_p), 2 <= p <= l - 1."""
    w, l = G.w, G.l
    return (G.R(w[1], G.pi(p), w[l]) + G.R(w[1], G.pi(p - 1))
            + G.R(G.pi(p + 1), w[l]) + G.R(G.pi(p)))


def A_8(G, p, q):
    """8. R(p pi_1) R(q pi_l) = sum_(i >= 0) R((p-i) pi_1 + (q-i) pi_l)."""
    w, l = G.w, G.l
    return G.sum(G.R((p - i) * w[1], (q - i) * w[l]) for i in EVERY_I)


def A_9_wedge2(G):
    """9. wedge^2 Ad = R(2 pi_1 + pi_(l-1)) + R(pi_2 + 2 pi_l) + Ad."""
    w, l = G.w, G.l
    return (G.R(2 * w[1], G.pi(l - 1)) + G.R(w[2], 2 * w[l])
            + G.R(w[1], w[l]))


def A_9_sym2(G):
    """S^2 Ad = R(2 pi_1 + 2 pi_l) + R(pi_2 + pi_(l-1)) + Ad + 1, l >= 3;
    R(2 pi_1 + 2 pi_2) + Ad + 1, l = 2."""
    w, l = G.w, G.l
    Ad = G.R(w[1], w[l])
    if l >= 3:
        return (G.R(2 * w[1], 2 * w[l]) + G.R(w[2], w[l - 1]) + Ad
                + G.one)
    return G.R(2 * w[1], 2 * w[2]) + Ad + G.one


def check_A(l):
    G = GroupA("A", l)
    t, n, w = G.name, G.n, G.w
    R = G.R(w[1])
    Ad = G.adjoint()
    holds(f"{t}: Ad = R(delta), delta = pi_1 + pi_l", Ad, G.R(w[1], w[l]))
    for p in range(0, n + 1):
        # 1. wedge^p R = R(pi_p).
        holds(f"{t} formula 1, p={p}", R.exterior_power(p), G.R(G.pi(p)))
    for p in range(1, P_MAX + 1):
        # 2. S^p R = R(p pi_1).
        holds(f"{t} formula 2, p={p}", R.symmetric_power(p), G.R(p * w[1]))
    for p in range(1, l + 1):
        for q in range(1, p + 1):
            holds(f"{t} formula 3, p={p}, q={q}",
                  G.R(G.pi(p)) * G.R(G.pi(q)), A_3(G, p, q))
        holds_sym2(f"{t} formula 3, S^2, p={p}", G.R(G.pi(p)),
                   A_3_sym2(G, p))
    for p in range(1, P_MAX + 1):
        for q in range(1, l + 1):
            holds(f"{t} formula 4, p={p}, q={q}",
                  G.R(p * w[1]) * G.R(G.pi(q)), A_4(G, p, q))
        for q in range(1, p + 1):
            holds(f"{t} formula 5, p={p}, q={q}",
                  G.R(p * w[1]) * G.R(q * w[1]), A_5(G, p, q))
        holds_sym2(f"{t} formula 5, S^2, p={p}", G.R(p * w[1]),
                   A_5_sym2(G, p))
        holds(f"{t} formula 6, p={p}", G.R(p * w[1]) * Ad, A_6(G, p))
        for q in range(1, P_MAX + 1):
            holds(f"{t} formula 8, p={p}, q={q}",
                  G.R(p * w[1]) * G.R(q * w[l]), A_8(G, p, q))
    for p in range(2, l):
        holds(f"{t} formula 7, p={p}", G.R(G.pi(p)) * Ad, A_7(G, p))
    holds(f"{t} formula 9, wedge^2", Ad.exterior_square(), A_9_wedge2(G))
    holds_sym2(f"{t} formula 9, S^2", Ad, A_9_sym2(G))

    # Dimensions (p. 300).
    for p in range(0, n + 1):
        holds(f"{t} dim pi_p, p={p}", G.R(G.pi(p)).degree(), C(n, p))
        for q in range(0, p + 1):
            holds(f"{t} dim pi_p + pi_q, p={p}, q={q}",
                  G.R(G.pi(p), G.pi(q)).degree(),
                  QQ(p - q + 1) / (p + 1) * C(n, p) * C(n + 1, q))
    for p in range(0, DIM_P_MAX + 1):
        holds(f"{t} dim p pi_1, p={p}", G.R(p * w[1]).degree(),
              C(n + p - 1, p))
        for q in range(1, l + 1):
            holds(f"{t} dim p pi_1 + pi_q, p={p}, q={q}",
                  G.R(p * w[1], w[q]).degree(),
                  QQ(q) / (p + q) * C(n + p, p) * C(n, q))
            holds(f"{t} dim p pi_1 + pi_q + pi_l, p={p}, q={q}",
                  G.R(p * w[1], w[q], w[l]).degree(),
                  QQ(n * (n - q) * q) / ((p + q) * (n + p))
                  * C(n + p + 1, p) * C(n + 1, q))
        for q in range(0, DIM_P_MAX + 1):
            holds(f"{t} dim p pi_1 + q pi_l, p={p}, q={q}",
                  G.R(p * w[1], q * w[l]).degree(),
                  QQ(n + p + q - 1) / (n - 1) * C(n + p - 2, p)
                  * C(n + q - 2, q))
            holds(f"{t} dim p pi_1 + q pi_2, p={p}, q={q}",
                  G.R(p * w[1], q * w[2]).degree(),
                  QQ(p + 1) / (p + q + 1) * C(n + p + q - 1, p + q)
                  * C(n + q - 2, q))


# =========================================================================
# B_l, l >= 2 (n = 2l + 1), printed p. 301; also formulas 1-5 of
# D_l, "the same as for B_l" (p. 302), with the hat(pi)_p of D_l.
# =========================================================================

def B_2(G, p):
    """2. S^p R = sum_(i >= 0) R((p - 2i) pi_1)."""
    return G.sum(G.R((p - 2 * i) * G.w[1]) for i in EVERY_I)


def B_3(G, p, q):
    """3. R(hat(pi)_p) R(hat(pi)_q)
    = sum_((x, y) in Delta(p, q)) R(hat(pi)_x + hat(pi)_y), q <= p <= l."""
    return G.sum(G.R(G.hat(x), G.hat(y)) for x, y in Delta(p, q))


def B_3_sym2(G, p):
    """S^2 R(hat(pi)_p) = sum_((x, y) in Delta(p, p), x = y (mod 4))
    R(hat(pi)_x + hat(pi)_y), p <= l."""
    return G.sum(G.R(G.hat(x), G.hat(y)) for x, y in Delta(p, p)
                 if (x - y) % 4 == 0)


def B_4(G, p, q):
    """4. R(p pi_1) R(hat(pi)_q) = R(p pi_1 + hat(pi)_q)
    + R((p-1) pi_1 + hat(pi)_(q-1)) + R((p-1) pi_1 + hat(pi)_(q+1))
    + R((p-2) pi_1 + hat(pi)_q), 2 <= q <= n - 2."""
    w1, hat = G.w[1], G.hat
    return (G.R(p * w1, hat(q)) + G.R((p - 1) * w1, hat(q - 1))
            + G.R((p - 1) * w1, hat(q + 1)) + G.R((p - 2) * w1, hat(q)))


def B_5(G, p, q, second):
    """5. R(p pi_1) R(q pi_1)
    = sum_((x, y) in Delta(p, q)) R((x - y) pi_1 + y pi_2);
    printed with second = pi_2, corrected (F6) to second = hat(pi)_2."""
    w1 = G.w[1]
    return G.sum(G.R((x - y) * w1, y * second) for x, y in Delta(p, q))


def B_5_sym2(G, p, second):
    """S^2 R(p pi_1) = sum_((x, y) in Delta(p, p), x = y = 0 (mod 2))
    R((x - y) pi_1 + y pi_2); pi_2 corrected as in formula 5 (F6)."""
    w1 = G.w[1]
    return G.sum(G.R((x - y) * w1, y * second) for x, y in Delta(p, p)
                 if x % 2 == 0 and y % 2 == 0)


def B_6(G, p):
    """6. R(hat(pi)_p) R(pi_l)
    = sum_(0 <= i <= p) R(hat(pi)_(p-i) + pi_l), p <= l."""
    return G.sum(G.R(G.hat(p - i), G.w[G.l]) for i in range(p + 1))


def B_7(G, p):
    """7. R(p pi_1) R(pi_l) = R(p pi_1 + pi_l) + R((p-1) pi_1 + pi_l)."""
    w, l = G.w, G.l
    return G.R(p * w[1], w[l]) + G.R((p - 1) * w[1], w[l])


def B_8(G):
    """8. R(pi_l)^2 = sum_(0 <= i <= l) R(hat(pi)_(l-i))."""
    return G.sum(G.R(G.hat(G.l - i)) for i in range(G.l + 1))


def B_8_sym2(G):
    """S^2 R(pi_l) = sum_(0 <= i <= l; i = 0, 3 (mod 4)) R(hat(pi)_(l-i))."""
    return G.sum(G.R(G.hat(G.l - i)) for i in range(G.l + 1)
                 if i % 4 in (0, 3))


def dim_p_minus_q_pi1_q_pi2(n, p, q):
    """Row (p - q) pi_1 + q pi_2 of B_l and D_l (pp. 301, 303)."""
    return (QQ((p - q + 1) * (n + 2 * p - 2) * (n + p + q - 3)
               * (n + 2 * q - 4)) / ((p + 1) * (n - 2) * (n - 3) * (n - 4))
            * C(n + p - 4, p) * C(n + q - 5, q))


def check_B_and_D_1_to_5(G):
    """Formulas 1-5 of B_l, and of D_l, and the dimension rows common to
    both."""
    t, n, l, w, hat = G.name, G.n, G.l, G.w, G.hat
    R = G.R(w[1])
    for p in range(0, n + 1):
        # 1. wedge^p R = R(hat(pi)_p).
        holds(f"{t} formula 1, p={p}", R.exterior_power(p), G.R(hat(p)))
    for p in range(1, P_MAX + 1):
        holds(f"{t} formula 2, p={p}", R.symmetric_power(p), B_2(G, p))
    for p in range(1, l + 1):
        for q in range(1, p + 1):
            holds(f"{t} formula 3, p={p}, q={q}",
                  G.R(hat(p)) * G.R(hat(q)), B_3(G, p, q))
        holds_sym2(f"{t} formula 3, S^2, p={p}", G.R(hat(p)),
                   B_3_sym2(G, p))
    for p in range(1, P_MAX + 1):
        for q in range(2, n - 1):
            holds(f"{t} formula 4, p={p}, q={q}",
                  G.R(p * w[1]) * G.R(hat(q)), B_4(G, p, q))

    # Formula 5 and its S^2 (F6): pi_2 as printed, hat(pi)_2 corrected.
    printed_pi2, corrected_pi2 = w[2], hat(2)
    same = printed_pi2 == corrected_pi2
    holds(f"{t}: pi_2 = hat(pi)_2 iff B_l, l >= 3, or D_l, l >= 4", same,
          (G.family == "B" and l >= 3) or (G.family == "D" and l >= 4))
    for p in range(1, P_MAX + 1):
        for q in range(1, p + 1):
            lhs = G.R(p * w[1]) * G.R(q * w[1])
            holds(f"{t} formula 5 with hat(pi)_2, p={p}, q={q}", lhs,
                  B_5(G, p, q, corrected_pi2))
            if not same:
                refuted(f"{t} formula 5 as printed (pi_2), p={p}, q={q}",
                        lhs, B_5(G, p, q, printed_pi2))
        holds_sym2(f"{t} formula 5, S^2 with hat(pi)_2, p={p}",
                   G.R(p * w[1]), B_5_sym2(G, p, corrected_pi2))
        if not same and p >= 2:  # p = 1: no pi_2 term, the readings agree
            refuted(f"{t} formula 5, S^2 as printed (pi_2), p={p}",
                    sym2(G.R(p * w[1])), B_5_sym2(G, p, printed_pi2))

    # Dimension rows common to B_l and D_l (pp. 301, 303).
    for p in range(0, n + 1):
        holds(f"{t} dim hat(pi)_p, p={p}", G.R(hat(p)).degree(), C(n, p))
    for p in range(0, l + 1):
        for q in range(0, p + 1):
            holds(f"{t} dim hat(pi)_p + hat(pi)_q, p={p}, q={q}",
                  G.R(hat(p), hat(q)).degree(),
                  QQ((p - q + 1) * (n - p - q + 1))
                  / ((p + 1) * (n - p + 1)) * C(n, p) * C(n + 2, q))
    for p in range(0, DIM_P_MAX + 1):
        holds(f"{t} dim p pi_1, p={p}", G.R(p * w[1]).degree(),
              QQ(n + 2 * p - 2) / (n + p - 2) * C(n + p - 2, p))
        for q in range(1, n):
            holds(f"{t} dim p pi_1 + hat(pi)_q, p={p}, q={q}",
                  G.R(p * w[1], hat(q)).degree(),
                  QQ((n + 2 * p) * q) / ((p + q) * (n + p - q))
                  * C(n + p - 1, p) * C(n - 1, q))
        for q in range(0, p + 1):
            printed = dim_p_minus_q_pi1_q_pi2(n, p, q)
            holds(f"{t} dim (p-q) pi_1 + q hat(pi)_2, p={p}, q={q}",
                  G.R((p - q) * w[1], q * corrected_pi2).degree(), printed)
            if not same and q >= 1:
                refuted(f"{t} dim (p-q) pi_1 + q pi_2 as printed, "
                        f"p={p}, q={q}",
                        G.R((p - q) * w[1], q * printed_pi2).degree(),
                        printed)


def check_B(l):
    G = Orthogonal("B", l)
    t, n, w = G.name, G.n, G.w
    check_B_and_D_1_to_5(G)
    spin = G.R(w[l])
    for p in range(1, l + 1):
        holds(f"{t} formula 6, p={p}", G.R(G.hat(p)) * spin, B_6(G, p))
    for p in range(1, P_MAX + 1):
        holds(f"{t} formula 7, p={p}", G.R(p * w[1]) * spin, B_7(G, p))
    holds(f"{t} formula 8", spin * spin, B_8(G))
    holds_sym2(f"{t} formula 8, S^2", spin, B_8_sym2(G))
    # Dimension rows of B_l only (p. 301).
    holds(f"{t} dim pi_l", spin.degree(), 2 ** l)
    for p in range(0, l + 1):
        holds(f"{t} dim hat(pi)_p + pi_l, p={p}",
              G.R(G.hat(p), w[l]).degree(),
              2 ** l * QQ(n - 2 * p + 1) / (n - p + 1) * C(n, p))
    for p in range(0, DIM_P_MAX + 1):
        holds(f"{t} dim p pi_1 + pi_l, p={p}", G.R(p * w[1], w[l]).degree(),
              2 ** l * C(n + p - 2, p))


# =========================================================================
# C_l, l >= 2 (n = 2l), printed p. 302; pi_0 = 0 in the right-hand
# sides.
# =========================================================================

def C_1(G, p):
    """1. wedge^p R = sum_(i >= 0) R(pi_(p-2i)), p <= l."""
    return G.sum(G.R(G.pi(p - 2 * i)) for i in EVERY_I)


def C_3(G, p, q):
    """3. R(pi_p) R(pi_q)
    = sum_((x, y) in Delta(p, q), x - y <= n - p - q) R(pi_x + pi_y),
    p >= q."""
    return G.sum(G.R(G.pi(x), G.pi(y)) for x, y in Delta(p, q)
                 if x - y <= G.n - p - q)


def C_3_sym2(G, p):
    """S^2 R(pi_p) = sum_((x, y) in Delta(p, p), x - y <= n - 2p,
    x = y = p (mod 2)) R(pi_x + pi_y)."""
    return G.sum(G.R(G.pi(x), G.pi(y)) for x, y in Delta(p, p)
                 if x - y <= G.n - 2 * p and (x - p) % 2 == 0
                 and (y - p) % 2 == 0)


def C_4(G, p, q):
    """4. R(p pi_1) R(pi_q) = R(p pi_1 + pi_q) + R((p-1) pi_1 + pi_(q+1))
    + R((p-1) pi_1 + pi_(q-1)) + R((p-2) pi_1 + pi_q); printed without a
    range of q, corrected (F5) to 2 <= q <= l."""
    w1, pi = G.w[1], G.pi
    return (G.R(p * w1, pi(q)) + G.R((p - 1) * w1, pi(q + 1))
            + G.R((p - 1) * w1, pi(q - 1)) + G.R((p - 2) * w1, pi(q)))


def C_5(G, p, q):
    """5. R(p pi_1) R(q pi_1)
    = sum_((x, y) in Delta(p, q)) R((x - y) pi_1 + y pi_2)."""
    w1, w2 = G.w[1], G.w[2]
    return G.sum(G.R((x - y) * w1, y * w2) for x, y in Delta(p, q))


def C_5_sym2(G, p):
    """S^2 R(p pi_1) = sum_((x, y) in Delta(p, p), x - y = 2p (mod 4))
    R((x - y) pi_1 + y pi_2)."""
    w1, w2 = G.w[1], G.w[2]
    return G.sum(G.R((x - y) * w1, y * w2) for x, y in Delta(p, p)
                 if (x - y - 2 * p) % 4 == 0)


def check_C(l):
    G = Group("C", l)
    t, n, w = G.name, G.n, G.w
    R = G.R(w[1])
    for p in range(0, l + 1):
        holds(f"{t} formula 1, p={p}", R.exterior_power(p), C_1(G, p))
    for p in range(1, P_MAX + 1):
        # 2. S^p R = R(p pi_1).
        holds(f"{t} formula 2, p={p}", R.symmetric_power(p), G.R(p * w[1]))
    for p in range(1, l + 1):
        for q in range(1, p + 1):
            holds(f"{t} formula 3, p={p}, q={q}",
                  G.R(w[p]) * G.R(w[q]), C_3(G, p, q))
        holds_sym2(f"{t} formula 3, S^2, p={p}", G.R(w[p]), C_3_sym2(G, p))
    for p in range(1, P_MAX + 1):
        for q in range(1, l + 1):
            lhs = G.R(p * w[1]) * G.R(w[q])
            if q >= 2:
                holds(f"{t} formula 4, p={p}, q={q}", lhs, C_4(G, p, q))
            else:  # F5: at q = 1, R((p-1) pi_1) is counted twice
                refuted(f"{t} formula 4 as printed, q=1, p={p}", lhs,
                        C_4(G, p, q))
                holds(f"{t} formula 4 at q=1 less one R((p-1) pi_1), p={p}",
                      lhs, C_4(G, p, q) - G.R((p - 1) * w[1]))
        for q in range(1, p + 1):
            holds(f"{t} formula 5, p={p}, q={q}",
                  G.R(p * w[1]) * G.R(q * w[1]), C_5(G, p, q))
        holds_sym2(f"{t} formula 5, S^2, p={p}", G.R(p * w[1]),
                   C_5_sym2(G, p))

    # Dimensions (p. 302).
    for p in range(0, l + 1):
        holds(f"{t} dim pi_p, p={p}", G.R(G.pi(p)).degree(),
              QQ(n - 2 * p + 2) / (n - p + 2) * C(n + 1, p))
        for q in range(0, p + 1):
            holds(f"{t} dim pi_p + pi_q, p={p}, q={q}",
                  G.R(G.pi(p), G.pi(q)).degree(),
                  QQ((p - q + 1) * (n - 2 * p + 2) * (n - p - q + 3)
                     * (n - 2 * q + 4))
                  / ((p + 1) * (n - p + 2) * (n - p + 3) * (n - q + 4))
                  * C(n + 1, p) * C(n + 3, q))
    for p in range(0, DIM_P_MAX + 1):
        holds(f"{t} dim p pi_1, p={p}", G.R(p * w[1]).degree(),
              C(n + p - 1, p))
        for q in range(1, l + 1):
            holds(f"{t} dim p pi_1 + pi_q, p={p}, q={q}",
                  G.R(p * w[1], w[q]).degree(),
                  QQ((n - 2 * q + 2) * q) / ((p + q) * (n + p - q + 2))
                  * C(n + p + 1, p) * C(n + 1, q))
        for q in range(0, p + 1):
            holds(f"{t} dim (p-q) pi_1 + q pi_2, p={p}, q={q}",
                  G.R((p - q) * w[1], q * w[2]).degree(),
                  QQ((p - q + 1) * (n + p + q - 1)) / ((p + 1) * (n - 1))
                  * C(n + p - 2, p) * C(n + q - 3, q))


# =========================================================================
# D_l, l >= 3 (n = 2l), printed pp. 302-304.
# =========================================================================

def D_3a(G, p, second):
    """3a. R(2 pi_l) R(hat(pi)_p) = sum_(i >= 0) R(2 pi_l + hat(pi)_(p-2i))
    + sum_((x, y) in Delta(l, q), x < l) R(hat(pi)_x + hat(pi)_y),
    p <= l - 1; printed Delta(l, q), corrected (F1) to Delta(l, p):
    `second` is the second argument of Delta."""
    l, hat = G.l, G.hat
    return (G.sum(G.R(2 * G.w[l], hat(p - 2 * i)) for i in EVERY_I)
            + G.sum(G.R(hat(x), hat(y)) for x, y in Delta(l, second)
                    if x < l))


def pairs_below_l(G):
    """y <= x < l (and y >= 0)."""
    return [(x, y) for x in range(G.l) for y in range(x + 1)]


def D_3b(G):
    """3b. R(2 pi_l) R(2 pi_(l-1))
    = sum_(y <= x < l, x = y = l - 1 (mod 2)) R(hat(pi)_x + hat(pi)_y)."""
    l, hat = G.l, G.hat
    return G.sum(G.R(hat(x), hat(y)) for x, y in pairs_below_l(G)
                 if (x - (l - 1)) % 2 == 0 and (y - (l - 1)) % 2 == 0)


def D_3c(G):
    """3c. R(2 pi_l)^2 = R(4 pi_l) + sum_(i >= 1) R(2 pi_l + hat(pi)_(l-2i))
    + sum_(y <= x < l, x = y = l (mod 2)) R(hat(pi)_x + hat(pi)_y)."""
    l, hat, w = G.l, G.hat, G.w
    return (G.R(4 * w[l])
            + G.sum(G.R(2 * w[l], hat(l - 2 * i)) for i in EVERY_I[1:])
            + G.sum(G.R(hat(x), hat(y)) for x, y in pairs_below_l(G)
                    if (x - l) % 2 == 0 and (y - l) % 2 == 0))


def D_3c_sym2(G):
    """S^2 R(2 pi_l) = R(4 pi_l) + sum_(i >= 1) R(2 pi_l + hat(pi)_(l-4i))
    + sum_(y <= x < l, x = y = l (mod 2), x = y (mod 4))
    R(hat(pi)_x + hat(pi)_y)."""
    l, hat, w = G.l, G.hat, G.w
    return (G.R(4 * w[l])
            + G.sum(G.R(2 * w[l], hat(l - 4 * i)) for i in EVERY_I[1:])
            + G.sum(G.R(hat(x), hat(y)) for x, y in pairs_below_l(G)
                    if (x - l) % 2 == 0 and (y - l) % 2 == 0
                    and (x - y) % 4 == 0))


def D_4a(G, p, last):
    """4a. R(p pi_1) R(2 pi_l) = R(p pi_1 + 2 pi_l)
    + R((p-1) pi_1 + hat(pi)_(l-1)) + R((p-2) pi_1 + 2 pi_l); the last term
    printed with `last` = pi_l, corrected (F2) to pi_(l-1)."""
    w, l = G.w, G.l
    return (G.R(p * w[1], 2 * w[l]) + G.R((p - 1) * w[1], G.hat(l - 1))
            + G.R((p - 2) * w[1], 2 * last))


def D_6(G, p):
    """6. R(hat(pi)_p) R(pi_l) = sum_(i >= 0) R(hat(pi)_(p-2i) + pi_l)
    + sum_(i >= 0) R(hat(pi)_(p-2i-1) + pi_(l-1)); printed for p <= l,
    corrected (F3) to p <= l - 1."""
    w, l, hat = G.w, G.l, G.hat
    return (G.sum(G.R(hat(p - 2 * i), w[l]) for i in EVERY_I)
            + G.sum(G.R(hat(p - 2 * i - 1), w[l - 1]) for i in EVERY_I))


def D_6a(G):
    """6a. R(2 pi_l) R(pi_l) = R(3 pi_l)
    + sum_(i >= 1) R(hat(pi)_(l-2i) + pi_l)."""
    w, l = G.w, G.l
    return G.R(3 * w[l]) + G.sum(G.R(G.hat(l - 2 * i), w[l])
                                 for i in EVERY_I[1:])


def D_7(G, p):
    """7. R(p pi_1) R(pi_l) = R(p pi_1 + pi_l) + R((p-1) pi_1 + pi_(l-1))."""
    w, l = G.w, G.l
    return G.R(p * w[1], w[l]) + G.R((p - 1) * w[1], w[l - 1])


def D_8(G):
    """8. R(pi_l) R(pi_(l-1)) = sum_(i >= 0) R(hat(pi)_(l-2i-1))."""
    return G.sum(G.R(G.hat(G.l - 2 * i - 1)) for i in EVERY_I)


def D_9(G):
    """9. R(pi_l)^2 = R(2 pi_l) + sum_(i >= 1) R(hat(pi)_(l-2i))."""
    return G.R(2 * G.w[G.l]) + G.sum(G.R(G.hat(G.l - 2 * i))
                                     for i in EVERY_I[1:])


def D_9_sym2(G):
    """S^2 R(pi_l) = R(2 pi_l) + sum_(i >= 1) R(hat(pi)_(l-4i))."""
    return G.R(2 * G.w[G.l]) + G.sum(G.R(G.hat(G.l - 4 * i))
                                     for i in EVERY_I[1:])


def dim_hat_p_plus_pi_l(G, p):
    """Row hat(pi)_p + pi_l of D_l (p. 304): printed for p <= l,
    corrected (F4) to p <= l - 1."""
    n = G.n
    return 2 ** (G.l - 1) * QQ(n - 2 * p + 1) / (n - p + 1) * C(n, p)


def check_D(l):
    G = Orthogonal("D", l)
    t, n, w, hat = G.name, G.n, G.w, G.hat
    check_B_and_D_1_to_5(G)
    two_l = G.R(2 * w[l])
    for p in range(1, l):
        lhs = two_l * G.R(hat(p))
        holds(f"{t} formula 3a with Delta(l, p), p={p}", lhs, D_3a(G, p, p))
        # F1: the printed Delta(l, q), q free: no q other than p will do.
        for q in range(0, l + 1):
            if q != p:
                refuted(f"{t} formula 3a with Delta(l, q), p={p}, q={q}",
                        lhs, D_3a(G, p, q))
    holds(f"{t} formula 3b", two_l * G.R(2 * w[l - 1]), D_3b(G))
    holds(f"{t} formula 3c", two_l * two_l, D_3c(G))
    holds_sym2(f"{t} formula 3c, S^2", two_l, D_3c_sym2(G))
    for p in range(1, P_MAX + 1):
        lhs = G.R(p * w[1]) * two_l
        holds(f"{t} formula 4a with 2 pi_(l-1), p={p}", lhs,
              D_4a(G, p, w[l - 1]))
        if p >= 2:  # p = 1: the last term is meaningless in both readings
            refuted(f"{t} formula 4a as printed (2 pi_l), p={p}", lhs,
                    D_4a(G, p, w[l]))
    spin = G.R(w[l])
    for p in range(1, l + 1):
        lhs = G.R(hat(p)) * spin
        if p <= l - 1:
            holds(f"{t} formula 6, p={p}", lhs, D_6(G, p))
        else:  # F3: at p = l, R(2 pi_(l-1) + pi_l) is counted twice
            refuted(f"{t} formula 6 as printed at p = l", lhs, D_6(G, p))
            holds(f"{t} formula 6 at p = l less one R(2 pi_(l-1) + pi_l)",
                  lhs, D_6(G, p) - G.R(2 * w[l - 1], w[l]))
    holds(f"{t} formula 6a", two_l * spin, D_6a(G))
    for p in range(1, P_MAX + 1):
        holds(f"{t} formula 7, p={p}", G.R(p * w[1]) * spin, D_7(G, p))
    holds(f"{t} formula 8", spin * G.R(w[l - 1]), D_8(G))
    holds(f"{t} formula 9", spin * spin, D_9(G))
    holds_sym2(f"{t} formula 9, S^2", spin, D_9_sym2(G))

    # Dimension rows of D_l only (pp. 303-304).
    top = C(n - 1, l - 1)
    holds(f"{t} dim 2 pi_l", two_l.degree(), top)
    for p in range(0, l):
        holds(f"{t} dim 2 pi_l + hat(pi)_p, p={p}",
              G.R(2 * w[l], hat(p)).degree(),
              QQ(2 * (l - p + 1) ** 2) / ((l + 1) * (n - p + 2)) * top
              * C(n + 1, p))
    holds(f"{t} dim 4 pi_l", G.R(4 * w[l]).degree(),
          QQ(2) / ((l + 1) * (l + 2)) * top * C(n + 1, l))
    for p in range(0, DIM_P_MAX + 1):
        holds(f"{t} dim p pi_1 + 2 pi_l, p={p}",
              G.R(p * w[1], 2 * w[l]).degree(),
              QQ(l) / (l + p) * top * C(n + p - 1, p))
        holds(f"{t} dim p pi_1 + pi_l, p={p}", G.R(p * w[1], w[l]).degree(),
              2 ** (l - 1) * C(n + p - 2, p))
    holds(f"{t} dim pi_l", spin.degree(), 2 ** (l - 1))
    for p in range(0, l + 1):
        dim = G.R(hat(p), w[l]).degree()
        if p <= l - 1:
            holds(f"{t} dim hat(pi)_p + pi_l, p={p}", dim,
                  dim_hat_p_plus_pi_l(G, p))
        else:  # F4: at p = l the printed value is dim R(3 pi_l)
            refuted(f"{t} dim hat(pi)_p + pi_l as printed at p = l", dim,
                    dim_hat_p_plus_pi_l(G, p))
            holds(f"{t} dim hat(pi)_l + pi_l as printed = dim R(3 pi_l)",
                  G.R(3 * w[l]).degree(), dim_hat_p_plus_pi_l(G, p))
    holds(f"{t} dim 3 pi_l", G.R(3 * w[l]).degree(),
          2 ** l * QQ(1) / (l + 1) * top)


# =========================================================================
# F1-F6 again, by formal characters, for the smallest ranks.
# =========================================================================

def check_findings_by_weights():
    for l in (3, 4):
        G = Orthogonal("D", l)
        w, hat, t = G.w, G.hat, G.name
        two_l = G.R(2 * w[l])
        for p in range(1, l):  # F1
            product = weights_of_product(two_l, G.R(hat(p)))
            for q in range(0, l + 1):
                if q != p:
                    by_weights(f"{t} F1, p={p}, q={q}", product,
                               D_3a(G, p, q), D_3a(G, p, p))
        for p in (2, 3):  # F2
            by_weights(f"{t} F2, p={p}",
                       weights_of_product(G.R(p * w[1]), two_l),
                       D_4a(G, p, w[l]), D_4a(G, p, w[l - 1]))
        # F3: formula 6 at p = l counts R(2 pi_(l-1) + pi_l) twice.
        printed = D_6(G, l)
        by_weights(f"{t} F3", weights_of_product(G.R(hat(l)), G.R(w[l])),
                   printed, printed - G.R(2 * w[l - 1], w[l]))
        # F4: the dimension of R(hat(pi)_p + pi_l) counted from its weights.
        for p in range(0, l + 1):
            count = sum(weights(G.R(hat(p), w[l])).values())
            if p <= l - 1:
                holds(f"{t} F4 by weights, p={p}", count,
                      dim_hat_p_plus_pi_l(G, p))
            else:
                refuted(f"{t} F4 by weights, p = l", count,
                        dim_hat_p_plus_pi_l(G, p))
    for l in (2, 3):  # F5: formula 4 at q = 1 counts R((p-1) pi_1) twice.
        G = Group("C", l)
        for p in (1, 2, 3):
            printed = C_4(G, p, 1)
            by_weights(f"{G.name} F5, p={p}",
                       weights_of_product(G.R(p * G.w[1]), G.R(G.w[1])),
                       printed, printed - G.R((p - 1) * G.w[1]))
    for G in (Orthogonal("B", 2), Orthogonal("D", 3)):  # F6
        w = G.w
        for p in (1, 2, 3):
            for q in range(1, p + 1):
                by_weights(f"{G.name} F6, p={p}, q={q}",
                           weights_of_product(G.R(p * w[1]), G.R(q * w[1])),
                           B_5(G, p, q, w[2]), B_5(G, p, q, G.hat(2)))
        for p in (2, 3):
            by_weights(f"{G.name} F6, S^2, p={p}",
                       weights_of_sym2(G.R(p * w[1])),
                       B_5_sym2(G, p, w[2]), B_5_sym2(G, p, G.hat(2)))


# =========================================================================
# E_6, E_7, E_8, F_4, G_2, printed pp. 304-305.
# =========================================================================

# Table 1, printed pp. 293-294: the Dynkin diagrams with "the
# numbering of simple roots accepted in all tables".  A bond (i, j, m) has
# m lines; for m > 1 the arrow points to j, the short root.
BOOK_DIAGRAMS = {
    "E6": [(1, 2, 1), (2, 3, 1), (3, 4, 1), (4, 5, 1), (3, 6, 1)],
    "E7": [(1, 2, 1), (2, 3, 1), (3, 4, 1), (4, 5, 1), (5, 6, 1),
           (4, 7, 1)],
    "E8": [(1, 2, 1), (2, 3, 1), (3, 4, 1), (4, 5, 1), (5, 6, 1),
           (6, 7, 1), (5, 8, 1)],
    "F4": [(1, 2, 1), (3, 2, 2), (3, 4, 1)],
    "G2": [(2, 1, 3)],
}

# Book's pi_i -> Bourbaki's (Sage's) omega_j.
BOOK_TO_BOURBAKI = {
    "E6": {1: 1, 2: 3, 3: 4, 4: 5, 5: 6, 6: 2},
    "E7": {1: 7, 2: 6, 3: 5, 4: 4, 5: 3, 6: 1, 7: 2},
    "E8": {1: 8, 2: 7, 3: 6, 4: 5, 5: 4, 6: 3, 7: 1, 8: 2},
    "F4": {1: 4, 2: 3, 3: 2, 4: 1},
    "G2": {1: 1, 2: 2},
}
# The other admissible numbering of E_6: the first followed by the symmetry
# 1 <-> 6, 3 <-> 5 of Bourbaki's diagram (it exchanges R and R*).
E6_OTHER = {1: 6, 2: 5, 3: 4, 4: 3, 5: 1, 6: 2}


def book_cartan(name):
    rank = int(name[1])
    a = {(i, j): 2 if i == j else 0
         for i in range(1, rank + 1) for j in range(1, rank + 1)}
    for i, j, m in BOOK_DIAGRAMS[name]:
        a[i, j], a[j, i] = -1, -m  # <alpha_j^v, alpha_i> = -m, j short
    return a


def sage_cartan(name):
    space = WeylCharacterRing(name, style="coroots").space()
    s = space.simple_roots()
    rank = int(name[1])
    return {(i, j): 2 * s[i].scalar(s[j]) / s[i].scalar(s[i])
            for i in range(1, rank + 1) for j in range(1, rank + 1)}


def check_numbering():
    for name, mapping in BOOK_TO_BOURBAKI.items():
        book, sage = book_cartan(name), sage_cartan(name)
        rank = int(name[1])
        admissible = []
        for image in permutations(range(1, rank + 1)):
            sigma = dict(zip(range(1, rank + 1), image))
            if all(book[i, j] == sage[sigma[i], sigma[j]] for i, j in book):
                admissible.append(sigma)
        holds(f"{name}: book numbering -> Bourbaki", mapping in admissible,
              True)
        holds(f"{name}: numbering unique up to diagram symmetry",
              len(admissible), 2 if name == "E6" else 1)
        if name == "E6":
            holds("E6: the other numbering", E6_OTHER in admissible, True)


class Exceptional(Group):
    """An exceptional group with the book's numbering of pi_i."""

    def __init__(self, name, mapping):
        super().__init__(name[0], int(name[1]))
        self.mapping = mapping

    def pi(self, i):
        return self.w[self.mapping[i]]

    def weight(self, text):
        """'2pi1+pi5' (book numbering) -> weight; '0' -> 0."""
        total = self.zero
        for term in text.replace(" ", "").split("+"):
            if term == "0":
                continue
            k, _, i = term.partition("pi")
            total += (int(k) if k else 1) * self.pi(int(i))
        return total

    def Rw(self, text):
        return self.R(self.weight(text))


def check_block(name, G, dims, identities):
    """One exceptional block: `identities` are its lines (label, computed
    left-hand side, printed right-hand side), `dims` its printed row of
    dimensions."""
    for label, computed, printed in identities:
        holds(f"{name} {label}", computed, printed)
    listed = [G.weight(text) for text in dims]
    for text, value in dims.items():
        holds(f"{name} dim R({text})", G.Rw(text).degree(), value)
    # p. 299: the dimensions of all irreducible representations occurring in
    # the formulas are listed (up to duality).
    for label, _, printed in identities:
        for weight in printed.monomial_coefficients():
            if weight == G.zero:
                continue
            dual = G.dual(G.R(weight))
            covered = weight in listed or any(
                dual == G.R(other) for other in listed)
            holds(f"{name} {label}: R({weight}) has its dimension listed",
                  covered, True)


def check_exceptional():
    for mapping in (BOOK_TO_BOURBAKI["E6"], E6_OTHER):
        G = Exceptional("E6", mapping)
        R, Ad, one = G.Rw("pi1"), G.Rw("pi6"), G.one
        Rs = G.dual(R)
        check_block("E_6", G, {
            "pi1": 27, "pi6": 78, "pi2": 351, "2pi1": 351, "pi1+pi5": 650,
            "pi1+pi6": 1728, "2pi6": 2430, "pi3": 2925,
        }, [
            ("Ad = R(pi_6)", G.adjoint(), Ad),
            ("1. wedge^2 R", R.exterior_square(), G.Rw("pi2")),
            ("1. S^2 R", R.symmetric_square(), G.Rw("2pi1") + Rs),
            ("2. R R*", R * Rs, G.Rw("pi1+pi5") + Ad + one),
            ("3. R Ad", R * Ad,
             G.Rw("pi1+pi6") + G.dual(G.Rw("pi2")) + R),
            ("4. wedge^2 Ad", Ad.exterior_square(), G.Rw("pi3") + Ad),
            ("4. S^2 Ad", Ad.symmetric_square(),
             G.Rw("2pi6") + G.Rw("pi1+pi5") + one),
        ])

    G = Exceptional("E7", BOOK_TO_BOURBAKI["E7"])
    R, Ad, one = G.Rw("pi1"), G.Rw("pi6"), G.one
    check_block("E_7", G, {
        "pi1": 56, "pi6": 133, "pi7": 912, "2pi1": 1463, "pi2": 1539,
        "pi1+pi6": 6480, "2pi6": 7371, "pi5": 8645,
    }, [
        ("Ad = R(pi_6)", G.adjoint(), Ad),
        ("1. wedge^2 R", R.exterior_square(), G.Rw("pi2") + one),
        ("1. S^2 R", R.symmetric_square(), G.Rw("2pi1") + Ad),
        ("2. R Ad", R * Ad, G.Rw("pi1+pi6") + G.Rw("pi7") + R),
        ("3. wedge^2 Ad", Ad.exterior_square(), G.Rw("pi5") + Ad),
        ("3. S^2 Ad", Ad.symmetric_square(),
         G.Rw("2pi6") + G.Rw("pi2") + one),
    ])

    G = Exceptional("E8", BOOK_TO_BOURBAKI["E8"])
    R, one = G.Rw("pi1"), G.one
    check_block("E_8", G, {
        "pi1": 248, "pi7": 3875, "2pi1": 27000, "pi2": 30380,
    }, [
        ("R = Ad = R(pi_1)", G.adjoint(), R),
        ("1. wedge^2 R", R.exterior_square(), G.Rw("pi2") + R),
        ("1. S^2 R", R.symmetric_square(),
         G.Rw("2pi1") + G.Rw("pi7") + one),
    ])

    G = Exceptional("F4", BOOK_TO_BOURBAKI["F4"])
    R, Ad, one = G.Rw("pi1"), G.Rw("pi4"), G.one
    check_block("F_4", G, {
        "pi1": 26, "pi4": 52, "pi2": 273, "2pi1": 324, "pi1+pi4": 1053,
        "2pi4": 1053, "pi3": 1274,
    }, [
        ("Ad = R(pi_4)", G.adjoint(), Ad),
        ("1. wedge^2 R", R.exterior_square(), G.Rw("pi2") + Ad),
        ("1. S^2 R", R.symmetric_square(), G.Rw("2pi1") + R + one),
        ("2. R Ad", R * Ad, G.Rw("pi1+pi4") + G.Rw("pi2") + R),
        ("3. wedge^2 Ad", Ad.exterior_square(), G.Rw("pi3") + Ad),
        ("3. S^2 Ad", Ad.symmetric_square(),
         G.Rw("2pi4") + G.Rw("2pi1") + one),
    ])

    G = Exceptional("G2", BOOK_TO_BOURBAKI["G2"])
    R, Ad, one = G.Rw("pi1"), G.Rw("pi2"), G.one
    check_block("G_2", G, {
        "pi1": 7, "pi2": 14, "2pi1": 27, "pi1+pi2": 64, "2pi2": 77,
        "3pi1": 77,
    }, [
        ("Ad = R(pi_2)", G.adjoint(), Ad),
        ("1. wedge^2 R", R.exterior_square(), Ad + R),
        ("1. S^2 R", R.symmetric_square(), G.Rw("2pi1") + one),
        ("2. R Ad", R * Ad, G.Rw("pi1+pi2") + G.Rw("2pi1") + R),
        ("3. wedge^2 Ad", Ad.exterior_square(), G.Rw("3pi1") + Ad),
        ("3. S^2 Ad", Ad.symmetric_square(),
         G.Rw("2pi2") + G.Rw("2pi1") + one),
        ("4. R(2pi_1) R", G.Rw("2pi1") * R,
         G.Rw("3pi1") + G.Rw("pi1+pi2") + G.Rw("2pi1") + Ad + R),
    ])


def main():
    check_notation()
    check_sym2_route()
    check_A1()
    for l in RANKS["A"]:
        check_A(l)
    for l in RANKS["B"]:
        check_B(l)
    for l in RANKS["C"]:
        check_C(l)
    for l in RANKS["D"]:
        check_D(l)
    check_findings_by_weights()
    check_numbering()
    check_exceptional()
    print(f"ok table-5: {COUNT[0]} checks")


if __name__ == "__main__":
    main()
