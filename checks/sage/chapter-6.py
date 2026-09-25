"""Exact checks of Chapter 6, "Levi Decomposition" (Onishchik-Vinberg 1990).

File: content/60-levi-decomposition.typ, printed pp. 282-288; the
corrections are in corrections.json.

The chapter proves general theorems and prints no tables.  The expected
values are the book's statements, taken from the printed book (page at every
check): inclusions of subspaces, "dim P - dim Q = 1" (p. 283), "n(h) = h" (p. 286)
and so on.  They are tested on explicit Lie algebras over QQ, realised as
matrix Lie algebras (structure constants computed from commutators, closure
asserted):

  name           g                              dim  rad  rad comm.  z(g)
  sl2            sl_2 (semisimple)                3    0     -        0
  sl2_K2         sl_2 x| K^2                      5    2    yes       0
  sl3_K3         sl_3 x| K^3                     11    3    yes       0
  takiff         sl_2 x| sl_2 (abelian ideal,     6    3    yes       0
                 adjoint action)
  sl2_K2_plus_K  (sl_2 x| K^2) + K                6    3    yes       1
  gl2            gl_2 (reductive)                 4    1    yes       1
  aff1           gl_1 x| K                        2    2    no        0
  aff2, aff3     gl_n x| K^n (affine algebra)  6, 12 3, 4   no        0
  jacobi         sl_2 x| heis_3 (Jacobi algebra)  6    3    no        1
  p21            parabolic of sl_3, blocks 2+1    6    3    no        0
  p22            parabolic of sl_4, blocks 2+2   11    5    no        0
  borel3         Borel subalgebra of sl_3         5    5    no        0

These data are derived by hand from the definitions (not from the book) and
checked here.  rad g is computed as the Killing orthogonal of [g, g] and then
certified independently: it is a solvable ideal and g/rad g has a
nondegenerate Killing form (Cartan's criterion), so it is the largest
solvable ideal (the argument of Problem 7).

Checked here, with the printed reading kept as a refuted check where the
book is wrong:

* (1), p. 282: a Levi subalgebra l is a complement of rad g and a
  subalgebra; the printed direct-sum sign would make l an ideal (refuted).
* P, Q, R of p. 282 and Problems 5, 6 (p. 283) in every example with
  rad g != 0.  Printed P ("v(g) = rad g") is not a subspace (refuted); the
  corrected P ("v(g) subset rad g") is.  Q subset P and dim P - dim Q = 1
  always (dim P = (n - k) k + 1).  Printed Problem 5 "R subset Q subset P"
  fails for every example with non-commutative radical (refuted); exactly:
  R cap P = R cap Q = ad z(rad g), so R subset Q iff R subset P iff rad g
  is commutative; the corrected Problem 5 "Q subset P, dim P - dim Q = 1.
  If rad g is commutative then R subset Q" holds everywhere.  Degenerate
  case rad g = 0 (sl2): P = Q = 0.  Problem 6: P, Q, R are rho(g)-invariant and
  rho(x)P subset Q for all x in g (corrected; the printed "x in rad g" also
  holds but gives nothing for x outside rad g, which the next paragraph
  needs); rho(x)P subset R for x in rad g when rad g is commutative, and not
  in general (aff2, aff3, jacobi, p21, p22).
* The paragraph after Problem 6 and Problems 3, 4 with Hint 4 (pp. 283,
  288), whenever rad g is commutative and z(g) = 0: the space W0 of v in P
  with rho(g)v subset R is not inside Q; v0 in W0 with v0|rad g = E is a
  projection normalising ad g; delta with [h, ad x] = ad delta(x) is a
  derivation, a projection onto rad g, and ker delta is a Levi subalgebra.
  Outside the standing assumption Hint 4's "clearly delta is a projection"
  fails: aff1 with h = id gives delta = 0 (Problem 4 itself stays true).
* The whole proof of Theorem 1 (p. 283), run recursively on every example:
  non-commutative case (Problems 7, 8, g_1 = g/(rad g)', g_2 = pi^-1(l_1)),
  commutative case with z(g) = 0 (P, Q, R), commutative case with
  z(g) != 0 (Problem 8, g_1, Problem 5.2.30).  Each branch is exercised.
  Problems 1, 7 and 8 on the ideals of each example.
* Theorem 3 (Malcev) and Corollary 1 (p. 285): for sl2_K2, sl3_K3, takiff,
  aff2 and jacobi all Levi subalgebras (the graphs x + C x, C: l -> rad g,
  that are subalgebras: an ideal I in the entries of C) are exactly
  exp(ad z) l with z in a nilpotent ideal N inside rad g: exp(ad z) l
  satisfies I identically in z, and every entry of C - C(tau(C)) lies in I
  (Groebner reduction), where tau is a linear left inverse of
  z -> C(z); I has dimension dim N (for jacobi it is quadratic, a genuinely
  non-linear family).  exp(ad z) is an automorphism (Problem 2).  For the three
  commutative examples the P, Q, R construction started from h + ad z
  gives ker = exp(-ad z) ker delta, so it produces every Levi subalgebra.
* Case a) of the proof of Theorem 4 (p. 286), at the Lie algebra level:
  n(h) cap rad g = z(g) when rad g is commutative (and n(h) = h if
  z(g) = 0); aff2 shows that the step uses commutativity.
* Problem 9 (p. 284) for dim V = 1..4: the three descriptions of the group
  (preserves the hyperplane (V, 1); preserves V and is the identity on W/V;
  GL(W; W, V) of Example 3.1.1.3, p. 99-100: (X - E)W subset V) cut out the
  same ideal; the induced map is affine and composition is matrix product.
  Lemma 1 (p. 284) on the affine action x -> g x + (g - E) w of SL_2:
  the invariant complement of V meets the hyperplane in the fixed point.

NOT established: the general theorems.  Every statement is checked for the
listed algebras only (all over QQ; an identity or ideal membership over QQ
holds over every field of characteristic 0, in particular over RR and CC).
Group-level statements (Theorem 2, Theorems 3-5 for groups, Problems 10-19,
the exercises) are not computed; the log records the logical checks of
Hint 14 and of the references.

Run with:  sage -python checks/sage/chapter-6.py
"""
from itertools import combinations

