"""Exact checks of Tables 9 and 10 of the Reference Chapter.

Onishchik, Vinberg, *Lie Groups and Algebraic Groups* (Springer 1990),
Reference Chapter, § 2, Table 9 "Real Simple Lie Algebras" (printed pp.
312-317) and Table 10 "Centers and Linearizers of Simply Connected Real
Simple Lie Groups" (printed pp. 318-321); our source
content/76-tables-9-10.typ.

Where the expected values come from.  Every expected value is written below
as a literal or a formula taken from the printed book (printed page and
row are given beside it); where the book is wrong the printed reading is
kept as a refuted check (`refute`) beside the corrected one.  The numbering
of simple roots is that of Table 1 (printed p. 293): Bourbaki for
A-D and G2, and for E6, E7, E8, F4 the book's own (checked in section 0).
The independent party is Sage: root systems, Weyl group elements, the
Chevalley basis of the complex Lie algebra, Smith/Hermite forms over ZZ.

What is checked.

0. The book's numbering of Table 1 (bonds, short roots) for the types used.
1. Table 9, every row, the classical families for all ranks up to 8 (the
   printed parameter ranges; l = 1 included where the table allows it) and
   all exceptional rows.  From the printed Satake diagram (black vertices,
   arrows) the Cartan involution on the maximally split Cartan subalgebra is
   rebuilt as theta = -w_B eps (w_B the longest element of the Weyl group of
   the black roots, eps the diagram automorphism given by the arrows on the
   white vertices and by -w_B on the black ones); theta is checked to be an
   involution of the root system.  Then: the real rank dim a, the restricted
   root system Sigma = {(alpha - theta alpha)/2} with multiplicities, its
   type and the numbering given by the printed column r (Cartan matrix of
   the lambda_j against Table 1, number of roots, integrality, BC or
   reduced), W(Sigma)-invariance of the multiplicities, the printed
   multiplicities dim g_lambda_j and dim g_2lambda_j, dim p = dim a + sum
   over Sigma^+ of the multiplicities, dim k = dim g - dim p against the
   printed dim k, dim p and against the dimension of the printed k.
   Independently, the maximal compact subalgebra k(C) = g(C)^theta is
   rebuilt from the Kac diagram of the same real form in Table 7 (printed
   pp. 307-309), with the signs of the diagram automorphism
   on the Chevalley basis computed in Sage's Lie algebra, and its type
   (simple components and centre) is compared with the printed k.
   Literature: rank, type of Sigma and multiplicities are compared with
   Knapp, Lie Groups Beyond an Introduction, 2nd ed. (Birkhauser 2002;
   digital second edition 2023, pages identical), (6.107), (6.108) (pp.
   424-425) and Appendix C, sections 3-4 (pp. 693-718), where the
   multiplicities are given through the real-rank-one subalgebras
   (sl(2,R): 1; sl(2,C): 2; so(n,1): n-1; su(n,1): 2(n-1), 1;
   sp(n,1): 4(n-1), 3).
2. Table 10, every row, the classical families for ranks up to 9 (up to 10
   for the u*(H) rows with l = 4p + 2) and all exceptional rows, from the
   book's own description of the centre (Theorems 5.3.7 and 5.3.9; Problems
   5.3.29, 5.3.30): with t = h^tau and theta = tau^ exp(2 pi i ad x) given
   by the Kac diagram of Table 7, Z(G) = (P^v cap t)/Q^v(k'),
   Lambda(G) = (Q^v cap t)/Q^v(k').  For every printed generator: it lies in
   P^v cap t (resp. Q^v cap t), the printed direct product of cyclic groups
   of the printed orders is exactly the quotient (relation lattice and
   surjectivity over ZZ).  Problem 5.3.30 (P^v cap t = P^v(g^tau^)) is
   checked on the way.  G_lin: the centre (P^v cap t)/(Q^v cap t) and
   pi_1 = Lambda(G) are compared with the centre and fundamental group of
   the printed matrix group (centre = scalars in the group; pi_1 = pi_1(K),
   K as in Knapp, App. C).
3. The column b_0.  For inner forms against formula (F14) of the Reference
   Chapter, 1.3 (epsilon = (-1)^(2 Lambda(2u + rho^v)), exp 2 pi i u = theta),
   on generators of the monoid of self-conjugate dominant weights (the index
   is multiplicative on Cartan components, and equals 1 on
   rho(Lambda + nu tau Lambda) when Lambda != nu tau Lambda).  For
   so(P, Q) independently: the index of the spinor representations is
   computed exactly from explicit gamma matrices (monomial matrices over
   Z[i]; an antilinear J = B conj commuting with spin(P, Q), J^2 = +-1),
   for all P + Q <= 18, and compared with the printed b_0 of every so row;
   uniqueness of J up to a scalar is confirmed by a linear system for
   P + Q <= 8.  For sl_p(H) the index of Lambda^k C^2p is (-1)^k; split
   forms have index 1.

Printed readings refuted here (each kept as a `refute` beside the check of
the corrected reading; see corrections.json):
Table 9 -- su_{p,l+1-p} (1 <= p <= 1/2); dim k of so_{p,2l+1-p}
p(2p+1) + (2l+1-p)(4l+3-2p); sp_{p,l-p} (1 <= p < (l-1)/2); "2 (j <= p+1)"
for su_{p,l+1-p}; B_{-1} for so_{l-1,l+1}.  Table 10 -- Z_1 = h_1 + h_{p+1}
for sl_{2p+1}(R); so_{2p,2(l-p)-1} (2 <= p <= l) with Z_1 = h_1 (also wrong
at p = l); b_0 of so_{2,2l-2} for even l; G_lin Spin_{2p+1,2(l-p)+1} and
b_0 = 0 of so_{2p+1,2(l-p)-1}.

What this does NOT establish: the families are checked for the ranks
listed only (a finite check is not a proof for all ranks); the Kac diagrams
of Table 7 are used as input for Table 10 (they are not re-derived here,
only their k is compared with Table 9); the classification itself (that the
rows exhaust the real forms) is not checked; no comparison of our typeset
diagrams with the printed book is made here.

Run with:  sage -python checks/sage/tables-9-10.py
"""
from itertools import combinations

from sage.all import (QQ, ZZ, CartanType, LieAlgebra, QuadraticField,
                      RootSystem, gcd, identity_matrix, matrix, vector, xgcd)

CHECKS = 0
MAX9 = 8     # Table 9: classical ranks up to 8
MAX10 = 9    # Table 10: classical ranks up to 9


def check(cond, what):
    global CHECKS
    assert cond, 'FAILED: ' + what
    CHECKS += 1


def refute(cond, what):
    """The printed reading `what` must be false (kept beside the fix)."""
    global CHECKS
    assert not cond, 'printed reading unexpectedly holds: ' + what
    CHECKS += 1


# ---------------------------------------------------------------------------
# 0. Root data in the numbering of Table 1
# ---------------------------------------------------------------------------

# Book index -> Bourbaki (Sage) index.  Read off the Dynkin diagrams of
# Table 1 (printed pp. 293-294) and checked in section 0 below.
BOOK_TO_SAGE = {
    ('E', 6): {1: 1, 2: 3, 3: 4, 4: 5, 5: 6, 6: 2},
    ('E', 7): {1: 7, 2: 6, 3: 5, 4: 4, 5: 3, 6: 1, 7: 2},
    ('E', 8): {1: 8, 2: 7, 3: 6, 4: 5, 5: 4, 6: 3, 7: 1, 8: 2},
    ('F', 4): {1: 4, 2: 3, 3: 2, 4: 1},
}

_RD = {}


def rootdata(letter, l):
    if (letter, l) not in _RD:
        _RD[(letter, l)] = RootData(letter, l)
    return _RD[(letter, l)]


class RootData:
    """Roots in simple-root coordinates, elements of h in coroot
    coordinates (h_1, ..., h_l), book numbering."""

    def __init__(self, letter, l):
        self.letter, self.l = letter, l
        self.ct = CartanType([letter, l])
        idx = BOOK_TO_SAGE.get((letter, l), {i: i for i in range(1, l + 1)})
        self.idx = idx
        amb = RootSystem(self.ct).ambient_space()
        s = [amb.simple_root(idx[i]) for i in range(1, l + 1)]
        self.G = matrix(QQ, l, l, lambda i, j: s[i].scalar(s[j]))
        # M[i, j] = alpha_i(h_j)
        self.M = matrix(QQ, l, l, lambda i, j: 2 * self.G[i, j] / self.G[j, j])
        self.Minv = self.M.inverse()
        self.pos = [vector(QQ, [r.coefficient(idx[i]) for i in range(1, l + 1)])
                    for r in RootSystem(self.ct).root_lattice().positive_roots()]
        for v in self.pos:
            v.set_immutable()
        self.roots = self.pos + [(-v) for v in self.pos]
        for v in self.roots:
            v.set_immutable()
        self.rootset = set(self.roots)
        self.dim = l + len(self.roots)

    def form(self, u, v):
        return u * self.G * v

    def ev(self, alpha, x):
        """alpha(x): alpha in root coordinates, x in coroot coordinates."""
        return alpha * self.M * x

    def h(self, i):
        return vector(QQ, [1 if j == i else 0 for j in range(1, self.l + 1)])

    def pic(self, i):
        """Fundamental coweight pi_i^v (alpha_j(pi_i^v) = delta_ij)."""
        return self.Minv.column(i - 1)

    def rho_c(self):
        return sum((self.pic(i) for i in range(1, self.l + 1)),
                   vector(QQ, [0] * self.l))

    def coroot(self, beta):
        """beta^v = 2 beta / (beta, beta) as an element of h."""
        n = self.form(beta, beta)
        return vector(QQ, [beta[j] * self.G[j, j] / n for j in range(self.l)])

    def nu(self):
        """nu = -w_0 on the simple roots (Table 3, column |nu|)."""
        l = self.l
        if self.letter == 'A':
            return {i: l + 1 - i for i in range(1, l + 1)}
        if self.letter == 'D' and l % 2 == 1:
            d = {i: i for i in range(1, l + 1)}
            d[l - 1], d[l] = l, l - 1
            return d
        if self.letter == 'E' and l == 6:
            return {1: 5, 2: 4, 3: 3, 4: 2, 5: 1, 6: 6}
        return {i: i for i in range(1, l + 1)}


def bonds(rd):
    return {(i + 1, j + 1) for i in range(rd.l) for j in range(i + 1, rd.l)
            if rd.G[i, j] != 0}


def short_roots(rd):
    m = max(rd.G[i, i] for i in range(rd.l))
    return {i + 1 for i in range(rd.l) if rd.G[i, i] < m}


