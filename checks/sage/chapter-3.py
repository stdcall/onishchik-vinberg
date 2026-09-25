"""Exact checks of Chapter 3, "Algebraic Groups" (Sage).

Onishchik, Vinberg, *Lie Groups and Algebraic Groups* (Springer, 1990),
Chapter 3, printed pp. 98-135.  Our files: content/30-algebraic-groups.typ,
31-background.typ, 32-commutative-solvable.typ, 33-tangent-algebra.typ,
34-compact-linear-groups.typ.

The chapter is almost entirely general theory.  What can be computed is
checked here: the explicit matrices, groups and formulas the book writes
down, the examples it gives, and small instances of its general statements.
Expected values are the book's, written as literals taken from the printed
book (the printed page is named in each check message); the
chapter file is not parsed.  Where the book was corrected, the printed
reading is kept as a refuted check next to the corrected one.

Checked here (section by section):

3.1 Background (pp. 98-110)
  * 1-5: the actions l, r, a on a group (p. 99, p. 103) and formula (3) of
    the regular representation as formula (2) with alpha = r (p. 105);
    the correction K[M] -> K[G] rests on this.
  * Example 3 of 1 (p. 100): GL(V; U, W) is closed under products and
    inverses (one instance, n = 3).
  * Problem 7 and Hint 7 (p. 101, p. 109): exp t diag(1, i) = diag(e^t,
    e^{it}) and exp t [[1,1],[0,1]] = e^t [[1,t],[0,1]] (power series,
    mod t^20); no nonzero polynomial of degree <= 5 vanishes on either
    curve (exact rank of Taylor coefficient matrices).  Exercise 5
    (p. 108): <1, 2> = 2^Z in K^* is not closed.
  * Real forms (p. 101-102): the cubic roots of unity and complex
    conjugation (fixed points {1}, not a real form); U_n as the fixed points
    of A -> (conj(A)^t)^(-1) (samples); Exercise 8 (R^* = {xy = 1},
    absolutely irreducible); Exercise 9 for G = C^* (identity in
    Q(i)[x1, y1, x2, y2]).
  * Semidirect products in char p (p. 102): for GF(4), GF(8), GF(3),
    GF(9), GF(5), GF(7) exhaustively, (K^*)^2 is the abstract direct
    product of {z2 = 1} and {z2 = z1^p}; the product morphism has
    Jacobian determinant 0, so it is not an isomorphism.  Frobenius
    (p. 103): bijective on these fields, derivative 0.
  * Theorem 8, Problem 19, Hint 19, Exercise 13 (pp. 105-106, 108, 110):
    the regular representation on an invariant subspace containing
    generators, for K, K^* and B_2; homomorphism property, faithfulness,
    and f_j = sum_i c_i a_ij.
  * Theorem 10 (Chevalley), Problems 21-24 and Hint 24 (pp. 106-107,
    110): B_2 in GL_2 as a line stabilizer; SL_2 = Ker T; the normalizer
    of the torus in GL_2 with two conjugate characters; the centralizer
    of a block-diagonal full matrix algebra is the block scalars.
  * Exercise 2 (p. 108): Aut of the dual numbers is {eps -> s eps} ~ K^*.

3.2 Commutative and solvable groups (pp. 110-122)
  * 1 (pp. 110-111): Jordan decompositions of two explicit 4 x 4 matrices
    (rational eigenvalues; eigenvalues +-sqrt 2) built from the book's
    definition (A_s = lambda on V^lambda(A)); A_s, A_n, A_u commute with
    the whole centralizer; the "commuting" hypotheses are needed.
  * 2 (pp. 111-113): exp/log as formal series (mod x^30, and in two
    variables to total degree 14, Hints 4, 5); exp and log inverse on
    generic 4 x 4 niltriangular matrices (polynomial identities);
    Theorem 1: A^(s+t) = A^s A^t, A^n for integers, Exercise 1 (binomial
    series), and the Zariski closure of {A^n} for a unipotent 3 x 3 A
    (degree <= 4, exact); Corollary 1 needs char 0 ([[1,1],[0,1]] over
    GF(p)).
  * 3 (pp. 113-115): Theorem 4 via Hint 8 (all multiplicative Laurent
    polynomials of degree <= 3 are monomials); Theorem 5 and formula (1)
    for five lattices (Smith form, torsion points of order N counted
    exhaustively, annihilators); Problem 11; Hint 12 ((2, 3, 5)); the
    correspondence fails in char p.
  * 4-5 (pp. 115-117): Problem 13, Exercise 8 and formula (2) for
    diag(2, 4, -1) and [[2,2],[0,2]] (Zariski closures of cyclic groups,
    degree <= 3); Theorem 7 for Sym^2.
  * 6-9 (pp. 116-120): B_n = U x| T, [b_n, b_n] = n_n (n <= 6);
    Problem 21 in B_2, B_3, and its failure in GL_3; the proof of
    Theorem 11 for B_2 (the correction "h in U" -> "h in Ug": the printed
    reading is refuted); Exercise 5 (contravariance, correction
    X(T_1) -> X(T_2) refuted); Exercises 14, 16; flag stabilizers in gl_n
    (n <= 5), so_3 and sp_4 (Borel subalgebras, orbit dimensions).

3.3 The tangent algebra (pp. 122-130)
  * 2 (p. 123): formula (1) and Problem 2; Problem 4 for the lattices of
    3.2; Exercises 10, 11 for diag(1, 2, i), diag(1, i) and [[1,1],[0,1]]
    (consistent with Problem 3.1.7).
  * Theorem 3 (p. 124) for h = <diag(1, sqrt 2), E_12>.
  * Engel (pp. 125-126): Hint 12, (ad X)^(2m-1) = 0 and sharp, for every
    nilpotent Jordan type in gl_n, n <= 6; nilpotency of n_n and of
    <E> + n_n (not unipotent), non-nilpotency of b_n; Exercises 8, 9.
  * Theorem 7 (p. 126): exp is closed under products on n_3, n_4 (BCH,
    polynomial identities); Hint 13 for an explicit matrix (mod t^15).

3.4 Compact linear groups (pp. 130-135)
  * Centre of mass (p. 131): Problem 1, c(gM) = g c(M), fixed points of
    finite affine groups (Theorem 1).  Theorem 2 by averaging over S_3,
    Exercise 1 (uniqueness for an irreducible group, not for a reducible
    one), Exercise 2 ([[1,1],[0,1]]).
  * 3 (p. 132): A -> A^* is a representation; the S_n example (identity
    for n <= 7, separation on {0..3}^3 and {0..2}^4); the conjugation
    example; Exercise 4 (invariants of degree <= 4 for n = 2, <= 3 for
    n = 3); Exercise 5 (orbit of [[1,1],[0,1]] not closed).
  * Example of Theorem 3 (p. 133): O_3 on symmetric matrices (Cayley
    parametrization, polynomial identities), spectral decompositions,
    and the complex analogue failing ([[1, i], [i, -1]]).

Not established: none of the general theorems of the chapter is proved
here.  Identities in polynomial rings prove the identity for the stated
size only; closures of cyclic groups are compared only up to the stated
degree (but on the whole curve, see closure_matches); power-series
identities hold modulo the stated order; enumerations are exhaustive only
for the listed fields, lattices, types and boxes.  Invariants of GL_n are
computed as invariants of gl_n (equal for a connected group in char 0).
Nothing here compares our Typst text with the printed book.

Run with:  sage -python checks/sage/chapter-3.py
"""
import itertools
import random

from sage.all import (
    AA, GF, QQ, QQbar, ZZ, CyclotomicField, MatrixGroup, Partitions,
    Polyhedron, PolynomialRing, PowerSeriesRing, QuadraticField,
    block_diagonal_matrix, companion_matrix, diagonal_matrix, factorial, gcd,
    identity_matrix, jordan_block, matrix, prod, vector, zero_matrix,
)

SCOPE = 'chapter-3'
COUNT = [0]


def check(cond, what):
    """One check of a statement of the book; fails loudly."""
    assert bool(cond), 'FAILED: ' + what
    COUNT[0] += 1


def refuted(cond, what):
    """The printed reading, kept beside the corrected one: it must fail."""
    assert not bool(cond), 'printed reading unexpectedly holds: ' + what
    COUNT[0] += 1


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def mexp(X):
    """exp X = sum X^k / k! for a nilpotent matrix (a finite sum)."""
    n = X.nrows()
    assert (X ** n).is_zero()
    S = identity_matrix(X.base_ring(), n)
    P = S
    for k in range(1, n):
        P = P * X * (QQ(1) / k)
        S = S + P
    return S


def mlog(A):
    """log A = sum (-1)^(k-1) (A - E)^k / k for a unipotent matrix."""
    n = A.nrows()
    E = identity_matrix(A.base_ring(), n)
    Y = A - E
    assert (Y ** n).is_zero()
    S = zero_matrix(A.base_ring(), n)
    P = E
    for k in range(1, n):
        P = P * Y
        S = S + P * (QQ((-1) ** (k - 1)) / k)
    return S


def unit(n, i, j, F=QQ):
    M = zero_matrix(F, n)
    M[i, j] = 1
    return M


def span_basis(mats, F=QQ):
    """A basis (as matrices) of the linear span of the given matrices."""
    mats = list(mats)
    if not mats:
        return []
    n, m = mats[0].nrows(), mats[0].ncols()
    rows = matrix(F, [M.list() for M in mats]).echelon_form()
    return [matrix(F, n, m, list(r)) for r in rows.rows() if not r.is_zero()]


def bracket(X, Y):
    return X * Y - Y * X


def bracket_span(A, B, F=QQ):
    return span_basis([bracket(X, Y) for X in A for Y in B], F)


def derived_length(basis, F=QQ, bound=12):
    """Length of the derived series, None if it does not reach 0."""
    L = basis
    for k in range(bound):
        if not L:
            return k
        L = bracket_span(L, L, F)
    return None


def lower_central_length(basis, F=QQ, bound=12):
    L = basis
    for k in range(bound):
        if not L:
            return k
        L = bracket_span(basis, L, F)
    return None


def solve_matrix_space(n, F, lin, basis=None):
    """Basis of {X in span(basis): lin(X) = 0}; basis defaults to gl_n."""
    if basis is None:
        basis = [unit(n, i, j, F) for i in range(n) for j in range(n)]
    cols = [vector(F, lin(B).list()) for B in basis]
    K = matrix(F, cols).transpose().right_kernel()
    return [sum((c * B for c, B in zip(v, basis)), zero_matrix(F, n))
            for v in K.basis()]


def closure_matches(R, points, gens, d):
    """Compare the polynomials of degree <= d vanishing at `points` with
    the degree <= d part of the ideal (gens).  Returns (dim of vanishing
    space, dim of I_{<=d}, every vanishing polynomial lies in I).  The
    callers choose enough points that vanishing there means vanishing on
    the whole curve they sample (explained at each call)."""
    mons = [m for k in range(d + 1) for m in R.monomials_of_degree(k)]
    M = matrix(QQ, [[m(*p) for m in mons] for p in points])
    kernel = M.right_kernel().basis()
    I = R.ideal(gens)
    lms = [g.lm() for g in I.groebner_basis()]
    standard = [m for m in mons if not any(l.divides(m) for l in lms)]
    in_ideal = all(I.reduce(sum(c * m for c, m in zip(v, mons))) == 0
                   for v in kernel)
    return len(kernel), len(mons) - len(standard), in_ideal


