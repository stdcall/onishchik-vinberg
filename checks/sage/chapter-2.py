"""Exact checks of Chapter 2, "Algebraic Varieties" (Onishchik-Vinberg 1990).

Files: content/20-algebraic-varieties.typ, 21-affine-varieties.typ,
22-projective-varieties.typ, 23-dimension.typ; the corrections are in
corrections.json.  The expected values are the book's statements, taken from
the printed book (printed pages given at every check); where the book prints
no answer (an exercise asks "find ...") the script records our answer and
says so.

Where the printed text is wrong the check of the printed reading is kept
beside the corrected one (`refuted(...)`): the printed claim fails, the
corrected claim holds.  Book errors found here:

* 2.1 Exercise 17 (p. 72): false in characteristic p (level sets of
  X^p are points, X is not a rational function of X^p); corrected
  "char K = 0".
* 2.2 Exercise 9 (p. 85): false in characteristic 2 (the conic is the
  double line (U0 + U1 + U2)^2 = 0 and f is constant); corrected
  "char K != 2".
* 2.3 Problem 9 and Hint 9 (pp. 88, 96): false in
  characteristic p (d/dt does not extend to K[t][t^(1/p)], f'(u) = 0);
  corrected "char K = 0".
* 2.3 Exercise 3 (p. 94): false in characteristic 2 (X2 = 0 singles
  the line out of the surface, which is then a cone); corrected
  "char K != 2".
* 2.3 Exercise 21 (p. 96): false for p of degree 0 (a nonzero
  constant: M1 is empty); corrected "of positive degree".

Covered (section.number as in the book; p. = printed page):

* § 1: the ideals (X), (X^2) (p. 60); the dominant non-surjective
  morphism of 5° (p. 66); the prime ideals of K[X] (p. 67); the
  coefficient identities of Hint 22 for m = 2..8 (Theorem 4, p. 74); the
  remark after Theorem 8 in char 2, 3, 5, 7 (p. 71); Exercises 5, 6, 7,
  11 (hypothesis), 14, 15, 16 (our answers), 17 (refuted in char p).
* § 2: Exercise 1 (instance); Problems 30, 31, Hints 30-32 (Segre, for
  (n, m) up to (3, 3), exhaustive over GF(2), GF(3) for small (n, m));
  Exercises 7 (m = 1..8), 8, 9, 11, 12; Problems 33-37, Hints 34-37
  (exhaustive over GF(2)^n, n <= 5, n = 6 with k != 3, GF(3)^n, n <= 4;
  radicals over QQ for Gr_2(K^4), Gr_2(K^5), Gr_3(K^5)); Problems 38, 39
  for flags of K^3.
* § 3: Theorem 3 (with Exercises 14 and 19) on the Segre, Veronese,
  Grassmann (Gr_2(K^4..6), Gr_3(K^5), Gr_3(K^6)) and flag examples; Hint 3
  (m = 1..8); Problem 9, Hint 9 (identity for degree <= 6, char p
  counterexample for p = 2, 3, 5, 7); the char 0 hypotheses of Exercises
  13, 14, 16; Exercises 3, 8, 10; Problem 18, Hint 18 (r = 1..4);
  Exercise 17 and its hint (six ideals), 18 (d = 0..6), 19, 20, 21;
  Problem 25 and Exercise 23 (z1 z2 = 1).

Scope and what is NOT established:

* Identities in polynomial rings over QQ or ZZ in the written variables are
  proved in those variables (ZZ: in every characteristic).  Statements
  about all m, n, r, d are checked only in the listed ranges.
* Ideal computations (kernels, radicals, saturations, ideal quotients,
  minimal primes) are exact Groebner computations over QQ or GF(q).  Over
  QQ they give the answer over every field of characteristic 0 for the
  ideals written with rational coefficients; they say nothing about
  characteristic p unless stated.
* Exhaustive enumerations over finite fields GF(q) prove the statement for
  those GF(q)-points only; the book's K is algebraically closed.  They are
  used for statements of linear algebra (Plucker, Segre) that do not
  depend on the field, and as illustrations.
* Dimensions are computed three independent ways where possible: Krull
  dimension of the prime ideal (Groebner), n - rank J (Theorem 3.3), the
  rank of the differential of a parametrization (Exercise 3.14), and the
  pole order of the Poincare series (Exercise 3.19).  The rank over the
  function field is pinned down exactly by a lower bound (rank at a
  rational point) and an upper bound (J(phi) Dphi = 0, rank Dphi at the
  same point).
* The general theorems (Nullstellensatz, Theorems 1.3-1.8, 2.1-2.4,
  3.1-3.6) are not proved here, and nothing here compares our text with the
  printed book.

Literature consulted for the corrections (not used by the script): M. Geck,
An Introduction to Algebraic Geometry and Algebraic Groups, Oxford Graduate
Texts in Mathematics 10, OUP 2003: Proposition 1.2.18 (p. 21), Proposition
1.4.5 (p. 39), Exercises 1.8.14, 1.8.15 (p. 93).

Run with:  sage -python checks/sage/chapter-2.py
"""
from itertools import combinations, product

from sage.all import (GF, QQ, QQbar, ZZ, FractionField, NumberField,
                      PolynomialRing, PowerSeriesRing, VectorSpace, binomial,
                      factorial, gcd, matrix, prod)

CHECKS = []


def check(condition, where):
    """A statement of the book (or our answer to an exercise) that holds."""
    assert condition, 'FAILED: ' + where
    CHECKS.append(where)


def refuted(condition, where):
    """The printed reading, kept as a check that must FAIL."""
    assert not condition, 'printed reading unexpectedly holds: ' + where
    CHECKS.append('REFUTED ' + where)


def jac(fs, xs):
    return matrix([[f.derivative(x) for x in xs] for f in fs])


def point(n, salt=0):
    """A fixed rational point (deterministic, avoids small special values)."""
    return [QQ((7 * i * i + 3 * i + 5 + salt) % 29 - 13) for i in range(n)]


def evaluate(mat, values):
    return matrix(QQ, [[e(*values) for e in row] for row in mat.rows()])


def poincare_form(H):
    """Write a Poincare series as p(t)/(1 - t)^(d+1); return (p, d)."""
    Rt = PolynomialRing(QQ, 't')
    t = Rt.gen()
    F = FractionField(Rt)
    H = F(H)
    for j in range(0, 40):
        q = H * (1 - t) ** j
        if q.denominator().degree() == 0:
            p = Rt(q.numerator()) / q.denominator()
            if p(1) != 0:
                return Rt(p), j - 1
    raise AssertionError('no form p/(1-t)^(d+1)')


def projective_checks(where, ideal, d_expected=None):
    """Exercise 3.19 (p. 95) for a homogeneous prime ideal: the
    Poincare series is p(t)/(1-t)^(d+1), p in ZZ[t], p(1) != 0, d = dim."""
    p, d = poincare_form(ideal.hilbert_series())
    check(all(c in ZZ for c in p.list()) and p(1) != 0,
          where + ': Exercise 3.19, p in ZZ[t] and p(1) != 0')
    check(d == ideal.dimension() - 1,
          where + ': Exercise 3.19, pole order d + 1 with d = dim M')
    if d_expected is not None:
        check(d == d_expected, where + ': dimension %d' % d_expected)
    return p, d