from sage.all import (QQ, PolynomialRing, VectorSpace, factorial,
                      identity_matrix, matrix, vector, zero_matrix)

CHECKS = []


def check(condition, where):
    """A statement of the book (or a fact about an example) that holds."""
    assert condition, 'FAILED: ' + where
    CHECKS.append(where)


def refuted(condition, where):
    """The printed reading, kept as a check that must FAIL."""
    assert not condition, 'printed reading unexpectedly holds: ' + where
    CHECKS.append('REFUTED ' + where)


# ------------------------------------------------------------ Lie algebras


class Lie:
    """A Lie algebra over QQ with basis e_0..e_(n-1); ads[i] is the matrix
    of ad e_i (column j = coordinates of [e_i, e_j])."""

    def __init__(self, name, ads):
        self.name = name
        self.ads = [matrix(QQ, a) for a in ads]
        self.n = len(self.ads)
        self.V = VectorSpace(QQ, self.n)

    @classmethod
    def from_matrices(cls, name, mats):
        mats = [matrix(QQ, m) for m in mats]
        flat = matrix(QQ, [m.list() for m in mats]).transpose()
        assert flat.rank() == len(mats), name
        ads = []
        for a in mats:
            cols = []
            for b in mats:
                k = vector(QQ, (a * b - b * a).list())
                c = flat.solve_right(k)
                assert flat * c == k, name + ': not closed under [ , ]'
                cols.append(c)
            ads.append(matrix(QQ, cols).transpose())
        g = cls(name, ads)
        g.mats = mats
        g.flat = flat
        return g

    def coords(self, m):
        """Coordinates of a matrix of the matrix realisation."""
        return self.flat.solve_right(vector(QQ, matrix(QQ, m).list()))

    def ad(self, x):
        ring = x.base_ring()
        out = zero_matrix(ring, self.n)
        for i in range(self.n):
            if x[i] != 0:
                out += x[i] * self.ads[i]
        return out

    def br(self, x, y):
        return self.ad(x) * y

    def span(self, vecs):
        return self.V.subspace([vector(QQ, v) for v in vecs])

    def bracket(self, A, B):
        return self.span([self.br(a, b) for a in A.basis()
                          for b in B.basis()])

    def is_ideal(self, A):
        return self.bracket(self.V, A).is_subspace(A)

    def is_subalgebra(self, A):
        return self.bracket(A, A).is_subspace(A)

    def is_solvable(self, A):
        while A.dimension() > 0:
            B = self.bracket(A, A)
            if B == A:
                return False
            A = B
        return True

    def killing(self):
        return matrix(QQ, self.n, self.n,
                      lambda i, j: (self.ads[i] * self.ads[j]).trace())

    def is_semisimple(self):
        """Cartan's criterion (the zero algebra counts as semisimple)."""
        return self.n == 0 or self.killing().det() != 0

    def centralizer(self, A, B):
        """{x in A : [x, B] = 0}."""
        Ab, Bb = A.basis(), B.basis()
        if not Ab:
            return self.span([])
        if not Bb:
            return A
        M = matrix(QQ, [sum((list(self.br(a, b)) for b in Bb), [])
                        for a in Ab])
        return self.span([sum(c[k] * Ab[k] for k in range(len(Ab)))
                          for c in M.left_kernel().basis()])

    def center(self):
        return self.centralizer(self.V, self.V)

    def normalizer(self, L):
        """{x in g : [x, L] subset L}."""
        ann = annihilator(L, self.n)
        M = matrix(QQ, [sum((list(ann * self.br(e, l)) for l in L.basis()),
                            []) for e in self.V.basis()])
        if M.ncols() == 0:
            return self.V
        return self.span(M.left_kernel().basis())

    def restrict(self, A):
        """The Lie algebra A (a subalgebra) with the basis A.basis()."""
        basis = A.basis()
        k = len(basis)
        ads = []
        for a in basis:
            cols = [A.coordinate_vector(self.br(a, b)) for b in basis]
            ads.append(matrix(QQ, cols).transpose())
        h = Lie(self.name + '|sub', ads)
        h.embed = (matrix(QQ, basis).transpose() if k
                   else matrix(QQ, self.n, 0))
        return h

    def quotient(self, I):
        """g/I (I an ideal) on the basis of a complement of I."""
        assert self.is_ideal(I)
        C = I.complement().basis()
        m = len(C)
        T = matrix(QQ, list(C) + list(I.basis())).transpose()
        proj = T.inverse()[:m, :]
        ads = []
        for a in C:
            cols = [proj * self.br(a, b) for b in C]
            ads.append(matrix(QQ, cols).transpose())
        q = Lie(self.name + '/I', ads)
        q.proj = proj
        q.sect = matrix(QQ, C).transpose() if m else matrix(QQ, self.n, 0)
        return q

    def image(self, q, A):
        """Image of a subspace A of g in the quotient q."""
        return q.span([q.proj * a for a in A.basis()])

    def preimage(self, q, I, S):
        """pi^-1(S) for S a subspace of the quotient q = g/I."""
        return self.span([q.sect * s for s in S.basis()] + list(I.basis()))

    def embedded(self, h, S):
        """A subspace S of the subalgebra h, in the coordinates of g."""
        return self.span([h.embed * s for s in S.basis()])