def jordan_parts(A):
    """A_s, A_n by the book's definition: A_s acts on V^lambda(A) as lambda
    (all eigenvalues of A must lie in the base field)."""
    n = A.nrows()
    F = A.base_ring()
    E = identity_matrix(F, n)
    cols, lams = [], []
    for lam, mult in A.charpoly().roots(F):
        root_space = ((A - lam * E) ** n).right_kernel().basis()
        assert len(root_space) == mult
        cols += list(root_space)
        lams += [lam] * mult
    Q = matrix(F, cols).transpose()
    As = Q * diagonal_matrix(F, lams) * Q.inverse()
    return As, A - As


def centralizer(A):
    n = A.nrows()
    return solve_matrix_space(n, A.base_ring(), lambda Y: A * Y - Y * A)


def is_semisimple(A):
    """Minimal polynomial squarefree <=> diagonalizable over the closure."""
    mp = A.minimal_polynomial()
    return mp.gcd(mp.derivative()).degree() == 0


def is_nilpotent(A):
    return (A ** A.nrows()).is_zero()


# ---------------------------------------------------------------------------
# 3.1 Background
# ---------------------------------------------------------------------------

def section_3_1():
    # 1 and 5: l(g) x = g x, r(g) x = x g^(-1), a(g) = l(g) r(g)
    # (printed p. 99; p. 103).
    names = ['%s%d%d' % (s, i, j) for s in 'ghx' for i in (1, 2)
             for j in (1, 2)]
    R = PolynomialRing(QQ, names)
    F = R.fraction_field()
    v = R.gens()
    g = matrix(F, 2, 2, v[0:4])
    h = matrix(F, 2, 2, v[4:8])
    x = matrix(F, 2, 2, v[8:12])
    left = lambda a, y: a * y
    right = lambda a, y: y * a.inverse()
    check(left(g * h, x) == left(g, left(h, x)),
          '3.1.1 (p. 99): l is an action')
    check(right(g * h, x) == right(g, right(h, x)),
          '3.1.1 (p. 99): r(g): x -> x g^(-1) is an action')
    check(left(g, right(g, x)) == g * x * g.inverse(),
          '3.1.1 (p. 99): a(g) = l(g) r(g) is x -> g x g^(-1)')

    # Formula (2) with M = G and alpha = r gives formula (3):
    # (r_*(g) f)(x) = f(r(g)^(-1) x) = f(x g)  (p. 105).
    def at(fexpr, X):
        """Substitute the matrix X for x in an expression in g, h, x."""
        return F(fexpr)(*(list(v[0:8]) + X.list()))

    f = F(v[8] ** 3 + 2 * v[9] * v[11] - v[10] ** 2 * v[8])
    r_inv = right(g, x.parent().identity_matrix()).inverse()  # r(g)^(-1) e
    check(at(f, right(g.inverse(), x)) == at(f, x * g)
          and r_inv == g,
          '3.1 (2) -> (3) (p. 105): (r_*(g) f)(x) = f(r(g)^(-1) x) = f(x g), '
          'a representation in K[G]')

    def r_star(a, fexpr):
        """(r_*(a) f)(x) = f(x a), as a new expression in g, h, x."""
        return at(fexpr, x * a)

    check(r_star(g * h, f) == r_star(g, r_star(h, f)),
          '3.1 (3) (p. 105): r_*(gh) = r_*(g) r_*(h) (substitution x -> xg '
          'into f(x h))')

    # Example 3 of 1 (p. 100): GL(V; U, W) = {A: (A - E)U in W},
    # W in U; V = K^3, U = <e1, e2>, W = <e1>.
    S = PolynomialRing(QQ, 'a1,b1,c1,d1,f1,a2,b2,c2,d2,f2')
    SF = S.fraction_field()
    w = S.gens()

    def member(a, b, c, d, f_):
        return matrix(SF, [[1 + a, b, c], [0, 1, d], [0, 0, f_]])

    A = member(*w[0:5])
    B = member(*w[5:10])
    E3 = identity_matrix(SF, 3)
    U = matrix(SF, [[1, 0], [0, 1], [0, 0]])

    def in_group(M):
        D = (M - E3) * U  # images of e1, e2 must lie in <e1>
        return D[1, 0] == 0 and D[2, 0] == 0 and D[1, 1] == 0 and D[2, 1] == 0

    check(in_group(A * B) and in_group(A.inverse()),
          '3.1.1 Example 3 (p. 100): GL(V; U, W) is a group (n = 3, '
          'U = <e1, e2>, W = <e1>)')

    # Problem 7 and Hint 7 (p. 101; p. 109).
    K = QuadraticField(-1, 'I')
    i = K.gen()
    prec = 20
    Pt = PowerSeriesRing(K, 't', default_prec=prec)
    t = Pt.gen()

    def exp_series(A):
        A = A.change_ring(Pt)
        S = identity_matrix(Pt, 2)
        P = S
        for k in range(1, prec):
            P = P * (t * A) * (QQ(1) / k)
            S = S + P
        return S.apply_map(lambda s: s.truncate(prec))

    trunc = lambda M: M.apply_map(lambda s: Pt(s).truncate(prec))
    lhs = exp_series(matrix(K, [[1, 0], [0, i]]))
    rhs = trunc(diagonal_matrix(Pt, [t.exp(prec), (i * t).exp(prec)]))
    check(lhs == rhs, '3.1 Problem 7 (p. 101): exp t diag(1, i) = '
          'diag(e^t, e^{it}) mod t^20')
    lhs = exp_series(matrix(K, [[1, 1], [0, 1]]))
    rhs = trunc(t.exp(prec) * matrix(Pt, [[1, t], [0, 1]]))
    check(lhs == rhs, '3.1 Problem 7 (p. 101): exp t [[1,1],[0,1]] = '
          'e^t [[1, t], [0, 1]] mod t^20')
    for d in range(1, 6):
        exps = [(a, b) for a in range(d + 1) for b in range(d + 1 - a)]
        # f(e^t, e^{it}) = sum c_ab e^{(a + ib) t}; Taylor coefficient of
        # t^m is sum c_ab (a + ib)^m / m!.
        M = matrix(K, [[(a + b * i) ** m for (a, b) in exps]
                       for m in range(len(exps))])
        check(M.rank() == len(exps),
              '3.1 Hint 7 (p. 109): no nonzero f of degree <= %d with '
              'f(e^t, e^{it}) = 0' % d)
        # second subgroup: (x11, x12) = (e^t, t e^t); x11^a x12^b =
        # t^b e^{(a+b)t}, coefficient of t^N is (a+b)^(N-b) / (N-b)!.
        rows = []
        for N in range(3 * len(exps)):
            rows.append([QQ(a + b) ** (N - b) / factorial(N - b)
                         if N >= b else 0 for (a, b) in exps])
        check(matrix(QQ, rows).rank() == len(exps),
              '3.1 Hint 7 (p. 109): no nonzero f of degree <= %d with '
              'f(e^t, t e^t) = 0 (the other subgroup)' % d)

    # Exercise 5 (p. 108): irreducibility of the M_alpha is needed in
    # Theorem 4.  M = {1, 2} in K^* is closed, contains 1, is epais in its
    # closure, but is reducible; <M> = 2^Z is infinite, so its closure is
    # the irreducible curve K^* (dim 1), which contains 3, not in 2^Z.
    powers = set(QQ(2) ** n for n in range(-30, 31))
    # 2^n has 2-adic valuation n; the only power of 2 of valuation 0 is 1.
    check(len(powers) == 61 and QQ(3).valuation(2) == 0 and QQ(3) != 1,
          '3.1 Exercise 5 (p. 108): <1, 2> = 2^Z in K^* is infinite and '
          'proper (3 is not a power of 2), so not closed')

    # Real forms (pp. 101-102).
    K3 = CyclotomicField(3)
    om = K3.gen()
    conj = K3.hom([om ** 2])
    mu3 = [K3(1), om, om ** 2]
    check(sorted(conj(z) for z in mu3) == sorted(mu3)
          and all(conj(conj(z)) == z for z in mu3)
          and all(conj(a * b) == conj(a) * conj(b) for a in mu3 for b in mu3),
          '3.1 (p. 102): complex conjugation is an involutive automorphism of '
          'the cubic roots of unity')
    fixed = [z for z in mu3 if conj(z) == z]
    check(fixed == [1] and len(mu3) == 3,
          '3.1 (p. 102): its fixed points {1} are not a real form of the '
          '3-element group (|G_0(C)| = 1 != 3)')

    rnd = random.Random(314)

    def gauss(n):
        return matrix(K, n, n, [QQ(rnd.randint(-5, 5))
                                + QQ(rnd.randint(-5, 5)) * i
                                for _ in range(n * n)])

    bar = lambda M: M.apply_map(lambda z: z.conjugate())
    sigma = lambda M: bar(M).transpose().inverse()
    for n in (2, 3):
        for _ in range(3):
            A, B = gauss(n), gauss(n)
            if A.det() == 0 or B.det() == 0:
                continue
            check(sigma(sigma(A)) == A and sigma(A * B) == sigma(A) * sigma(B),
                  '3.1 (p. 101): A -> (conj(A)^t)^(-1) is an involutive '
                  'automorphism (sample, n = %d)' % n)
        H = gauss(n)
        H = H + bar(H).transpose()  # Hermitian
        E = identity_matrix(K, n)
        Uc = (E - i * H) * (E + i * H).inverse()  # a unitary matrix
        check(sigma(Uc) == Uc and Uc * bar(Uc).transpose() == E,
              '3.1 (p. 101): a unitary matrix is fixed by A -> '
              '(conj(A)^t)^(-1) (Cayley transform, n = %d)' % n)

    Rb = PolynomialRing(QQbar, 'x,y')
    xb, yb = Rb.gens()
    fac = (xb * yb - 1).factor()
    check(len(fac) == 1 and fac[0][1] == 1,
          '3.1 Exercise 8 (p. 108): R^* = {xy = 1} is (absolutely) '
          'irreducible; it has two real components x > 0, x < 0')

    Rr = PolynomialRing(K, 'x1,y1,x2,y2')
    x1, y1, x2, y2 = Rr.gens()
    phi = lambda a, b: (a + i * b, a - i * b)
    prod_R = (x1 * x2 - y1 * y2, x1 * y2 + x2 * y1)  # product in (C^*)^R
    u1, v1 = phi(x1, y1)
    u2, v2 = phi(x2, y2)
    check(phi(*prod_R) == (u1 * u2, v1 * v2)
          and x1 ** 2 + y1 ** 2 == u1 * v1,
          '3.1 Exercise 9 (p. 108) for G = C^*: (x, y) -> (x + iy, x - iy) '
          'is a homomorphism (C^*)^R(C) -> C^* x C^*, x^2 + y^2 = u v')

    # Semidirect products in char p (p. 102) and Frobenius (p. 103).
    for p, k in [(2, 2), (2, 3), (3, 1), (3, 2), (5, 1), (7, 1)]:
        Fq = GF(p ** k, 'z')
        units = [z for z in Fq if z != 0]
        H1 = set((z, Fq(1)) for z in units)
        H2 = set((z, z ** p) for z in units)
        check(H1 & H2 == {(Fq(1), Fq(1))},
              '3.1 (p. 102): {z2 = 1} and {z2 = z1^p} meet in 1 over GF(%d)'
              % p ** k)
        prods = set((a * b, b ** p) for a in units for b in units)
        check(len(prods) == len(units) ** 2,
              '3.1 (p. 102): (K^*)^2 = {z2 = 1} x {z2 = z1^p} as an abstract '
              'group over GF(%d)' % p ** k)
        frob = set(z ** p for z in Fq)
        check(len(frob) == p ** k and all(
            (a + b) ** p == a ** p + b ** p for a in Fq for b in Fq),
            '3.1 (p. 103): Frobenius is a bijective homomorphism of GF(%d)'
            % p ** k)
        Rp = PolynomialRing(GF(p), 'a,b')
        a, b = Rp.gens()
        J = matrix(Rp, [[(a * b).derivative(a), (a * b).derivative(b)],
                        [(b ** p).derivative(a), (b ** p).derivative(b)]])
        check(J.det() == 0 and (a ** p).derivative(a) == 0,
              '3.1 (pp. 102-103), char %d: the product morphism '
              '(a, b) -> (ab, b^p) and x -> x^p have zero Jacobian, so they '
              'are not isomorphisms of varieties' % p)

    # Theorem 8, Problem 19, Hint 19, Exercise 13 (pp. 105-106, 108, 110).
    Rg = PolynomialRing(QQ, 'x,g,h')
    xx, gg, hh = Rg.gens()
    # K: K[G] = K[x], V = <1, x>, f_j(x + g) = sum_i a_ij(g) f_i(x)
    basis = [Rg(1), xx]
    Rmat = lambda s: matrix(Rg, [[1, s], [0, 1]])
    check(all(f.subs(x=xx + gg) == sum(Rmat(gg)[r, j] * basis[r]
                                       for r in range(2))
              for j, f in enumerate(basis)),
          '3.1 Exercise 13 (p. 108): r_* on <1, x> has the matrix '
          '[[1, g], [0, 1]]')
    check(Rmat(gg + hh) == Rmat(gg) * Rmat(hh),
          '3.1 Exercise 13: g -> [[1, g], [0, 1]] is a (faithful) '
          'representation of K')
    c = [f.subs(x=0) for f in basis]
    check(all(sum(c[r] * Rmat(gg)[r, j] for r in range(2))
              == basis[j].subs(x=gg) for j in range(2)),
          '3.1 Hint 19 (p. 110): f_j = sum_i c_i a_ij, c_i = f_i(e), for K')

    Rb2 = PolynomialRing(QQ, 'a,b,d,a1,b1,d1,a2,b2,d2')
    Fb = Rb2.fraction_field()
    a, b, d, a1, b1, d1, a2, b2, d2 = [Fb(z) for z in Rb2.gens()]
    fs = [lambda A: A[0, 0], lambda A: A[0, 1], lambda A: A[1, 1],
          lambda A: 1 / (A[0, 0] * A[1, 1])]
    elt = lambda p, q, s: matrix(Fb, [[p, q], [0, s]])
    X0 = elt(a, b, d)

    def Rrep(p, q, s):  # matrix (a_ij(g)) with f_j(x g) = sum_i a_ij f_i(x)
        return matrix(Fb, [[p, q, 0, 0], [0, s, 0, 0], [0, 0, s, 0],
                           [0, 0, 0, 1 / (p * s)]])

    g1 = elt(a1, b1, d1)
    g2 = elt(a2, b2, d2)
    check(all(fs[j](X0 * g1) == sum(Rrep(a1, b1, d1)[r, j] * fs[r](X0)
                                    for r in range(4)) for j in range(4)),
          '3.1 Theorem 8 for B_2: V = <a, b, d, 1/(ad)> is r_*-invariant '
          'with the matrix R(g)')
    g12 = g1 * g2
    check(Rrep(g12[0, 0], g12[0, 1], g12[1, 1])
          == Rrep(a1, b1, d1) * Rrep(a2, b2, d2),
          '3.1 Theorem 8 for B_2: R(g h) = R(g) R(h) in the convention of '
          'Hint 19')
    ce = [f(identity_matrix(Fb, 2)) for f in fs]
    check(all(sum(ce[r] * Rrep(a1, b1, d1)[r, j] for r in range(4))
              == fs[j](g1) for j in range(4)),
          '3.1 Problem 19, Hint 19 (pp. 106, 110): f_j = sum_i c_i a_ij for '
          'B_2, so the matrix elements span V (which contains generators)')

    Rt = PolynomialRing(QQ, 'u,s')
    Ft = Rt.fraction_field()
    uu, ss = [Ft(z) for z in Rt.gens()]
    fs1 = [uu, 1 / uu]
    check(fs1[0](uu * ss, ss) == ss * fs1[0]
          and fs1[1](uu * ss, ss) == fs1[1] / ss,
          '3.1 Theorem 8 for K^*: V = <x, 1/x>, R(g) = diag(g, 1/g)')

    # Theorem 10 (Chevalley), Problems 21-24 (pp. 106-107).
    Rc = PolynomialRing(QQ, 'h11,h12,h21,h22,x11,x12,x21,x22')
    hv = Rc.gens()[0:4]
    xv = Rc.gens()[4:8]
    hM = matrix(Rc, 2, 2, hv)
    xM = matrix(Rc, 2, 2, xv)
    xh = xM * hM
    # U = <x21, x22> (row 2) is invariant under right translations.
    Smat = matrix(Rc, [[hM[0, 0], hM[0, 1]], [hM[1, 0], hM[1, 1]]])
    check(xh[1, 0] == Smat[0, 0] * xv[2] + Smat[1, 0] * xv[3]
          and xh[1, 1] == Smat[0, 1] * xv[2] + Smat[1, 1] * xv[3],
          '3.1 Theorem 10 (p. 106), H = B_2 in GL_2: U = <x21, x22> is '
          'r_*-invariant and contains the generator x21 of I_G(H)')
    # W = U cap I_G(B_2) = <x21>: c1 x21 + c2 x22 vanishes on B_2 iff c2 = 0.
    # S(h) W in W iff the x22-coefficient of r_*(h) x21 vanishes: h21 = 0.
    check(Smat[1, 0] == hv[2],
          '3.1 Problems 21-23 (pp. 106-107): S(h) W in W, i.e. R(h) v0 in '
          'K v0 for v0 = x21, iff h21 = 0, i.e. h in B_2')
    # H = SL_2 normal: v0 = det - 1, R(h) v0 = det(h) det - 1 in K v0 iff
    # det h = 1; T(h) = conjugation by diag(det h, 1) on L(V_1).
    dh = hM.det()
    check((xM * hM).det() == xM.det() * dh
          and matrix(Rc, [[dh, -1], [1, -1]]).det() == 1 - dh,
          '3.1 Theorem 10, H = SL_2: R(h)(det - 1) = det(h) det - 1 is '
          'proportional to det - 1 iff det h = 1')
    Rk = PolynomialRing(QQ, 'D,y11,y12,y21,y22')
    Dv = Rk.gen(0)
    Y = matrix(Rk, 2, 2, Rk.gens()[1:5])
    Rh = diagonal_matrix(Rk, [Dv, 1])
    comm = Rh * Y - Y * Rh
    Iy = Rk.ideal([comm[r, s].coefficient({v_: 1}) for r in range(2)
                   for s in range(2) for v_ in Rk.gens()[1:5]])
    check(Iy == Rk.ideal([Dv - 1]),
          '3.1 Problem 24 (p. 107), H = SL_2: Ker T = {det h = 1} = SL_2')
    # Normalizer N of the diagonal torus T in GL_2, H = T normal, v0 = e1:
    # chi_0(t) = t1 and its conjugate t2 are different; L_0(V_1) is the
    # diagonal matrices; Ker T = elements of N commuting with them = T.
    wmat = matrix(QQ, [[0, 1], [1, 0]])
    tmat = diagonal_matrix(QQ, [2, 3])
    check((wmat.inverse() * tmat * wmat)[0, 0] == tmat[1, 1]
          and (wmat * vector(QQ, [1, 0]))[0] == 0,
          '3.1 Theorem 10 for T in N(T): R(w) e1 is not in K e1, and '
          'chi_0^w(t) = t2 != chi_0(t) = t1')
    Ddiag = [unit(2, 0, 0), unit(2, 1, 1)]
    check(all(wmat * X * wmat.inverse() in [unit(2, 1, 1), unit(2, 0, 0)]
              for X in Ddiag)
          and any(wmat * X != X * wmat for X in Ddiag)
          and all(tmat * X == X * tmat for X in Ddiag),
          '3.1 Problem 24 for T in N(T): w permutes the summands L(V_chi) '
          'and is not in Ker T, T is')
    # Hint 24: the centralizer of (+) L(V_i) in L(V) is the block scalars.
    for sizes in [(1, 1), (2, 1), (1, 2, 3), (2, 2), (1, 1, 1), (3, 1, 2)]:
        n = sum(sizes)
        offs = [sum(sizes[:k]) for k in range(len(sizes))]
        algebra = [unit(n, o + r, o + s) for o, m in zip(offs, sizes)
                   for r in range(m) for s in range(m)]
        cent = solve_matrix_space(
            n, QQ, lambda Yc: block_diagonal_matrix(
                [Yc * Z - Z * Yc for Z in algebra]))
        scalars = [block_diagonal_matrix(
            [identity_matrix(QQ, m) if k == j else zero_matrix(QQ, m)
             for k, m in enumerate(sizes)]) for j in range(len(sizes))]
        check(len(cent) == len(sizes)
              and len(span_basis(cent + scalars)) == len(sizes),
              '3.1 Hint 24 (p. 110): centralizer of (+) L(V_i) for block '
              'sizes %s is the block scalars' % (sizes,))

    # Exercise 2 (p. 108): Aut of K[eps]/(eps^2) in the basis (1, eps).
    Ra = PolynomialRing(QQ, 'p,q,r,s')
    p_, q_, r_, s_ = Ra.gens()
    mul = lambda u, v_: (u[0] * v_[0], u[0] * v_[1] + u[1] * v_[0])
    one, eps = (p_, r_), (q_, s_)  # images of 1 and eps
    eqs = [mul(one, one)[k] - one[k] for k in (0, 1)]
    eqs += [mul(one, eps)[k] - eps[k] for k in (0, 1)]
    eqs += [mul(eps, eps)[k] for k in (0, 1)]
    Iaut = Ra.ideal(eqs).saturation(Ra.ideal([p_ * s_ - q_ * r_]))[0]
    check(Iaut == Ra.ideal([p_ - 1, q_, r_]),
          '3.1 Exercise 2 (p. 108): Aut(K[eps]) = {1 -> 1, eps -> s eps, '
          's != 0}, an algebraic linear group ~ K^*')