def dimension_by_jacobian(where, P, gens, images, S, salt=0):
    """Theorem 3.3 (p. 89) and Exercise 3.14 (p. 95) on the
    closure M of the image of the polynomial map phi: A^N -> A^n given by
    `images`, where `gens` generate I(M) (a prime kernel).  Returns dim M.
    rank_{K(M)} J >= rank J(phi(a)) (specialization) and
    rank_{K(M)} J <= n - rank Dphi(a) (J(phi) Dphi = 0 since f(phi) = 0);
    equality of the two bounds pins down r = rank_{K(M)} J exactly."""
    phi = P.hom(images, S)
    check(all(phi(f) == 0 for f in gens), where + ': f(phi) = 0')
    a = point(S.ngens(), salt)
    b = [im(*a) for im in images]
    r = evaluate(jac(gens, P.gens()), b).rank()
    s = evaluate(jac(images, S.gens()), a).rank()
    n = P.ngens()
    check(r + s == n, where + ': rank J = %d exactly (rank Dphi = %d)'
          % (r, s))
    krull = P.ideal(gens).dimension()
    check(krull == n - r, where + ': Theorem 3.3, dim = n - rk J = %d'
          % (n - r))
    check(krull == s, where + ': Exercise 3.14, dim f(M) = rk Dphi = %d'
          % s)
    return krull


# ---------------------------------------------------------------------------
# Exterior algebra in coordinates (used in 2.7, Problems 33-37).
# A k-vector is a dict {sorted tuple S: coefficient of e_S}.


def wedge_with_vector(u, x):
    """u ^ x, with e_S ^ e_j = (-1)^#{s in S: s > j} e_(S + j)."""
    out = {}
    for S, c in u.items():
        for j, xj in enumerate(x):
            if xj == 0 or j in S:
                continue
            T = tuple(sorted(S + (j,)))
            sign = (-1) ** sum(1 for s in S if s > j)
            out[T] = out.get(T, 0) + sign * c * xj
    return {T: c for T, c in out.items() if c != 0}


def wedge_of_rows(rows):
    u = {(): 1}
    for x in rows:
        u = wedge_with_vector(u, list(x))
    return u


def wedge_map(R, k, n, coeff):
    """Matrix of x |-> u ^ x : V -> Lambda^(k+1) V, rows (k+1)-subsets."""
    rows = list(combinations(range(n), k + 1))
    M = matrix(R, len(rows), n)
    for a, T in enumerate(rows):
        for j in T:
            S = tuple(t for t in T if t != j)
            M[a, j] = (-1) ** sum(1 for s in S if s > j) * coeff(S)
    return M


# ---------------------------------------------------------------------------
# Section 1. Affine Algebraic Varieties (21-affine-varieties.typ).