def annihilator(A, n):
    """Rows: linear forms vanishing on A."""
    if A.dimension() == 0:
        return identity_matrix(QQ, n)
    return matrix(QQ, A.basis()).right_kernel_matrix()


def radical(g):
    """rad g = Killing orthogonal of [g, g], certified as the largest
    solvable ideal (solvable ideal with semisimple quotient)."""
    if g.n == 0:
        return g.V
    D = g.bracket(g.V, g.V)
    r = (matrix(QQ, D.basis()) * g.killing()).right_kernel() if D.basis() \
        else g.V
    r = g.span(r.basis())
    assert g.is_ideal(r) and g.is_solvable(r), g.name
    assert g.quotient(r).is_semisimple(), g.name
    return r


def is_levi(g, L, r):
    return (g.is_subalgebra(L) and L.intersection(r).dimension() == 0
            and L.dimension() + r.dimension() == g.n
            and g.restrict(L).is_semisimple())


# ---------------------------------------------------------------- examples


def E(N, i, j):
    m = matrix(QQ, N, N)
    m[i, j] = 1
    return m


def embed(block, N, rows, cols):
    m = matrix(QQ, N, N)
    for a, i in enumerate(rows):
        for b, j in enumerate(cols):
            m[i, j] = block[a, b]
    return m


def sl_basis(n):
    out = [matrix(QQ, E(n, i, j)) for i in range(n) for j in range(n)
           if i != j]
    out += [E(n, i, i) - E(n, i + 1, i + 1) for i in range(n - 1)]
    return out


def gl_basis(n):
    return [E(n, i, j) for i in range(n) for j in range(n)]


def semidirect_Kn(name, lin, n):
    """lin x| K^n inside gl_(n+1): [[X, v], [0, 0]]."""
    N = n + 1
    mats = [embed(X, N, range(n), range(n)) for X in lin]
    mats += [E(N, i, n) for i in range(n)]
    return Lie.from_matrices(name, mats)


def examples():
    ex = {}
    ex['sl2'] = Lie.from_matrices('sl2', sl_basis(2))
    ex['sl2_K2'] = semidirect_Kn('sl2_K2', sl_basis(2), 2)
    ex['sl3_K3'] = semidirect_Kn('sl3_K3', sl_basis(3), 3)
    # Takiff: [[X, Y], [0, X]], X, Y in sl_2; Y spans an abelian ideal.
    tk = [embed(X, 4, range(2), range(2)) + embed(X, 4, range(2, 4),
                                                  range(2, 4))
          for X in sl_basis(2)]
    tk += [embed(Y, 4, range(2), range(2, 4)) for Y in sl_basis(2)]
    ex['takiff'] = Lie.from_matrices('takiff', tk)
    sk = [embed(X, 4, range(2), range(2)) for X in sl_basis(2)]
    sk += [E(4, 0, 2), E(4, 1, 2), E(4, 3, 3)]
    ex['sl2_K2_plus_K'] = Lie.from_matrices('sl2_K2_plus_K', sk)
    ex['gl2'] = Lie.from_matrices('gl2', gl_basis(2))
    ex['aff1'] = semidirect_Kn('aff1', gl_basis(1), 1)
    ex['aff2'] = semidirect_Kn('aff2', gl_basis(2), 2)
    ex['aff3'] = semidirect_Kn('aff3', gl_basis(3), 3)
    # Jacobi algebra sl_2 x| heis_3 in gl_4: [[0, v^T J, c], [0, X, v],
    # [0, 0, 0]] with J = [[0, 1], [-1, 0]], so v^T J = (-v_2, v_1).
    jb = [embed(X, 4, (1, 2), (1, 2)) for X in sl_basis(2)]
    jb += [E(4, 1, 3) + E(4, 0, 2), E(4, 2, 3) - E(4, 0, 1), E(4, 0, 3)]
    ex['jacobi'] = Lie.from_matrices('jacobi', jb)
    p21 = [E(3, 0, 1), E(3, 1, 0), E(3, 0, 2), E(3, 1, 2),
           E(3, 0, 0) - E(3, 1, 1), E(3, 1, 1) - E(3, 2, 2)]
    ex['p21'] = Lie.from_matrices('p21', p21)
    p22 = [E(4, i, j) for (i, j) in [(0, 1), (1, 0), (2, 3), (3, 2),
                                     (0, 2), (0, 3), (1, 2), (1, 3)]]
    p22 += [E(4, i, i) - E(4, i + 1, i + 1) for i in range(3)]
    ex['p22'] = Lie.from_matrices('p22', p22)
    b3 = [E(3, 0, 1), E(3, 0, 2), E(3, 1, 2), E(3, 0, 0) - E(3, 1, 1),
          E(3, 1, 1) - E(3, 2, 2)]
    ex['borel3'] = Lie.from_matrices('borel3', b3)
    return ex