# ---------------------------------------------------------------------------
# 3.2 Commutative and solvable algebraic groups
# ---------------------------------------------------------------------------

def section_3_2():
    # 1: the Jordan decomposition (pp. 110-111).
    J = block_diagonal_matrix([jordan_block(QQ(2), 2), matrix(QQ, [[3]]),
                               matrix(QQ, [[-1]])])
    P = matrix(QQ, [[1, 2, 0, 1], [0, 1, 1, 0], [1, 0, 1, 1], [0, 1, 0, 2]])
    assert P.det() != 0
    A = P * J * P.inverse()
    As, An = jordan_parts(A)
    E = identity_matrix(QQ, 4)
    check(As == P * diagonal_matrix(QQ, [2, 2, 3, -1]) * P.inverse(),
          '3.2.1 (p. 111): A_s acts on V^lambda(A) as lambda')
    check(is_semisimple(As) and is_nilpotent(An) and As * An == An * As,
          '3.2.1 (p. 111): A_s semisimple, A_n = A - A_s nilpotent, commuting')
    Au = A * As.inverse()
    check(Au == E + An * As.inverse() and is_nilpotent(Au - E)
          and Au * As == As * Au,
          '3.2.1 (p. 111): A_u = A A_s^(-1) = E + A_n A_s^(-1) unipotent')
    Z = centralizer(A)
    check(Z and all(Y * As == As * Y and Y * An == An * Y and Y * Au == Au * Y
                    for Y in Z),
          '3.2.1 (p. 111): A_s, A_n, A_u commute with every operator '
          'commuting with A (basis of the centralizer, dim %d)' % len(Z))
    check(all(((As - lam * E).right_kernel()
               == ((A - lam * E) ** 4).right_kernel()) for lam in (2, 3, -1)),
          '3.2 Hint 3 (p. 120): V_lambda(A_s) = V^lambda(A)')

    # Irrational eigenvalues: companion matrix of (x^2 - 2)^2; A_s by Newton
    # iteration for the squarefree part f = x^2 - 2 (a polynomial in C).
    Rx = PolynomialRing(QQ, 'x')
    xq = Rx.gen()
    C = companion_matrix((xq ** 2 - 2) ** 2)
    f = xq ** 2 - 2
    Sm = C
    for _ in range(5):
        Sm = Sm - f(Sm) * f.derivative()(Sm).inverse()
    check(f(Sm).is_zero() and is_semisimple(Sm) and is_nilpotent(C - Sm)
          and Sm * C == C * Sm and not (C - Sm).is_zero(),
          '3.2.1 (p. 111): C = C_s + C_n for the companion matrix of '
          '(x^2 - 2)^2, eigenvalues +-sqrt 2')

    # The "commuting" hypotheses are needed (p. 111).
    Nu, Nl = unit(2, 0, 1), unit(2, 1, 0)
    check(not is_nilpotent(Nu + Nl),
          '3.2.1 (p. 111): the sum of NON-commuting nilpotents need not be '
          'nilpotent')
    P1, P2 = matrix(QQ, [[1, 0], [0, 0]]), matrix(QQ, [[0, 1], [0, 1]])
    check(is_semisimple(P1) and is_semisimple(P2)
          and not is_semisimple(P1 + P2),
          '3.2.1 (p. 111): the sum of NON-commuting semisimple operators need '
          'not be semisimple')
    S1, S2 = matrix(QQ, [[1, 0], [0, -1]]), matrix(QQ, [[1, 1], [0, -1]])
    check(is_semisimple(S1) and is_semisimple(S2)
          and S1 * S2 == matrix(QQ, [[1, 1], [0, 1]]),
          '3.2.1 (p. 111): the product of NON-commuting semisimple operators '
          'can be a nontrivial unipotent one')
    for n in range(1, 7):
        Jn = jordan_block(QQ(0), n)
        check((Jn ** n).is_zero()
              and (n == 1 or not (Jn ** (n - 1)).is_zero()),
              '3.2.1 (p. 111): A^m = 0 for some m iff A^n = 0, n = dim V '
              '(Jordan block, n = %d)' % n)

    # 2: exp and log (pp. 111-113), Hints 4, 5 (p. 120).
    prec = 30
    Px = PowerSeriesRing(QQ, 'x', default_prec=prec)
    x = Px.gen()
    e_ = x.exp(prec) - 1
    l_ = (1 + x).log(prec)
    check((l_(e_) - x).truncate(prec) == 0
          and (e_(l_) - x).truncate(prec) == 0,
          '3.2 Hint 4 (p. 120): l(e(x)) = x, e(l(x)) = x mod x^30')
    D2 = 14
    R2 = PolynomialRing(QQ, 'x,y')
    X2, Y2 = R2.gens()

    def trunc(p, deg):
        return sum((c * m for c, m in zip(p.coefficients(), p.monomials())
                    if m.degree() <= deg), R2(0))

    def texp(z):
        return trunc(sum(z ** k / factorial(k) for k in range(D2 + 1)), D2)

    def tlog1p(z):
        return trunc(sum((-1) ** (k - 1) * z ** k / k
                         for k in range(1, D2 + 1)), D2)

    check(texp(X2 + Y2) == trunc(texp(X2) * texp(Y2), D2),
          '3.2 Problem 5, Hint 5 (pp. 112, 120): exp(x + y) = exp x exp y '
          'to total degree 14')
    check(tlog1p(X2 + Y2 + X2 * Y2) == trunc(tlog1p(X2) + tlog1p(Y2), D2),
          '3.2 Problem 5 (p. 112): log((1+x)(1+y)) = log(1+x) + log(1+y) '
          'to total degree 14')

    names = ['a%d%d' % (r, s) for r in range(4) for s in range(r + 1, 4)]
    R4 = PolynomialRing(QQ, names + ['s', 't', 'c1', 'c2', 'c3', 'c4'])
    gens = R4.gens()
    X = zero_matrix(R4, 4)
    for k, (r, s) in enumerate([(r, s) for r in range(4)
                                for s in range(r + 1, 4)]):
        X[r, s] = gens[k]
    s_, t_ = gens[6], gens[7]
    c1, c2, c3, c4 = gens[8:12]
    E4 = identity_matrix(R4, 4)
    check(mlog(mexp(X)) == X and mexp(mlog(E4 + X)) == E4 + X,
          '3.2 Problem 4 (p. 112): exp and log are inverse polynomial maps '
          'on generic 4 x 4 niltriangular matrices')
    Xc, Yc = c1 * X + c2 * X ** 2, c3 * X + c4 * X ** 3
    check(mexp(Xc + Yc) == mexp(Xc) * mexp(Yc)
          and mlog(mexp(Xc) * mexp(Yc)) == mlog(mexp(Xc)) + mlog(mexp(Yc)),
          '3.2 Problem 5 (p. 112): exp(X + Y) = exp X exp Y and '
          'log AB = log A + log B for commuting X, Y (polynomials in X)')
    E3 = identity_matrix(QQ, 3)
    check(mexp(unit(3, 0, 1) + unit(3, 1, 2))
          != mexp(unit(3, 0, 1)) * mexp(unit(3, 1, 2)),
          '3.2 Problem 5: without commutation exp(X + Y) != exp X exp Y '
          '(E12, E23)')
    A4 = E4 + X

    def power_t(A, tt):
        return mexp(mlog(A) * tt)

    check(power_t(A4, s_ + t_) == power_t(A4, s_) * power_t(A4, t_),
          '3.2 Theorem 1 (p. 112): A^(s+t) = A^s A^t, A^t = exp(t log A)')
    F4 = R4.fraction_field()
    ok = all(power_t(A4, R4(n)) == A4 ** n for n in range(0, 6))
    ok = ok and all(power_t(A4, R4(-n)).change_ring(F4)
                    == A4.change_ring(F4).inverse() ** n for n in range(1, 4))
    check(ok, '3.2 Theorem 1 (p. 112): A^t at t = n is the n-th power, '
          'n = -3..5')
    binom_series = sum((X ** k * prod([t_ - j for j in range(k)])
                        * (QQ(1) / factorial(k)) for k in range(4)),
                       zero_matrix(R4, 4))
    check(binom_series == power_t(A4, t_),
          '3.2 Exercise 1 (p. 119): A^t = sum t(t-1)...(t-k+1)/k! X^k')

    # Zariski closure of {A^n} for A = [[1,1,0],[0,1,1],[0,0,1]]: the
    # curve {A^t} = {x12 = x23, 2 x13 = x12^2 - x12}.  A polynomial of
    # degree <= 4 restricted to the curve is a polynomial of degree <= 8
    # in t, so vanishing at n = -10..10 means vanishing on the whole curve.
    Rc = PolynomialRing(QQ, 'y12,y13,y23')
    y12, y13, y23 = Rc.gens()
    pts = [(QQ(n), QQ(n * (n - 1)) / 2, QQ(n)) for n in range(-10, 11)]
    A3 = matrix(QQ, [[1, 1, 0], [0, 1, 1], [0, 0, 1]])
    check(all(A3 ** n == matrix(QQ, [[1, a, b], [0, 1, c], [0, 0, 1]])
              for n, (a, b, c) in zip(range(-10, 11), pts)),
          '3.2 Theorem 1: A^n = [[1, n, n(n-1)/2], [0, 1, n], [0, 0, 1]]')
    dim_v, dim_i, inside = closure_matches(
        Rc, pts, [y12 - y23, 2 * y13 - y12 ** 2 + y12], 4)
    check(dim_v == dim_i and inside,
          '3.2 Theorem 1 (p. 112): the closure of {A^n} is {A^t: t in K} '
          '(degree <= 4, dim %d)' % dim_v)

    # Corollary 1 (p. 112): finite order => semisimple, char 0 only.
    check(all((xq ** m - 1).gcd(m * xq ** (m - 1)) == 1 for m in range(1, 61)),
          '3.2 Corollary 1 (p. 112): x^m - 1 is squarefree over QQ '
          '(m = 1..60), so an operator of finite order is semisimple')
    rot = matrix(QQ, [[0, -1], [1, -1]])
    check(rot ** 3 == identity_matrix(QQ, 2) and is_semisimple(rot),
          '3.2 Corollary 1: an element of order 3 is semisimple')
    for p in (2, 3, 5, 7):
        Jp = matrix(GF(p), [[1, 1], [0, 1]])
        check(Jp ** p == identity_matrix(GF(p), 2) and not is_semisimple(Jp),
              '3.2 Corollary 1 needs char K = 0 (assumed in 3.2): '
              '[[1,1],[0,1]] has order %d over GF(%d), not semisimple'
              % (p, p))

    # 3: tori (pp. 113-115), Hint 8 (p. 120).
    dmax = 3
    Rl = PolynomialRing(QQ, ['c%d' % k for k in range(2 * dmax + 1)])
    cs = Rl.gens()  # c_k is the coefficient of x^(k - dmax)
    eqs = [cs[k] - cs[k] ** 2 for k in range(2 * dmax + 1)]
    eqs += [cs[k] * cs[l] for k in range(2 * dmax + 1)
            for l in range(k + 1, 2 * dmax + 1)]
    eqs += [sum(cs) - 1]
    sols = Rl.ideal(eqs).variety()
    check(len(sols) == 2 * dmax + 1 and all(
        sorted(sol.values()) == [0] * (2 * dmax) + [1] for sol in sols),
        '3.2 Theorem 4, Hint 8 (pp. 113, 120): a Laurent polynomial of degree '
        '<= 3 with chi(xy) = chi(x) chi(y), chi(1) = 1 is a monomial x^k')

    lattices = [
        matrix(ZZ, [[2, 4], [6, 8]]),
        matrix(ZZ, [[1, -2]]),
        matrix(ZZ, [[2, 0, 0], [0, 3, 0]]),
        matrix(ZZ, [[2, 2, 4], [0, 6, 6], [4, 4, 2]]),
        matrix(ZZ, [[1, 1, 0, 0], [0, 2, 2, 0], [0, 0, 0, 3]]),
    ]
    for M in lattices:
        m, n = M.nrows(), M.ncols()
        Dm, Um, Vm = M.smith_form()
        cf = [Dm[k, k] for k in range(min(m, n)) if Dm[k, k] != 0]
        Vinv = Vm.inverse()
        eps_basis = Vinv.rows()  # rows: the basis (epsilon_1, ..., epsilon_n)
        check(Dm == Um * M * Vm and abs(Vm.det()) == 1 and abs(Um.det()) == 1
              and all(cf[k + 1] % cf[k] == 0 for k in range(len(cf) - 1)),
              '3.2 Theorem 5 (p. 114): Smith form of %s, invariant factors %s'
              % (M.rows(), cf))
        gen_rows = matrix(ZZ, [cf[k] * eps_basis[k] for k in range(len(cf))])
        check(M.row_module() == gen_rows.row_module(),
              '3.2 Theorem 5 proof (p. 114): Gamma = <c_1 eps_1, ..., '
              'c_m eps_m> for %s' % (M.rows(),))
        Ns = (4, 6, 12) if n <= 3 else (6,)
        for N in Ns:
            # x = (zeta_N^{a_1}, ...): chi_k(x) = 1 iff <k, a> = 0 mod N
            sub = [a for a in itertools.product(range(N), repeat=n)
                   if all(sum(r[j] * a[j] for j in range(n)) % N == 0
                          for r in M.rows())]
            predicted = prod([gcd(c_, N) for c_ in cf]) * N ** (n - len(cf))
            check(len(sub) == predicted,
                  '3.2 Theorem 5, formula (1) (p. 114): |T^Gamma[%d]| = '
                  'prod gcd(c_i, N) N^(n-m) for %s' % (N, M.rows()))
            if N % cf[-1] == 0 and N ** n * len(sub) <= 2 * 10 ** 6:
                ann = set(k for k in itertools.product(range(N), repeat=n)
                          if all(sum(k[j] * a[j] for j in range(n)) % N == 0
                                 for a in sub))
                gam = set(tuple(int(z) % N for z in
                                sum((lam[r] * M.row(r) for r in range(m)),
                                    vector(ZZ, [0] * n)))
                          for lam in itertools.product(range(N), repeat=m))
                check(ann == gam,
                      '3.2 Theorem 5 (p. 114): the characters trivial on '
                      'T^Gamma[%d] are Gamma mod %d for %s' % (N, N, M.rows()))
    for p, k in [(2, 3), (3, 2), (5, 1)]:
        Fq = GF(p ** k, 'z')
        check([z for z in Fq if z != 0 and z ** p == 1] == [1],
              '3.2 Theorem 5 needs char 0: over GF(%d) x^p = 1 only for '
              'x = 1, '
              'so T^Gamma is trivial for Gamma = pZ != Z' % p ** k)
    # Problem 11 (p. 114): faithful iff weights generate X(T).
    for weights, faithful in [([(2,), (3,)], True), ([(2,), (4,)], False),
                              ([(1, 0), (1, 1)], True),
                              ([(1, 1), (1, -1)], False)]:
        W = matrix(ZZ, weights)
        n = W.ncols()
        kernel12 = [a for a in itertools.product(range(12), repeat=n)
                    if all(sum(r[j] * a[j] for j in range(n)) % 12 == 0
                           for r in W.rows())]
        generates = W.row_module() == ZZ ** n
        check(generates == faithful and (len(kernel12) == 1) == faithful,
              '3.2 Problem 11 (p. 114): weights %s generate X(T) iff the '
              'representation is faithful' % weights)
    # Hint 12 (p. 120): (2, 3, 5) lies in no proper algebraic subgroup.
    box = range(-6, 7)
    check(all(QQ(2) ** a * QQ(3) ** b * QQ(5) ** c != 1
              for a in box for b in box for c in box
              if (a, b, c) != (0, 0, 0)),
          '3.2 Hint 12 (p. 120): no nontrivial character with |k_i| <= 6 is 1 '
          'at (2, 3, 5)')

    # 4-5: Problem 13, Exercise 8, formula (2), Problem 15 (pp. 115-116).
    # A = diag(2, 4, -1): relations x2 = x1^2, x3^2 = 1, a quasitorus with
    # two components.  f(A^n) = sum over bases beta = 2^(a+2b) (-1)^c of
    # (coefficient) beta^n; at most 14 bases for degree <= 3, so vanishing
    # at n = 0..20 means vanishing for all n (Vandermonde).
    Rd = PolynomialRing(QQ, 'z1,z2,z3')
    z1, z2, z3 = Rd.gens()
    pts = [(QQ(2) ** n, QQ(4) ** n, QQ(-1) ** n) for n in range(21)]
    dim_v, dim_i, inside = closure_matches(
        Rd, pts, [z2 - z1 ** 2, z3 ** 2 - 1], 3)
    check(dim_v == dim_i and inside,
          '3.2 Exercise 8 (p. 120): G(diag(2, 4, -1)) = {diag(b1, b1^2, '
          '+-1)} (degree <= 3)')
    rel = matrix(ZZ, [[2, -1, 0], [0, 0, 2]])
    Dr = rel.smith_form()[0]
    check([Dr[k, k] for k in range(2)] == [1, 2],
          '3.2 Problem 13 (p. 115): G(diag(2, 4, -1)) = T^Gamma is a '
          'quasitorus K^* x Z/2 (invariant factors 1, 2)')
    # A = [[2, 2], [0, 2]] = 2E [[1,1],[0,1]]: A^n = 2^n [[1, n], [0, 1]];
    # f(A^n) = sum_k 2^(kn) q_k(n), deg q_k <= 3, k <= 3: 16 unknowns.
    Rq = PolynomialRing(QQ, 'w11,w12,w21,w22')
    w11, w12, w21, w22 = Rq.gens()
    A2 = matrix(QQ, [[2, 2], [0, 2]])
    pts = []
    for n in range(-10, 16):
        B = A2 ** n
        pts.append((B[0, 0], B[0, 1], B[1, 0], B[1, 1]))
    dim_v, dim_i, inside = closure_matches(Rq, pts, [w21, w11 - w22], 3)
    check(dim_v == dim_i and inside,
          '3.2 Problem 15, formula (2) (p. 116): G(A) = {[[a, b], [0, a]]} = '
          'G(A_s) x G(A_u) for A = [[2, 2], [0, 2]] (degree <= 3)')

    # Theorem 7 (p. 115): R = Sym^2 maps unipotent to unipotent and
    # semisimple to semisimple.
    Ru = PolynomialRing(QQ, 'u,p,q')
    u, p_, q_ = Ru.gens()

    def sym2(M):
        (a, b), (c, d) = M.rows()
        # basis x^2, xy, y^2 of Sym^2 K^2, (x, y) -> (a x + c y, b x + d y)
        return matrix(Ru, [[a ** 2, a * b, b ** 2],
                           [2 * a * c, a * d + b * c, 2 * b * d],
                           [c ** 2, c * d, d ** 2]]).transpose()

    Mu = matrix(Ru, [[1, u], [0, 1]])
    Mv = matrix(Ru, [[1, p_], [0, 1]])
    check(sym2(Mu * Mv) == sym2(Mu) * sym2(Mv)
          and ((sym2(Mu) - identity_matrix(Ru, 3)) ** 3).is_zero(),
          '3.2 Theorem 7 (p. 115): Sym^2 of a unipotent matrix is unipotent')
    check(sym2(diagonal_matrix(Ru, [p_, q_])).is_diagonal(),
          '3.2 Theorem 7: Sym^2 of a diagonal matrix is diagonal')

    # 6-9: solvable groups, B_n (pp. 116-119).
    for n in range(2, 7):
        b_n = [unit(n, r, s) for r in range(n) for s in range(r, n)]
        n_n = [unit(n, r, s) for r in range(n) for s in range(r + 1, n)]
        check(len(bracket_span(b_n, b_n)) == len(n_n)
              and len(span_basis(bracket_span(b_n, b_n) + n_n)) == len(n_n)
              and derived_length(b_n) is not None,
              '3.2 Problem 19, Exercise 3.3.9: [b_n, b_n] = n_n, b_n solvable '
              '(n = %d)' % n)
    Rb = PolynomialRing(QQ, ['b%d%d' % (r, s) for r in range(3)
                             for s in range(r, 3)]
                        + ['c%d%d' % (r, s) for r in range(3)
                           for s in range(r, 3)])
    Fb = Rb.fraction_field()
    bv = Rb.gens()

    def tri(vals):
        M = zero_matrix(Fb, 3)
        k = 0
        for r in range(3):
            for s in range(r, 3):
                M[r, s] = vals[k]
                k += 1
        return M

    bm, cm = tri(bv[0:6]), tri(bv[6:12])
    tpart = diagonal_matrix(Fb, [bm[k, k] for k in range(3)])
    upart = bm * tpart.inverse()
    commutator = bm * cm * bm.inverse() * cm.inverse()
    lower_zero = lambda M: all(M[r, s] == 0 for r in range(3)
                               for s in range(r))
    unitri = lambda M: lower_zero(M) and all(M[k, k] == 1 for k in range(3))
    check(unitri(upart) and upart * tpart == bm
          and unitri(tpart * upart * tpart.inverse())
          and unitri(commutator),
          '3.1.3 Example 2, 3.2 Example (pp. 102, 118): B_3 = U T with U '
          'unitriangular normalized by T; (B_3, B_3) in U (Problem 19)')
    # Problem 21 (p. 118): N_{B_n}(T) = Z_{B_n}(T) = T; for generic t the
    # condition b t b^(-1) diagonal forces b diagonal.
    for n in (2, 3):
        Rn = PolynomialRing(QQ, ['t%d' % k for k in range(n)]
                            + ['b%d%d' % (r, s) for r in range(n)
                               for s in range(r, n)])
        tv = Rn.gens()[0:n]
        bvv = Rn.gens()[n:]
        B = zero_matrix(Rn, n)
        k = 0
        for r in range(n):
            for s in range(r, n):
                B[r, s] = bvv[k]
                k += 1
        T = diagonal_matrix(Rn, tv)
        adjB = B.adjugate()  # b^(-1) = adj(b) / det b
        conj_ = B * T * adjB
        eqs = [conj_[r, s] for r in range(n) for s in range(r + 1, n)]
        dets = prod([B[k, k] for k in range(n)])
        diffs = prod([tv[r] - tv[s] for r in range(n)
                      for s in range(r + 1, n)])
        I_ = Rn.ideal(eqs).saturation(Rn.ideal([dets * diffs]))[0]
        offd = Rn.ideal([B[r, s] for r in range(n) for s in range(r + 1, n)])
        check(I_ == offd,
              '3.2 Problem 21 (p. 118): N_{B_%d}(T) = T = Z_{B_%d}(T) '
              '(b t b^(-1) diagonal for t with distinct entries => b in T)'
              % (n, n))
    perms = [matrix(QQ, 3, 3, lambda r, s: 1 if s == pm[r] else 0)
             for pm in itertools.permutations(range(3))]
    tt = diagonal_matrix(QQ, [1, 2, 3])
    check(all((Pm * tt * Pm.inverse()).is_diagonal() for Pm in perms)
          and sum(1 for Pm in perms if Pm * tt == tt * Pm) == 1,
          '3.2 Problem 21 needs solvability: in GL_3, N(T)/Z(T) has order 6')

    # Proof of Theorem 11 (p. 118), G = B_2, g = u t, u t != t u.
    Rh = PolynomialRing(QQ, 'a,c,d,x')
    Fh = Rh.fraction_field()
    a, c, d, xg = [Fh(z) for z in Rh.gens()]
    uu = matrix(Fh, [[1, 1], [0, 1]])
    tt2 = diagonal_matrix(Fh, [2, 1])
    g = uu * tt2
    bgen = matrix(Fh, [[a, c], [0, d]])
    conj_g = bgen * g * bgen.inverse()
    check(uu * tt2 != tt2 * uu and is_semisimple(g.change_ring(QQ)),
          '3.2 Theorem 11 proof: g = u t is semisimple and u t != t u')
    check(conj_g[0, 0] == 2 and conj_g[1, 1] == 1 and conj_g[1, 0] == 0
          and conj_g[0, 1].numerator().degree(Rh.gen(1)) == 1,
          '3.2 Theorem 11 proof (p. 118): C(g) = U g = {[[2, x], [0, 1]]} '
          '(the entry x is affine in c with nonzero slope)')
    hgen = matrix(Fh, [[2, xg], [0, 1]])  # a general element of U g
    conj_h = bgen * hgen * bgen.inverse()
    check(conj_h[0, 0] == 2 and conj_h[1, 1] == 1 and conj_h[1, 0] == 0
          and uu * hgen * uu.inverse() != hgen,
          '3.2 Theorem 11 proof, corrected: C(h) in U g for h in U g, and '
          'u h u^(-1) != h')
    hU = matrix(Fh, [[1, xg], [0, 1]])  # h in U, as printed
    conj_hU = bgen * hU * bgen.inverse()
    refuted(conj_hU[0, 0] == 2 and conj_hU[1, 1] == 1,
            '3.2 Theorem 11 proof as printed (p. 118): "C(h) of any h in U is '
            'contained in U g" (C(h) stays in U, and U and U g are disjoint)')

    # Exercise 5 (p. 120): characters are contravariant.
    # T_1 = K^*, T_2 = (K^*)^2, f(x) = (x^2, x^3), g(y1, y2) = y1 / y2.
    Rc5 = PolynomialRing(QQ, 'x5,k1,k2')
    k1_, k2_ = Rc5.gen(1), Rc5.gen(2)
    # chi_(k1, k2)(f(x)) = x^(2 k1 + 3 k2): the exponent as a linear form
    fstar = matrix(ZZ, [[(2 * k1_ + 3 * k2_).coefficient(k1_),
                         (2 * k1_ + 3 * k2_).coefficient(k2_)]])
    gstar = matrix(ZZ, [[1], [-1]])  # chi_k(g(y)) = y1^k y2^(-k)
    check(fstar.dimensions() == (1, 2) and fstar * gstar == matrix(ZZ, [[-1]]),
          '3.2 Exercise 5 (p. 120): f^* is a map X(T_2) = Z^2 -> X(T_1) = Z, '
          'and (g f)^* = f^* g^* for g f: x -> x^(-1)')
    refuted(fstar.dimensions() == (2, 1),
            '3.2 Exercise 5 as printed: f -> f^* lands in Hom(X(T_1), X(T_2)) '
            '= Hom(Z, Z^2)')

    # Exercise 14 (p. 121): S_3 in its two-dimensional representation.
    s_ = matrix(QQ, [[0, 1], [1, 0]])
    r_ = matrix(QQ, [[0, -1], [1, -1]])
    Gs = MatrixGroup([s_, r_])
    K3 = CyclotomicField(3)
    lines = [v_ for lam, vs, mult in r_.change_ring(K3).eigenvectors_right()
             for v_ in vs]
    s3 = s_.change_ring(K3)
    check(Gs.order() == 6 and Gs.is_solvable() and len(lines) == 2
          and all(matrix(K3, [s3 * v_, v_]).rank() == 2 for v_ in lines),
          '3.2 Exercise 14 (p. 121): S_3 in GL_2(Q) is solvable and has no '
          'common eigenvector over the algebraic closure')
    # Exercise 16 (p. 121): the Klein four-group in PGL_2.
    a_ = matrix(QQ, [[1, 0], [0, -1]])
    b_ = matrix(QQ, [[0, 1], [1, 0]])
    ab = a_ * b_
    check(a_ * b_ * a_.inverse() * b_.inverse() == -identity_matrix(QQ, 2)
          and (ab ** 2).is_scalar(),
          '3.2 Exercise 16 (p. 121): diag(1, -1), [[0,1],[1,0]] commute in '
          'PGL_2 and generate a Klein four-group')
    Kq = QuadraticField(-1, 'I')

    def fixed_lines(M):
        return set(tuple(v_) for lam, vs, mult in
                   M.change_ring(Kq).eigenvectors_right() for v_ in vs)

    fa, fb, fab = fixed_lines(a_), fixed_lines(b_), fixed_lines(ab)
    proj = lambda S: set(tuple(z / next(w for w in v_ if w != 0) for z in v_)
                         for v_ in S)
    check(not (proj(fa) & proj(fb)) and not (proj(fa) & proj(fab))
          and not (proj(fb) & proj(fab)) and fa and fb and fab,
          '3.2 Exercise 16: each element fixes points of P^1 (lies in a '
          'Borel subgroup) but they have no common fixed point')

    # Theorem 12 (p. 119): flag stabilizers.
    def stabilizer(basis, flag, F=QQ):
        n = basis[0].nrows()
        conds = []
        for Vi in flag:
            Bi = matrix(F, Vi).transpose()
            Ci = Bi.left_kernel().basis_matrix()
            conds.append((Bi, Ci))

        def lin(Xm):
            return block_diagonal_matrix([Ci * Xm * Bi for Bi, Ci in conds])

        return solve_matrix_space(n, F, lin, basis)

    for n in range(2, 6):
        gl = [unit(n, r, s) for r in range(n) for s in range(n)]
        flag = [[vector(QQ, [1 if j == k else 0 for j in range(n)])
                 for k in range(m)] for m in range(1, n)]
        st = stabilizer(gl, flag)
        check(len(st) == n * (n + 1) // 2 and derived_length(st) is not None
              and n * n - len(st) == n * (n - 1) // 2,
              '3.2 Theorem 12 (p. 119): the stabilizer of a flag in gl_%d is '
              'b_%d, solvable; orbit dimension %d = dim F(V)'
              % (n, n, n * (n - 1) // 2))
    J3 = matrix(QQ, [[0, 0, 1], [0, 1, 0], [1, 0, 0]])
    so3 = solve_matrix_space(3, QQ, lambda Xm: Xm.transpose() * J3 + J3 * Xm)
    e = identity_matrix(QQ, 3).columns()
    st_iso = stabilizer(so3, [[e[0]], [e[0], e[1]]])
    v1, v2 = vector(QQ, [1, 1, 1]), vector(QQ, [1, 2, 3])
    st_gen = stabilizer(so3, [[v1], [v1, v2]])
    check(len(so3) == 3 and len(st_iso) == 2 and derived_length(st_iso) == 2
          and len(st_gen) == 0 and e[0] * J3 * e[0] == 0,
          '3.2 Theorem 12 for SO_3: the isotropic flag has a 2-dimensional '
          'solvable (Borel) stabilizer, orbit of dim 1 (a conic); a generic '
          'flag has an open orbit (dim 3 = dim F(K^3))')
    J4 = matrix(QQ, [[0, 0, 0, 1], [0, 0, 1, 0], [0, -1, 0, 0],
                     [-1, 0, 0, 0]])
    sp4 = solve_matrix_space(4, QQ, lambda Xm: Xm.transpose() * J4 + J4 * Xm)
    e4 = identity_matrix(QQ, 4).columns()
    st_sp = stabilizer(sp4, [e4[:1], e4[:2], e4[:3]])
    check(len(sp4) == 10 and len(st_sp) == 6
          and derived_length(st_sp) is not None
          and len(sp4) - len(st_sp) == 4,
          '3.2 Theorem 12 for Sp_4: the isotropic flag has a 6-dimensional '
          'solvable stabilizer (Borel), orbit dim 4 = number of positive '
          'roots of C_2')


# ---------------------------------------------------------------------------
# 3.3 The tangent algebra
# ---------------------------------------------------------------------------

def int_relations(vals, F):
    """The lattice of integer relations sum k_i x_i = 0 among elements of a
    number field F (coordinates over QQ)."""
    rows = [list(F(v_).vector()) if hasattr(F(v_), 'vector')
            else [QQ(v_)] for v_ in vals]
    M = matrix(QQ, rows)  # n x deg
    den = M.denominator()
    Mz = (M * den).change_ring(ZZ)
    return Mz.left_kernel()


def section_3_3():
    # 2 (p. 123): d chi_k (xi) = <k, xi>, formula (1) and Problem 2.
    prec = 8
    Rxi = PolynomialRing(QQ, 'xi1,xi2,xi3')
    Ps = PowerSeriesRing(Rxi, 's', default_prec=prec)
    s_ = Ps.gen()
    xi = Rxi.gens()

    def dchi(k):
        # chi_k(exp(s xi)) = exp(s <k, xi>); its s-derivative at 0
        val = prod([(s_ * xi[j]).exp(prec) ** k[j] if k[j] >= 0
                    else (-(s_ * xi[j])).exp(prec) ** (-k[j])
                    for j in range(3)])
        return val.padded_list(prec)[1]

    k1, k2 = (2, -1, 0), (1, 3, -2)
    ksum = tuple(a + b for a, b in zip(k1, k2))
    check(dchi(ksum) == dchi(k1) + dchi(k2)
          and dchi(k1) == 2 * xi[0] - xi[1],
          '3.3 formula (1) (p. 123): d(chi_1 + chi_2) = d chi_1 + d chi_2, '
          'd chi_k = sum k_i xi_i')
    Vb = matrix(ZZ, [[2, 1, 0], [1, 1, 0], [0, 0, 1]])  # a basis of X(T)
    check(abs(Vb.det()) == 1 and Vb.change_ring(QQ).rank() == 3,
          '3.3 Problem 2 (p. 123): the differentials of a basis of X(T) are '
          'a basis of t^*')
    # Problem 4 (p. 123): the tangent algebra of T^Gamma is the rational
    # subspace Gamma^perp, of dimension n - rank Gamma.
    for M in [matrix(ZZ, [[2, 4], [6, 8]]), matrix(ZZ, [[1, -2]]),
              matrix(ZZ, [[2, 0, 0], [0, 3, 0]])]:
        tan = M.change_ring(QQ).right_kernel()
        check(tan.dimension() == M.ncols() - M.rank(),
              '3.3 Problem 4 (p. 123): Lie(T^Gamma) = Gamma^perp is defined '
              'over Q, dim n - rank Gamma, for %s' % (M.rows(),))

    # Exercises 10, 11 (p. 129) and Problem 3.1.7.
    K = QuadraticField(-1, 'I')
    i = K.gen()
    rel = int_relations([1, 2, i], K)
    check(rel.rank() == 1 and vector(ZZ, [2, -1, 0]) in rel,
          '3.3 Exercise 11: the integer relations of (1, 2, i) are Z(2, -1, 0)'
          ', so g(diag(1, 2, i)) = {diag(y1, 2 y1, y3)}, the tangent algebra '
          'of {x2 = x1^2} (Problem 4)')
    rel = int_relations([1, i], K)
    check(rel.rank() == 0,
          '3.3 Exercise 11 and Problem 3.1.7: (1, i) has no integer '
          'relation, g(diag(1, i)) is 2-dimensional, so <diag(1, i)> and '
          'the subgroup exp t diag(1, i) are not algebraic')
    Xm = matrix(QQ, [[1, 1], [0, 1]])
    Xs, Xn = jordan_parts(Xm)
    rel = int_relations([1, 1], QQ)
    check(Xs == identity_matrix(QQ, 2) and Xn == unit(2, 0, 1)
          and rel.rank() == 1 and vector(ZZ, [1, -1]) in rel,
          '3.3 Exercises 10, 11 and Problem 3.1.7: for X = [[1,1],[0,1]], '
          'g(X) = g(E) + <E12> = <E, E12> is 2-dimensional, the tangent '
          'algebra of {[[a, b], [0, a]]}')

    # Theorem 3 (p. 124): (h^a)' = h' for h = <diag(1, sqrt 2), E12>.
    K2 = QuadraticField(2, 'r')
    r2 = K2.gen()
    Dm = diagonal_matrix(K2, [1, r2])
    h = [Dm, unit(2, 0, 1, K2)]
    rel = int_relations([1, r2], K2)
    ha = [unit(2, 0, 0, K2), unit(2, 1, 1, K2), unit(2, 0, 1, K2)]  # b_2
    check(rel.rank() == 0
          and len(span_basis(bracket_span(h, h, K2), K2)) == 1
          and len(span_basis(bracket_span(h, h, K2)
                             + bracket_span(ha, ha, K2), K2)) == 1
          and derived_length(ha, K2) is not None,
          '3.3 Theorem 3, Corollary 2 (p. 124): h^a = b_2 and '
          '(h^a)\' = h\' = <E12>; h^a solvable')

    # Engel's theorem (pp. 125-126), Hint 12 (p. 129).
    for n in range(1, 7):
        for lam in Partitions(n):
            X = block_diagonal_matrix([jordan_block(QQ(0), part)
                                       for part in lam])
            m = max(lam)
            ad = matrix(QQ, [bracket(X, unit(n, r, s)).list()
                             for r in range(n) for s in range(n)]).transpose()
            check((ad ** (2 * m - 1)).is_zero()
                  and (m == 1 or not (ad ** (2 * m - 2)).is_zero()),
                  '3.3 Hint 12 (p. 129): X^%d = 0 => (ad X)^%d = 0, and not '
                  'less (Jordan type %s)' % (m, 2 * m - 1, list(lam)))
    for n in range(2, 7):
        n_n = [unit(n, r, s) for r in range(n) for s in range(r + 1, n)]
        b_n = [unit(n, r, s) for r in range(n) for s in range(r, n)]
        scal_n = span_basis([identity_matrix(QQ, n)] + n_n)
        check(lower_central_length(n_n) == n - 1,
              '3.3 (p. 126): n_%d is nilpotent (lower central series of '
              'length %d)' % (n, n - 1))
        check(lower_central_length(scal_n) is not None
              and not is_nilpotent(identity_matrix(QQ, n)),
              '3.3 (p. 126): <E> + n_%d is nilpotent but not unipotent' % n)
        check(lower_central_length(b_n) is None,
              '3.3 Exercise 8 (p. 129): b_%d is not nilpotent (ad of a '
              'diagonal element is not nilpotent)' % n)
    Rn4 = PolynomialRing(QQ, ['p%d%d' % (r, s) for r in range(4)
                              for s in range(r + 1, 4)])
    Xg = zero_matrix(Rn4, 4)
    k = 0
    for r in range(4):
        for s in range(r + 1, 4):
            Xg[r, s] = Rn4.gen(k)
            k += 1
    n4 = [unit(4, r, s) for r in range(4) for s in range(r + 1, 4)]
    cols = []
    for B in n4:
        br = (Xg * B.change_ring(Rn4) - B.change_ring(Rn4) * Xg)
        # coordinates of br in the basis n4 are its entries above the diagonal
        cols.append([br[r, s] for r in range(4) for s in range(r + 1, 4)])
    adX = matrix(Rn4, cols).transpose()
    check((adX ** 3).is_zero() and not (adX ** 2).is_zero(),
          '3.3 Problem 12 (p. 125): for the unipotent n_4, ad n_4 consists of '
          'nilpotent operators ((ad X)^3 = 0 on n_4, generic X)')

    # Theorem 7 (p. 126), Hint 16 (p. 129): exp n_k is a group (BCH).
    for n in (3, 4):
        pos = [(r, s) for r in range(n) for s in range(r + 1, n)]
        Rb = PolynomialRing(QQ, ['x%d%d' % rs for rs in pos]
                            + ['y%d%d' % rs for rs in pos])
        X = zero_matrix(Rb, n)
        Y = zero_matrix(Rb, n)
        for k, (r, s) in enumerate(pos):
            X[r, s] = Rb.gen(k)
            Y[r, s] = Rb.gen(len(pos) + k)
        XY = bracket(X, Y)
        Zbch = X + Y + XY * QQ(1) / 2 + (bracket(X, XY) - bracket(Y, XY)) * (
            QQ(1) / 12)
        check(mexp(X) * mexp(Y) == mexp(Zbch),
              '3.3 Theorem 7 (p. 126): exp X exp Y = exp(BCH(X, Y)) on n_%d, '
              'so exp: n_%d -> U_%d is onto a group' % (n, n, n))

    # Problem 13, Hint 13 (pp. 126, 129): exp tX = exp tX_s exp tX_n.
    J = block_diagonal_matrix([jordan_block(QQ(2), 2), matrix(QQ, [[-1]])])
    P = matrix(QQ, [[1, 1, 0], [0, 1, 2], [1, 0, 1]])
    X = P * J * P.inverse()
    Xs, Xn = jordan_parts(X)
    prec = 15
    Pt = PowerSeriesRing(QQ, 't', default_prec=prec)
    t = Pt.gen()

    def exp_series(M):
        M = M.change_ring(Pt)
        S = identity_matrix(Pt, M.nrows())
        Q = S
        for k in range(1, prec):
            Q = Q * (t * M) * (QQ(1) / k)
            S = S + Q
        return S.apply_map(lambda f: f.truncate(prec))

    expXs = (P * diagonal_matrix(Pt, [t.exp(prec) ** 2, t.exp(prec) ** 2,
                                      (-t).exp(prec)]) * P.inverse())
    lhs = exp_series(X)
    rhs = (expXs * exp_series(Xn)).apply_map(lambda f: f.truncate(prec))
    check(lhs == rhs and exp_series(Xs) == expXs.apply_map(
        lambda f: f.truncate(prec)),
        '3.3 Hint 13 (p. 129): exp tX = (exp tX_s)(exp tX_n) mod t^15, '
        'exp tX_s diagonalized by the eigenbasis of X_s for all t')


# ---------------------------------------------------------------------------
# 3.4 Compact linear groups
# ---------------------------------------------------------------------------

def centroid_polygon(pts):
    """Centre of mass of a convex polygon given by its vertices in cyclic
    order (triangle fan)."""
    area = QQ(0)
    cx = vector(QQ, [0, 0])
    p0 = vector(QQ, pts[0])
    for k in range(1, len(pts) - 1):
        p1, p2 = vector(QQ, pts[k]), vector(QQ, pts[k + 1])
        a = ((p1 - p0)[0] * (p2 - p0)[1] - (p1 - p0)[1] * (p2 - p0)[0]) / 2
        area += a
        cx += a * (p0 + p1 + p2) / 3
    return cx / area


def section_3_4():
    # Centre of mass (p. 131), Problem 1, Hint 1 (p. 134).
    quad = [(0, 0), (4, 0), (4, 1), (0, 3)]
    P = Polyhedron(vertices=quad)
    check(P.centroid() == centroid_polygon(quad)
          and P.centroid() != sum(vector(QQ, q) for q in quad) / 4,
          '3.4.1 (p. 131): Sage centroid is the centre of mass (checked by a '
          'triangle fan), not the vertex average')
    rnd = random.Random(2718)
    Mg = matrix(QQ, [[2, 1], [1, 3]])
    bg = vector(QQ, [QQ(1) / 3, -2])
    gmap = lambda v_: Mg * vector(QQ, v_) + bg
    for _ in range(4):
        pts = [(rnd.randint(-9, 9), rnd.randint(-9, 9)) for _ in range(7)]
        Pp = Polyhedron(vertices=pts)
        if Pp.dim() < 2:
            continue
        c = Pp.centroid()
        check(Pp.contains(c),
              '3.4 Problem 1 (p. 131): c(M) in M (random polygon)')
        Pg = Polyhedron(vertices=[gmap(v_) for v_ in Pp.vertices_list()])
        check(Pg.centroid() == gmap(c),
              '3.4.1 (p. 131): c(gM) = g c(M) for an affine g')
    for R, pcentre in [(matrix(QQ, [[0, -1], [1, 0]]),
                        vector(QQ, [QQ(1) / 3, QQ(2) / 5])),
                       (matrix(QQ, [[0, -1], [1, -1]]),
                        vector(QQ, [-1, QQ(3) / 7]))]:
        aff = lambda v_: R * (v_ - pcentre) + pcentre
        orbit = [vector(QQ, [5, 1])]
        while True:
            nxt = aff(orbit[-1])
            if nxt == orbit[0]:
                break
            orbit.append(nxt)
        Po = Polyhedron(vertices=orbit)
        check(Po.centroid() == pcentre and aff(pcentre) == pcentre,
              '3.4 Theorem 1 proof (p. 131): the centre of mass of the hull '
              'of an orbit of a finite affine group (order %d) is its fixed '
              'point' % len(orbit))

    # Theorem 2 (p. 131) by averaging; Exercise 1 (p. 134).
    gens = [matrix(QQ, [[0, 1], [1, 0]]), matrix(QQ, [[0, -1], [1, -1]])]
    group = [identity_matrix(QQ, 2)]
    frontier = list(group)
    while frontier:
        new = []
        for g in frontier:
            for s in gens:
                h = g * s
                if h not in group:
                    group.append(h)
                    new.append(h)
        frontier = new
    Q = sum(g.transpose() * g for g in group)
    check(len(group) == 6 and all(g.transpose() * Q * g == Q for g in group)
          and Q.is_positive_definite(),
          '3.4 Theorem 2 (p. 131): an invariant positive definite form for '
          'S_3 in GL_2(Q) (average over the group)')

    def invariant_forms(gs):
        return solve_matrix_space(
            2, QQ, lambda S: block_diagonal_matrix(
                [S - S.transpose()] + [g.transpose() * S * g - S for g in gs]))

    check(len(invariant_forms(gens)) == 1,
          '3.4 Exercise 1 (p. 134): for the irreducible S_3 the invariant '
          'form is unique up to a factor')
    check(len(invariant_forms([diagonal_matrix(QQ, [1, -1])])) == 2,
          '3.4 Exercise 1 needs irreducibility: {E, diag(1, -1)} has a '
          '2-dimensional space of invariant forms')
    Jb = matrix(QQ, [[1, 1], [0, 1]])
    lines = [v_ for lam, vs, mult in Jb.eigenvectors_right() for v_ in vs]
    check(len(lines) == 1 and lines[0] == vector(QQ, [1, 0]),
          '3.4 Exercise 2 (p. 134): <[[1,1],[0,1]]> has the single invariant '
          'line <e1> without an invariant complement')

    # 3 (p. 132): A -> A^* is a representation of GL(V) in K[V].
    Rr = PolynomialRing(QQ, 'a11,a12,a21,a22,b11,b12,b21,b22,x1,x2')
    Fr = Rr.fraction_field()
    v = [Fr(z) for z in Rr.gens()]
    A = matrix(Fr, 2, 2, v[0:4])
    B = matrix(Fr, 2, 2, v[4:8])
    xv = vector(Fr, v[8:10])
    f = lambda y: y[0] ** 3 + 2 * y[0] * y[1] - y[1] ** 2
    star = lambda M, phi: (lambda y: phi(M.inverse() * y))
    check(star(A * B, f)(xv) == star(A, star(B, f))(xv),
          '3.4.3 (p. 132): (AB)^* = A^* B^* for (A^* f)(x) = f(A^(-1) x)')

    # The S_n example (p. 132).
    for n in range(1, 8):
        Rs = PolynomialRing(QQ, ['x%d' % k for k in range(n)] + ['t'])
        xs, t = Rs.gens()[:n], Rs.gens()[n]
        sig = [sum(prod(c_) for c_ in itertools.combinations(xs, k))
               for k in range(n + 1)]
        check(prod([t - xk for xk in xs])
              == sum((-1) ** k * sig[k] * t ** (n - k) for k in range(n + 1)),
              '3.4.3 (p. 132): prod (t - x_i) = t^n - sigma_1 t^(n-1) + ... + '
              '(-1)^n sigma_n, n = %d' % n)

    def sigmas(p):
        return tuple(sum(prod(c_) for c_ in itertools.combinations(p, k))
                     for k in range(1, len(p) + 1))

    for n, top in [(3, 3), (4, 2)]:
        pts = list(itertools.product(range(top + 1), repeat=n))
        by_sig = {}
        for p in pts:
            by_sig.setdefault(sigmas(p), set()).add(tuple(sorted(p)))
        check(all(len(v_) == 1 for v_ in by_sig.values()),
              '3.4.3 (p. 132): the sigma_k separate the S_%d-orbits on '
              '{0..%d}^%d' % (n, top, n))

    # Conjugation example (p. 132) and Exercise 5 (p. 134).
    Rs = PolynomialRing(QQ, 's')
    sv = Rs.gen()
    Fs = Rs.fraction_field()
    J2 = matrix(Fs, [[1, 1], [0, 1]])
    Ds = diagonal_matrix(Fs, [sv, 1])
    E2 = identity_matrix(QQ, 2)
    check(Ds * J2 * Ds.inverse() == matrix(Fs, [[1, sv], [0, 1]])
          and J2.charpoly() == E2.change_ring(Fs).charpoly()
          and (J2 - 1).rank() == 1,
          '3.4.3 (p. 132), Exercise 5 (p. 134): E and [[1,1],[0,1]] have the '
          'same characteristic polynomial, are not similar, and E lies in '
          'the closure of the orbit {[[1, s], [0, 1]]: s != 0}')

    # Exercise 4 (p. 134): invariants of degree d of GL_n acting by
    # conjugation = kernel of the derivations [E_ab, X] d/dX.
    for n, dmax in [(2, 4), (3, 3)]:
        names = ['x%d%d' % (r, s) for r in range(n) for s in range(n)]
        Rx = PolynomialRing(QQ, names)
        Xg = matrix(Rx, n, n, Rx.gens())
        cp = Xg.charpoly()
        coeffs = [cp[k] for k in range(n)]
        derivs = []
        for r in range(n):
            for s in range(n):
                br = bracket(unit(n, r, s).change_ring(Rx), Xg)
                derivs.append(lambda f, br=br: sum(
                    br[a, b] * f.derivative(Xg[a, b])
                    for a in range(n) for b in range(n)))
        check(all(D(cf) == 0 for D in derivs for cf in coeffs),
              '3.4 Exercise 4: the coefficients of the characteristic '
              'polynomial are invariant (n = %d)' % n)
        jac = matrix(Rx, [[cf.derivative(z) for z in Rx.gens()]
                          for cf in coeffs])
        check(jac.rank() == n,
              '3.4 Exercise 4: they are algebraically independent (n = %d)'
              % n)
        for d in range(1, dmax + 1):
            mons = Rx.monomials_of_degree(d)
            index = {m: k for k, m in enumerate(mons)}
            entries = {}
            for di, D in enumerate(derivs):
                for col, m in enumerate(mons):
                    img = D(m)
                    for c_, mm in zip(img.coefficients(), img.monomials()):
                        entries[(di * len(mons) + index[mm], col)] = c_
            Mat = matrix(QQ, len(derivs) * len(mons), len(mons), entries,
                         sparse=True)
            dim_inv = len(mons) - Mat.rank()
            check(dim_inv == Partitions(d, max_part=n).cardinality(),
                  '3.4 Exercise 4 (p. 134): dim K[L_%d(K)]^G in degree %d = '
                  'number of monomials in c_1..c_%d of weight %d'
                  % (n, d, n, d))

    # Example to Theorem 3 (p. 133): O_3 on real symmetric matrices.
    Ro = PolynomialRing(QQ, ['s1', 's2', 's3'] + ['y%d%d' % (r, s)
                                                  for r in range(3)
                                                  for s in range(r, 3)])
    Fo = Ro.fraction_field()
    s1, s2, s3 = [Fo(z) for z in Ro.gens()[:3]]
    Sk = matrix(Fo, [[0, s1, s2], [-s1, 0, s3], [-s2, -s3, 0]])
    E3 = identity_matrix(Fo, 3)
    Aorth = (E3 - Sk) * (E3 + Sk).inverse()
    Xsym = zero_matrix(Fo, 3)
    k = 3
    for r in range(3):
        for s in range(r, 3):
            Xsym[r, s] = Xsym[s, r] = Fo(Ro.gen(k))
            k += 1
    orthogonal = Aorth.transpose() * Aorth == E3
    RX = Aorth * Xsym * Aorth.transpose()  # A^(-1) = A^t
    check(orthogonal and RX.is_symmetric()
          and RX.charpoly() == Xsym.charpoly(),
          '3.4 Example (p. 133): for orthogonal A (Cayley), A X A^(-1) is '
          'symmetric with the same characteristic polynomial (generic X)')
    for Xs_ in [matrix(QQ, [[2, 1, 0], [1, 2, 1], [0, 1, 2]]),
                matrix(QQ, [[1, 1, 1], [1, 1, 1], [1, 1, 1]]),
                matrix(QQ, [[0, 3, -1], [3, 5, 2], [-1, 2, -4]])]:
        XA = Xs_.change_ring(AA)
        eig = XA.eigenvectors_right()
        vecs = [(lam, v_) for lam, vs, mult in eig for v_ in vs]
        check(sum(mult for lam, vs, mult in eig) == 3
              and XA.is_diagonalizable()
              and all(v_ * w_ == 0 for (l1, v_) in vecs for (l2, w_) in vecs
                      if l1 != l2),
              '3.4 Example (p. 133): a real symmetric matrix has real '
              'eigenvalues and orthogonal eigenspaces, so its orbit contains '
              'a diagonal matrix')
    K = QuadraticField(-1, 'I')
    i = K.gen()
    Nc = matrix(K, [[1, i], [i, -1]])
    check(Nc.is_symmetric() and (Nc ** 2).is_zero() and not Nc.is_zero()
          and Nc.charpoly() == zero_matrix(K, 2).charpoly(),
          '3.4 Theorem 3 needs a real space and a compact group: over C, '
          'the symmetric [[1, i], [i, -1]] != 0 has the characteristic '
          'polynomial of 0')
    Rl = PolynomialRing(K, 'lam')
    Fl = Rl.fraction_field()
    lam = Fl(Rl.gen())
    ca, sb = (lam + 1 / lam) / 2, (lam - 1 / lam) / (2 * i)
    Aso = matrix(Fl, [[ca, -sb], [sb, ca]])
    Ncl = Nc.change_ring(Fl)
    conjN = Aso * Ncl * Aso.inverse()
    check(Aso.transpose() * Aso == identity_matrix(Fl, 2)
          and Aso.det() == 1
          and (conjN == lam ** 2 * Ncl or conjN == Ncl / lam ** 2),
          '3.4: in SO_2(C), A_lambda N A_lambda^(-1) = lambda^(+-2) N, so 0 '
          'lies in the closure of the orbit of N and no invariant separates')


def main():
    section_3_1()
    section_3_2()
    section_3_3()
    section_3_4()
    print('ok %s: %d checks' % (SCOPE, COUNT[0]))


if __name__ == '__main__':
    main()