def section_1():
    R = PolynomialRing(QQ, 1, 'X')
    X = R.gen()
    # p. 60: (X) and (X^2) define the same variety {0}; the largest
    # ideal I(M) is (X).  Exercise 6, p. 71: the algebras differ.
    check(R.ideal(X ** 2) != R.ideal(X)
          and R.ideal(X ** 2).radical() == R.ideal(X),
          '2.1.1 p. 60: (X^2) != (X) define the same point, I(M) = (X)')
    check(R.ideal(X).vector_space_dimension() == 1
          and R.ideal(X ** 2).vector_space_dimension() == 2,
          '2.1 Exercise 6 p. 71: K[X]/(X), K[X]/(X^2) not isomorphic')

    # p. 66: f: {X1 X2 = 1} -> A^1, (X1, X2) |-> X1, is dominant but
    # its image is A^1 minus {0}.
    P = PolynomialRing(QQ, 'X1,X2')
    X1, X2 = P.gens()
    I = P.ideal(X1 * X2 - 1)
    check(I.elimination_ideal([X2]) == P.ideal(0),
          '2.1.5 p. 66: f^* injective, f dominant (Problem 23)')
    check(I + P.ideal(X1) == P.ideal(1),
          '2.1.5 p. 66: 0 is not in f(M)')
    Fa = FractionField(PolynomialRing(QQ, 'a'))
    a = Fa.gen()
    check(a * (1 / a) - 1 == 0,
          '2.1.5 p. 66: every a != 0 is f((a, 1/a))')

    # p. 67: in K[X], (f) is prime iff deg f = 1 (K algebraically
    # closed, f != 0 tacitly; (0) is prime as K[X] has no zero divisors).
    Xb = PolynomialRing(QQbar, 'X').gen()
    check(all(g.degree() == 1 for g, _ in (Xb ** 3 - 2).factor())
          and all(g.degree() == 1 for g, _ in (Xb ** 2 + 1).factor()),
          '2.1.7 p. 67: over QQbar X^2 + 1, X^3 - 2 split (not prime)')
    check(R.ideal(X ** 2 + 1).is_prime(),
          '2.1.7 p. 67: over QQ (not closed) (X^2 + 1) is prime')

    # Theorem 4 (p. 66), Hint 22 (pp. 73-74):
    # p = p_m (X + p_(m-1)/(m p_m))^m iff for all i <= m - 2
    # p_i = p_m binom(m,i) (p_(m-1)/(m p_m))^(m-i), and the cleared form
    # m^(m-i) p_m^(m-i-1) p_i != binom(m,i) p_(m-1)^(m-i).
    for m in range(2, 9):
        B = PolynomialRing(QQ, ['q%d' % i for i in range(m + 1)])
        q = B.gens()
        F = FractionField(B)
        c = F(q[m - 1]) / (m * q[m])
        T = PolynomialRing(F, 'T').gen()
        power = F(q[m]) * (T + c) ** m
        ok = power[m] == q[m] and power[m - 1] == q[m - 1]
        for i in range(0, m - 1):
            ok &= power[i] == q[m] * binomial(m, i) * c ** (m - i)
            lhs = m ** (m - i) * F(q[m]) ** (m - i - 1) * (
                q[i] - q[m] * binomial(m, i) * c ** (m - i))
            ok &= lhs == (m ** (m - i) * q[m] ** (m - i - 1) * q[i]
                          - binomial(m, i) * q[m - 1] ** (m - i))
        check(ok, '2.1 Hint 22 p. 74: coefficient identities, m = %d' % m)

    # Remark after Theorem 8 (p. 71), also the counterexample to
    # Theorem 4 without char K = 0: in char p the map X |-> X^p is a
    # bijection (every a has exactly one p-th root) but X is not rational
    # in X^p: T^p - Y is irreducible over K(Y).
    for p in (2, 3, 5, 7):
        G = PolynomialRing(GF(p), 'x,y')
        x, y = G.gens()
        check((x - y) ** p == x ** p - y ** p,
              '2.1.10 p. 71: (x - y)^p = x^p - y^p in char %d, injective' % p)
        for q in sorted({p, p ** 2}):
            Fq = GF(q, 'z')
            check(len({e ** p for e in Fq}) == q,
                  '2.1.10 p. 71: Frobenius bijective on GF(%d)' % q)
            H = PolynomialRing(Fq, 'Y,T')
            Y, Tv = H.gens()
            fac = (Tv ** p - Y).factor()
            check(len(fac) == 1 and fac[0][1] == 1,
                  '2.1.10 p. 71: T^%d - Y irreducible over GF(%d)(Y), '
                  'X not in K(X^p)' % (p, q))

    # Exercise 5 (p. 71), an instance: M(f) = union of M(p_i).
    P = PolynomialRing(QQ, 'X,Y')
    Xa, Ya = P.gens()
    primes = P.ideal(Xa ** 2 * Ya * (Xa + Ya - 1) ** 3) \
        .minimal_associated_primes()
    check(set(primes) == {P.ideal(Xa), P.ideal(Ya), P.ideal(Xa + Ya - 1)},
          '2.1 Exercise 5 p. 71: components of X^2 Y (X+Y-1)^3 = 0')

    # Exercise 7 (p. 71): an instance, dim_K A = 4, four points.
    I = P.ideal(Xa ** 2 - 1, Ya ** 2 - Xa)
    check(I.vector_space_dimension() == 4 and len(I.variety(QQbar)) == 4,
          '2.1 Exercise 7 p. 71: finite-dimensional algebra, finite variety')

    # Exercise 11 (p. 71): needs K algebraically closed (header of the
    # exercises): QQ(i) (x) QQ(i) = QQ[x,y]/(x^2+1, y^2+1) has zero divisors.
    I = P.ideal(Xa ** 2 + 1, Ya ** 2 + 1)
    check((Xa - Ya) * (Xa + Ya) in I and Xa - Ya not in I
          and Xa + Ya not in I,
          '2.1 Exercise 11 p. 71: over QQ (not closed) the product of '
          'domains QQ(i) is not a domain')

    # Exercise 14 (p. 71). Our answer: on M = {X1 X4 = X2 X3} the
    # function x1/x3 = x2/x4 has I_f = (x3, x4), domain M minus {x3=x4=0}.
    P = PolynomialRing(QQ, 'X1,X2,X3,X4')
    X1, X2, X3, X4 = P.gens()
    I = P.ideal(X1 * X4 - X2 * X3)
    check(I.is_prime(), '2.1 Exercise 14 p. 71: M irreducible')
    If = (I + P.ideal(X3)).quotient(P.ideal(X1))
    check(If == P.ideal(X3, X4),
          '2.1 Exercise 14 p. 71: I_f = (x3, x4), D_f = M - {x3 = x4 = 0}')
    check(X1 * X4 - X2 * X3 in I,
          '2.1 Exercise 14 p. 71: x1/x3 = x2/x4 in K(M)')

    # Exercise 15 (p. 71). Our answer (char K != 2): the circle
    # Y1^2 + Y2^2 = 1 minus (-1, 0); the map is undefined at X^2 = -1.
    FX = FractionField(PolynomialRing(QQ, 'X'))
    Xf = FX.gen()
    y1 = (1 - Xf ** 2) / (1 + Xf ** 2)
    y2 = 2 * Xf / (1 + Xf ** 2)
    check(y1 ** 2 + y2 ** 2 == 1, '2.1 Exercise 15 p. 71: image on circle')
    check(y2 / (1 + y1) == Xf,
          '2.1 Exercise 15 p. 71: inverse X = y2/(1 + y1)')
    check((1 - Xf ** 2) + (1 + Xf ** 2) == 2,
          '2.1 Exercise 15 p. 71: y1 = -1 impossible when 2 != 0')
    C = PolynomialRing(QQ, 'A,B')
    A_, B_ = C.gens()
    circ = C.ideal(A_ ** 2 + B_ ** 2 - 1)
    # X = B/(1 + A):  (1 + A)^2 (1 + X^2) = 2 (1 + A), and the two
    # coordinates come back as A and B, for every circle point with A != -1.
    check((1 + A_) ** 2 + B_ ** 2 - 2 * (1 + A_) in circ
          and (1 + A_) ** 2 - B_ ** 2 - 2 * A_ * (1 + A_) in circ,
          '2.1 Exercise 15 p. 71: every circle point other than (-1, 0) '
          'is attained')
    F2 = FractionField(PolynomialRing(GF(2), 'X'))
    X2f = F2.gen()
    check((1 - X2f ** 2) / (1 + X2f ** 2) == 1 and 2 * X2f == 0,
          '2.1 Exercise 15 p. 71: in char 2 the image is the point (1, 0)')

    # Exercise 16 (pp. 71-72): f = (X^2, X^3); image is the cusp,
    # the inverse y2/y1 is rational and not defined at f(0) = (0, 0).
    P = PolynomialRing(QQ, 'X,Y1,Y2')
    X, Y1, Y2 = P.gens()
    cusp = P.ideal(Y1 - X ** 2, Y2 - X ** 3).elimination_ideal([X])
    Q = PolynomialRing(QQ, 'Y1,Y2')
    Y1, Y2 = Q.gens()
    check(Q.ideal([Q(g) for g in cusp.gens()]) == Q.ideal(Y1 ** 3 - Y2 ** 2),
          '2.1 Exercise 16 p. 72: f(M) is the cusp Y1^3 = Y2^2 (closed)')
    check(Q.ideal(Y1 ** 3 - Y2 ** 2).is_prime(),
          '2.1 Exercise 16 p. 72: the cusp is irreducible')
    check(Xf ** 3 / Xf ** 2 == Xf,
          '2.1 Exercise 16 p. 72: y2/y1 inverts f')
    If = (Q.ideal(Y1 ** 3 - Y2 ** 2, Y1)).quotient(Q.ideal(Y2))
    check(If == Q.ideal(Y1, Y2),
          '2.1 Exercise 16 p. 72: I_(y2/y1) = (y1, y2), undefined at f(0)')

    # Exercise 17 (p. 72).  Printed: no assumption on char K.
    # Counterexample in char p: n = k = 1, f1 = X^p, g = X.  The level sets
    # of X^p are points (Frobenius injective, above), g is constant on them,
    # and X is not in K(X^p) (T^p - Y irreducible, above).  Corrected
    # reading "char K = 0" is Theorem 8 (not re-checked here).
    for p in (2, 3, 5, 7):
        G = PolynomialRing(GF(p), 'Y,T')
        Y, Tv = G.gens()
        fac = (Tv ** p - Y).factor()
        irreducible = len(fac) == 1 and fac[0][1] == 1
        refuted(not irreducible,
                '2.1 Exercise 17 p. 72 printed (any char): X in K(X^p), '
                'char %d' % p)


# ---------------------------------------------------------------------------
# Section 2. Projective and Quasiprojective Varieties
# (22-projective-varieties.typ).