# (dim g, dim rad g, rad g commutative, dim z(g)): derived by hand.
EXPECTED = {
    'sl2': (3, 0, True, 0), 'sl2_K2': (5, 2, True, 0),
    'sl3_K3': (11, 3, True, 0), 'takiff': (6, 3, True, 0),
    'sl2_K2_plus_K': (6, 3, True, 1), 'gl2': (4, 1, True, 1),
    'aff1': (2, 2, False, 0), 'aff2': (6, 3, False, 0),
    'aff3': (12, 4, False, 0), 'jacobi': (6, 3, False, 1),
    'p21': (6, 3, False, 0), 'p22': (11, 5, False, 0),
    'borel3': (5, 5, False, 0),
}


def jacobi_identity(g):
    for i, j, k in combinations(range(g.n), 3):
        e = g.V.basis()
        s = (g.br(e[i], g.br(e[j], e[k])) + g.br(e[j], g.br(e[k], e[i]))
             + g.br(e[k], g.br(e[i], e[j])))
        if s != 0:
            return False
    return True


# ------------------------------------------------------ P, Q, R (p. 282)


def unflat(v, n):
    return matrix(QQ, n, n, list(v))


def fl(m):
    return vector(QQ, m.list())


def linear_map_matrix(f, dim):
    return matrix(QQ, [f(e) for e in identity_matrix(QQ, dim).rows()]) \
        .transpose()


def pqr(g, r):
    """P, Q, R of p. 282 as subspaces of gl(g) = QQ^(n^2) (row-major), and
    the scalar lambda(v) of v in P on rad g."""
    n, rb = g.n, r.basis()
    ann = annihilator(r, n)

    def F(w):
        v, lam = unflat(w[:n * n], n), w[n * n]
        out = list((ann * v).list())
        for x in rb:
            out += list(v * x - lam * x)
        return vector(QQ, out)

    Fm = linear_map_matrix(F, n * n + 1)
    VV = VectorSpace(QQ, n * n)
    P = VV.subspace([k[:n * n] for k in Fm.right_kernel().basis()])
    Q = VV.subspace(Fm[:, :n * n].right_kernel().basis())
    R = VV.subspace([fl(g.ad(x)) for x in rb])

    def lam(v):
        x = rb[0]
        y = unflat(v, n) * x
        i = x.nonzero_positions()[0]
        assert y == (y[i] / x[i]) * x
        return y[i] / x[i]

    return P, Q, R, lam


def rho(g, i, v):
    """rho(e_i) v = [ad e_i, v] for v in gl(g) (flattened)."""
    A, m = g.ads[i], unflat(v, g.n)
    return fl(A * m - m * A)


def image_space(g, v):
    return g.span(unflat(v, g.n).columns())


def problems_5_6(g, r, where):
    n, k = g.n, r.dimension()
    P, Q, R, lam = pqr(g, r)
    commutative = g.bracket(r, r).dimension() == 0
    # Printed P: v(g) = rad g.  A projection p onto rad g and -p lie in it,
    # their sum 0 does not: not a subspace.
    p = next(v for v in P.basis() if lam(v) != 0)
    in_printed = [image_space(g, u) == r for u in (p, -p, p - p)]
    refuted(all(in_printed),
            'p. 282 printed P = {v: v(g) = rad g, ...} closed under '
            '+ [%s]' % where)
    refuted(image_space(g, 0 * p) == r,
            'p. 282 printed P contains Q (0 in Q) [%s]' % where)
    check(Q.is_subspace(P) and P.dimension() - Q.dimension() == 1,
          'Problem 5 p. 283: Q subset P, dim P - dim Q = 1 [%s]'
          % where)
    check(P.dimension() == (n - k) * k + 1,
          'P = Hom(g/rad g, rad g) + K*(projection), dim (n-k)k+1 [%s]'
          % where)
    zr = g.centralizer(r, r)
    adz = P.ambient_vector_space().subspace([fl(g.ad(z))
                                             for z in zr.basis()])
    check(R.intersection(P) == adz and R.intersection(Q) == adz,
          'R cap P = R cap Q = ad z(rad g) [%s]' % where)
    if commutative:
        check(R.is_subspace(Q) and Q.is_subspace(P),
              'Problem 5 p. 283: R subset Q subset P (rad g commutative) '
              '[%s]' % where)
    else:
        refuted(R.is_subspace(Q),
                'Problem 5 p. 283 as printed: R subset Q without '
                '"rad g commutative" [%s]' % where)
        refuted(R.is_subspace(P),
                'Problem 5 p. 283 as printed: R subset P [%s]' % where)
    all_idx = range(n)
    rad_coords = list(r.basis())

    def rho_x(x, v):
        A, m = g.ad(x), unflat(v, n)
        return fl(A * m - m * A)

    invariant = all(rho(g, i, v) in S for i in all_idx
                    for S in (P, Q, R) for v in S.basis())
    check(invariant, 'Problem 6 p. 283: P, Q, R are rho(g)-invariant [%s]'
          % where)
    check(all(rho(g, i, v) in Q for i in all_idx for v in P.basis()),
          'Problem 6 p. 283 (corrected): rho(x)P subset Q for all x in g '
          '[%s]' % where)
    check(all(rho_x(x, v) in Q for x in rad_coords for v in P.basis()),
          'Problem 6 p. 283 as printed: rho(x)P subset Q for x in rad g '
          '(holds, weaker) [%s]' % where)
    into_R = all(rho_x(x, v) in R for x in rad_coords for v in P.basis())
    if commutative:
        check(into_R, 'Problem 6 p. 283: rho(x)P subset R for x in rad g, '
              'rad g commutative [%s]' % where)
        outside = any(rho(g, i, v) not in R for i in all_idx
                      for v in P.basis())
        check(outside, 'p. 283: rho(x)P not inside R for some x outside '
              'rad g, so the corrected Problem 6 is needed for '
              'rho^(xi)(P/R) subset Q/R [%s]' % where)
    return P, Q, R, lam, into_R