# Table 1 diagrams (printed pp. 293-294).
check(bonds(rootdata('E', 6)) == {(1, 2), (2, 3), (3, 4), (4, 5), (3, 6)},
      'Table 1: E6 numbering')
check(bonds(rootdata('E', 7)) == {(1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (4, 7)},
      'Table 1: E7 numbering')
check(bonds(rootdata('E', 8))
      == {(1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (5, 8)},
      'Table 1: E8 numbering')
check(bonds(rootdata('F', 4)) == {(1, 2), (2, 3), (3, 4)}
      and short_roots(rootdata('F', 4)) == {1, 2}, 'Table 1: F4, 1 and 2 short')
check(short_roots(rootdata('G', 2)) == {1}, 'Table 1: G2, alpha_1 short')
for l in range(2, MAX10 + 1):
    check(short_roots(rootdata('B', l)) == {l}, 'Table 1: B_l, alpha_l short')
    check(short_roots(rootdata('C', l)) == set(range(1, l)),
          'Table 1: C_l, alpha_l long')
for l in range(4, MAX10 + 2):
    check((l - 2, l) in bonds(rootdata('D', l))
          and (l - 2, l - 1) in bonds(rootdata('D', l)), 'Table 1: D_l fork')


# ---------------------------------------------------------------------------
# Small helpers: lattices, types of reductive algebras
# ---------------------------------------------------------------------------

def is_integral(v):
    return all(c in ZZ for c in v)


def imm(v):
    v = vector(QQ, v)
    v.set_immutable()
    return v


def simple_system(roots):
    """Simple roots of the positive system cut out by a generic functional."""
    n = len(roots[0])
    wt = vector(QQ, [1000 ** i for i in range(n)])
    pos = [b for b in roots if b * wt > 0]
    assert 2 * len(pos) == len(roots)
    posset = set(pos)
    return [b for b in pos
            if not any(imm(b - c) in posset for c in pos if c != b)], pos


def rowspan_ZZ(rows, n):
    return (ZZ ** n).span([vector(ZZ, r) for r in rows]) if rows else \
        (ZZ ** n).span([])


def coords(basis, v):
    """Coordinates of v in the rows of `basis` (exact; None if not in span)."""
    B = matrix(QQ, basis)
    try:
        c = B.solve_left(vector(QQ, v))
    except ValueError:
        return None
    return c


def quotient_invariants(target, sub):
    """Invariants of the abelian group <target>/<sub> (both ZZ-bases in QQ^l,
    sub inside target): (sorted torsion orders > 1, free rank)."""
    r = len(target)
    rows = []
    for v in sub:
        c = coords(target, v)
        assert c is not None and is_integral(c), 'sub not inside target'
        rows.append(c)
    if not rows:
        return [], r
    R = matrix(ZZ, rows)
    ed = [d for d in R.elementary_divisors() if d != 0]
    return sorted(d for d in ed if d > 1), r - R.rank()


def printed_group_is_quotient(target, sub, gens):
    """The printed group prod <Z_i>_{m_i} (m = 0 for infinity) with the
    printed generators is exactly <target>/<sub>: every Z_i lies in the
    target lattice, the relations among the Z_i modulo `sub` are exactly
    m_i Z_i, and the Z_i together with `sub` generate the target."""
    r = len(target)
    V = []
    for v, _ in gens:
        c = coords(target, v)
        if c is None or not is_integral(c):
            return False
        V.append(c)
    S = [coords(target, v) for v in sub]
    assert all(c is not None and is_integral(c) for c in S)
    k = len(gens)
    allrows = [vector(ZZ, c) for c in V] + [vector(ZZ, c) for c in S]
    if rowspan_ZZ(allrows, r) != (ZZ ** r):
        return False
    if k == 0:
        return True
    Mx = matrix(ZZ, allrows)
    K = Mx.left_kernel()
    rel = (ZZ ** k).span([b[:k] for b in K.basis()])
    expected = (ZZ ** k).span([vector(ZZ, [m if j == i else 0 for j in range(k)])
                               for i, (_, m) in enumerate(gens) if m != 0])
    return rel == expected


def ident_component(n, npos, nlong_pos, ratio):
    """Name of a simple complex Lie algebra from rank, number of positive
    roots, number of long positive roots, squared length ratio."""
    if ratio == 1:
        if npos == n * (n + 1) // 2:
            return 'A%d' % n
        if n >= 4 and npos == n * (n - 1):
            return 'D%d' % n
        return {(6, 36): 'E6', (7, 63): 'E7', (8, 120): 'E8'}[(n, npos)]
    if ratio == 3:
        assert n == 2
        return 'G2'
    if n == 4 and npos == 24:
        return 'F4'
    assert npos == n * n
    if n == 2:
        return 'B2'
    return 'B%d' % n if nlong_pos == n * (n - 1) else 'C%d' % n


def normalize(name):
    table = {'B1': 'A1', 'C1': 'A1', 'C2': 'B2', 'D3': 'A3'}
    return table.get(name, name)


def compact_type(parts):
    """Complexified type of a printed compact algebra, as (sorted names,
    centre dimension).  parts: list like [('so', 5), ('u', 3), ('E6',)]."""
    names, centre = [], 0
    for part in parts:
        kind = part[0]
        if kind == 'so':
            n = part[1]
            if n == 2:
                centre += 1
            elif n == 3:
                names.append('A1')
            elif n == 4:
                names += ['A1', 'A1']
            elif n >= 5:
                names.append('B%d' % ((n - 1) // 2) if n % 2 else 'D%d' % (n // 2))
        elif kind == 'su':
            if part[1] >= 2:
                names.append('A%d' % (part[1] - 1))
        elif kind == 'u':
            centre += 1
            if part[1] >= 2:
                names.append('A%d' % (part[1] - 1))
        elif kind == 'sp':
            names.append('C%d' % part[1])
        elif kind == 'R':
            centre += 1
        else:
            names.append(kind)
    return sorted(normalize(x) for x in names), centre


def type_dim(names, centre):
    total = centre
    for x in names:
        n = int(x[1:])
        total += {'A': n * (n + 2), 'B': n * (2 * n + 1), 'C': n * (2 * n + 1),
                  'D': n * (2 * n - 1)}.get(x[0], 0)
        total += {'E6': 78, 'E7': 133, 'E8': 248, 'F4': 52, 'G2': 14}.get(x, 0)
    return total


# ---------------------------------------------------------------------------
# 1a. Satake diagrams -> restricted roots
# ---------------------------------------------------------------------------

def reflection(rd, i):
    l = rd.l
    return matrix(QQ, l, l, lambda r, k: (1 if r == k else 0)
                  - (rd.M[k, i - 1] if r == i - 1 else 0))


def unit(l, i):
    return vector(QQ, [1 if j == i else 0 for j in range(1, l + 1)])


def is_pos(v):
    return all(c >= 0 for c in v) and any(c != 0 for c in v)


def satake(rd, black, arrows):
    """theta = -w_B eps on the root lattice; restricted roots with
    multiplicities."""
    l = rd.l
    black = set(black)
    W = identity_matrix(QQ, l)
    changed = True
    while changed:
        changed = False
        for i in black:
            if is_pos(W * unit(l, i)):
                W = W * reflection(rd, i)
                changed = True
    for i in black:
        assert all(c <= 0 for c in W * unit(l, i))
    eps = {}
    for i in range(1, l + 1):
        if i in black:
            v = -(W * unit(l, i))
            js = [j for j in black if v == unit(l, j)]
            assert len(js) == 1, '-w_B does not permute the black roots'
            eps[i] = js[0]
        else:
            eps[i] = arrows.get(i, i)
    theta = matrix(QQ, l, l)
    for i in range(1, l + 1):
        theta.set_column(i - 1, -(W * unit(l, eps[i])))
    ok_inv = theta * theta == identity_matrix(QQ, l)
    ok_perm = {imm(theta * a) for a in rd.roots} == rd.rootset
    mult = {}
    nblack = 0
    for a in rd.roots:
        lam = (a - theta * a) / 2
        if lam == 0:
            nblack += 1
            continue
        lam.set_immutable()
        mult[lam] = mult.get(lam, 0) + 1
    a_dim = (identity_matrix(QQ, l) - theta).rank()
    dim_p = a_dim + (len(rd.roots) - nblack) // 2
    return dict(theta=theta, eps=eps, involution=ok_inv, permutes=ok_perm,
                mult=mult, rank=a_dim, dim_p=dim_p, dim_k=rd.dim - dim_p,
                inner=None)


def restricted(rd, theta, i):
    v = (unit(rd.l, i) - theta * unit(rd.l, i)) / 2
    v.set_immutable()
    return v


def expected_sigma_cartan(kind, n):
    if kind == 'BC':
        return matrix(QQ, [[2]]) if n == 1 else rootdata('B', n).M
    return rootdata(kind, n).M


def expected_sigma_count(kind, n):
    return {'A': n * (n + 1), 'B': 2 * n * n, 'C': 2 * n * n,
            'D': 2 * n * (n - 1), 'BC': 2 * n * n + 2 * n}.get(
        kind, {('E', 6): 72, ('E', 7): 126, ('E', 8): 240, ('F', 4): 48,
               ('G', 2): 12}.get((kind, n)))


def sigma_checks(rd, S, kind, n, r_map):
    """Type of Sigma and the numbering of the lambda_j given by column r."""
    theta, mult = S['theta'], S['mult']
    lam = {}
    consistent = True
    for i, j in r_map.items():
        v = restricted(rd, theta, i)
        if j in lam and lam[j] != v:
            consistent = False
        lam[j] = v
    js = sorted(lam)
    ok_idx = js == list(range(1, n + 1)) and consistent and n == S['rank']
    if not ok_idx:
        return False, lam
    L = [lam[j] for j in js]
    C = matrix(QQ, n, n, lambda a, b: 2 * rd.form(L[a], L[b]) / rd.form(L[b], L[b]))
    ok_cartan = C == expected_sigma_cartan(kind, n)
    Gram = matrix(QQ, n, n, lambda a, b: rd.form(L[a], L[b]))
    ok_int = True
    for mu in mult:
        c = Gram.solve_right(vector(QQ, [rd.form(mu, x) for x in L]))
        if sum((c[t] * L[t] for t in range(n)), 0 * mu) != mu:
            ok_int = False
        if not is_integral(c) or not (all(x >= 0 for x in c) or all(x <= 0 for x in c)):
            ok_int = False
    ok_count = len(mult) == expected_sigma_count(kind, n)
    doubles = {imm(2 * mu) for mu in mult} & set(mult)
    ok_bc = (len(doubles) > 0) == (kind == 'BC')
    if kind == 'BC':
        two = 2 * lam[n]
        two.set_immutable()
        ok_bc = ok_bc and two in mult
    # W(Sigma)-invariance of the multiplicities
    ok_w = True
    for x in L:
        for mu, m in mult.items():
            s = mu - 2 * rd.form(mu, x) / rd.form(x, x) * x
            s.set_immutable()
            if mult.get(s) != m:
                ok_w = False
    return (ok_cartan and ok_int and ok_count and ok_bc and ok_w), lam


def mult_of(mult, v):
    v = vector(QQ, v)
    v.set_immutable()
    return mult.get(v, 0)


def length_classes(rd, mult):
    """Multiplicities by squared length (ascending): list of sets."""
    d = {}
    for mu, m in mult.items():
        d.setdefault(rd.form(mu, mu), set()).add(m)
    return [d[k] for k in sorted(d)]


# ---------------------------------------------------------------------------
# 1b. Kac diagrams -> k(C) = g(C)^theta, theta = tau^ exp(2 pi i ad x)
# ---------------------------------------------------------------------------

_SIGNS = {}


def act(tau, v):
    w = [0] * len(v)
    for i in range(1, len(v) + 1):
        w[tau[i] - 1] = v[i - 1]
    w = vector(QQ, w)
    w.set_immutable()
    return w


def tau_signs(rd, tau):
    """c_alpha with tau^(e_alpha) = c_alpha e_alpha for tau-fixed roots,
    tau^ the automorphism e_i -> e_tau(i), f_i -> f_tau(i) of (4.4.1),
    computed in the Chevalley basis of Sage's Lie algebra."""
    key = (rd.letter, rd.l, tuple(sorted(tau.items())))
    if key in _SIGNS:
        return _SIGNS[key]
    g = LieAlgebra(QQ, cartan_type=rd.ct)
    sg = {i: rd.idx[i] for i in range(1, rd.l + 1)}

    def path(alpha):
        ht = sum(alpha)
        if ht == 1:
            return [list(alpha).index(1) + 1]
        for i in range(1, rd.l + 1):
            b = alpha - unit(rd.l, i)
            b.set_immutable()
            if b in rd.rootset and is_pos(b):
                return path(b) + [i]
        raise ValueError

    def build(seq, gen):
        v = gen(sg[seq[0]])
        for i in seq[1:]:
            v = g.bracket(gen(sg[i]), v)
        (k, c), = v.monomial_coefficients().items()
        return c

    signs = {}
    for a in rd.pos:
        if act(tau, a) != a:
            continue
        p = path(a)
        tp = [tau[i] for i in p]
        for gen, s in ((g.e, 1), (g.f, -1)):
            c1, c2 = build(p, gen), build(tp, gen)
            v = s * a
            v.set_immutable()
            signs[v] = c2 / c1
    _SIGNS[key] = signs
    return signs


def fixed_algebra(rd, tau, x):
    """Roots of k(C) = g(C)^theta w.r.t. t = h^tau, as tau-invariant
    elements of h^* (restrictions (alpha + tau alpha)/2)."""
    l = rd.l
    assert act(tau, x) == vector(QQ, x)
    signs = tau_signs(rd, tau) if any(tau[i] != i for i in tau) else {}
    kroots, seen = [], set()
    for a in rd.roots:
        ta = act(tau, a)
        two = 2 * rd.ev(a, x)
        assert two in ZZ
        phase = (-1) ** int(two)
        if ta == a:
            if signs.get(a, 1) * phase == 1:
                beta = vector(QQ, a)
                beta.set_immutable()
                kroots.append(beta)
        else:
            orbit = frozenset([a, ta])
            if orbit in seen:
                continue
            seen.add(orbit)
            beta = (a + ta) / 2
            beta.set_immutable()
            kroots.append(beta)
    orbits = tau_orbits(tau, l)
    return kroots, len(orbits)


def tau_orbits(tau, l):
    out, seen = [], set()
    for i in range(1, l + 1):
        if i in seen:
            continue
        o = sorted({i, tau[i]})
        seen.update(o)
        out.append(o)
    return out


def reductive_type(rd, kroots, dim_t):
    """(sorted simple component names, centre dimension) of k(C)."""
    assert len(set(kroots)) == len(kroots), 'k-root spaces not 1-dimensional'
    if not kroots:
        return [], dim_t
    simple, pos = simple_system(kroots)
    n = len(simple)
    # components
    names, groups = [], []
    rest = list(simple)
    while rest:
        g = [rest.pop()]
        grow = True
        while grow:
            grow = False
            for s in list(rest):
                if any(rd.form(s, t) != 0 for t in g):
                    g.append(s)
                    rest.remove(s)
                    grow = True
        groups.append(g)
    for g in groups:
        rts = [b for b in pos if any(rd.form(b, s) != 0 for s in g)]
        lens = sorted({rd.form(b, b) for b in rts})
        ratio = lens[-1] / lens[0]
        nlong = len([b for b in rts if rd.form(b, b) == lens[-1]])
        names.append(normalize(ident_component(len(g), len(rts), nlong, ratio)))
    rank_k = matrix(QQ, kroots).rank() if kroots else 0
    assert rank_k == n
    return sorted(names), dim_t - n


# ---------------------------------------------------------------------------
# Kac data of Table 7 (printed pp. 307-309): tau and x with
# alpha_i(x) = 1/2 on black vertices i >= 1, 0 on white ones (for outer
# automorphisms on the restrictions alpha_i|t, numbered as in g(C)^tau^).
# ---------------------------------------------------------------------------

def ident(l):
    return {i: i for i in range(1, l + 1)}


def flip_A(l):
    return {i: l + 1 - i for i in range(1, l + 1)}


def swap_D(l):
    t = ident(l)
    t[l - 1], t[l] = l, l - 1
    return t


TAU_E6 = {1: 5, 2: 4, 3: 3, 4: 2, 5: 1, 6: 6}


def kac(letter, l, tau, black):
    """x in h^tau with alpha_i(x) = 1/2 for i in `black` (and tau(i)), 0 on
    the other simple roots of g(C)."""
    rd = rootdata(letter, l)
    rhs = vector(QQ, [QQ(1) / 2 if (i in black or tau[i] in black) else 0
                      for i in range(1, l + 1)])
    x = rd.M.solve_right(rhs)  # alpha_i(x) = (M x)_i
    return rd, tau, x


def marks(rd):
    """Coefficients of the highest root (affine marks a_1..a_l)."""
    top = max(rd.pos, key=lambda v: sum(v))
    return top


# ---------------------------------------------------------------------------
# 1. Table 9
# ---------------------------------------------------------------------------

def table9_row(name, letter, l, black, arrows, sigma, r_map, mults,
               k_parts, dimk_printed, dimp_printed, rank_printed, kac_data,
               knapp):
    """One row of Table 9 for one value of the parameters.
    mults: {j: (dim g_lambda_j, dim g_2lambda_j)} as printed.
    knapp: (rank, (kind, n), [multiplicity sets by ascending length]) from
    Knapp (6.107)-(6.108), App. C."""
    rd = rootdata(letter, l)
    S = satake(rd, black, arrows)
    tag = '%s (%s%d)' % (name, letter, l)
    check(S['involution'] and S['permutes'], tag + ': theta involution of Delta')
    check(S['rank'] == rank_printed, tag + ': rk_R = printed')
    ok, lam = sigma_checks(rd, S, sigma[0], sigma[1], r_map)
    check(ok, tag + ': type of Sigma %s%d with printed r' % sigma)
    for j, (m1, m2) in mults.items():
        check(mult_of(S['mult'], lam[j]) == m1, tag + ': dim g_lambda_%d' % j)
        check(mult_of(S['mult'], 2 * lam[j]) == m2, tag + ': dim g_2lambda_%d' % j)
    check(S['dim_p'] == dimp_printed, tag + ': dim p = printed')
    check(S['dim_k'] == dimk_printed, tag + ': dim k = printed')
    names, centre = compact_type(k_parts)
    check(type_dim(names, centre) == dimk_printed, tag + ': dim of printed k')
    # k from the Kac diagram of Table 7
    krd, tau, x = kac_data
    kroots, dim_t = fixed_algebra(krd, tau, x)
    check(dim_t + len(kroots) == S['dim_k'], tag + ': dim k (Kac) = dim k (Satake)')
    check(reductive_type(krd, kroots, dim_t) == (names, centre),
          tag + ': type of k (Kac) = printed k')
    # literature (Knapp)
    kr, (kk, kn), kclasses = knapp
    check(kr == S['rank'] and (kk, kn) == sigma, tag + ': Knapp rank and Sigma')
    check(length_classes(rd, S['mult']) == [set([m]) for m in kclasses],
          tag + ': Knapp multiplicities')
    return S


def dims_so(n):
    return n * (n - 1) // 2


# --- page 327/328 (printed 312/313): sl, su, so(odd), sp -------------------
for l in range(1, MAX9 + 1):
    # sl_{l+1}(R): so_{l+1}, l(l+1)/2, l(l+3)/2, l; A_l, r = id, 1, 0
    n = l + 1
    kd = kac('A', l, flip_A(l), [] if n % 2 else [n // 2]) if l > 1 else \
        kac('A', 1, ident(1), [1])
    table9_row('sl_%d(R)' % n, 'A', l, [], {}, ('A', l),
               {j: j for j in range(1, l + 1)},
               {j: (1, 0) for j in range(1, l + 1)}, [('so', n)],
               l * (l + 1) // 2, l * (l + 3) // 2, l, kd, (l, ('A', l), [1]))

for p in range(1, (MAX9 - 1) // 2 + 1):
    # sl_{p+1}(H), l = 2p+1: sp_{p+1}, (p+1)(2p+3), p(2p+3), p; A_p,
    # r(alpha_2j) = lambda_j, 4, 0
    l = 2 * p + 1
    table9_row('sl_%d(H)' % (p + 1), 'A', l, range(1, l + 1, 2), {}, ('A', p),
               {2 * j: j for j in range(1, p + 1)},
               {j: (4, 0) for j in range(1, p + 1)}, [('sp', p + 1)],
               (p + 1) * (2 * p + 3), p * (2 * p + 3), p,
               kac('A', l, flip_A(l), []), (p, ('A', p), [4]))

# su_{p,l+1-p}.  Printed range (1 <= p <= 1/2): no integer p at all, yet
# su_{1,2} is a real form of sl_3(C) (checked just below) not covered by the
# other rows.  Corrected range 1 <= p <= l/2 (p < l + 1 - p).
refute(any(1 <= p <= QQ(1) / 2 for p in range(1, 10)),
       'p. 312: su_{p,l+1-p} (1 <= p <= 1/2) is a nonempty range')
for l in range(2, MAX9 + 1):
    for p in range(1, l // 2 + 1):
        q = l + 1 - p
        arrows = {}
        for j in range(1, p + 1):
            arrows[j], arrows[l + 1 - j] = l + 1 - j, j
        r_map = {}
        for j in range(1, p + 1):
            r_map[j] = r_map[l + 1 - j] = j
        mults = {j: (2, 0) for j in range(1, p)}
        mults[p] = (2 * (l + 1 - 2 * p), 1)
        S = table9_row('su_{%d,%d}' % (p, q), 'A', l, range(p + 1, l + 1 - p),
                       arrows, ('BC', p), r_map, mults, [('su', p), ('u', q)],
                       p * p + q * q - 1, 2 * p * q, p,
                       kac('A', l, ident(l), [p]),
                       (p, ('BC', p), ([2 * (q - p), 2, 1] if p > 1
                                       else [2 * (q - p), 1])))
        # printed first subrow "2 (j <= p + 1)" (p. 313): the condition takes
        # in j = p, where the multiplicity is 2(l + 1 - 2p) (second subrow).
        if l + 1 - 2 * p != 1:
            lam_p = restricted(rootdata('A', l), S['theta'], p)
            refute(mult_of(S['mult'], lam_p) == 2,
                   'p. 313: su_{%d,%d} dim g_lambda_j = 2 for j <= p + 1 (j = p)'
                   % (p, q))
# su_{p,p}, l = 2p - 1, p >= 2: su_p + u_p, 2p^2 - 1, 2p^2, p; C_p,
# r(alpha_j) = r(alpha_{2p-j}) = lambda_j, 2 (j <= p-1), 1 (j = p), 0
for p in range(2, (MAX9 + 1) // 2 + 1):
    l = 2 * p - 1
    arrows = {}
    r_map = {p: p}
    for j in range(1, p):
        arrows[j], arrows[2 * p - j] = 2 * p - j, j
        r_map[j] = r_map[2 * p - j] = j
    mults = {j: (2, 0) for j in range(1, p)}
    mults[p] = (1, 0)
    table9_row('su_{%d,%d}' % (p, p), 'A', l, [], arrows, ('C', p), r_map, mults,
               [('su', p), ('u', p)], 2 * p * p - 1, 2 * p * p, p,
               kac('A', l, ident(l), [p]), (p, ('C', p), [2, 1]))

# so_{p,2l+1-p} (1 <= p <= l): so_p + so_{2l+1-p}; dim k printed
# p(2p+1) + (2l+1-p)(4l+3-2p) -- refuted; corrected
# p(p-1)/2 + (2l+1-p)(2l-p)/2; dim p = p(2l+1-p); rk p; B_p, r = id,
# 1 (j <= p-1), 2(l-p)+1 (j = p), 0.
for l in range(1, MAX9 + 1):
    for p in range(1, l + 1):
        printed = p * (2 * p + 1) + (2 * l + 1 - p) * (4 * l + 3 - 2 * p)
        corrected = p * (p - 1) // 2 + (2 * l + 1 - p) * (2 * l - p) // 2
        refute(printed == dims_so(p) + dims_so(2 * l + 1 - p),
               'p. 312: dim k of so_{%d,%d} = p(2p+1) + (2l+1-p)(4l+3-2p)'
               % (p, 2 * l + 1 - p))
        mults = {j: (1, 0) for j in range(1, p)}
        mults[p] = (2 * (l - p) + 1, 0)
        even = p if p % 2 == 0 else 2 * l + 1 - p   # the even index 2k
        kk = even // 2
        kd = kac('B', l, ident(l), [kk]) if l > 1 else kac('B', 1, ident(1), [1])
        sig = ('B', p) if p > 1 else ('A', 1)
        # Knapp: B_p, long roots sl(2,R), short so(2l+2-2p, 1)
        cls = [2 * l + 1 - 2 * p, 1] if p > 1 else [2 * l + 1 - 2 * p]
        table9_row('so_{%d,%d}' % (p, 2 * l + 1 - p), 'B', l, range(p + 1, l + 1),
                   {}, sig, {j: j for j in range(1, p + 1)}, mults,
                   [('so', p), ('so', 2 * l + 1 - p)], corrected,
                   p * (2 * l + 1 - p), p, kd, (p, sig, cls))

for l in range(1, MAX9 + 1):
    # sp_2l(R): u_l, l^2, l(l+1), l; C_l, r = id, 1, 0
    sig = ('C', l) if l > 1 else ('A', 1)
    kd = kac('C', l, ident(l), [l])
    table9_row('sp_%d(R)' % (2 * l), 'C', l, [], {}, sig,
               {j: j for j in range(1, l + 1)}, {j: (1, 0) for j in range(1, l + 1)},
               [('u', l)], l * l, l * (l + 1), l, kd,
               (l, sig, [1, 1] if l > 1 else [1]))

# sp_{p,l-p}: printed range (1 <= p < (l-1)/2) misses p = (l-1)/2 (e.g.
# sp_{1,2}, l = 3), which no other row covers; corrected 1 <= p <= (l-1)/2.
for l in range(3, MAX9 + 1):
    for p in range(1, (l - 1) // 2 + 1):
        black = list(range(1, 2 * p, 2)) + list(range(2 * p + 1, l + 1))
        mults = {j: (4, 0) for j in range(1, p)}
        mults[p] = (4 * (l - 2 * p), 3)
        table9_row('sp_{%d,%d}' % (p, l - p), 'C', l, black, {}, ('BC', p),
                   {2 * j: j for j in range(1, p + 1)}, mults,
                   [('sp', p), ('sp', l - p)],
                   p * (2 * p + 1) + (l - p) * (2 * l - 2 * p + 1), 4 * p * (l - p),
                   p, kac('C', l, ident(l), [p]),
                   (p, ('BC', p), [4 * (l - 2 * p), 4, 3] if p > 1
                    else [4 * (l - 2 * p), 3]))
        if 2 * p == l - 1:
            refute(p < QQ(l - 1) / 2,
                   'p. 312: sp_{%d,%d} lies in the printed range p < (l-1)/2'
                   % (p, l - p))
for p in range(1, MAX9 // 2 + 1):
    # sp_{p,p}, l = 2p: sp_p + sp_p, 2p(2p+1), 4p^2, p; C_p, r(alpha_2j) =
    # lambda_j, 4 (j <= p-1), 3 (j = p), 0
    l = 2 * p
    mults = {j: (4, 0) for j in range(1, p)}
    mults[p] = (3, 0)
    sig = ('C', p) if p > 1 else ('A', 1)
    table9_row('sp_{%d,%d}' % (p, p), 'C', l, range(1, l, 2), {}, sig,
               {2 * j: j for j in range(1, p + 1)}, mults, [('sp', p), ('sp', p)],
               2 * p * (2 * p + 1), 4 * p * p, p, kac('C', l, ident(l), [p]),
               (p, sig, [4, 3] if p > 1 else [3]))

# --- page 329/330 (printed 314/315): so(even), u*(H), E6 --------------------
for l in range(4, MAX9 + 1):
    for p in range(1, l - 1):
        # so_{p,2l-p} (1 <= p <= l-2): p(p-1)/2 + (2l-p)(2l-p-1)/2, p(2l-p),
        # p; B_p, r = id, 1 (j <= p-1), 2(l-p) (j = p)
        mults = {j: (1, 0) for j in range(1, p)}
        mults[p] = (2 * (l - p), 0)
        if p % 2 == 0:
            kd = kac('D', l, ident(l), [p // 2])
        else:
            kd = kac('D', l, swap_D(l), [(p - 1) // 2] if p > 1 else [])
        sig = ('B', p) if p > 1 else ('A', 1)
        table9_row('so_{%d,%d}' % (p, 2 * l - p), 'D', l, range(p + 1, l + 1), {},
                   sig, {j: j for j in range(1, p + 1)}, mults,
                   [('so', p), ('so', 2 * l - p)],
                   p * (p - 1) // 2 + (2 * l - p) * (2 * l - p - 1) // 2,
                   p * (2 * l - p), p, kd,
                   (p, sig, [2 * (l - p), 1] if p > 1 else [2 * (l - p)]))
    # so_{l-1,l+1}: (l-1)(l-2)/2 + l(l+1)/2, l^2 - 1, l - 1; printed type
    # "B_{-1}" (p. 315) refuted, B_{l-1}; r(alpha_j) = lambda_j (j <= l-1),
    # r(alpha_l) = lambda_{l-1}; 1 (j <= l-2), 2 (j = l-1)
    refute(-1 == l - 1, 'p. 315: type of Sigma B_{-1} for so_{l-1,l+1}')
    r_map = {j: j for j in range(1, l)}
    r_map[l] = l - 1
    mults = {j: (1, 0) for j in range(1, l - 1)}
    mults[l - 1] = (2, 0)
    kd = kac('D', l, ident(l), [(l - 1) // 2]) if l % 2 else \
        kac('D', l, swap_D(l), [(l - 2) // 2])
    table9_row('so_{%d,%d}' % (l - 1, l + 1), 'D', l, [], {l - 1: l, l: l - 1},
               ('B', l - 1), r_map, mults, [('so', l - 1), ('so', l + 1)],
               (l - 1) * (l - 2) // 2 + l * (l + 1) // 2, l * l - 1, l - 1, kd,
               (l - 1, ('B', l - 1), [2, 1]))
    # so_{l,l}: l(l-1), l^2, l; D_l, r = id, 1, 0
    kd = kac('D', l, ident(l), [l // 2]) if l % 2 == 0 else \
        kac('D', l, swap_D(l), [(l - 1) // 2])
    table9_row('so_{%d,%d}' % (l, l), 'D', l, [], {}, ('D', l),
               {j: j for j in range(1, l + 1)}, {j: (1, 0) for j in range(1, l + 1)},
               [('so', l), ('so', l)], l * (l - 1), l * l, l, kd, (l, ('D', l), [1]))
for p in range(2, MAX9 // 2 + 1):
    # u*_2p(H), l = 2p: u_2p, 4p^2, 2p(2p-1), p; C_p, r(alpha_2j) = lambda_j,
    # 4 (j <= p-1), 1 (j = p), 0
    l = 2 * p
    mults = {j: (4, 0) for j in range(1, p)}
    mults[p] = (1, 0)
    table9_row('u*_%d(H)' % l, 'D', l, range(1, l, 2), {}, ('C', p),
               {2 * j: j for j in range(1, p + 1)}, mults, [('u', l)], 4 * p * p,
               2 * p * (2 * p - 1), p, kac('D', l, ident(l), [l]),
               (p, ('C', p), [4, 1]))
for p in range(2, (MAX9 - 1) // 2 + 1):
    # u*_{2p+1}(H), l = 2p+1: u_{2p+1}, (2p+1)^2, 2p(2p+1), p; BC_p,
    # r(alpha_2j) = lambda_j, r(alpha_{2p+1}) = lambda_p; 4; 0 (j <= p-1),
    # 1 (j = p)
    l = 2 * p + 1
    r_map = {2 * j: j for j in range(1, p + 1)}
    r_map[l] = p
    mults = {j: (4, 0) for j in range(1, p)}
    mults[p] = (4, 1)
    table9_row('u*_%d(H)' % l, 'D', l, range(1, 2 * p, 2), {l - 1: l, l: l - 1},
               ('BC', p), r_map, mults, [('u', l)], l * l, 2 * p * (2 * p + 1), p,
               kac('D', l, ident(l), [l]), (p, ('BC', p), [4, 4, 1]))

E6o = kac('E', 6, TAU_E6, [6])   # E I:  E6^(2), vertex 4 (= alpha_6|t)
table9_row('EI', 'E', 6, [], {}, ('E', 6), {j: j for j in range(1, 7)},
           {j: (1, 0) for j in range(1, 7)}, [('sp', 4)], 36, 42, 6, E6o,
           (6, ('E', 6), [1]))
table9_row('EII', 'E', 6, [], {1: 5, 5: 1, 2: 4, 4: 2}, ('F', 4),
           {1: 1, 5: 1, 2: 2, 4: 2, 3: 3, 6: 4},
           {1: (2, 0), 2: (2, 0), 3: (1, 0), 4: (1, 0)}, [('su', 2), ('su', 6)],
           38, 40, 4, kac('E', 6, ident(6), [2]), (4, ('F', 4), [2, 1]))
table9_row('EIII', 'E', 6, [2, 3, 4], {1: 5, 5: 1}, ('BC', 2),
           {1: 2, 5: 2, 6: 1}, {1: (6, 0), 2: (8, 1)}, [('so', 10), ('R',)],
           46, 32, 2, kac('E', 6, ident(6), [1]), (2, ('BC', 2), [8, 6, 1]))
table9_row('EIV', 'E', 6, [2, 3, 4, 6], {}, ('A', 2), {1: 1, 5: 2},
           {1: (8, 0), 2: (8, 0)}, [('F4',)], 52, 26, 2,
           kac('E', 6, TAU_E6, []), (2, ('A', 2), [8]))

# --- page 331/332 (printed 316/317): E7, E8, F4, G2 -------------------------
table9_row('EV', 'E', 7, [], {}, ('E', 7), {j: j for j in range(1, 8)},
           {j: (1, 0) for j in range(1, 8)}, [('su', 8)], 63, 70, 7,
           kac('E', 7, ident(7), [7]), (7, ('E', 7), [1]))
table9_row('EVI', 'E', 7, [1, 3, 7], {}, ('F', 4), {2: 1, 4: 2, 5: 3, 6: 4},
           {1: (4, 0), 2: (4, 0), 3: (1, 0), 4: (1, 0)}, [('su', 2), ('so', 12)],
           69, 64, 4, kac('E', 7, ident(7), [2]), (4, ('F', 4), [4, 1]))
# E VII: printed "1 (i = 3)" read as j = 3 (index letter).
table9_row('EVII', 'E', 7, [3, 4, 5, 7], {}, ('C', 3), {6: 1, 2: 2, 1: 3},
           {1: (8, 0), 2: (8, 0), 3: (1, 0)}, [('E6',), ('R',)], 79, 54, 3,
           kac('E', 7, ident(7), [1]), (3, ('C', 3), [8, 1]))
table9_row('EVIII', 'E', 8, [], {}, ('E', 8), {j: j for j in range(1, 9)},
           {j: (1, 0) for j in range(1, 9)}, [('so', 16)], 120, 128, 8,
           kac('E', 8, ident(8), [7]), (8, ('E', 8), [1]))
table9_row('EIX', 'E', 8, [4, 5, 6, 8], {}, ('F', 4), {7: 1, 3: 2, 2: 3, 1: 4},
           {1: (8, 0), 2: (8, 0), 3: (1, 0), 4: (1, 0)}, [('su', 2), ('E7',)],
           136, 112, 4, kac('E', 8, ident(8), [1]), (4, ('F', 4), [8, 1]))
table9_row('FI', 'F', 4, [], {}, ('F', 4), {j: j for j in range(1, 5)},
           {j: (1, 0) for j in range(1, 5)}, [('su', 2), ('sp', 3)], 24, 28, 4,
           kac('F', 4, ident(4), [4]), (4, ('F', 4), [1, 1]))
# F II: Knapp gives no multiplicities for F II (its rank-one subalgebra is
# F II itself); the Satake values 8, 7 are checked against the printed ones
# and against dim p = 1 + 8 + 7 = 16.
S = table9_row('FII', 'F', 4, [2, 3, 4], {}, ('BC', 1), {1: 1}, {1: (8, 7)},
               [('so', 9)], 36, 16, 1, kac('F', 4, ident(4), [1]),
               (1, ('BC', 1), [8, 7]))
table9_row('G', 'G', 2, [], {}, ('G', 2), {1: 1, 2: 2}, {1: (1, 0), 2: (1, 0)},
           [('so', 3), ('so', 3)], 6, 8, 2, kac('G', 2, ident(2), [2]),
           (2, ('G', 2), [1, 1]))

# Table 7 marks: a black vertex i >= 1 of a type I diagram has mark 2, the
# vertex p of a type II diagram (with vertex 0 black) has mark 1.
for (letter, l, i, m) in [('E', 6, 2, 2), ('E', 6, 1, 1), ('E', 7, 7, 2),
                          ('E', 7, 2, 2), ('E', 7, 1, 1), ('E', 8, 7, 2),
                          ('E', 8, 1, 2), ('F', 4, 4, 2), ('F', 4, 1, 2),
                          ('G', 2, 2, 2)]:
    check(marks(rootdata(letter, l))[i - 1] == m,
          'Table 7: mark of vertex %d of %s%d' % (i, letter, l))


# ---------------------------------------------------------------------------
# 2-3. Table 10
# ---------------------------------------------------------------------------

def lattices(rd, tau, x):
    kroots, dim_t = fixed_algebra(rd, tau, x)
    orbits = tau_orbits(tau, rd.l)
    L1 = [sum((rd.pic(i) for i in o), 0 * rd.h(1)) for o in orbits]
    QT = [sum((rd.h(i) for i in o), 0 * rd.h(1)) for o in orbits]
    L0 = [rd.coroot(b) for b in kroots]
    # Problem 5.3.30: P^v cap t = P^v(g(C)^tau^) (coweights of the fixed
    # algebra of tau^ with respect to t).
    if any(tau[i] != i for i in tau):
        fr, _ = fixed_algebra(rd, tau, 0 * rd.h(1))
        simple, _ = simple_system(fr)
        ok = len(simple) == len(QT)
        # L1 inside P^v(g^tau^) ...
        for v in L1:
            ok &= all(rd.ev(b, v) in ZZ for b in fr)
        # ... and the fundamental coweights of g^tau^ (in t) inside L1
        A = matrix(QQ, [[rd.ev(b, v) for v in QT] for b in simple])
        for i in range(len(simple)):
            c = A.solve_right(vector(QQ, [1 if j == i else 0
                                          for j in range(len(simple))]))
            y = sum((c[k] * QT[k] for k in range(len(QT))), 0 * rd.h(1))
            cc = coords(L1, y)
            ok &= cc is not None and is_integral(cc)
        check(ok, '%s%d: Problem 5.3.30, P^v cap t = P^v(g^tau^)'
              % (rd.letter, rd.l))
    return L1, QT, L0, kroots


def t10_row(name, letter, l, kd, zgens, lgens, centre_lin=None, pi1_lin=None,
            b0=None, eps_check=None, expect=True):
    """zgens, lgens: printed generators [(vector, order)], order 0 = oo.
    centre_lin, pi1_lin: (torsion list, free rank) of the named G_lin.
    expect=False: the printed row must fail (refuted reading)."""
    rd, tau, x = kd
    L1, QT, L0, kroots = lattices(rd, tau, x)
    tag = '%s (%s%d)' % (name, letter, l)
    okz = printed_group_is_quotient(L1, L0, zgens)
    okl = printed_group_is_quotient(QT, L0, lgens)
    if not expect:
        refute(okz and okl, tag + ': printed Z(G), Lambda(G)')
        return
    check(all(coords(L1, v) is not None and is_integral(coords(L1, v))
              for v, _ in zgens), tag + ': generators in P^v cap k(C)')
    check(okz, tag + ': Z(G) as printed')
    check(okl, tag + ': Lambda(G) as printed')
    if centre_lin is not None:
        check(quotient_invariants(L1, QT) == centre_lin, tag + ': Z(G_lin)')
        check(quotient_invariants(QT, L0) == pi1_lin, tag + ': pi_1(G_lin)')
    if b0 is not None:
        cb = coords(L1, b0)
        check(cb is not None and is_integral(cb), tag + ': b_0 in Z(G)')
        if eps_check is not None:
            check(eps_check(rd, tau, x, b0), tag + ': b_0 against the index')


def f14(rd, tau, x, b0):
    """(F14): for inner theta = exp(2 pi i ad x), exp(2 pi i Lambda(b_0)) =
    (-1)^(2 Lambda(2x + rho^v)) for all nu-invariant dominant Lambda."""
    assert all(tau[i] == i for i in tau)
    y = b0 - 2 * x - rd.rho_c()
    nu = rd.nu()
    ok = True
    for i in range(1, rd.l + 1):
        if nu[i] == i:
            ok &= y[i - 1] in ZZ
        else:
            ok &= (y[i - 1] + y[nu[i] - 1]) in ZZ
    return ok


def split_index(rd, tau, x, b0):
    """Split real forms: every self-conjugate irreducible representation is
    defined over R, index 1, so pi_i(b_0) must be an integer on the
    fundamental weights fixed by nu tau and on the sums over 2-orbits."""
    nt = {i: rd.nu()[tau[i]] for i in tau}
    return all((b0[i - 1] if nt[i] == i else b0[i - 1] + b0[nt[i] - 1]) in ZZ
               for i in range(1, rd.l + 1))


def slH_index(rd, tau, x, b0):
    """sl_p(H): Lambda^k C^2p has index (-1)^k (J^(tensor k) with J^2 = -1)."""
    return all((b0[k - 1] - QQ(k % 2) / 2) in ZZ for k in range(1, rd.l + 1))


def Z_h(rd, idxs, den=1):
    return sum((rd.h(i) for i in idxs), 0 * rd.h(1)) / den


INF = 0

# --- p. 334 (printed 319) ---------------------------------------------------
for p in range(1, MAX10 // 2 + 1):
    # sl_{2p+1}(R): <Z_1>_2, Z_1 = h_1 + h_{p+1}; Lambda <Z_1>_2;
    # SL_{2p+1}(R); b_0 = 0
    l = 2 * p
    rd = rootdata('A', l)
    kd = kac('A', l, flip_A(l), [])
    printed = rd.h(1) + rd.h(p + 1)
    corrected = rd.h(p) + rd.h(p + 1)
    if p >= 2:
        refute(act(flip_A(l), printed) == printed,
               'p. 319: Z_1 = h_1 + h_{p+1} lies in k(C) (sl_%d(R))' % (2 * p + 1))
        # the other tau-invariant candidate near the printed one,
        # h_1 + h_2p, is trivial in Z(G): not a generator
        L1_, QT_, L0_, _ = lattices(*kd)
        alt = rd.h(1) + rd.h(2 * p)
        check(printed_group_is_quotient(L1_, L0_ + [alt], [(corrected, 2)])
              and quotient_invariants(L1_, L0_ + [alt]) == ([2], 0),
              'sl_%d(R): h_1 + h_2p lies in Q^v(k\'), trivial in Z(G)'
              % (2 * p + 1))
    t10_row('sl_%d(R)' % (2 * p + 1), 'A', l, kd, [(corrected, 2)],
            [(corrected, 2)], ([], 0), ([2], 0), 0 * rd.h(1), split_index)
for p in range(1, (MAX10 - 1) // 4 + 1):
    # sl_{4p+2}(R): <Z_2>_4, Z_2 = (h_1 + h_3 + ... + h_{4p+1})/2;
    # Lambda <2Z_2>_2; SL_{4p+2}(R); b_0 = 0
    l = 4 * p + 1
    rd = rootdata('A', l)
    Z2 = Z_h(rd, range(1, l + 1, 2), 2)
    t10_row('sl_%d(R)' % (4 * p + 2), 'A', l, kac('A', l, flip_A(l), [2 * p + 1]),
            [(Z2, 4)], [(2 * Z2, 2)], ([2], 0), ([2], 0), 0 * rd.h(1), split_index)
for p in range(1, (MAX10 + 1) // 4 + 1):
    # sl_{4p}(R): <Z_2>_2 x <Z_3>_2, Z_2 = (h_1 + ... + h_{4p-1})/2,
    # Z_3 = h_2p; Lambda <Z_3>_2; SL_4p(R); b_0 = 0
    l = 4 * p - 1
    rd = rootdata('A', l)
    Z2, Z3 = Z_h(rd, range(1, l + 1, 2), 2), rd.h(2 * p)
    t10_row('sl_%d(R)' % (4 * p), 'A', l, kac('A', l, flip_A(l), [2 * p]),
            [(Z2, 2), (Z3, 2)], [(Z3, 2)], ([2], 0), ([2], 0), 0 * rd.h(1),
            split_index)
for p in range(2, (MAX10 + 1) // 2 + 1):
    # sl_p(H): <Z_2>_2, Z_2 = (h_1 + ... + h_{2p-1})/2; Lambda {e};
    # SL_p(H); b_0 = Z_2
    l = 2 * p - 1
    rd = rootdata('A', l)
    Z2 = Z_h(rd, range(1, l + 1, 2), 2)
    t10_row('sl_%d(H)' % p, 'A', l, kac('A', l, flip_A(l), []), [(Z2, 2)], [],
            ([2], 0), ([], 0), Z2, slH_index)
for n in range(2, MAX10 + 2):
    for p in range(1, n // 2 + 1):
        # su_{p,q}: <Z_4>_oo x <Z_5>_d, d = gcd(p,q); Z_4 = a pi_1 + b pi_{n-1},
        # aq + bp = d; Z_5 = (p pi_1 - q pi_{n-1})/d; Lambda
        # <pi_1 + pi_{n-1}>_oo; SU_{p,q}; b_0 = pi_p + rho
        q, l = n - p, n - 1
        rd = rootdata('A', l)
        d, a, b = xgcd(q, p)
        for t in (0, 1):   # two solutions of aq + bp = d
            aa, bb = a + t * (p // d), b - t * (q // d)
            Z4 = aa * rd.pic(1) + bb * rd.pic(l)
            Z5 = (p * rd.pic(1) - q * rd.pic(l)) / d
            t10_row('su_{%d,%d}' % (p, q), 'A', l, kac('A', l, ident(l), [p]),
                    [(Z4, INF), (Z5, d)], [(rd.pic(1) + rd.pic(l), INF)],
                    ([n], 0), ([], 1), rd.pic(p) + rd.rho_c(), f14)
for l in range(2, MAX10 + 1):
    # so_{2,2l-1}: <Z_1>_oo x <Z_2>_2, Z_1 = h_1, Z_2 = h_l/2; Lambda
    # <Z_1>_oo; Spin_{2,2l-1}; b_0 = (1 + l(l+1)/2) Z_2
    rd = rootdata('B', l)
    Z1, Z2 = rd.h(1), rd.h(l) / 2
    t10_row('so_{2,%d}' % (2 * l - 1), 'B', l, kac('B', l, ident(l), [1]),
            [(Z1, INF), (Z2, 2)], [(Z1, INF)], ([2], 0), ([], 1),
            (1 + l * (l + 1) // 2) * Z2, f14)
for l in range(2, MAX10 + 1):
    for p in range(2, l + 1):
        # printed "so_{2p,2(l-p)-1} (2 <= p <= l)": the subscripts add up to
        # 2l - 1, not 2l + 1; the G_lin column has Spin_{2p,2(l-p)+1}.
        refute(2 * p + 2 * (l - p) - 1 == 2 * l + 1,
               'p. 319: so_{2p,2(l-p)-1} is a real form of so_{2l+1}(C)')
        # <Z_1>_2 x <Z_2>_2, Z_1 = h_1, Z_2 = h_l/2; Lambda <Z_1>_2;
        # Spin_{2p,2(l-p)+1}; b_0 = (p + l(l+1)/2) Z_2.
        # Z_1 = h_1 (copied from the row so_{2,2l-1} above) is a coroot of
        # k = so_2p + so_{2(l-p)+1} for p >= 2 (alpha_1 is compact), so it is
        # trivial in Z(G): refuted.  Corrected Z_1 = h_p (cf. Z_3 = h_p in
        # the rows of so_2l(C)).
        rd = rootdata('B', l)
        Z1p, Z1, Z2 = rd.h(1), rd.h(p), rd.h(l) / 2
        kd = kac('B', l, ident(l), [p])
        b0 = (p + l * (l + 1) // 2) * Z2
        name = 'so_{%d,%d}' % (2 * p, 2 * (l - p) + 1)
        t10_row(name, 'B', l, kd, [(Z1p, 2), (Z2, 2)], [(Z1p, 2)],
                expect=False)
        if p < l:
            t10_row(name, 'B', l, kd, [(Z1, 2), (Z2, 2)], [(Z1, 2)],
                    ([2], 0), ([2], 0), b0, f14)
        else:
            # p = l, so_{2l,1}: the printed range includes it, but here also
            # Z_1 = h_l = 2 Z_2 is trivial: Z(G) = <Z_2>_2, Lambda(G) = {e},
            # G = Spin_{2l,1} (pi_1 = pi_1(Spin_2l) = 0, centre {+-1}).
            t10_row(name, 'B', l, kd, [(Z1, 2), (Z2, 2)], [(Z1, 2)],
                    expect=False)
            t10_row(name, 'B', l, kd, [(Z2, 2)], [], ([2], 0), ([], 0), b0,
                    f14)
for l in [2 * p + 1 for p in range(0, (MAX10 - 1) // 2 + 1)]:
    # sp_{4p+2}(R), l = 2p+1: <Z_1>_oo, Z_1 = (h_1 + h_3 + ... + h_l)/2;
    # Lambda <2Z_1>_oo; Sp_{4p+2}(R); b_0 = 0
    rd = rootdata('C', l)
    Z1 = Z_h(rd, range(1, l + 1, 2), 2)
    t10_row('sp_%d(R)' % (2 * l), 'C', l, kac('C', l, ident(l), [l]),
            [(Z1, INF)], [(2 * Z1, INF)], ([2], 0), ([], 1), 0 * Z1, f14)
for l in range(2, MAX10 + 1, 2):
    # sp_{4p}(R), l = 2p: <Z_1>_2 x <Z_2>_oo, Z_1 = (h_1 + ... + h_{2p-1})/2,
    # Z_2 = h_2p; Lambda <Z_2>_oo; Sp_4p(R); b_0 = 0
    rd = rootdata('C', l)
    Z1, Z2 = Z_h(rd, range(1, l, 2), 2), rd.h(l)
    t10_row('sp_%d(R)' % (2 * l), 'C', l, kac('C', l, ident(l), [l]),
            [(Z1, 2), (Z2, INF)], [(Z2, INF)], ([2], 0), ([], 1), 0 * Z1, f14)
for l in range(2, MAX10 + 1):
    for p in range(1, l // 2 + 1):
        # sp_{p,q}: <Z_1>_2, Z_1 = (h_1 + h_3 + ...)/2; Lambda {e}; Sp_{p,q};
        # b_0 = Z_1
        rd = rootdata('C', l)
        Z1 = Z_h(rd, range(1, l + 1, 2), 2)
        t10_row('sp_{%d,%d}' % (p, l - p), 'C', l, kac('C', l, ident(l), [p]),
                [(Z1, 2)], [], ([2], 0), ([], 0), Z1, f14)

# --- p. 335 (printed 320) ---------------------------------------------------
for l in range(3, MAX10 + 1):
    # so_{2,2l-2}: <Z_1>_oo x <Z_2>_2, Z_1 = pi_{l-1}, Z_2 = (h_{l-1}+h_l)/2;
    # Lambda <2Z_1>_oo (l even), <2Z_1 + Z_2> (l odd; printed without the
    # order, which is oo); Spin_{2,2l-2}; b_0 = Z_2 if l = 4q+2, 4q+3,
    # 0 otherwise.  The printed b_0 is refuted for even l (F14 with
    # 2u = pi_1: b_0 = (1 + l(l-1)/2) Z_2); corrected: Z_2 if l = 4q or
    # 4q+1, 0 otherwise (for odd l either choice acts trivially on the
    # self-conjugate representations).
    rd = rootdata('D', l)
    Z1, Z2 = rd.pic(l - 1), (rd.h(l - 1) + rd.h(l)) / 2
    lam = 2 * Z1 if l % 2 == 0 else 2 * Z1 + Z2
    kd = kac('D', l, ident(l), [1])
    b0_printed = Z2 if l % 4 in (2, 3) else 0 * Z2
    b0 = Z2 if l % 4 in (0, 1) else 0 * Z2
    if l % 2 == 0:
        refute(f14(kd[0], kd[1], kd[2], b0_printed),
               'p. 320: b_0 of so_{2,%d} (Z_2 iff l = 4q+2, 4q+3)' % (2 * l - 2))
    else:
        check(f14(kd[0], kd[1], kd[2], b0_printed),
              'p. 320: b_0 of so_{2,%d} as printed (odd l)' % (2 * l - 2))
    t10_row('so_{2,%d}' % (2 * l - 2), 'D', l, kd,
            [(Z1, INF), (Z2, 2)], [(lam, INF)],
            ([4], 0) if l % 2 else ([2, 2], 0), ([], 1), b0, f14)
for l in range(4, MAX10 + 1):
    rd = rootdata('D', l)
    Z1, Z2 = rd.pic(l - 1), (rd.h(l - 1) + rd.h(l)) / 2
    for p in range(2, l // 2 + 1):
        kd = kac('D', l, ident(l), [p])
        name = 'so_{%d,%d}' % (2 * p, 2 * (l - p))
        if l % 2:
            # l = 2q+1: <Z_1>_4 x <Z_3>_2, Z_3 = h_p; Lambda <Z_3>_2;
            # b_0 = (p + q) Z_2
            q = (l - 1) // 2
            Z3 = rd.h(p)
            t10_row(name, 'D', l, kd, [(Z1, 4), (Z3, 2)], [(Z3, 2)],
                    ([4], 0), ([2], 0), (p + q) * Z2, f14)
        elif p % 2:
            # l = 2q, p odd: <Z_1>_4 x <Z_4>_2, Z_4 = h_p + (h_{l-1}+h_l)/2;
            # Lambda <2Z_1>_2; b_0 = (1 + q) Z_2
            q = l // 2
            Z4 = rd.h(p) + Z2
            t10_row(name, 'D', l, kd, [(Z1, 4), (Z4, 2)], [(2 * Z1, 2)],
                    ([2, 2], 0), ([2], 0), (1 + q) * Z2, f14)
        else:
            # l, p even: <Z_1>_2 x <Z_4>_2 x <Z_5>_2, Z_5 = pi_l;
            # Lambda <Z_1 + Z_4 + Z_5>_2; b_0 = q Z_2
            q = l // 2
            Z4, Z5 = rd.h(p) + Z2, rd.pic(l)
            t10_row(name, 'D', l, kd, [(Z1, 2), (Z4, 2), (Z5, 2)],
                    [(Z1 + Z4 + Z5, 2)], ([2, 2], 0), ([2], 0), q * Z2, f14)


def so_oddodd_index(p):
    """Index of the half-spinor representations of so_{2p+1,2(l-p)-1}
    (l odd, the only case where they are self-conjugate), from the exact
    Clifford computation below (section 3a), used through spin_index."""
    def test(rd, tau, x, b0):
        l = rd.l
        ok = all(b0[i - 1] in ZZ for i in range(1, l - 1))   # Lambda^i R^2l
        if l % 2 == 0:
            return ok and (b0[l - 2] + b0[l - 1]) in ZZ
        e = spin_index(2 * p + 1, 2 * (l - p) - 1)
        return ok and e[0] == 'self' and \
            ((-1) ** int(2 * b0[l - 1]) == e[1]) and \
            ((-1) ** int(2 * b0[l - 2]) == e[1])
    return test


# ---------------------------------------------------------------------------
# 3a. Spinor indices from explicit gamma matrices (monomial matrices over
#     Z[i]).  A monomial matrix is (perm, phase): e_j -> phase[j] e_perm[j].
# ---------------------------------------------------------------------------
K = QuadraticField(-1, 'i')
I = K.gen()


def mono_mul(A, B):
    pa, fa = A
    pb, fb = B
    return ([pa[pb[j]] for j in range(len(pb))],
            [fb[j] * fa[pb[j]] for j in range(len(pb))])


def mono_conj(A):
    return (A[0], [f.conjugate() for f in A[1]])


def mono_scale(c, A):
    return (A[0], [c * f for f in A[1]])


def gammas(n):
    """gamma_1..gamma_n of Cl_n(C) on C^(2^m), m = [n/2] (Pauli products)."""
    m = n // 2
    dim = 2 ** m
    out = []

    def bit(j, t):
        return (j >> (t - 1)) & 1

    for k in range(1, m + 1):
        for kind in (1, 2):
            perm, ph = [], []
            for j in range(dim):
                s = K(1)
                for t in range(1, k):
                    s *= (-1) ** bit(j, t)
                if kind == 2:
                    s *= I if bit(j, k) == 0 else -I
                perm.append(j ^ (1 << (k - 1)))
                ph.append(s)
            out.append((perm, ph))
    if n % 2:
        out.append((list(range(dim)),
                    [K((-1) ** sum(bit(j, t) for t in range(1, m + 1)))
                     for j in range(dim)]))
    return out


def is_scalar(A):
    return A[0] == list(range(len(A[0]))) and len(set(A[1])) == 1


_SPIN = {}


def spin_index(P, Q):
    """For spin(P, Q) (Gamma_a^2 = +1 for a <= P, -1 after) on the spinor
    space (n = P + Q odd) or on S^+ (n even): ('self', eps) if there is an
    antilinear J commuting with spin(P, Q), J^2 = eps; ('swap', None) if
    conj S^+ = S^-."""
    if (P, Q) in _SPIN:
        return _SPIN[(P, Q)]
    n = P + Q
    g = gammas(n)
    dim = len(g[0][0])
    one = (list(range(dim)), [K(1)] * dim)
    # Clifford relations
    for a in range(n):
        assert mono_mul(g[a], g[a]) == one
        for b in range(a + 1, n):
            assert mono_mul(g[a], g[b]) == mono_scale(-1, mono_mul(g[b], g[a]))
    Gam = [g[a] if a < P else mono_scale(I, g[a]) for a in range(n)]
    s = []
    for a in range(n):
        c = mono_conj(Gam[a])
        if c == Gam[a]:
            s.append(1)
        else:
            assert c == mono_scale(-1, Gam[a])
            s.append(-1)
    Sset = [a for a in range(n) if s[a] == -1]
    B = one
    for a in Sset:
        B = mono_mul(B, Gam[a])
    gens = [mono_mul(Gam[a], Gam[b]) for a in range(n) for b in range(a + 1, n)]
    for X in gens:
        assert mono_mul(B, mono_conj(X)) == mono_mul(X, B)
    c = mono_mul(B, mono_conj(B))
    assert is_scalar(c)
    eps = int(c[1][0])
    assert eps in (1, -1)
    res = ('self', eps)
    if n % 2 == 0:
        omega = one
        for a in range(n):
            omega = mono_mul(omega, g[a])
        assert omega[0] == list(range(dim))   # diagonal chirality
        BO, OB = mono_mul(B, mono_conj(omega)), mono_mul(omega, B)
        # J omega = conj-linear: J(omega v) = B conj(omega) conj(v)
        if BO == OB or BO == mono_scale(-1, OB):
            # J preserves the eigenspaces of omega iff it maps the
            # eigenvalue c of omega on S^+ to itself
            lam_p = omega[1][0]
            imgs = {omega[1][j] for j in range(dim)}
            assert len(imgs) == 2
            # J maps the c-eigenspace to the conj(c)*(sign)-eigenspace
            sign = 1 if BO == OB else -1
            res = ('self', eps) if sign * lam_p.conjugate() == lam_p else \
                ('swap', None)
        else:
            raise AssertionError
    _SPIN[(P, Q)] = res
    return res


def spin_index_linear(P, Q):
    """Brute force for small n: all C with C conj(X) = X C on the spinor
    space (or S^+), X = Gamma_a Gamma_(a+1); kernel dimension and sign of
    C conj(C)."""
    n = P + Q
    g = gammas(n)
    dim = len(g[0][0])

    def dense(A):
        Mx = matrix(K, dim, dim)
        for j in range(dim):
            Mx[A[0][j], j] = A[1][j]
        return Mx

    Gam = [dense(g[a]) if a < P else I * dense(g[a]) for a in range(n)]
    idx = list(range(dim))
    if n % 2 == 0:
        om = dense(g[0])
        for a in range(1, n):
            om = om * dense(g[a])
        c0 = om[0, 0]
        idx = [j for j in range(dim) if om[j, j] == c0]
    Xs = [(Gam[a] * Gam[a + 1]).matrix_from_rows_and_columns(idx, idx)
          for a in range(n - 1)]
    d = len(idx)
    rows = []
    for X in Xs:
        Xc = X.apply_map(lambda z: z.conjugate())
        for r in range(d):
            for cc in range(d):
                # (C Xc - X C)[r, cc] = sum_k C[r,k] Xc[k,cc] - X[r,k] C[k,cc]
                row = [K(0)] * (d * d)
                for k in range(d):
                    row[r * d + k] += Xc[k, cc]
                    row[k * d + cc] -= X[r, k]
                rows.append(row)
    Ker = matrix(K, rows).right_kernel()
    if Ker.dimension() == 0:
        return ('swap', None)
    assert Ker.dimension() == 1
    C = matrix(K, d, d, list(Ker.basis()[0]))
    CC = C * C.apply_map(lambda z: z.conjugate())
    lam = CC[0, 0]
    assert CC == lam * identity_matrix(K, d) and lam in QQ and lam != 0
    return ('self', 1 if lam > 0 else -1)


# Machinery: compact so(n) against Table 3 (printed p. 298), b:
# B_l: skew iff l = 4q+1, 4q+2; D_l (l even): skew iff l = 4q+2.
for n in range(3, 19):
    e = spin_index(n, 0)
    l = n // 2
    if n % 2:
        check(e == ('self', -1 if l % 4 in (1, 2) else 1),
              'compact so(%d) spinor index vs Table 3' % n)
    elif l % 2 == 0:
        check(e == ('self', -1 if l % 4 == 2 else 1),
              'compact so(%d) half-spinor index vs Table 3' % n)
    else:
        check(e[0] == 'swap', 'compact so(%d): S^+ and S^- conjugate' % n)
for n in range(3, 9):
    for P in range(0, n + 1):
        check(spin_index_linear(P, n - P) == spin_index(P, n - P),
              'J unique up to a scalar, same sign: so(%d,%d)' % (P, n - P))


def predicted_eps_from_b0(l, b0_coef):
    return (-1) ** (b0_coef % 2)


# The so rows of Table 10 against the explicit spinor index, n = P + Q <= 18.
# B_l (n = 2l+1): the even one of P, Q is 2k; k = 1: b_0 = (1 + l(l+1)/2)Z_2,
# k >= 2: b_0 = (k + l(l+1)/2)Z_2 (p. 319); spinor weight pi_l, pi_l(Z_2) = 1/2.
for l in range(1, 9):
    for k in range(1, l + 1):
        P, Q = 2 * k, 2 * (l - k) + 1
        coef = (1 if k == 1 else k) + l * (l + 1) // 2
        check(spin_index(P, Q) == ('self', predicted_eps_from_b0(l, coef)),
              'so_{%d,%d}: printed b_0 gives the spinor index' % (P, Q))
# D_l (n = 2l), both even: so_{2,2l-2}: Z_2 if l = 4q+2, 4q+3; so_{2p,2(l-p)}:
# (p+q)Z_2 (l = 2q+1), (1+q)Z_2 (l = 2q, p odd), qZ_2 (l, p even).
for l in range(3, 10):
    for k in range(1, l // 2 + 1):
        P, Q = 2 * k, 2 * (l - k)
        if k == 1:
            coef = 1 if l % 4 in (0, 1) else 0          # corrected
            if l % 2 == 0:
                printed = 1 if l % 4 in (2, 3) else 0
                refute(spin_index(P, Q) == ('self', predicted_eps_from_b0(
                    l, printed)), 'p. 320: b_0 of so_{2,%d}' % Q)
        elif l % 2:
            coef = k + (l - 1) // 2
        elif k % 2:
            coef = 1 + l // 2
        else:
            coef = l // 2
        e = spin_index(P, Q)
        if l % 2:
            check(e[0] == 'swap', 'so_{%d,%d}: S^+- conjugate (b_0 free)' % (P, Q))
        else:
            check(e == ('self', predicted_eps_from_b0(l, coef)),
                  'so_{%d,%d}: printed b_0 gives the half-spinor index' % (P, Q))
# D_l, both odd: so_{2p+1,2(l-p)-1}, printed b_0 = 0 (p. 320).  Refuted for
# odd l with p + (l-1)/2 odd, e.g. so_{3,7}: the half-spinors are
# quaternionic.  Corrected: b_0 = (p + (l-1)(l-2)/2) Z_2 (for even l any
# multiple of Z_2 serves: the half-spinors are not self-conjugate).
for l in range(3, 10):
    for p in range(0, (l - 1) // 2 + 1):
        P, Q = 2 * p + 1, 2 * (l - p) - 1
        e = spin_index(P, Q)
        coef = p + (l - 1) * (l - 2) // 2
        if l % 2 == 0:
            check(e[0] == 'swap', 'so_{%d,%d}: S^+- conjugate' % (P, Q))
            continue
        check(e == ('self', predicted_eps_from_b0(l, coef)),
              'so_{%d,%d}: corrected b_0 gives the half-spinor index' % (P, Q))
        if p >= 1 and coef % 2 == 1:
            refute(e == ('self', 1),
                   'p. 320: b_0 = 0 for so_{%d,%d}' % (P, Q))
check(spin_index(3, 7) == ('self', -1), 'so_{3,7}: half-spinors quaternionic')

for l in range(3, MAX10 + 1):
    rd = rootdata('D', l)
    Z2 = (rd.h(l - 1) + rd.h(l)) / 2
    for p in range(1, (l - 1) // 2 + 1):
        # so_{2p+1,2(l-p)-1} (1 <= p <= [(l-1)/2]): <Z_2>_2 x <Z_3>_2,
        # Z_3 = h_p; Lambda <Z_3>_2; G_lin printed Spin_{2p+1,2(l-p)+1}
        # (subscripts add up to 2l + 2: refuted), Spin_{2p+1,2(l-p)-1}.
        refute(2 * p + 1 + 2 * (l - p) + 1 == 2 * l,
               'p. 320: G_lin = Spin_{2p+1,2(l-p)+1} for so_{2l}(C)')
        kd = kac('D', l, swap_D(l), [p])
        Z3 = rd.h(p)
        t10_row('so_{%d,%d}' % (2 * p + 1, 2 * (l - p) - 1), 'D', l, kd,
                [(Z2, 2), (Z3, 2)], [(Z3, 2)], ([2], 0), ([2], 0),
                (p + (l - 1) * (l - 2) // 2) * Z2, so_oddodd_index(p))
    # p = 0, so_{1,2l-1} (not in the table; l >= 4 is not isomorphic to any
    # listed row): Z(G) = <Z_2>_2, Lambda(G) = {e}, G = Spin_{1,2l-1}.
    t10_row('so_{1,%d}' % (2 * l - 1), 'D', l, kac('D', l, swap_D(l), []),
            [(Z2, 2)], [], ([2], 0), ([], 0),
            ((l - 1) * (l - 2) // 2) * Z2, so_oddodd_index(0))
for l in range(3, MAX10 + 1, 2):
    # u*_l(H), l = 2p+1: <Z_6>_oo, Z_6 = pi_{l-1} - p(h_{l-1}+h_l)/2;
    # Lambda <4Z_6>_oo; two-sheeted covering of U*_l(H) (centre of order 4,
    # pi_1 = Z); b_0 = (h_1 + h_3 + ... + h_{2p-1})/2 + (h_2p - h_{2p+1})/4
    p = (l - 1) // 2
    rd = rootdata('D', l)
    Z6 = rd.pic(l - 1) - p * (rd.h(l - 1) + rd.h(l)) / 2
    b0 = Z_h(rd, range(1, 2 * p, 2), 2) + (rd.h(2 * p) - rd.h(2 * p + 1)) / 4
    t10_row('u*_%d(H)' % l, 'D', l, kac('D', l, ident(l), [l]), [(Z6, INF)],
            [(4 * Z6, INF)], ([4], 0), ([], 1), b0, f14)
for l in (6, 10):
    # u*_l(H), l = 4p+2: <Z_7>_2 x <Z_8>_oo, Z_7 = pi_{l-1} - p(h_{l-1}+h_l),
    # Z_8 = pi_l - p(h_{l-1}+h_l); Lambda <2Z_8>_oo;
    # b_0 = (h_1 + h_3 + ... + h_{4p+1})/2
    p = (l - 2) // 4
    rd = rootdata('D', l)
    s = rd.h(l - 1) + rd.h(l)
    Z7, Z8 = rd.pic(l - 1) - p * s, rd.pic(l) - p * s
    t10_row('u*_%d(H)' % l, 'D', l, kac('D', l, ident(l), [l]),
            [(Z7, 2), (Z8, INF)], [(2 * Z8, INF)], ([2, 2], 0), ([], 1),
            Z_h(rd, range(1, l, 2), 2), f14)
for l in (4, 8):
    # u*_l(H), l = 4p: <Z_9>_2 x <Z_10>_oo, Z_9 = pi_l - p(h_{l-1}+h_l),
    # Z_10 = pi_{l-1} - p(h_{l-1}+h_l); Lambda <2Z_10>_oo;
    # b_0 = (h_1 + h_3 + ... + h_{4p-1})/2
    p = l // 4
    rd = rootdata('D', l)
    s = rd.h(l - 1) + rd.h(l)
    Z9, Z10 = rd.pic(l) - p * s, rd.pic(l - 1) - p * s
    t10_row('u*_%d(H)' % l, 'D', l, kac('D', l, ident(l), [l]),
            [(Z9, 2), (Z10, INF)], [(2 * Z10, INF)], ([2, 2], 0), ([], 1),
            Z_h(rd, range(1, l, 2), 2), f14)

# --- p. 336 (printed 321): exceptional rows ---------------------------------
rd = rootdata('E', 6)
Z2e6 = (rd.h(1) - rd.h(2) + rd.h(4) - rd.h(5)) / 3
t10_row('EI', 'E', 6, kac('E', 6, TAU_E6, [6]), [(rd.h(6), 2)], [(rd.h(6), 2)],
        b0=0 * Z2e6, eps_check=split_index)
t10_row('EII', 'E', 6, kac('E', 6, ident(6), [2]), [(Z2e6, 6)], [(3 * Z2e6, 2)],
        b0=0 * Z2e6, eps_check=f14)
t10_row('EIII', 'E', 6, kac('E', 6, ident(6), [1]), [(Z2e6, INF)],
        [(3 * Z2e6, INF)], b0=2 * Z2e6, eps_check=f14)
t10_row('EIV', 'E', 6, kac('E', 6, TAU_E6, []), [], [], b0=0 * Z2e6)
rd = rootdata('E', 7)
Z1e7 = (rd.h(1) + rd.h(3) + rd.h(7)) / 2
t10_row('EV', 'E', 7, kac('E', 7, ident(7), [7]), [(Z1e7, 4)], [(2 * Z1e7, 2)],
        b0=0 * Z1e7, eps_check=f14)
t10_row('EVI', 'E', 7, kac('E', 7, ident(7), [2]), [(Z1e7, 2), (rd.h(2), 2)],
        [(rd.h(2), 2)], b0=Z1e7, eps_check=f14)
t10_row('EVII', 'E', 7, kac('E', 7, ident(7), [1]), [(Z1e7, INF)],
        [(2 * Z1e7, INF)], b0=0 * Z1e7, eps_check=f14)
rd = rootdata('E', 8)
t10_row('EVIII', 'E', 8, kac('E', 8, ident(8), [7]), [(rd.h(7), 2)],
        [(rd.h(7), 2)], b0=0 * rd.h(1), eps_check=f14)
t10_row('EIX', 'E', 8, kac('E', 8, ident(8), [1]), [(rd.h(1), 2)],
        [(rd.h(1), 2)], b0=0 * rd.h(1), eps_check=f14)
rd = rootdata('F', 4)
t10_row('FI', 'F', 4, kac('F', 4, ident(4), [4]), [(rd.h(4), 2)],
        [(rd.h(4), 2)], b0=0 * rd.h(1), eps_check=f14)
t10_row('FII', 'F', 4, kac('F', 4, ident(4), [1]), [], [], b0=0 * rd.h(1),
        eps_check=f14)
rd = rootdata('G', 2)
t10_row('G', 'G', 2, kac('G', 2, ident(2), [2]), [(rd.h(2), 2)],
        [(rd.h(2), 2)], b0=0 * rd.h(1), eps_check=f14)

print('ok tables-9-10: %d checks' % CHECKS)