def section_2():
    # Exercise 1 (p. 84), an instance: S = {U0^2, U1^2} has no zeros
    # in P^1 and its ideal contains all forms of degree 3 but not of degree 2.
    P = PolynomialRing(QQ, 'U0,U1')
    U0, U1 = P.gens()
    I = P.ideal(U0 ** 2, U1 ** 2)
    check(all(m in I for m in (U0 ** 3, U0 ** 2 * U1, U0 * U1 ** 2, U1 ** 3))
          and U0 * U1 not in I,
          '2.2 Exercise 1 p. 84: all forms of degree 3 in (U0^2, U1^2)')

    # Problem 30 and Hint 30 (pp. 82, 86): the image of the
    # Segre map eta is given by the 2x2 minors of (W_ij); Problem 31 (p. 82)
    # and Hint 31: in the affine chart it is the graph W_ij = W_i0 W_0j.
    for n, m in [(1, 1), (1, 2), (2, 2), (1, 3), (2, 3), (3, 3)]:
        names = ['W%d%d' % (i, j) for i in range(n + 1) for j in range(m + 1)]
        P = PolynomialRing(QQ, names)
        W = matrix(P, n + 1, m + 1, P.gens())
        check(P.ngens() - 1 == n * m + n + m,
              '2.2.6 p. 82: target P^(nm+n+m), (n,m) = (%d,%d)' % (n, m))
        S = PolynomialRing(QQ, ['U%d' % i for i in range(n + 1)]
                           + ['V%d' % j for j in range(m + 1)])
        U, V = S.gens()[:n + 1], S.gens()[n + 1:]
        images = [U[i] * V[j] for i in range(n + 1) for j in range(m + 1)]
        K = P.hom(images, S).kernel()
        check(K == P.ideal(W.minors(2)),
              '2.2 Problem 30, Hint 30 p. 86: image of eta = rank-1 '
              'matrices, (n,m) = (%d,%d)' % (n, m))
        chart = P.ideal(W.minors(2) + [W[0, 0] - 1])
        graph = P.ideal([W[i, j] - W[i, 0] * W[0, j]
                         for i in range(1, n + 1) for j in range(1, m + 1)]
                        + [W[0, 0] - 1])
        check(chart == graph,
              '2.2 Problem 31, Hint 31 p. 86: chart W00 != 0 is the graph '
              'W_ij = W_i0 W_0j, (n,m) = (%d,%d)' % (n, m))
        projective_checks('Segre P^%d x P^%d' % (n, m), K, n + m)
        dimension_by_jacobian('Segre cone (%d,%d)' % (n, m), P, K.gens(),
                              images, S)
    # Injectivity of eta and the rank-1 description, exhaustively over
    # GF(2), GF(3) for small (n, m).
    for q in (2, 3):
        Fq = GF(q)
        for n, m in [(1, 1), (1, 2), (2, 2)]:
            def normalize(v):
                v = list(v)
                c = next(e for e in v if e != 0)
                return tuple(e / c for e in v)

            Pn = {normalize(v) for v in product(Fq, repeat=n + 1) if any(v)}
            Pm = {normalize(v) for v in product(Fq, repeat=m + 1) if any(v)}
            image = {normalize([a * b for a in u for b in v])
                     for u in Pn for v in Pm}
            rank1 = {normalize(v) for v in product(Fq, repeat=(n + 1) * (m + 1))
                     if any(v) and matrix(Fq, n + 1, m + 1, v).rank() == 1}
            check(len(image) == len(Pn) * len(Pm) and image == rank1,
                  '2.2 Problem 30 p. 82: eta injective onto rank-1 points, '
                  'GF(%d), (n,m) = (%d,%d)' % (q, n, m))

    # Hint 32 (p. 86): multiplying p = 0 of bidegree (k, l), k > l, by
    # all monomials of degree k - l in V gives the same zero set in
    # P^n x P^m (saturation by (V0, V1) returns (p)).
    P = PolynomialRing(QQ, 'U0,U1,V0,V1')
    U0, U1, V0, V1 = P.gens()
    for p_, e in [(U0 ** 2 * V0 - U1 ** 2 * V1, 1),
                  (U0 * U1 ** 2 * V1 + U0 ** 3 * V0 - U1 ** 3 * V1, 2)]:
        mons = [V0 ** i * V1 ** (e - i) for i in range(e + 1)]
        J = P.ideal([mm * p_ for mm in mons])
        check(J.saturation(P.ideal(V0, V1))[0] == P.ideal(p_),
              '2.2 Hint 32 p. 86: same zero set after multiplying by the '
              'monomials of degree %d' % e)

    # Exercise 7 (p. 85). Our answer: the rational normal curve,
    # cut out by the 2x2 minors of ((W0 ... W_(m-1)), (W1 ... Wm)).
    for m in range(1, 9):
        P = PolynomialRing(QQ, ['W%d' % i for i in range(m + 1)])
        S = PolynomialRing(QQ, 'U0,U1')
        U0, U1 = S.gens()
        images = [U0 ** (m - i) * U1 ** i for i in range(m + 1)]
        K = P.hom(images, S).kernel()
        H = matrix(P, 2, m, [P.gen(i) for i in range(m)]
                   + [P.gen(i + 1) for i in range(m)])
        check(K == P.ideal(H.minors(2)),
              '2.2 Exercise 7 p. 85: image = rational normal curve, '
              '2x2 minors, m = %d' % m)
        p, d = projective_checks('rational normal curve m=%d' % m, K, 1)
        check(p(1) == m, 'rational normal curve m=%d: degree m' % m)

    # Exercise 8 (p. 85). Our answer: f = (U1U2 : U2U0 : U0U1) is defined
    # off the three coordinate points; f(D_f) = {U0U1U2 != 0} plus the
    # three coordinate points; f o f = U0U1U2 * id.
    P = PolynomialRing(ZZ, 'U0,U1,U2')
    U = P.gens()
    f = [U[1] * U[2], U[2] * U[0], U[0] * U[1]]
    ff = [g(*f) for g in f]
    check(all(ff[i] == U[0] * U[1] * U[2] * U[i] for i in range(3)),
          '2.2 Exercise 8 p. 85: f^2 = id (f o f = U0 U1 U2 (U0:U1:U2))')
    check(gcd(gcd(f[0], f[1]), f[2]) == 1,
          '2.2 Exercise 8 p. 85: the set (U1U2, U2U0, U0U1) is reduced')
    PQ = PolynomialRing(QQ, 'U0,U1,U2')
    V = PQ.gens()
    base = PQ.ideal([PQ(g) for g in f]).radical()
    points = PQ.ideal(V[1], V[2]).intersection(PQ.ideal(V[0], V[2]),
                                               PQ.ideal(V[0], V[1]))
    check(base == points,
          '2.2 Exercise 8 p. 85: base locus = the 3 coordinate points')
    for q in (3, 4, 5, 7):
        Fq = GF(q, 'z')

        def normalize(v):
            c = next(e for e in v if e != 0)
            return tuple(e / c for e in v)

        P2 = {normalize(v) for v in product(Fq, repeat=3) if any(v)}
        domain = [v for v in P2 if any(g(*v) != 0 for g in f)]
        image = {normalize([g(*v) for g in f]) for v in domain}
        torus = {v for v in P2 if all(e != 0 for e in v)}
        coord = {(1, 0, 0), (0, 1, 0), (0, 0, 1)}
        check(len(domain) == len(P2) - 3 and image == torus | coord,
              '2.2 Exercise 8 p. 85: domain and range over GF(%d)' % q)

    # Exercise 9 (p. 85).  Printed: no assumption on char K.
    # Identities over ZZ (valid in every characteristic):
    P = PolynomialRing(ZZ, 'U0,U1,U2,s,t')
    U0, U1, U2, s, t = P.gens()
    conic = U0 ** 2 - U1 ** 2 - U2 ** 2
    check((U0 - U1) * (U0 + U1) - U2 * U2 == conic,
          '2.2 Exercise 9 p. 85: (u0 - u1, u2) ~ (u2, u0 + u1) on M')
    g = [s ** 2 + t ** 2, t ** 2 - s ** 2, 2 * s * t]
    check(g[0] ** 2 - g[1] ** 2 - g[2] ** 2 == 0,
          '2.2 Exercise 9 p. 85: g = (s^2+t^2 : t^2-s^2 : 2st) lies on M')
    fg = [g[0] - g[1], g[2]]
    check(fg[0] == 2 * s * s and fg[1] == 2 * s * t,
          '2.2 Exercise 9 p. 85: f o g = 2s (s : t)')
    gf = [c(s=U0 - U1, t=U2) for c in g]
    check(all((gf[i] - 2 * (U0 - U1) * [U0, U1, U2][i]) % conic == 0
              for i in range(3)),
          '2.2 Exercise 9 p. 85: g o f = 2(u0 - u1) (u0 : u1 : u2) on M')
    check(g[0] - g[1] == 2 * s ** 2 and g[0] + g[1] == 2 * t ** 2,
          '2.2 Exercise 9 p. 85: g base-point free iff 2 != 0')
    # the two representatives of f have no common zero on M iff 2 != 0:
    check((U0 - U1) + (U0 + U1) == 2 * U0 and (U0 + U1) - (U0 - U1) == 2 * U1,
          '2.2 Exercise 9 p. 85: f defined everywhere on M iff 2 != 0')
    for q in (3, 5, 7, 9):
        Fq = GF(q, 'z')
        Pq = PolynomialRing(Fq, 'U0,U1,U2')
        W0, W1, W2 = Pq.gens()
        I = Pq.ideal(W0 ** 2 - W1 ** 2 - W2 ** 2)
        check(I + Pq.ideal(W0 - W1, W2, W0 + W1) == Pq.ideal(W0, W1, W2),
              '2.2 Exercise 9 p. 85: corrected (char != 2), f is a '
              'morphism over GF(%d)' % q)
    for q in (2, 4):
        Fq = GF(q, 'z')
        Pq = PolynomialRing(Fq, 'U0,U1,U2')
        W0, W1, W2 = Pq.gens()
        c2 = W0 ** 2 - W1 ** 2 - W2 ** 2
        line = W0 + W1 + W2
        check(c2 == line ** 2,
              'char 2, GF(%d): the conic is the double line' % q)
        # I^pr(M) = (line); f = (u0 - u1 : u2) = (u2 : u2) is constant, and
        # M has q + 1 >= 3 points, so f is not an isomorphism.
        refuted((W0 - W1) - W2 not in Pq.ideal(line),
                '2.2 Exercise 9 p. 85 printed (any char): f is an '
                'isomorphism, GF(%d)' % q)

    # Exercises 11, 12 (p. 85): S = {X1, X1^2 + X2}: M = {(0,0)},
    # M~ = V(U1, U1^2 + U0 U2) = {(1:0:0), (0:0:1)}, closure of M = (1:0:0).
    P = PolynomialRing(QQ, 'U0,U1,U2')
    U0, U1, U2 = P.gens()
    tilde = P.ideal(U1, U1 ** 2 + U0 * U2)
    comps = set(tilde.minimal_associated_primes())
    check(comps == {P.ideal(U0, U1), P.ideal(U1, U2)},
          '2.2 Exercise 12 p. 85: components of M~ are (0:0:1), (1:0:0)')
    closure = tilde.saturation(P.ideal(U0))[0]
    check(closure == P.ideal(U1, U2),
          '2.2 Exercise 11 p. 85: closure of M = components not in U0 = 0')
    check(closure != tilde.radical(),
          '2.2 Exercise 12 p. 85: closure of M != M~')

    # Problems 33, 34 (pp. 83-84), Hints 34, 35 (p. 87):
    # exhaustively over finite fields.  For every nonzero u in Lambda^k V:
    # dim V(u) <= k; dim V(u) = k iff u is simple, and then V(u) is the
    # spanned subspace and u = c x1 ^ ... ^ xk; rank(x |-> u ^ x) <= n - k
    # iff u is simple, and then it equals n - k.
    # (Lambda^3 of GF(2)^6, 2^20 elements, is left out for time.)
    cases = [(2, 3, (1, 2)), (2, 4, (1, 2, 3)), (2, 5, (1, 2, 3, 4)),
             (3, 3, (1, 2)), (3, 4, (1, 2, 3)), (2, 6, (1, 2, 4, 5))]
    for q, n, ks in cases:
        Fq = GF(q)
        Vs = VectorSpace(Fq, n)
        for k in ks:
            subsets = list(combinations(range(n), k))
            simple = {}
            for Wsp in Vs.subspaces(k):
                w = wedge_of_rows(Wsp.basis_matrix().rows())
                for c in Fq:
                    if c != 0:
                        key = tuple(c * w.get(S, 0) for S in subsets)
                        simple[key] = Wsp
            ok = True
            count = 0
            for coords in product(Fq, repeat=len(subsets)):
                if not any(coords):
                    continue
                count += 1
                u = dict(zip(subsets, coords))
                M = wedge_map(Fq, k, n, lambda S: u[S])
                kern = M.right_kernel()
                is_simple = coords in simple
                ok &= kern.dimension() <= k
                ok &= (kern.dimension() == k) == is_simple
                ok &= (M.rank() <= n - k) == is_simple
                if is_simple:
                    ok &= M.rank() == n - k and kern == simple[coords]
                    w = wedge_of_rows(kern.basis_matrix().rows())
                    ok &= any(tuple(c * w.get(S, 0) for S in subsets)
                              == coords for c in Fq if c != 0)
            check(ok, '2.2 Problems 33, 34, Hints 34, 35 pp. 83-87: all '
                  '%d nonzero %d-vectors over GF(%d)^%d' % (count, k, q, n))

    # Problem 36, Hint 36 (p. 84, p. 87): the Plucker coordinates of
    # x1 ^ ... ^ xk are the k-th order minors (generic vectors, over ZZ).
    for n in range(2, 6):
        for k in range(1, n + 1):
            R = PolynomialRing(ZZ, ['x%d_%d' % (i, j)
                                    for i in range(k) for j in range(n)])
            Xm = matrix(R, k, n, R.gens())
            w = wedge_of_rows(Xm.rows())
            check(all(w.get(S, 0) == Xm.matrix_from_columns(list(S)).det()
                      for S in combinations(range(n), k)),
                  '2.2 Hint 36 p. 87: Plucker coordinates = minors, '
                  'k = %d, n = %d' % (k, n))

    # Problem 35, Hint 35 over QQ: the radical of the ideal of minors of
    # order n - k + 1 of x |-> u ^ x is the ideal of Gr_k(V) (the kernel of
    # p_S |-> minors).  Then Theorem 3.3, Exercises 3.14 and 3.19 on Gr.
    for k, n in [(2, 4), (2, 5), (3, 5), (2, 6), (3, 6)]:
        subsets = list(combinations(range(n), k))
        P = PolynomialRing(QQ, ['p' + ''.join(map(str, S)) for S in subsets])
        pv = dict(zip(subsets, P.gens()))
        S = PolynomialRing(QQ, ['x%d_%d' % (i, j)
                                for i in range(k) for j in range(n)])
        Xm = matrix(S, k, n, S.gens())
        images = [Xm.matrix_from_columns(list(T)).det() for T in subsets]
        K = P.hom(images, S).kernel()
        if n <= 5:  # the radical for n = 6 takes minutes; left out
            minors = P.ideal(wedge_map(P, k, n, lambda T: pv[T])
                             .minors(n - k + 1))
            check(minors.radical() == K,
                  '2.2 Problem 35, Hint 35 p. 87: Gr_%d(K^%d) closed, '
                  'rad(minors) = Plucker ideal' % (k, n))
            check(K.is_prime(),
                  'Gr_%d(K^%d): irreducible (Problem 36)' % (k, n))
        projective_checks('Gr_%d(K^%d)' % (k, n), K, k * (n - k))
        dimension_by_jacobian('Gr_%d(K^%d) cone' % (k, n), P, K.gens(),
                              images, S)

    # Problem 37, Hint 37 (p. 84, p. 87): V(u) in V(v) iff
    # rank(x |-> (u ^ x, v ^ x)) <= n - k, and then it equals n - k;
    # exhaustively over GF(2)^3, GF(2)^4, GF(3)^3.
    for q, n in [(2, 3), (2, 4), (3, 3)]:
        Fq = GF(q)
        Vs = VectorSpace(Fq, n)
        ok = True
        pairs = 0
        for k in range(1, n):
            for l in range(k + 1, n + 1):
                for Wk in Vs.subspaces(k):
                    u = wedge_of_rows(Wk.basis_matrix().rows())
                    Mu = wedge_map(Fq, k, n, lambda S: u.get(S, 0))
                    for Ul in Vs.subspaces(l):
                        v = wedge_of_rows(Ul.basis_matrix().rows())
                        Mv = wedge_map(Fq, l, n, lambda S: v.get(S, 0)) \
                            if l < n else matrix(Fq, 0, n)
                        rank = Mu.stack(Mv).rank()
                        inside = Wk.is_subspace(Ul)
                        ok &= (rank <= n - k) == inside
                        ok &= (not inside) or rank == n - k
                        pairs += 1
        check(ok, '2.2 Problem 37, Hint 37 pp. 84-87: all %d pairs over '
              'GF(%d)^%d' % (pairs, q, n))

    # Flag variety of K^3 (2.7, p. 84): in Gr_1 x Gr_2 = P^2 x P^2 it is the
    # incidence u ^ v = 0; the Hint 37 minors define it; dimension 3.
    P = PolynomialRing(QQ, 'u0,u1,u2,v01,v02,v12')
    u0, u1, u2, v01, v02, v12 = P.gens()
    u = {(0,): u0, (1,): u1, (2,): u2}
    v = {(0, 1): v01, (0, 2): v02, (1, 2): v12}
    M = wedge_map(P, 1, 3, lambda S: u[S]).stack(
        wedge_map(P, 2, 3, lambda S: v[S]))
    incidence = u0 * v12 - u1 * v02 + u2 * v01
    check(P.ideal(M.minors(3)).radical() == P.ideal(incidence),
          '2.2 Problem 38, Hint 37 p. 87: flags of K^3 = {u ^ v = 0}')
    S = PolynomialRing(QQ, ['x%d_%d' % (i, j) for i in range(2)
                            for j in range(3)])
    Xm = matrix(S, 2, 3, S.gens())
    images = list(Xm.row(0)) + [Xm.matrix_from_columns([a, b]).det()
                                for a, b in [(0, 1), (0, 2), (1, 2)]]
    K = P.hom(images, S).kernel()
    check(K == P.ideal(incidence) and K.is_prime(),
          '2.2 Problem 39 p. 84: F(K^3) is irreducible, ideal (u ^ v)')
    d = dimension_by_jacobian('F(K^3) bicone', P, K.gens(), images, S)
    check(d - 2 == 3, 'F(K^3): dim 5 - 2 = 3 (two homothety factors)')