def construct_levi(g, r, where):
    """The paragraph after Problem 6, Problem 4 with Hint 4, Problem 3."""
    n = g.n
    P, Q, R, lam = pqr(g, r)
    Pb, Rb = P.basis(), R.basis()
    cols = []
    for v in Pb:
        cols.append(sum((list(rho(g, i, v)) for i in range(n)), []))
    for i in range(n):
        for w in Rb:
            col = [QQ(0)] * (n * n * n)
            for a in range(n * n):
                col[i * n * n + a] = -w[a]
            cols.append(col)
    M = matrix(QQ, cols).transpose()
    W0 = P.ambient_vector_space().subspace(
        [sum(c[k] * Pb[k] for k in range(len(Pb)))
         for c in M.right_kernel().basis()])
    check(R.is_subspace(W0) and not W0.is_subspace(Q),
          'p. 283: there is v0 in P \\ Q with rho(g)v0 subset R [%s]'
          % where)
    check(W0.dimension() - W0.intersection(Q).dimension() == 1,
          'p. 283: dim P/R - dim Q/R = 1 leaves one invariant direction '
          'modulo Q [%s]' % where)
    v0 = next(v for v in W0.basis() if lam(v) != 0)
    h = unflat(v0 / lam(v0), n)
    check(g.span(h.columns()).is_subspace(r)
          and all(h * x == x for x in r.basis()),
          'p. 283: h = v0/lambda is a projection of g onto rad g [%s]'
          % where)
    adm = matrix(QQ, [fl(a) for a in g.ads]).transpose()
    check(adm.rank() == n, 'Hint 4 p. 288: ad: g -> ad g is an '
          'isomorphism (z(g) = 0) [%s]' % where)
    adg = P.ambient_vector_space().subspace(adm.columns())
    check(all(rho(g, j, fl(h)) in R for j in range(n)) and R.is_subspace(adg),
          'p. 283: [ad x, v0] in R subset ad g, so h normalises ad g [%s]'
          % where)
    dcols = []
    for j in range(n):
        target = fl(h * g.ads[j] - g.ads[j] * h)
        d = adm.solve_right(target)
        assert adm * d == target
        dcols.append(d)
    D = matrix(QQ, dcols).transpose()
    e = g.V.basis()
    check(all(D * g.br(e[i], e[j]) == g.br(D * e[i], e[j])
              + g.br(e[i], D * e[j]) for i in range(n) for j in range(n)),
          'Hint 4 p. 288: delta is a derivation [%s]' % where)
    check(g.span(D.columns()).is_subspace(r)
          and all(D * x == x for x in r.basis()),
          'Hint 4 p. 288 / p. 282: delta is a projection onto rad g [%s]'
          % where)
    K = g.span(D.right_kernel().basis())
    check(g.is_subalgebra(K), 'Problem 3 p. 282: ker delta is a subalgebra '
          '[%s]' % where)
    check(is_levi(g, K, r), 'Problem 4 p. 282: ker delta is a Levi '
          'subalgebra [%s]' % where)
    # The whole family h + ad z (ad z in R subset W0): delta becomes
    # delta + ad z and ker becomes exp(-ad z) ker delta.
    rb = r.basis()
    S = PolynomialRing(QQ, ['t%d' % i for i in range(len(rb))])
    z = sum((S.gen(i) * vector(S, list(rb[i])) for i in range(len(rb))),
            vector(S, [0] * n))
    A = g.ad(z)
    hA = h.change_ring(S) + A
    ok = A * A == 0
    for j in range(n):
        lhs = hA * g.ads[j] - g.ads[j] * hA
        rhs = g.ad((D.change_ring(S) + A) * vector(S, list(e[j])))
        ok &= lhs == rhs
    Eneg = identity_matrix(S, n) - A
    ok &= all((D.change_ring(S) + A) * (Eneg * vector(S, list(y))) == 0
              for y in K.basis())
    check(ok, 'p. 283: from h + ad z the construction gives '
          'exp(-ad z) ker delta, for all z in rad g [%s]' % where)
    return K


# ------------------------------------------- the proof of Theorem 1, p. 283

BRANCHES = set()


def levi_by_book(g, where):
    r = radical(g)
    if r.dimension() == 0:
        BRANCHES.add('semisimple')
        return g.V
    rr = g.bracket(r, r)
    if rr.dimension() > 0:
        BRANCHES.add('noncommutative')
        check(0 < r.dimension() - rr.dimension() < r.dimension()
              and g.is_ideal(rr),
              "p. 283: 0 < dim rad g/(rad g)' < dim rad g, (rad g)' an "
              'ideal [%s]' % where)
        g1 = g.quotient(rr)
        check(radical(g1) == g.image(g1, r),
              "Problem 8 p. 283: rad(g/(rad g)') = rad g/(rad g)' [%s]"
              % where)
        l1 = levi_by_book(g1, where + " / g1 = g/(rad g)'")
        g2s = g.preimage(g1, rr, l1)
        g2 = g.restrict(g2s)
        check(g2.n == l1.dimension() + rr.dimension()
              and g.embedded(g2, radical(g2)) == rr,
              "p. 283: g_2/(rad g)' = l_1 and (rad g)' = rad g_2 "
              '(Problem 7) [%s]' % where)
        l = g.embedded(g2, levi_by_book(g2, where + ' / g2'))
        check(is_levi(g, l, r), 'p. 283: l is a Levi subalgebra of g '
              '(non-commutative case) [%s]' % where)
        return l
    z = g.center()
    if z.dimension() == 0:
        BRANCHES.add('PQR')
        if ' / ' in where:     # top-level examples: see section_theorem_1
            problems_5_6(g, r, where)
        return construct_levi(g, r, where)
    BRANCHES.add('center')
    check(z.is_subspace(r) and r.dimension() - z.dimension()
          < r.dimension(),
          'p. 283: dim(rad g/z(g)) < dim rad g [%s]' % where)
    gz = g.quotient(z)
    check(radical(gz) == g.image(gz, r),
          'Problem 8 p. 283: rad(g/z(g)) = rad g/z(g) [%s]' % where)
    l1 = levi_by_book(gz, where + ' / g/z(g)')
    g1s = g.preimage(gz, z, l1)
    g1 = g.restrict(g1s)
    r1 = radical(g1)
    check(g.embedded(g1, r1) == z and r1 == g1.center(),
          'p. 283: z(g) = rad g_1 (= z(g_1)) [%s]' % where)
    d1 = g1.bracket(g1.V, g1.V)
    check(d1.intersection(r1).dimension() == 0
          and d1.dimension() + r1.dimension() == g1.n
          and g1.restrict(d1).is_semisimple(),
          "Problem 5.2.30 (used p. 283): g_1 = g_1' + z(g_1), g_1' "
          'semisimple [%s]' % where)
    l = g.embedded(g1, d1)
    check(is_levi(g, l, r), 'p. 283: l is a Levi subalgebra of g '
          '(commutative radical, z(g) != 0) [%s]' % where)
    return l


# ------------------------------------------ Malcev: Theorem 3, Corollary 1


def exp_ad(g, z):
    A = g.ad(z)
    ring = z.base_ring()
    out, term = identity_matrix(ring, g.n), identity_matrix(ring, g.n)
    for k in range(1, g.n + 1):
        term = term * A
        if term == 0:
            return out, A, True
        out += term / factorial(k)
    return out, A, term * A == 0


def levi_variety(g, l, r, N, where):
    lb, rb, Nb = l.basis(), r.basis(), N.basis()
    dl, dr, dn = len(lb), len(rb), len(Nb)
    T = matrix(QQ, list(lb) + list(rb)).transpose()
    Tinv = T.inverse()
    S = PolynomialRing(QQ, ['c%d_%d' % (a, b) for a in range(dr)
                            for b in range(dl)])
    C = matrix(S, dr, dl, S.gens())
    Rm = matrix(S, rb).transpose()

    def graph(j):
        return vector(S, list(lb[j])) + Rm * C.column(j)

    eqs = []
    for i, j in combinations(range(dl), 2):
        w = Tinv.change_ring(S) * g.br(graph(i), graph(j))
        wl, wr = w[:dl], w[dl:]
        assert all(c in QQ for c in wl)
        eqs += list(wr - C * wl)
    I = S.ideal(eqs)
    St = PolynomialRing(QQ, ['t%d' % k for k in range(dn)])
    z = sum((St.gen(k) * vector(St, list(Nb[k])) for k in range(dn)),
            vector(St, [0] * g.n))
    Ez, A, nilpotent = exp_ad(g, z)
    e = [vector(St, list(v)) for v in g.V.basis()]
    check(nilpotent and all(Ez * g.br(x, y) == g.br(Ez * x, Ez * y)
                            for x in e for y in e),
          'Problem 2 / Theorem 3: exp(ad z), z in N, is an automorphism '
          '(identity in z) [%s]' % where)
    Ct = matrix(St, dr, dl)
    for j in range(dl):
        y = Tinv.change_ring(St) * (Ez * vector(St, list(lb[j])))
        assert list(y[:dl]) == [1 if a == j else 0 for a in range(dl)]
        for a in range(dr):
            Ct[a, j] = y[dl + a]
    phi = S.hom(Ct.list(), St)
    check(all(phi(f) == 0 for f in eqs),
          'Theorem 3 p. 284: exp(ad z) l is a Levi subalgebra for all z '
          'in N [%s]' % where)
    entries = Ct.list()
    lin = matrix(QQ, [[f.monomial_coefficient(St.gen(k)) for f in entries]
                      for k in range(dn)]).transpose()
    high = sorted({m for f in entries for m in f.monomials()
                   if m.degree() >= 2})
    H = matrix(QQ, [[f.monomial_coefficient(m) for f in entries]
                    for m in high]).transpose() if high \
        else matrix(QQ, len(entries), 0)
    assert all(f.constant_coefficient() == 0 for f in entries)
    target = identity_matrix(QQ, dn).augment(matrix(QQ, dn, H.ncols()))
    tau = lin.augment(H).solve_left(target)
    t_of_c = [sum(tau[k, a] * S.gens()[a] for a in range(len(entries)))
              for k in range(dn)]
    back = Ct.apply_map(lambda f: f(*t_of_c) if dn else S(f))
    I.groebner_basis()
    diff = (C - back.change_ring(S)).list()
    check(all(I.reduce(f) == 0 for f in diff),
          'Corollary 1 p. 285: every Levi subalgebra is exp(ad z) l, z in '
          'N subset rad g [%s]' % where)
    check(I.dimension() == dn, 'the variety of Levi subalgebras has '
          'dimension dim N = %d [%s]' % (dn, where))