# ---------------------------------------------------------------------------
# Section 3. Dimension and Analytic Properties (23-dimension.typ).


def section_3():
    # p. 88: trdeg K[X1..Xn] = n, dim P^n = dim A^n = n; with
    # Exercise 3.19: P_(K[U0..Un])(t) = 1/(1-t)^(n+1).
    for n in range(1, 6):
        P = PolynomialRing(QQ, ['U%d' % i for i in range(n + 1)])
        p, d = projective_checks('P^%d' % n, P.ideal(0), n)
        check(p == 1, 'P^%d: Poincare series 1/(1-t)^(n+1)' % n)

    # Hint 3 (p. 96): from b0 + b1 a + ... + bm a^m = 0, b0 != 0,
    # a^(-1) = -b0^(-1) (b1 + b2 a + ... + bm a^(m-1)).
    for m in range(1, 9):
        B = PolynomialRing(QQ, ['b%d' % i for i in range(m + 1)] + ['a'])
        b, a = B.gens()[:-1], B.gens()[-1]
        rel = sum(b[i] * a ** i for i in range(m + 1))
        tail = sum(b[i] * a ** (i - 1) for i in range(1, m + 1))
        check(b[0] + a * tail == rel,
              '2.3 Hint 3 p. 96: a * (-b0^-1 (b1 + ... + bm a^(m-1))) = 1 '
              'modulo the relation, m = %d' % m)

    # Problem 9 and Hint 9 (pp. 88, 96).  The linear equation of
    # Hint 9 holds for any derivation D (chain rule, over ZZ, degree <= 6):
    # D(f(u)) = f^D(u) + f'(u) D(u).
    for m in range(1, 7):
        names = (['a%d' % i for i in range(m + 1)]
                 + ['da%d' % i for i in range(m + 1)] + ['u', 'du'])
        R = PolynomialRing(ZZ, names)
        g = R.gens()
        a, da, uu, du = g[:m + 1], g[m + 1:2 * m + 2], g[-2], g[-1]
        f_u = sum(a[i] * uu ** i for i in range(m + 1))
        D = sum(f_u.derivative(a[i]) * da[i] for i in range(m + 1)) \
            + f_u.derivative(uu) * du
        fD = sum(da[i] * uu ** i for i in range(m + 1))
        fprime = sum(i * a[i] * uu ** (i - 1) for i in range(1, m + 1))
        check(D == fD + fprime * du,
              '2.3 Hint 9 p. 96: D f(u) = f^D(u) + f\'(u) D u, deg %d' % m)
    # Corrected reading (char K = 0): an irreducible f has gcd(f, f') = 1,
    # so f'(u) != 0 and D u = -f^D(u)/f'(u) is forced (examples over QQ(t)).
    Ft = FractionField(PolynomialRing(QQ, 't'))
    tt = Ft.gen()
    T = PolynomialRing(Ft, 'T').gen()
    for f in [T ** 2 - tt, T ** 3 - tt, T ** 3 - tt * T - 1,
              T ** 5 - tt ** 2 * T - tt]:
        check(f.is_irreducible() and gcd(f, f.derivative()) == 1,
              '2.3 Problem 9 corrected (char 0): f\'(u) != 0 for f = %s' % f)
    # Printed reading in char p: A = K[t], B = A[s], s^p = t, L = K(s),
    # d/dt on A.  X^p - t is the minimal polynomial of s (irreducible), its
    # derivative vanishes, and any extension D would give
    # 1 = D(t) = D(s^p) = p s^(p-1) D(s) = 0.
    for p in (2, 3, 5, 7):
        for q in sorted({p, p ** 2}):
            G = PolynomialRing(GF(q, 'z'), 't,X,dX')
            t_, Xv, dX = G.gens()
            f = Xv ** p - t_
            fac = f.factor()
            check(len(fac) == 1 and fac[0][1] == 1,
                  '2.3 Problem 9: X^%d - t irreducible over GF(%d)(t), B '
                  'algebraic over A' % (p, q))
            refuted(f.derivative(Xv) != 0,
                    '2.3 Hint 9 p. 96 printed (any char): f\'(u) != 0, '
                    'GF(%d)' % q)
            D_sp = (Xv ** p).derivative(Xv) * dX
            refuted(D_sp == 1,
                    '2.3 Problem 9 p. 88 printed (any char): d/dt extends '
                    '(D(s^p) = %s, D(t) = 1), GF(%d)' % (D_sp, q))
        # The same example shows the char 0 hypotheses of Exercises 13, 14,
        # 16 (p. 95) are needed: every derivation of B = K[s] kills
        # t = s^p (restriction D(B, L) -> D(A, L) is zero, not onto);
        # f = X^p on A^1 has derivative 0 but dim f(A^1) = 1; X1^p is not
        # constant though all its partials vanish.
        G = PolynomialRing(GF(p), 'X,Y')
        Xv, Yv = G.gens()
        check((Xv ** p).derivative(Xv) == 0
              and G.ideal(Yv - Xv ** p).elimination_ideal([Xv]) == G.ideal(0),
              '2.3 Exercises 13, 14, 16 p. 95: char %d, X^p has zero '
              'derivative but dominant image' % p)

    # Theorem 3 (p. 89) on the circle and Exercise 10 (p. 95).  Our
    # answer to Exercise 10: dim D(K(M), K(M)) = 1 with basis the derivation
    # x1 |-> -x2, x2 |-> x1.
    P = PolynomialRing(QQ, 'X1,X2')
    X1, X2 = P.gens()
    circle = X1 ** 2 + X2 ** 2 - 1
    check(P.ideal(circle).is_prime(), '2.3 Exercise 10: M irreducible')
    check(-X2 * circle.derivative(X1) + X1 * circle.derivative(X2) == 0,
          '2.3 Exercise 10 p. 95: -x2 d/dx1 + x1 d/dx2 kills I(M)')
    check(jac([circle], [X1, X2]).rank() == 1
          and P.ideal(circle).dimension() == 1,
          '2.3 Exercise 10 p. 95: dim D = 2 - rk J = 1 (Theorem 3)')

    # Exercise 8 (p. 94): n = m = 1, f = X^2: rk J < n - dim M.
    R = PolynomialRing(QQ, 1, 'X')
    Xr = R.gen()
    check((Xr ** 2).derivative(Xr)(0) == 0
          and R.ideal(Xr ** 2).dimension() == 0,
          '2.3 Exercise 8 p. 94: X^2 = 0, rk J = 0 < 1 = n - dim M')

    # Exercise 3 (p. 94).  S: X1^2 + X2 X3 = 1, L: X1 = 1, X2 = 0.
    # "Singled out ... by a single equation" is set-theoretic (as in
    # Exercise 8, whose example needs a non-radical equation).
    P = PolynomialRing(QQ, 'X1,X2,X3')
    X1, X2, X3 = P.gens()
    s_eq = X1 ** 2 + X2 * X3 - 1
    L = P.ideal(X1 - 1, X2)
    check(s_eq in L and P.ideal(s_eq).is_prime(),
          '2.3 Exercise 3 p. 94: L lies on the irreducible surface S')
    check((P.ideal(s_eq, X2)).radical() == L.intersection(P.ideal(X1 + 1, X2))
          and (P.ideal(s_eq, X1 - 1)).radical()
          == L.intersection(P.ideal(X1 - 1, X3)),
          '2.3 Exercise 3 p. 94 (char 0): X2 = 0 and X1 = 1 cut L plus '
          'another line')
    # The algebraic steps of the proof for char K != 2 (log 23, question on
    # Exercise 3): the lines R2_mu = {(t, mu(1+t), (1-t)/mu)} and
    # R1_lambda = {(1 - lambda s, s, lambda(2 - lambda s))} lie on S; R2_mu
    # misses L for mu != 0 (x1 = 1 forces x2 = 2 mu); on R1_lambda the
    # coordinate mu = x2/(1 + x1) of R2 is s/(2 - lambda s).  If f vanished
    # exactly on L it would be constant on each R2_mu, hence a mu^k, and
    # a (s/(2 - lambda s))^k is a polynomial in s only for k = 0.
    Pm = PolynomialRing(QQ, 'mu,lam,t,s')
    Fm = FractionField(Pm)
    mu, lam, tv, sv = Fm.gens()
    R2 = (tv, mu * (1 + tv), (1 - tv) / mu)
    R1 = (1 - lam * sv, sv, lam * (2 - lam * sv))
    check(s_eq(*R2) == 0 and s_eq(*R1) == 0,
          '2.3 Exercise 3: the two rulings of S')
    check(R2[1].subs(t=1) == 2 * mu,
          '2.3 Exercise 3: R2_mu meets L only if mu = 0')
    t_of_s, mu_of_s = 1 - lam * sv, sv / (2 - lam * sv)
    check(mu_of_s * (1 + t_of_s) == sv
          and (1 - t_of_s) / mu_of_s == lam * (2 - lam * sv)
          and R1[1] / (1 + R1[0]) == mu_of_s,
          '2.3 Exercise 3: R1_lambda in the (t, mu) chart, mu = s/(2 - l s)')
    check(all((mu_of_s ** k).denominator().degree(Pm.gen(3)) > 0
              for k in list(range(-5, 0)) + list(range(1, 6))),
          '2.3 Exercise 3: (s/(2 - l s))^k is not a polynomial, k != 0')
    for q in (2, 4):
        Pq = PolynomialRing(GF(q, 'z'), 'X1,X2,X3')
        Y1, Y2, Y3 = Pq.gens()
        Sq = Y1 ** 2 + Y2 * Y3 - 1
        Lq = Pq.ideal(Y1 + 1, Y2)
        J = Pq.ideal(Sq, Y2)
        # rad J = I(L): J is inside the prime Lq and (X1 + 1)^2 is in J.
        singled_out = (all(g in Lq for g in J.gens())
                       and (Y1 + 1) ** 2 in J and Y2 in J)
        refuted(not singled_out,
                '2.3 Exercise 3 p. 94 printed (any char): L cannot be '
                'singled out; in char 2 X2 = 0 does it, GF(%d)' % q)
        check(all(Sq.derivative(v)(1, 0, 0) == 0 for v in (Y1, Y2, Y3)),
              'char 2, GF(%d): S is a cone with vertex (1,0,0) on L' % q)

    # Problem 18 and Hint 18 (p. 91; p. 97): expanding a minor
    # of order r + 1 bordering Delta along the last column gives
    # Delta a_ij + sum_k c_ik a_kj with c_ik independent of j, and the same
    # expression vanishes identically for j <= r.  Generic matrices, over ZZ.
    for r in range(1, 5):
        rows, cols = r + 2, r + 2
        R = PolynomialRing(ZZ, ['a%d_%d' % (i, j) for i in range(rows)
                                for j in range(cols)])
        A = matrix(R, rows, cols, R.gens())
        Delta = A.matrix_from_rows_and_columns(list(range(r)),
                                               list(range(r))).det()
        ok = True
        for i in range(r, rows):
            def bordered(j):
                return A.matrix_from_rows_and_columns(
                    list(range(r)) + [i], list(range(r)) + [j]).det()
            cof = [bordered(r).derivative(A[k, r]) for k in range(r)]
            for j in range(cols):
                expr = Delta * A[i, j] + sum(cof[k] * A[k, j]
                                             for k in range(r))
                ok &= expr == (bordered(j) if j >= r else 0)
        check(ok, '2.3 Problem 18, Hint 18: bordered-minor expansion, '
              'r = %d' % r)

    # Exercise 17 (p. 95) and its hint: induction through
    # multiplication by U_n needs the kernel AND the cokernel:
    # (1 - t) P_(A/I) = P_(A/(I + U_n)) - t P_((I : U_n)/I).
    P = PolynomialRing(QQ, 'U0,U1,U2,U3')
    U0, U1, U2, U3 = P.gens()
    Ft = FractionField(PolynomialRing(QQ, 't'))
    t = Ft.gen()
    ideals = [P.ideal(0), P.ideal(U3 ** 2), P.ideal(U0 * U3, U1 * U3),
              P.ideal(U0 * U2 - U1 ** 2, U1 * U3 - U2 ** 2, U0 * U3 - U1 * U2),
              P.ideal(U0 ** 3 - U1 * U2 * U3, U3 ** 2 * U0),
              P.ideal(U0 * U1, U2 * U3, U3 ** 3)]
    for I in ideals:
        HI = Ft(I.hilbert_series())
        Hc = Ft((I + P.ideal(U3)).hilbert_series())
        Hk = HI - Ft(I.quotient(P.ideal(U3)).hilbert_series())
        check((1 - t) * HI == Hc - t * Hk,
              '2.3 Exercise 17 hint: kernel and cokernel of U_n, I = %s'
              % (I.gens(),))
        pp, d = poincare_form(HI)
        check(all(c in ZZ for c in pp.list()) and d <= 3,
              '2.3 Exercise 17: P = p/(1-t)^(k+1), p in ZZ[t], k <= n')
    I = P.ideal(U3 ** 2)
    check(Ft(I.quotient(P.ideal(U3)).hilbert_series())
          != Ft(I.hilbert_series()),
          '2.3 Exercise 17 hint: the kernel term is nonzero for (U3^2)')

    # Exercise 18 (p. 95): p(t)/(1-t)^(d+1) has a_k = f(k) for k >= deg p
    # with f of degree <= d and leading coefficient p(1)/d!; conversely
    # sum f(k) t^k (1-t)^(d+1) is a polynomial q with q(1) = d! lc(f).
    for d in range(0, 7):
        C = PolynomialRing(QQ, ['c%d' % j for j in range(5)] + ['k'])
        c, kv = C.gens()[:5], C.gens()[5]
        PS = PowerSeriesRing(C, 'x', default_prec=30)
        x = PS.gen()
        series = sum(c[j] * x ** j for j in range(5)) / (1 - x) ** (d + 1)
        f = sum(c[j] * prod(kv - j + i for i in range(1, d + 1))
                for j in range(5)) / factorial(d)
        ok = all(series[kk] == f(*c, kk) for kk in range(4, 25))
        lead = f.coefficient({kv: d}) if d > 0 else f
        ok &= f.degree(kv) <= d and lead == sum(c) / factorial(d)
        check(ok, '2.3 Exercise 18 p. 95: only if, d = %d' % d)
        Bq = PolynomialRing(QQ, ['b%d' % i for i in range(d + 1)])
        bq = Bq.gens()
        PB = PowerSeriesRing(Bq, 'x', default_prec=40)
        xb = PB.gen()
        S = sum(sum(bq[i] * kk ** i for i in range(d + 1)) * xb ** kk
                for kk in range(40)).add_bigoh(40)
        qs = (S * (1 - xb) ** (d + 1)).truncate(39)
        ok = qs.degree() <= d and qs(1) == factorial(d) * bq[d]
        check(ok, '2.3 Exercise 18 p. 95: if, d = %d' % d)

    # Exercises 19, 20 (pp. 95-96): examples with known dimension.
    P = PolynomialRing(QQ, 'U0,U1,U2')
    U0, U1, U2 = P.gens()
    projective_checks('conic U0^2 - U1^2 - U2^2', P.ideal(
        U0 ** 2 - U1 ** 2 - U2 ** 2), 1)
    Q = PolynomialRing(QQ, 'U0,U1')
    V0, V1 = Q.gens()
    for I, name in [(Q.ideal(V0 ** 2), '(U0^2)'),
                    (Q.ideal(V0 ** 2, V0 * V1), '(U0^2, U0 U1)')]:
        pp, d = poincare_form(I.hilbert_series())
        check(d == 0 and pp(1) != 0 and all(e in ZZ for e in pp.list()),
              '2.3 Exercise 20 p. 96: %s, zero set a point, d = 0' % name)

    # Exercise 21 (p. 96).  Printed: "p a nonzero homogeneous
    # element".  p = 1 (degree 0) on M = P^1: M1 is empty, not of dimension
    # dim M - 1 = 0.  Corrected: p of positive degree (examples).
    # (Projective dimension = Krull dimension of the cone - 1; Sage gives
    # the unit ideal Krull dimension -1, so an empty M1 has "dim" -2.)
    Q = PolynomialRing(QQ, 'U0,U1')
    M, p_const = Q.ideal(0), Q(1)
    dim_M = M.dimension() - 1
    dim_M1 = (M + Q.ideal(p_const)).dimension() - 1
    refuted(p_const != 0 and dim_M == 1 and dim_M1 == dim_M - 1,
            '2.3 Exercise 21 p. 96 printed: p = 1 (nonzero, homogeneous of '
            'degree 0) on P^1 gives dim M1 = 0')
    P = PolynomialRing(QQ, 'W0,W1,W2,W3')
    W0, W1, W2, W3 = P.gens()
    cubic = P.ideal(W0 * W2 - W1 ** 2, W1 * W3 - W2 ** 2, W0 * W3 - W1 * W2)
    quadric = P.ideal(W0 * W3 - W1 * W2)
    for I, pp, name in [(P.ideal(0), W0 + W1, 'P^3'),
                        (quadric, W0, 'P^1 x P^1'),
                        (cubic, W0, 'twisted cubic'),
                        (cubic, W1 ** 2 + W3 ** 2, 'twisted cubic'),
                        (quadric, W0 * W1 - W2 * W3, 'P^1 x P^1')]:
        J = I + P.ideal(pp)
        check(pp not in I and J.dimension() == I.dimension() - 1,
              '2.3 Exercise 21 corrected: %s, p = %s' % (name, pp))
    subsets = list(combinations(range(4), 2))
    G = PolynomialRing(QQ, ['p' + ''.join(map(str, S)) for S in subsets])
    g = dict(zip(subsets, G.gens()))
    gr = G.ideal(g[(0, 1)] * g[(2, 3)] - g[(0, 2)] * g[(1, 3)]
                 + g[(0, 3)] * g[(1, 2)])
    check((gr + G.ideal(g[(0, 1)])).dimension() == gr.dimension() - 1,
          '2.3 Exercise 21 corrected: Gr_2(K^4), p = p01')

    # Exercise 23 (p. 96) and Problem 25 (p. 92): M = {z1 z2 = 1}.
    # M^R has the real equations Re, Im of (X1 + iY1)(X2 + iY2) - 1; over
    # QQ(i) the substitution Z = X + iY, W = X - iY turns them into
    # (Z1 Z2 - 1, W1 W2 - 1): M^R(C) = M x conj(M) (here conj(M) = M).
    Rr = PolynomialRing(QQ, 'X1,Y1,X2,Y2')
    X1, Y1, X2, Y2 = Rr.gens()
    real = Rr.ideal(X1 * X2 - Y1 * Y2 - 1, X1 * Y2 + X2 * Y1)
    check(real.dimension() == 2 and real.is_prime(),
          '2.3 Problem 25 p. 92: dim M^R = 2 dim M (= 2)')
    Ki = NumberField(PolynomialRing(QQ, 'y')(PolynomialRing(QQ, 'y').gen()
                                             ** 2 + 1), 'i')
    iu = Ki.gen()
    C = PolynomialRing(Ki, 'Z1,Z2,W1,W2')
    Z1, Z2, W1, W2 = C.gens()
    to_zw = Rr.hom([(Z1 + W1) / 2, (Z1 - W1) / (2 * iu),
                    (Z2 + W2) / 2, (Z2 - W2) / (2 * iu)], C)
    check(C.ideal([to_zw(g) for g in real.gens()])
          == C.ideal(Z1 * Z2 - 1, W1 * W2 - 1),
          '2.3 Exercise 23 p. 96: M^R(C) = M x conj(M) for z1 z2 = 1')


def main():
    section_1()
    section_2()
    section_3()
    print('ok chapter-2: %d checks' % len(CHECKS))


if __name__ == '__main__':
    main()