# ---------------------------------------------------------- the sections


def section_examples(ex):
    for name, g in ex.items():
        dim, drad, comm, dz = EXPECTED[name]
        r = radical(g)
        check(jacobi_identity(g) and g.n == dim and r.dimension() == drad
              and (g.bracket(r, r).dimension() == 0) == comm
              and g.center().dimension() == dz,
              'example %s: dim %d, rad %d, commutative %s, z %d'
              % (name, dim, drad, comm, dz))


def section_theorem_1(ex):
    levis, into_R = {}, {}
    for name, g in ex.items():
        r = radical(g)
        if r.dimension() == 0:
            P, Q, R, lam = pqr(g, r)
            check(P.dimension() == 0 and Q.dimension() == 0,
                  'Problem 5 degenerate case rad g = 0 (%s): P = Q = 0, '
                  'dim P - dim Q = 0; the book tacitly has rad g != 0' % name)
        else:
            into_R[name] = problems_5_6(g, r, name)[4]
        l = levi_by_book(g, name)
        check(is_levi(g, l, r), 'Theorem 1 p. 282: %s has a Levi '
              'subalgebra (dim %d)' % (name, l.dimension()))
        levis[name] = l
        q = g.quotient(r)
        check(g.image(q, l).dimension() == l.dimension() == q.n,
              'Problem 1 p. 282: pi maps l isomorphically onto g/rad g [%s]'
              % name)
        if g.bracket(l, r).dimension() > 0:
            check(g.bracket(l, r).is_subspace(r) and g.is_subalgebra(l),
                  '(1) p. 282: g = rad g (+) l, semidirect sum [%s]' % name)
            refuted(g.is_ideal(l), '(1) p. 282 as printed: direct sum, l '
                    'an ideal [%s]' % name)
        # Problems 7 and 8 on the ideals 0, (rad g)', z(g), rad g, [g, g], g.
        rr, z = g.bracket(r, r), g.center()
        D = g.bracket(g.V, g.V)
        ideals = [g.span([]), rr, z, r, D, g.V, r + D]
        ok7 = all(g.is_ideal(I) and (r.is_subspace(I)
                                     == g.quotient(I).is_semisimple())
                  for I in ideals)
        check(ok7, 'Problem 7 p. 283: h contains rad g iff g/h semisimple, '
              'on 0, (rad g)\', z, rad g, [g, g], g [%s]' % name)
        ok8 = True
        for I in (rr, z, r):
            if g.is_solvable(I):
                q = g.quotient(I)
                ok8 &= radical(q) == g.image(q, r)
                ok8 &= is_levi(q, g.image(q, l), radical(q))
        check(ok8, 'Problem 8 p. 283: rad(g/r) = rad g/r and the image of l '
              'is a Levi subalgebra of g/r, r in (rad g)\', z, rad g [%s]'
              % name)
    check(BRANCHES == {'semisimple', 'noncommutative', 'PQR', 'center'},
          'p. 283: every branch of the proof of Theorem 1 was run')
    return levis, into_R


def section_problem_6_hypothesis(into_R):
    fails = sorted(name for name, ok in into_R.items() if not ok)
    check(fails == ['aff2', 'aff3', 'jacobi', 'p21', 'p22'],
          'Problem 6 p. 283, second sentence: without "rad g commutative" '
          'rho(x)P subset R fails (aff2, aff3, jacobi, p21, p22)')


def section_hint_4_scope(ex):
    """Hint 4 uses the standing assumption (commutative radical)."""
    g = ex['aff1']
    r = radical(g)
    h = identity_matrix(QQ, g.n)
    adm = matrix(QQ, [fl(a) for a in g.ads]).transpose()
    ok = r == g.V and g.center().dimension() == 0 and adm.rank() == g.n
    D = []
    for j in range(g.n):
        target = fl(h * g.ads[j] - g.ads[j] * h)
        D.append(adm.solve_right(target))
    D = matrix(QQ, D).transpose()
    check(ok and D == 0, 'Problem 4 hypotheses hold in aff1 with h = id '
          '(projection onto rad g = g, normalises ad g, z(g) = 0) and '
          'delta = 0')
    refuted(all(D * x == x for x in r.basis()),
            'Hint 4 p. 288 "clearly delta is a projection onto rad g" '
            'outside the standing assumption (aff1, non-commutative rad)')
    # The identity behind it: for x in rad g and any projection h onto
    # rad g, [h, ad x] = ad x - (ad x) h; tested in aff2, p22, jacobi.
    ok = True
    for name in ('aff2', 'p22', 'jacobi'):
        g = ex[name]
        r = radical(g)
        P, Q, R, lam = pqr(g, r)
        v = next(v for v in P.basis() if lam(v) != 0)
        h = unflat(v / lam(v), g.n)
        for x in r.basis():
            A = g.ad(x)
            ok &= h * A - A * h == A - A * h
    check(ok, 'for x in rad g: [h, ad x] = ad x - (ad x) h, so delta|rad g '
          '= id iff rad g is commutative (aff2, p22, jacobi)')


def section_malcev(ex, levis):
    for name in ('sl2_K2', 'sl3_K3', 'takiff'):
        g = ex[name]
        r = radical(g)
        levi_variety(g, levis[name], r, r, name)
    # aff2: N = the translations K^2; jacobi: N = span(p, q); natural l.
    g = ex['aff2']
    l = g.span([g.coords(embed(X, 3, range(2), range(2)))
                for X in sl_basis(2)])
    N = g.span([g.coords(E(3, i, 2)) for i in range(2)])
    levi_variety(g, l, radical(g), N, 'aff2')
    g = ex['jacobi']
    l = g.span([g.coords(embed(X, 4, (1, 2), (1, 2))) for X in sl_basis(2)])
    N = g.span([g.coords(E(4, 1, 3) + E(4, 0, 2)),
                g.coords(E(4, 2, 3) - E(4, 0, 1))])
    levi_variety(g, l, radical(g), N, 'jacobi')


def section_theorem_4a(ex, levis):
    for name in ('sl2_K2', 'sl3_K3', 'takiff', 'sl2_K2_plus_K'):
        g = ex[name]
        r, l = radical(g), levis[name]
        nl = g.normalizer(l)
        check(nl.intersection(r) == g.center()
              and nl == l + nl.intersection(r),
              'Theorem 4 a) p. 286: n(h) = (n(h) cap rad g) + h, '
              'n(h) cap rad g = z(g) (rad g commutative) [%s]' % name)
    g = ex['aff2']
    r, l = radical(g), levis['aff2']
    nl = g.normalizer(l)
    check(nl.intersection(r).dimension() == 1
          and g.center().dimension() == 0,
          'Theorem 4 a) uses commutativity: in aff2 n(l) cap rad g = K E '
          '!= z(g) = 0')


def section_problem_9():
    for n in range(1, 5):
        names = ['x%d_%d' % (i, j) for i in range(n + 1)
                 for j in range(n + 1)] + ['v%d' % i for i in range(n)]
        S = PolynomialRing(QQ, names)
        X = matrix(S, n + 1, n + 1, S.gens()[:(n + 1) ** 2])
        v = S.gens()[(n + 1) ** 2:]
        last = (X * vector(S, list(v) + [1]))[n] - 1
        coeffs = [last.derivative(vi) for vi in v]
        coeffs.append(last.subs({vi: 0 for vi in v}))
        preserves_A = S.ideal(coeffs)
        gl_wwv = S.ideal(list((X - identity_matrix(S, n + 1)).row(n)))
        book = S.ideal([X[n, j] for j in range(n)] + [X[n, n] - 1])
        check(preserves_A == gl_wwv == book,
              'Problem 9 p. 284, dim V = %d: preserving (V, 1) <=> '
              'preserving V, identity on W/V <=> (X - E)W subset V '
              '(GL(W; W, V) of Example 3.1.1.3, p. 100)' % n)
    n = 2
    S = PolynomialRing(QQ, ['a%d' % i for i in range(8)]
                       + ['b%d' % i for i in range(4)] + ['v0', 'v1'])
    a, b, w = S.gens()[:8], S.gens()[8:12], vector(S, S.gens()[12:])
    A1, A2 = matrix(S, 2, 2, a[:4]), matrix(S, 2, 2, a[4:])
    b1, b2 = vector(S, b[:2]), vector(S, b[2:])

    def X(A, bb):
        return A.augment(matrix(S, 2, 1, list(bb))).stack(
            matrix(S, [[0, 0, 1]]))

    ok = X(A1, b1) * vector(S, list(w) + [1]) == \
        vector(S, list(A1 * w + b1) + [1])
    ok &= X(A1, b1) * X(A2, b2) == X(A1 * A2, A1 * b2 + b1)
    check(ok, 'Problem 9 p. 284: X = [[A, b], [0, 1]] induces v -> Av + b '
          'on the hyperplane, composition = matrix product (dim V = 2)')


def section_lemma_1():
    S = PolynomialRing(QQ, ['g%d' % i for i in range(8)])
    G1 = matrix(S, 2, 2, S.gens()[:4])
    G2 = matrix(S, 2, 2, S.gens()[4:])
    w = vector(S, [3, -5])

    def R(g):
        return g.augment(matrix(S, 2, 1, list((g - 1) * w))).stack(
            matrix(S, [[0, 0, 1]]))

    v0 = vector(S, list(-w) + [1])
    check(R(G1) * R(G2) == R(G1 * G2) and R(G1) * v0 == v0,
          'Lemma 1 p. 284: the affine action x -> g x + (g - E) w is a '
          'linear representation on W = V + K fixing v0 = (-w, 1)')
    # Lie algebra level: the invariant complement of V meets (V, 1) in v0.
    mats = [X.augment(matrix(QQ, 2, 1, list(X * vector(QQ, [3, -5]))))
            .stack(matrix(QQ, [[0, 0, 0]])) for X in sl_basis(2)]
    ker = mats[0].stack(mats[1]).stack(mats[2]).right_kernel()
    check(ker == VectorSpace(QQ, 3).subspace([vector(QQ, [-3, 5, 1])]),
          'Lemma 1 p. 284: the sl_2-invariant complement of V is K v0 with '
          'v0 in the hyperplane, c = 1')


def main():
    ex = examples()
    section_examples(ex)
    levis, into_R = section_theorem_1(ex)
    section_problem_6_hypothesis(into_R)
    section_hint_4_scope(ex)
    section_malcev(ex, levis)
    section_theorem_4a(ex, levis)
    section_problem_9()
    section_lemma_1()
    print('ok chapter-6: %d checks' % len(CHECKS))


if __name__ == '__main__':
    main()
