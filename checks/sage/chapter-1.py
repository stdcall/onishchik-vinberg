"""Exact checks of Chapter 1 "Lie Groups" of Onishchik and Vinberg (Sage).

Run: sage -python checks/sage/chapter-1.py (plain asserts; do not use -O).
The last line of the output is "ok chapter-1: N checks".

Book: A. L. Onishchik, E. B. Vinberg, Lie Groups and Algebraic Groups,
Springer 1990.  Pages are the printed pages of the book.  The expected
values are the book's statements, written below as literals (formulas in n,
printed matrices, printed identities) taken from the printed book; our
Typst source is not parsed.  Where the book is wrong the
printed reading is kept as a refuted check (function `refuted`: the printed
reading must fail) next to the corrected one.

What is checked, by section:

§ 1 (content/11-background.typ, pp. 1-19)
  * dimensions: SL_n (Problem 4, and rk det = 1 in the Example of 6°),
    O_n (Problem 5) with the orbit of a nondegenerate symmetric form open
    (Example 5.1), U_n (Problem 6), Sp(V, f) (Example 5.2), GL_n(H) and the
    quaternionic unitary group Sp_n (Exercises 2, 3), Grassmannians
    (Example 9.2), positive definite matrices = GL_n(R)/O_n (Example 9.3),
    for n <= 8 (quaternionic n <= 5);
  * Exercise 7 (the centralizer of an element of GL_n has dimension >= n)
    for every Jordan type of size n <= 6 (hence every complex matrix of that
    size);
  * Problem 8 (Ad, Sq are representations), Problem 11 (Ad, Sq are the
    tensor representations of types (1, 1), (2, 0)), formulas (1), (2) for
    T_(0,2), T_(0,3), T_(1,2) against the product of the representations;
  * semidirect products of 11°: GA(V) = V x|_Id GL(V) (Example 2),
    triangular = unitriangular x| diagonal (Example 4), GL_n = SL_n x| K*
    (Exercise 11).

§ 2 (content/12-tangent-algebra.typ, pp. 19-42)
  * formulas (1)-(5) in the coordinates X - E on GL_n (Hint 2), Problem 12,
    Problem 5 (d det = tr), Problem 7 (d Ad, d Sq), Problems 8, 9, formulas
    (9), (10); (12)-(14) (Jacobi); Example 3.2 (derivations = stabilizer of
    the structure tensor) for sl_2, the Heisenberg algebra and M_2;
  * exp: Problem 27 and the second-order term that makes [xi, eta] = 0
    necessary, det exp A = e^(tr A), Exercise 9 (not injective; unipotent
    logarithm), Exercise 10 (the algebraic part: X^2 = -det X E on sl_2 and
    exp X = C E + S X; -E + E_12 in SL_2(R) has trace -2 and is not -E);
  * Lemma, formula (19), with the corrected sign (generic jets and a
    concrete path), and the printed "=" refuted; the corrected velocity
    2 xi_2(2t) and path h_1(2t - 1) h_2(1) in the proof of Theorem 6
    (concrete paths in GL_2, f = Sq), printed readings refuted;
  * Examples 2, 3 of 10° (Heisenberg and ax + b algebras: automorphisms,
    inner automorphisms, Aut/Int), Problem 36 formula (20) on eight Lie
    algebras, (21), (22) and Example 2 of 11° (the tangent algebra of GA(V));
  * Exercise 3 (symmetric part of alpha changes by -4s under a quadratic
    change of coordinates), Exercise 13 (Im of a Moebius transform);
  * Exercise 19: the printed algebra (diagonal matrices) is commutative, so
    Int g = {E} for every c and the printed "only if" fails for
    c = (0, 1, 1 + sqrt 2); the reading "matrices with this diagonal" is not
    a subalgebra; the corrected algebra (triangular matrices) is checked
    algebraically: the weights of ad D on E_12, E_23, E_13 are c1 - c2,
    c2 - c3, c1 - c3, dim Der g = 5 = dim ad g + 1, the diagonal
    automorphisms (D, X, Y, Z) -> (D, aX, bY, abZ);
  * Hint 21 (corrected references): Ad-invariance and ad-invariance of
    subspaces agree on examples (ax + b).

§ 3 (content/13-connectedness.typ, pp. 42-50)
  * dim Sp_n(K), dim O_(k,l) (k + l <= 8), the stabilizers of Hints 6, 7, 8
    (Sp_(2n-2)(K) x K^(2n-1) confirmed, the printed Sp_(n-2) refuted),
    Hint 10 (hyperboloid);
  * Problem 9 and Exercise 5 on random rational points of O_(k,l)
    (products of reflections): d_k != 0, the sign of d_k and of det are
    multiplicative and all four sign pairs occur;
  * Example 2 of 2°: det is Ad-invariant, ad: sl_2 -> o(sl_2, det) is an
    isomorphism, the kernel of Ad on SL_2 is {E, -E} (variety over QQbar);
    Exercise 6 (SU_2 -> SO_3 with kernel {E, -E});
  * Problem 11: the printed "into" refuted by the embedding R -> R^2;
  * Exercise 10: a nonabelian two-dimensional Lie algebra has a basis with
    [X, Y] = Y (the algebra of x -> ax + b);
  * fundamental groups (Problems 17, 18, Exercises 8, 9, and pi_1(SO_3(C))
    = Z_2) against the lattice formula pi_1(K) = Gamma/I of Hall, Lie Groups,
    Lie Algebras, and Representations, 2nd ed. (GTM 222, 2015), Corollary
    13.18 (p. 379): SU_n (n <= 8), Sp_n (n <= 8), SO_n (3 <= n <= 8), with
    U_n and SO_2 (pi_1 = Z) as boundary cases.  The complex groups are
    compared through their maximal compact subgroups: SL_n(C) by Hall,
    Conclusion 13.13 (p. 377); SO_n(C), Sp_2n(C) by the Cartan
    decomposition (this book, § 5.3, Corollary 2 of Theorem 3, p. 259).

§ 4 (content/14-derived-algebra.typ, pp. 50-58)
  * Hint 1 (the commutator of two paths is e + s^2 [xi, eta] + O(s^3)),
    Hint 3 and Problem 3, Exercises 1-3 (derived algebras of gl_n, so_n,
    u_n), O_2' = SO_2 (the commutator of a reflection and a rotation);
  * Examples 1, 2 (B_(n,k)): for k >= 1 the map (1) is additive, for k = 0
    it is multiplicative (the printed "onto the vector group K^(n-k)"
    refuted for k = 0); commutators and brackets fall into B_(n,k+1),
    b_(n,k+1); b_n^((n)) = 0;
  * semisimplicity (Killing form) of sl_n, so_n (n >= 3), sp_n, n <= 8
    (Exercise 10 and p. 56); Exercise 12 (radical of gl(V; U), dim V <= 5);
    Hint 13 (the last nonzero derived algebra of the radical is a nonzero
    commutative ideal) on twelve non-semisimple algebras (gl_n, n <= 5; b_n,
    2 <= n <= 5; the Heisenberg, ax + b and GA(2) algebras), the radical
    certified as a solvable ideal with semisimple quotient; Problem 13 as
    printed ("no commutative ideals") refuted by sl_2 and the zero ideal;
  * Exercise 4 (commutators of unitriangular matrices are central);
  * Exercise 15: the printed statement refuted by G = {x -> ax + b, a > 0},
    H = {x -> ax}; the corrected (normal) statement illustrated by
    H = {x -> x + b}.

What these checks do NOT establish.  Every check is either a polynomial or
rational-function identity in the written variables (then it holds for all
values), a truncated power-series identity (to the stated order), or an
exhaustive computation for the listed sizes n, ranks, algebras or sampled
matrices.  None of them proves a general theorem of the book for all n;
topological statements (closedness, connectedness, coverings) are only
reduced to algebra, and the reductions are stated in the comments.  The
fundamental groups rest on Hall's Corollary 13.18, which is used, not
proved.  Nothing here compares our text with the printed book.
"""
import random
from itertools import product

from sage.all import (
    QQ, QQbar, ZZ, SR, I, Partition, Partitions, PolynomialRing,
    QuadraticField,
    QuaternionAlgebra, RootSystem, block_matrix, exp, factorial,
    identity_matrix, matrix, pi, vector, zero_matrix,
)

COUNT = [0]


def check(condition, label):
    """The book's statement (or our corrected reading) holds."""
    assert bool(condition), label
    COUNT[0] += 1


def refuted(condition, label):
    """The printed reading must fail: it is kept as a refuted check."""
    assert not bool(condition), 'printed reading unexpectedly holds: ' + label
    COUNT[0] += 1


# ---------------------------------------------------------------------------
# Helpers: matrices, linear maps on matrix spaces, Lie algebras.


def unit(n, i, j, R=QQ):
    M = matrix(R, n, n)
    M[i, j] = 1
    return M


def unit_basis(n, R=QQ):
    return [unit(n, i, j, R) for i in range(n) for j in range(n)]


def br(X, Y):
    return X * Y - Y * X


def map_matrix(f, basis, R=QQ):
    """Matrix of a linear map given on a basis; columns = flattened images."""
    return matrix(R, [list(f(B).list()) for B in basis]).transpose()


def generic(R, name, n, m=None):
    m = n if m is None else m
    return matrix(R, n, m, [R(f'{name}{i}{j}') for i in range(n)
                            for j in range(m)])


def names(prefixes, n, m=None):
    m = n if m is None else m
    return [f'{p}{i}{j}' for p in prefixes for i in range(n) for j in range(m)]


def truncate(p, idx, deg):
    """Drop the monomials of total degree >= deg in the variables idx."""
    R = p.parent()
    return R({e: c for e, c in p.dict().items()
              if sum(e[i] for i in idx) < deg})


def trunc_mat(M, idx, deg):
    return M.apply_map(lambda p: truncate(p, idx, deg))


def exp_trunc(M, N):
    """sum_(k < N) M^k / k!, entries in a univariate ring in t, mod t^N;
    M must have entries divisible by t."""
    n = M.nrows()
    total = identity_matrix(M.base_ring(), n)
    term = identity_matrix(M.base_ring(), n)
    for k in range(1, N):
        term = (term * M) / k
        total += term
    return total.apply_map(lambda p: p.truncate(N))


class MatrixLie:
    """A Lie subalgebra of gl_n(K) given by a basis of matrices."""

    def __init__(self, basis, K=QQ):
        self.K = K
        self.basis = [matrix(K, b) for b in basis]
        self.d = len(self.basis)
        B = matrix(K, [b.list() for b in self.basis]).transpose()
        assert B.rank() == self.d, 'basis is not linearly independent'
        rows = B.pivot_rows()
        self.rows = rows
        self.Binv = B.matrix_from_rows(rows).inverse()
        self.B = B
        self.c = [[self.coords(br(x, y)) for y in self.basis]
                  for x in self.basis]

    def coords_unchecked(self, v):
        return self.Binv * vector(self.K, [v[r] for r in self.rows])

    def coords(self, M):
        v = vector(self.K, matrix(self.K, M).list())
        c = self.coords_unchecked(v)
        assert self.B * c == v, 'bracket leaves the span: not a subalgebra'
        return c

    def element(self, v):
        return sum((a * b for a, b in zip(v, self.basis)),
                   matrix(self.K, self.basis[0].nrows()))

    def ad(self, v):
        """ad of the element with coordinates v, as a d x d matrix."""
        cols = [sum((v[i] * self.c[i][j] for i in range(self.d)),
                    vector(self.K, self.d)) for j in range(self.d)]
        return matrix(self.K, cols).transpose()

    def ad_basis(self):
        return [self.ad(vector(self.K, [int(i == j) for j in range(self.d)]))
                for i in range(self.d)]

    def killing(self):
        ads = self.ad_basis()
        return matrix(self.K, self.d, self.d,
                      lambda i, j: (ads[i] * ads[j]).trace())

    def span(self, vectors):
        V = self.K ** self.d
        return V.subspace(vectors)

    def bracket_space(self, S, T):
        return self.span([self.coords(br(self.element(a), self.element(b)))
                          for a in S.basis() for b in T.basis()])

    def whole(self):
        return (self.K ** self.d).subspace((self.K ** self.d).basis())

    def is_ideal(self, S):
        return self.bracket_space(self.whole(), S).is_subspace(S)

    def derived_series(self, S):
        series = [S]
        while series[-1].dimension() > 0:
            nxt = self.bracket_space(series[-1], series[-1])
            if nxt == series[-1]:
                break
            series.append(nxt)
        return series

    def is_solvable(self, S):
        return self.derived_series(S)[-1].dimension() == 0

    def quotient_killing(self, R):
        """Killing form of g/R for an ideal R (on a complement basis)."""
        comp = []
        W = R
        for e in (self.K ** self.d).basis():
            if e not in W:
                comp.append(e)
                W = W + self.span([e])
        P = matrix(self.K, list(R.basis()) + comp).transpose()
        Pinv = P.inverse()
        r = R.dimension()
        ads = []
        for v in comp:
            A = Pinv * self.ad(v) * P
            ads.append(A.submatrix(r, r))
        m = len(comp)
        return matrix(self.K, m, m, lambda i, j: (ads[i] * ads[j]).trace())

    def derivations(self):
        """Basis of Der g as d x d matrices (columns = images of the basis)."""
        d, K, c = self.d, self.K, self.c
        rows = []
        for i in range(d):
            for j in range(d):
                for k in range(d):
                    row = [K(0)] * (d * d)
                    # D[k][m] is unknown number k*d + m.
                    for m in range(d):
                        row[k * d + m] += c[i][j][m]
                    for p in range(d):
                        row[p * d + i] -= c[p][j][k]
                        row[p * d + j] -= c[i][p][k]
                    rows.append(row)
        sol = matrix(K, rows).right_kernel().basis()
        return [matrix(K, d, d, list(v)) for v in sol]


def lie_from_kernel(f, n, R=QQ):
    """The Lie algebra {X in gl_n: f(X) = 0} (f linear), as MatrixLie."""
    basis = unit_basis(n, R)
    M = map_matrix(f, basis, R)
    K = M.right_kernel().basis()
    mats = [sum((a * B for a, B in zip(v, basis)), matrix(R, n, n))
            for v in K]
    return mats


def sl_basis(n):
    return lie_from_kernel(lambda X: matrix(QQ, 1, 1, [X.trace()]), n)


def so_basis(n):
    return lie_from_kernel(lambda X: X + X.transpose(), n)


def J_matrix(n):
    h = n // 2
    return block_matrix(QQ, [[zero_matrix(QQ, h), identity_matrix(QQ, h)],
                             [-identity_matrix(QQ, h), zero_matrix(QQ, h)]])


def sp_basis(n):
    J = J_matrix(n)
    return lie_from_kernel(lambda X: X.transpose() * J + J * X, n)


def aff_basis():
    """x -> ax + b: the algebra of matrices [[x, y], [0, 0]] (Example 10.3)."""
    return [unit(2, 0, 0), unit(2, 0, 1)]


def heis_basis():
    """Nil-triangular 3 x 3 matrices X, Y, Z of Example 10.2."""
    return [unit(3, 0, 1), unit(3, 1, 2), unit(3, 0, 2)]


def b_basis(n):
    return [unit(n, i, j) for i in range(n) for j in range(n) if j >= i]


def ga_basis(n):
    """Tangent algebra of GA(K^n): (n+1) x (n+1) matrices [[X, v], [0, 0]]."""
    return [unit(n + 1, i, j) for i in range(n) for j in range(n + 1)]


def ex19_basis(c, K=QQ):
    """Exercise 2.19, corrected reading: triangular matrices with diagonal
    proportional to (c1, c2, c3)."""
    D = matrix(K, 3, 3, [c[0], 0, 0, 0, c[1], 0, 0, 0, c[2]])
    return [D, unit(3, 0, 1, K), unit(3, 1, 2, K), unit(3, 0, 2, K)]


# ---------------------------------------------------------------------------
# § 1. Background (11-background.typ).


def section_1():
    # Problem 4 (p. 3) and the Example of 6° (p. 8): SL_n(K) has
    # codimension 1 because d_E det = tr has rank 1 (d_E det = tr itself is
    # Problem 2.5, checked in section_2).
    for n in range(1, 9):
        rk = map_matrix(lambda X: matrix(QQ, 1, 1, [X.trace()]),
                        unit_basis(n)).rank()
        check(rk == 1, f'1.4: rk d_E det = 1 for n = {n}')
        check(len(sl_basis(n)) == n * n - 1, f'1.4: dim SL_{n} = n^2 - 1')

    # Problem 5 (p. 3): dim O_n(K) = n(n - 1)/2; Example 5.1
    # (pp. 7-8): the orbit of a nondegenerate symmetric form is
    # open, i.e. Y -> Y + Y^T maps gl_n onto B_+ (dimension n(n + 1)/2), and
    # dim O(V, f) = n^2 - n(n + 1)/2 = n(n - 1)/2.
    for n in range(1, 9):
        check(len(so_basis(n)) == n * (n - 1) // 2, f'1.5: dim O_{n}')
        rk = map_matrix(lambda X: X + X.transpose(), unit_basis(n)).rank()
        check(rk == n * (n + 1) // 2, f'Example 1.5.1: orbit open, n = {n}')
        check(n * n - n * (n + 1) // 2 == n * (n - 1) // 2,
              f'Example 1.5.1: printed arithmetic, n = {n}')

    # Problem 6 (p. 3): U_n is a real Lie subgroup of dimension n^2.
    # X = A + iB (A, B real); X + X^* = (A + A^T) + i(B - B^T): the real
    # kernel is {A skew} + {B symmetric}.
    for n in range(1, 9):
        def herm(pair, n=n):
            A, B = pair
            return block_matrix(QQ, [[A + A.transpose(), B - B.transpose()]])
        basis = ([(U, zero_matrix(QQ, n)) for U in unit_basis(n)]
                 + [(zero_matrix(QQ, n), U) for U in unit_basis(n)])
        M = matrix(QQ, [list(herm(p).list()) for p in basis]).transpose()
        check(2 * n * n - M.rank() == n * n, f'1.6: dim U_{n} = n^2')

    # Example 5.2 (p. 8), repeated in § 3 (p. 43): dim Sp(V, f)
    # = n(n + 1)/2 (n even); the orbit of f in B_-(V) is open.
    for n in range(2, 9, 2):
        J = J_matrix(n)
        check(len(sp_basis(n)) == n * (n + 1) // 2,
              f'Example 1.5.2: dim Sp_{n}')
        rk = map_matrix(lambda X: X.transpose() * J + J * X,
                        unit_basis(n)).rank()
        check(rk == n * (n - 1) // 2, f'Example 1.5.2: orbit open, n = {n}')

    # Exercises 2, 3 (p. 17): GL_n(H) has real dimension 4n^2; the
    # group Sp_n of unitary quaternionic matrices has dimension 2n^2 + n.
    H = QuaternionAlgebra(QQ, -1, -1)
    qbasis = [H(1), H.gen(0), H.gen(1), H.gen(0) * H.gen(1)]
    for n in range(1, 6):
        basis = []
        for i in range(n):
            for j in range(n):
                for q in qbasis:
                    M = [[H(0)] * n for _ in range(n)]
                    M[i][j] = q
                    basis.append(M)
        check(len(basis) == 4 * n * n, f'Exercise 1.2: dim GL_{n}(H) = 4n^2')

        def skew_part(M, n=n):
            out = []
            for i in range(n):
                for j in range(n):
                    out.extend((M[i][j] + M[j][i].conjugate())
                               .coefficient_tuple())
            return out
        A = matrix(QQ, [skew_part(M) for M in basis]).transpose()
        check(4 * n * n - A.rank() == 2 * n * n + n,
              f'Exercise 1.3: dim Sp_{n} = 2n^2 + n')

    # Exercise 7 (p. 17): the centralizer of any element of GL_n(K) has
    # dimension >= n.  The dimension depends only on the Jordan type (and
    # over R equals the complex one), so every Jordan type of size n <= 6 is
    # tested: a multiset of partitions, one per eigenvalue 1, 2, ....
    for n in range(1, 7):
        types = set()
        for sizes in Partitions(n):
            for parts in product(*[Partitions(s).list() for s in sizes]):
                types.add(tuple(sorted(tuple(p) for p in parts)))
        dims = []
        for jt in types:
            blocks = []
            for ev, part in enumerate(jt, start=1):
                for size in part:
                    J = ev * identity_matrix(QQ, size)
                    for k in range(size - 1):
                        J[k, k + 1] = 1
                    blocks.append(J)
            A = matrix.block_diagonal(blocks)
            rk = map_matrix(lambda X: A * X - X * A, unit_basis(n)).rank()
            dims.append(n * n - rk)
            # Known formula: sum over eigenvalues of sum of (conjugate
            # partition parts)^2; a cross-check of the rank computation.
            formula = sum(sum(c * c for c in Partition(list(p)).conjugate())
                          for p in jt)
            check(n * n - rk == formula, f'Exercise 1.7: formula, type {jt}')
        check(min(dims) >= n, f'Exercise 1.7: dim Z(A) >= {n}')
        check(min(dims) == n, f'Exercise 1.7: bound attained, n = {n}')

    # Example 9.2 (p. 13): the stabilizer of x_(p+1) = ... = x_n = 0 has
    # codimension p(n - p) (its tangent algebra: the lower-left block is 0).
    for n in range(1, 9):
        for p in range(0, n + 1):
            rk = map_matrix(lambda X: X.submatrix(p, 0, n - p, p),
                            unit_basis(n)).rank() if 0 < p < n else 0
            check(rk == p * (n - p), f'Example 1.9.2: codim, n = {n}, p = {p}')

    # Example 9.3 (p. 13): positive definite matrices = GL_n(R)/O_n,
    # dimension n^2 - n(n - 1)/2 = n(n + 1)/2 = dim of symmetric matrices.
    for n in range(1, 9):
        check(n * n - n * (n - 1) // 2 == n * (n + 1) // 2,
              f'Example 1.9.3: n = {n}')

    # Problem 8 (p. 4): Ad(A)X = A X A^-1 and Sq(A)X = A X A^T are
    # representations.  Identities in the generic entries.
    for n in (2, 3):
        R = PolynomialRing(QQ, names('abx', n)).fraction_field()
        A, B, X = (generic(R, p, n) for p in 'abx')
        check((A * B) * X * (A * B).inverse()
              == A * (B * X * B.inverse()) * A.inverse(),
              f'1.8: Ad is a homomorphism, n = {n}')
        check((A * B) * X * (A * B).transpose()
              == A * (B * X * B.transpose()) * A.transpose(),
              f'1.8: Sq is a homomorphism, n = {n}')

        # Problem 11 (p. 6) and its hint: X ~ sum v (x) w (rank one
        # matrices v w^T); Sq(A) acts as A (x) A = T_(2,0)(A), Ad(A) as
        # A (x) (A^-1)^T = T_(1,1)(A) (the dual acts by (A^-1)^T).
        Ainv = A.inverse()
        vecX = vector(R, X.list())
        check(A.tensor_product(A) * vecX
              == vector(R, (A * X * A.transpose()).list()),
              f'1.11: Sq = T_(2,0), n = {n}')
        check(A.tensor_product(Ainv.transpose()) * vecX
              == vector(R, (A * X * Ainv).list()),
              f'1.11: Ad = T_(1,1), n = {n}')
        v, w = generic(R, 'x', n, 1), generic(R, 'b', n, 1)
        check(A * (v * w.transpose()) * A.transpose()
              == (A * v) * (A * w).transpose(),
              f'Hint 1.11: rank one matrices, n = {n}')

    # Formulas (1), (2) (pp. 5-6): T_(0,l)(A) = product of l dual
    # representations, T_(1,l)(A) = Id times l duals, compared with
    # f(A^-1 v_1, ...) and A F(A^-1 v_1, ...) on basis vectors (n = 2).
    n = 2
    R = PolynomialRing(QQ, names('a', n) + [f'f{i}{j}{k}' for i in range(n)
                       for j in range(n) for k in range(n)]).fraction_field()
    A = generic(R, 'a', n)
    Ainv = A.inverse()
    Dual = Ainv.transpose()
    e = [vector(R, [int(i == j) for j in range(n)]) for i in range(n)]
    f3 = {(i, j, k): R(f'f{i}{j}{k}') for i in range(n) for j in range(n)
          for k in range(n)}

    def form2(u, w):
        return sum(f3[(i, j, 0)] * u[i] * w[j] for i in range(n)
                   for j in range(n))

    def form3(u, w, x):
        return sum(f3[(i, j, k)] * u[i] * w[j] * x[k] for i in range(n)
                   for j in range(n) for k in range(n))

    def map12(u, w):  # F(u, w) = sum_k f_(k i j) u_i w_j e_k
        return vector(R, [sum(f3[(k, i, j)] * u[i] * w[j] for i in range(n)
                              for j in range(n)) for k in range(n)])
    coeff2 = vector(R, [f3[(i, j, 0)] for i in range(n) for j in range(n)])
    new2 = vector(R, [form2(Ainv * e[i], Ainv * e[j]) for i in range(n)
                      for j in range(n)])
    check(Dual.tensor_product(Dual) * coeff2 == new2, 'formula (1), l = 2')
    coeff3 = vector(R, [f3[(i, j, k)] for i in range(n) for j in range(n)
                        for k in range(n)])
    new3 = vector(R, [form3(Ainv * e[i], Ainv * e[j], Ainv * e[k])
                      for i in range(n) for j in range(n) for k in range(n)])
    check(Dual.tensor_product(Dual).tensor_product(Dual) * coeff3 == new3,
          'formula (1), l = 3')
    new12 = vector(R, [(A * map12(Ainv * e[i], Ainv * e[j]))[k]
                       for k in range(n) for i in range(n) for j in range(n)])
    check(A.tensor_product(Dual).tensor_product(Dual) * coeff3 == new12,
          'formula (2), l = 2')

    # 11°, Example 2 (p. 16): V x|_Id GL(V) = GA(V): the product (4)
    # with b = Id is the product of the matrices [[A, v], [0, 1]]; (5).
    n = 2
    R = PolynomialRing(QQ, names('ab', n) + names('vw', n, 1)).fraction_field()
    A, B = generic(R, 'a', n), generic(R, 'b', n)
    v, w = generic(R, 'v', n, 1), generic(R, 'w', n, 1)

    def aff(M, u):
        return block_matrix(R, [[M, u], [zero_matrix(R, 1, n),
                                         identity_matrix(R, 1)]])
    check(aff(A, v) * aff(B, w) == aff(A * B, v + A * w),
          'Example 1.11.2: (4) with b = Id is GA(V)')
    E2 = identity_matrix(R, n)
    check(aff(A, 0 * v) * aff(E2, w) * aff(A, 0 * v).inverse()
          == aff(E2, A * w), 'Example 1.11.2: formula (5)')

    # 11°, Example 4 (p. 16): triangular = unitriangular x| diagonal.
    n = 3
    R = PolynomialRing(QQ, names('tu', n)).fraction_field()
    T = matrix(R, n, n, lambda i, j: R(f't{i}{j}') if j >= i else 0)
    U = matrix(R, n, n, lambda i, j: (R(f'u{i}{j}') if j > i
                                      else R(int(i == j))))
    D = matrix.diagonal(R, [T[i, i] for i in range(n)])
    Uf = T * D.inverse()
    check(all(Uf[i, i] == 1 for i in range(n)) and Uf.is_triangular('upper'),
          'Example 1.11.4: T = U D with U unitriangular')
    C = D * U * D.inverse()
    check(C.is_triangular('upper') and all(C[i, i] == 1 for i in range(n)),
          'Example 1.11.4: unitriangular subgroup is normal')

    # Exercise 11 (p. 17): GL_n = SL_n x| {diag(a, 1, ..., 1)}.
    A = generic(R, 't', n)
    d = A.det()
    Dg = matrix.diagonal(R, [d] + [1] * (n - 1))
    check((A * Dg.inverse()).det() == 1 and A == (A * Dg.inverse()) * Dg,
          'Exercise 1.11: A = (A diag(1/det A, 1, 1)) diag(det A, 1, 1)')


# ---------------------------------------------------------------------------
# § 2. Tangent algebra (12-tangent-algebra.typ).


def section_2():
    # Hint 2 (pp. 39-40): in the coordinates X - E on GL_n,
    # overline(XY) = x + y + x y exactly, so alpha(x, y) = x y and
    # gamma(x, y) = x y - y x (formula (4)); formula (3): the commutator
    # (x, y) = E + gamma(x, y) + (degree >= 3); Problem 12: g x g^-1 =
    # x + gamma(g, x) + (degree >= 3).  s, t scale the coordinates.
    for n in (2, 3):
        R = PolynomialRing(QQ, ['s', 't'] + names('ab', n))
        s, t = R('s'), R('t')
        A, B = generic(R, 'a', n), generic(R, 'b', n)
        E = identity_matrix(R, n)
        check((E + A) * (E + B) - E == A + B + A * B,
              f'Hint 2.2: overline(XY) = x + y + xy, n = {n}')

        def inv(M, var, N=3):  # (E + var M)^-1 modulo var^N
            return sum(((-var * M) ** k for k in range(N)), 0 * E)
        X, Y = E + s * A, E + t * B
        comm = X * Y * inv(A, s) * inv(B, t)
        check(trunc_mat(comm - E, (0, 1), 3) == s * t * br(A, B),
              f'formulas (3), (4): (x, y) = gamma(x, y) + ..., n = {n}')
        conj = X * Y * inv(A, s)
        check(trunc_mat(conj - E, (0, 1), 3) == t * B + s * t * br(A, B),
              f'2.12: g x g^-1 = x + gamma(g, x) + ..., n = {n}')

    # Problem 5 (p. 22): (d_E det)(X) = tr X, the coefficient of t in
    # det(E + tX) (Hint 5).
    for n in range(1, 7):
        R = PolynomialRing(PolynomialRing(QQ, names('x', n)), 't')
        t = R.gen()
        X = generic(R.base_ring(), 'x', n).change_ring(R)
        check((identity_matrix(R, n) + t * X).det()[1] == X.trace(),
              f'2.5: d det = tr, n = {n}')

    # Problem 7 (p. 22): (d Ad)(Y)X = YX - XY, (d Sq)(Y)X = YX + XY^T;
    # (12) (p. 24).  Problems 8, 9: dual and product representations.
    # Dual numbers: A = E + eps Y, A^-1 = E - eps Y modulo eps^2.
    for n in (2, 3):
        R = PolynomialRing(PolynomialRing(QQ, names('xyz', n)), 'eps')
        eps = R.gen()
        X, Y, Z = (generic(R.base_ring(), p, n).change_ring(R) for p in 'xyz')
        E = identity_matrix(R, n)

        def d1(M):  # coefficient of eps
            return M.apply_map(lambda p: p[1])
        A, Ainv = E + eps * Y, E - eps * Y
        check(d1(A * X * Ainv) == Y * X - X * Y, f'2.7: d Ad, n = {n}')
        check(d1(A * X * A.transpose()) == Y * X + X * Y.transpose(),
              f'2.7: d Sq, n = {n}')
        check(d1(Ainv.transpose()) == -Y.transpose(),
              f'2.8: d R^* = -(d R)^T, n = {n}')
        B = E + eps * Z
        check(d1(A.tensor_product(B))
              == Y.tensor_product(E) + E.tensor_product(Z),
              f'2.9: d(RS) = dR (x) 1 + 1 (x) dS, n = {n}')

    # Formulas (9), (10) (pp. 22-23): differentiate formulas (1),
    # (2) at E (n = 2, l = 2, 3 and (1, 2)).
    n = 2
    R0 = PolynomialRing(QQ, names('xvw', n, 1) + ['y00', 'y01', 'y10', 'y11']
                        + [f'f{i}{j}{k}' for i in range(n) for j in range(n)
                           for k in range(n)])
    R = PolynomialRing(R0, 'eps')
    eps = R.gen()
    X = generic(R0, 'y', n).change_ring(R)
    Xinv = identity_matrix(R, n) - eps * X
    A = identity_matrix(R, n) + eps * X
    u, v, w = (generic(R0, p, n, 1).change_ring(R).column(0) for p in 'xvw')
    f3 = {(i, j, k): R(f'f{i}{j}{k}') for i in range(n) for j in range(n)
          for k in range(n)}

    def form2(a, b):
        return sum(f3[(i, j, 0)] * a[i] * b[j] for i in range(n)
                   for j in range(n))

    def form3(a, b, c):
        return sum(f3[(i, j, k)] * a[i] * b[j] * c[k] for i in range(n)
                   for j in range(n) for k in range(n))

    def F12(a, b):
        return vector(R, [sum(f3[(k, i, j)] * a[i] * b[j] for i in range(n)
                              for j in range(n)) for k in range(n)])
    lhs = form2(Xinv * u, Xinv * v)[1]
    check(lhs == -(form2(X * u, v) + form2(u, X * v))[0],
          'formula (9), l = 2')
    lhs = form3(Xinv * u, Xinv * v, Xinv * w)[1]
    check(lhs == -(form3(X * u, v, w) + form3(u, X * v, w)
                   + form3(u, v, X * w))[0], 'formula (9), l = 3')
    lhs = (A * F12(Xinv * u, Xinv * v)).apply_map(lambda p: p[1])
    rhs = (X * F12(u, v) - F12(X * u, v) - F12(u, X * v)).apply_map(
        lambda p: p[0])
    check(lhs == rhs, 'formula (10), l = 2')

    # Example 3.2 (p. 23): Der A = {D: tau_(1,2)(D) mu = 0}.  For a Lie
    # algebra given by structure constants the stabilizer equations are the
    # derivation equations; check that Der sl_2 = ad sl_2 (dim 3), dim Der of
    # the Heisenberg algebra = 6 (used in Example 10.2), and for the
    # associative algebra M_2 (Der M_2 = inner, dim 3).
    sl2 = MatrixLie(sl_basis(2))
    ders = sl2.derivations()
    check(len(ders) == 3, 'Example 2.3.2: dim Der sl_2 = 3')
    adspace = matrix(QQ, [a.list() for a in sl2.ad_basis()]).row_space()
    check(all(vector(QQ, D.list()) in adspace for D in ders),
          'Example 2.3.2: Der sl_2 = ad sl_2')
    heis = MatrixLie(heis_basis())
    check(len(heis.derivations()) == 6, 'Example 2.10.2: dim Der n_3 = 6')
    m2 = unit_basis(2)
    rows = []
    for a in range(4):
        for b in range(4):
            prod = (m2[a] * m2[b]).list()
            for k in range(4):
                row = [QQ(0)] * 16
                for m in range(4):
                    row[k * 4 + m] += prod[m]
                for p in range(4):
                    row[p * 4 + a] -= (m2[p] * m2[b]).list()[k]
                    row[p * 4 + b] -= (m2[a] * m2[p]).list()[k]
                rows.append(row)
    check(matrix(QQ, rows).right_kernel().dimension() == 3,
          'Example 2.3.2: Der M_2 (associative) has dimension 3')

    # (13), (14) (p. 24): Jacobi identity for the commutator bracket.
    n = 3
    R = PolynomialRing(QQ, names('xyz', n))
    X, Y, Z = (generic(R, p, n) for p in 'xyz')
    check(br(br(X, Y), Z) == br(X, br(Y, Z)) - br(Y, br(X, Z)),
          'formula (13)')
    check(br(br(X, Y), Z) + br(br(Y, Z), X) + br(br(Z, X), Y) == 0,
          'formula (14)')

    # Problem 27 (p. 29): [xi, eta] = 0 => exp(xi + eta) =
    # exp xi exp eta.
    # Truncated series in t.  For generic X, Y the second-order term is
    # [X, Y]/2, so the hypothesis cannot be dropped.
    n = 2
    Rb = PolynomialRing(QQ, names('xy', n))
    R = PolynomialRing(Rb, 't')
    t = R.gen()
    X, Y = (generic(Rb, p, n).change_ring(R) for p in 'xy')
    lhs = (exp_trunc(t * X, 3) * exp_trunc(t * Y, 3)).apply_map(
        lambda p: p.truncate(3))
    check(lhs == exp_trunc(t * (X + Y) + t ** 2 / 2 * br(X, Y), 3),
          '2.27: second-order term (1/2)[X, Y]')
    refuted(lhs == exp_trunc(t * (X + Y), 3),
            '2.27 without [xi, eta] = 0 (generic X, Y)')
    Yc = X * X + 2 * X  # commutes with X
    N = 8
    lhs = (exp_trunc(t * X, N) * exp_trunc(t * Yc, N)).apply_map(
        lambda p: p.truncate(N))
    check(lhs == exp_trunc(t * (X + Yc), N),
          '2.27: exp(X + Y) = exp X exp Y for commuting X, Y (mod t^8)')

    # p. 29: det exp A = e^(tr A), as series in t (mod t^7).
    for n in (2, 3):
        Rb = PolynomialRing(QQ, names('a', n))
        R = PolynomialRing(Rb, 't')
        t = R.gen()
        A = generic(Rb, 'a', n).change_ring(R)
        N = 7
        lhs = exp_trunc(t * A, N).det().truncate(N)
        rhs = exp_trunc(matrix(R, 1, 1, [t * A.trace()]), N)[0, 0]
        check(lhs == rhs, f'p. 29: det exp tA = e^(t tr A) mod t^7, n = {n}')

    # Exercise 9 (p. 39): exp on GL_n(C) is not injective:
    # exp diag(0, 2 pi i) = E = exp 0.  Onto: the unipotent part has the
    # logarithm N - N^2/2 + ... (N nilpotent), checked exactly for n = 3, 4.
    check(bool(exp(2 * pi * I) == 1) and bool(exp(SR(0)) == 1),
          'Exercise 2.9: exp diag(0, 2 pi i) = exp 0 = E')
    for n in (3, 4):
        Rb = PolynomialRing(QQ, names('m', n))
        M = matrix(Rb, n, n, lambda i, j: Rb(f'm{i}{j}') if j > i else 0)
        L = sum(((-1) ** (k + 1) * M ** k / k for k in range(1, n)),
                zero_matrix(Rb, n))
        expL = sum((L ** k / factorial(k) for k in range(n)),
                   zero_matrix(Rb, n))
        check(expL == identity_matrix(Rb, n) + M,
              f'Exercise 2.9: exp log(E + N) = E + N, n = {n}')

    # Exercise 10 (p. 39): exp: sl_2(R) -> SL_2(R) is not onto.
    # Algebraic part: X^2 = -det(X) E, hence exp X = C(d) E + S(d) X with
    # C(d) = sum d^k/(2k)!, S(d) = sum d^k/(2k+1)!, d = -det X.  Analysis (not
    # checked): C is cosh sqrt d >= 1 for d >= 0 and cos sqrt(-d) >= -1 for
    # d < 0, with C = -1 only where S = 0, i.e. exp X = -E.  So tr exp X
    # >= -2 with equality only for -E, and -E + E_12 is not an exponential.
    Rb = PolynomialRing(QQ, 'a,b,c')
    a, b, c = Rb.gens()
    X = matrix(Rb, [[a, b], [c, -a]])
    check(X * X == -X.det() * identity_matrix(Rb, 2),
          'Exercise 2.10: X^2 = -det X E on sl_2')
    R = PolynomialRing(Rb, 't')
    t = R.gen()
    N = 12
    dd = -X.det()
    Cs = sum((t ** (2 * k) * dd ** k / factorial(2 * k) for k in range(N)),
             R(0)).truncate(N)
    Ss = sum((t ** (2 * k + 1) * dd ** k / factorial(2 * k + 1)
              for k in range(N)), R(0)).truncate(N)
    lhs = exp_trunc(t * X.change_ring(R), N)
    check(lhs == Cs * identity_matrix(R, 2) + Ss * X.change_ring(R),
          'Exercise 2.10: exp tX = C E + S X (mod t^12)')
    Mbad = matrix(QQ, [[-1, 1], [0, -1]])
    check(Mbad.det() == 1 and Mbad.trace() == -2
          and Mbad != -identity_matrix(QQ, 2),
          'Exercise 2.10: -E + E_12 in SL_2, trace -2, not -E')

    # Lemma, formula (19) (p. 30), corrected sign (p. 31):
    # d eta/dt - d xi/ds = [xi, eta] for xi = g_t g^-1, eta = g_s g^-1.
    # (a) generic jets: G, G_t, G_s, G_ts independent matrices, derivatives by
    # the product rule and d(G^-1) = -G^-1 dG G^-1;
    for n in (2, 3):
        R = PolynomialRing(QQ, names(['g', 'p', 'q', 'r'], n)).fraction_field()
        G, Gt, Gs, Gts = (generic(R, p, n) for p in 'gpqr')
        Gi = G.inverse()
        xi, eta = Gt * Gi, Gs * Gi
        eta_t = Gts * Gi - Gs * Gi * Gt * Gi
        xi_s = Gts * Gi - Gt * Gi * Gs * Gi
        check(eta_t - xi_s == br(xi, eta), f'formula (19), jets, n = {n}')
        refuted(eta_t == xi_s, f'printed "d eta/dt = d xi/ds", n = {n}')
    # (b) a concrete map of the square into GL_2, g(0, 0) = E;
    P2 = PolynomialRing(QQ, 't,s')
    R = P2.fraction_field()
    t, s = R.gens()
    g = matrix(R, [[1 + t + s * t, s + t * s], [t ** 2 - s, 1 + s ** 2 + t]])

    def dm(M, var):
        return M.apply_map(lambda e: e.derivative(var))
    gi = g.inverse()
    xi, eta = dm(g, t) * gi, dm(g, s) * gi
    check(dm(eta, t) - dm(xi, s) == br(xi, eta), 'formula (19), concrete g')
    refuted(dm(eta, t) == dm(xi, s), 'printed "=" for concrete g')
    # the coordinate step of the proof (alpha(x, y) = x y on GL_2, at g = E):
    # g_ts = d xi/ds + xi eta = d eta/dt + eta xi at (t0, s0) = (0, 0).

    def at0(M):
        return M.apply_map(lambda e: e.numerator()(0, 0)
                           / e.denominator()(0, 0))
    check(at0(g) == identity_matrix(QQ, 2), 'concrete g: g(0, 0) = E')
    gts = at0(dm(dm(g, t), s))
    check(gts == at0(dm(xi, s) + xi * eta) == at0(dm(eta, t) + eta * xi),
          'proof of the Lemma: second derivatives at (t0, s0)')

    # Proof of Theorem 6 (p. 32): velocity of g(t) = g_2(2t) and of
    # g(t) = g_1(2t - 1) g_2(1); the path h(t) = h_1(2t - 1) h_2(1).  Here
    # G = GL_2, f = Sq: GL_2 -> GL(L_2), phi = d Sq: Y -> Y (x) E + E (x) Y.
    R = PolynomialRing(QQ, 't').fraction_field()
    t = R.gen()
    E2 = identity_matrix(R, 2)

    def g1(x):
        return matrix(R, [[1 + x, x], [x ** 2, 1]])

    def g2(x):
        return matrix(R, [[1, x], [x, 1 + x + x ** 2]])

    def vel(M):
        return M.apply_map(lambda e: e.derivative(t)) * M.inverse()

    def Sq(M):
        return M.tensor_product(M)

    def phi(Y):
        return Y.tensor_product(E2) + E2.tensor_product(Y)

    def at(M, x):
        return M.apply_map(lambda e: e(x))
    xi1, xi2 = vel(g1(t)), vel(g2(t))
    check(vel(g2(2 * t)) == 2 * at(xi2, 2 * t),
          'Theorem 2.6: velocity 2 xi_2(2t) on [0, 1/2]')
    refuted(vel(g2(2 * t)) == 2 * xi2, 'printed velocity 2 xi_2(t)')
    check(vel(g1(2 * t - 1) * g2(R(1))) == 2 * at(xi1, 2 * t - 1),
          'Theorem 2.6: velocity 2 xi_1(2t - 1) on [1/2, 1]')
    h1, h2 = (lambda x: Sq(g1(x))), (lambda x: Sq(g2(x)))
    for h, xi in ((h1, xi1), (h2, xi2)):
        H = h(t)
        check(H.apply_map(lambda e: e.derivative(t)) == phi(xi) * H,
              'Theorem 2.6: h_i = f(g_i) solves (17)')
    h_ok = h1(2 * t - 1) * h2(R(1))
    h_bad = h1(2 * t - 1) * h2(t)
    xi_second = 2 * at(xi1, 2 * t - 1)
    check(h_ok.apply_map(lambda e: e.derivative(t)) == phi(xi_second) * h_ok,
          'Theorem 2.6: h_1(2t - 1) h_2(1) solves (17) on [1/2, 1]')
    check(at(h_ok, R(1) / 2) == h2(R(1)),
          'Theorem 2.6: h continuous at t = 1/2')
    refuted(h_bad.apply_map(lambda e: e.derivative(t))
            == phi(xi_second) * h_bad,
            'printed h_1(2t - 1) h_2(t) solves (17)')
    refuted(at(h_bad, R(1) / 2) == h2(R(1)),
            'printed h_1(2t - 1) h_2(t) continuous at 1/2')
    check(Sq(g1(R(1)) * g2(R(1))) == h1(R(1)) * h2(R(1)),
          'Theorem 2.6: f(g_1 g_2) = h_1(1) h_2(1)')

    # Example 10.2 (pp. 35-36): the nil-triangular algebra.
    X, Y, Z = heis_basis()
    check(br(X, Y) == Z and br(X, Z) == 0 and br(Y, Z) == 0,
          'Example 2.10.2: [X, Y] = Z, [X, Z] = [Y, Z] = 0')
    heis = MatrixLie(heis_basis())
    # the center: coordinate vectors v with [v, e_j] = 0 for all j.
    cvecs = matrix(QQ, [[heis.c[i][j][k] for i in range(3)]
                        for j in range(3) for k in range(3)]).right_kernel()
    check(cvecs.dimension() == 1 and vector(QQ, [0, 0, 1]) in cvecs,
          'Example 2.10.2: the center is <Z>')
    Rb = PolynomialRing(QQ, 'p,q,u,r,s,v,c')
    p, q, u, r, s, v, c = Rb.gens()
    phiX, phiY, phiZ = (p * X + q * Y + u * Z, r * X + s * Y + v * Z, c * Z)
    phiX, phiY, phiZ = (M.change_ring(Rb) for M in (phiX, phiY, phiZ))
    check(br(phiX, phiY) - phiZ == (p * s - q * r - c) * Z.change_ring(Rb)
          and br(phiX, phiZ) == 0 and br(phiY, phiZ) == 0,
          'Example 2.10.2: automorphism iff c = det of the map on g/z')
    Rg = PolynomialRing(QQ, 'x,y,z')
    x, y, z = Rg.gens()
    g = matrix(Rg, [[1, x, z], [0, 1, y], [0, 0, 1]])
    gi = g.inverse()
    Xr, Yr, Zr = (M.change_ring(Rg) for M in (X, Y, Z))
    check(g * Xr * gi == Xr - y * Zr and g * Yr * gi == Yr + x * Zr
          and g * Zr * gi == Zr,
          'Example 2.10.2: inner automorphisms X -> X + aZ, Y -> Y + bZ')
    ders = heis.derivations()
    induced = matrix(QQ, [D.submatrix(0, 0, 2, 2).list() for D in ders])
    check(induced.rank() == 4, 'Example 2.10.2: Der -> gl(g/z) is onto')
    kernel_ders = induced.left_kernel()
    inner = [vector(QQ, (heis.ad(vector(QQ, [1, 0, 0]))).list()),
             vector(QQ, (heis.ad(vector(QQ, [0, 1, 0]))).list())]
    kspace = matrix(QQ, [sum(a * vector(QQ, D.list())
                             for a, D in zip(kv, ders))
                         for kv in kernel_ders.basis()]).row_space()
    check(kspace == matrix(QQ, inner).row_space(),
          'Example 2.10.2: the kernel is ad g (Out = GL_2)')

    # Example 10.3 (p. 36): the algebra of x -> ax + b.
    X, Y = aff_basis()
    check(br(X, Y) == Y, 'Example 2.10.3: [X, Y] = Y')
    Rg = PolynomialRing(QQ, 'a,b').fraction_field()
    a, b = Rg.gens()
    g = matrix(Rg, [[a, b], [0, 1]])
    Xr, Yr = X.change_ring(Rg), Y.change_ring(Rg)
    check(g * Xr * g.inverse() == Xr - b * Yr
          and g * Yr * g.inverse() == a * Yr,
          'Example 2.10.3: Ad g: X -> X - bY, Y -> aY')
    Rb = PolynomialRing(QQ, 'p,q,r,s')
    p, q, r, s = Rb.gens()
    phiX = (p * X + q * Y).change_ring(Rb)
    phiY = (r * X + s * Y).change_ring(Rb)
    diff = br(phiX, phiY) - phiY
    check(diff == -r * X.change_ring(Rb) + (p * s - q * r - s)
          * Y.change_ring(Rb),
          'Example 2.10.3: automorphism iff r = 0, p = 1 (s != 0): Aut = Int')

    # Problem 36, formula (20) (p. 35): [D, ad xi] = ad(D xi).
    algebras = {
        'sl_2': sl_basis(2), 'n_3': heis_basis(), 'ax+b': aff_basis(),
        'b_3': b_basis(3), 'gl_2': unit_basis(2), 'ga_2': ga_basis(2),
        'so_4': so_basis(4), 'ex19(0,1,3)': ex19_basis((0, 1, 3)),
    }
    for label, basis in algebras.items():
        L = MatrixLie(basis)
        ders = L.derivations()
        ok = all(D * L.ad(vector(QQ, [int(i == j) for j in range(L.d)]))
                 - L.ad(vector(QQ, [int(i == j) for j in range(L.d)])) * D
                 == L.ad(D.column(i))
                 for D in ders for i in range(L.d))
        check(ok, f'formula (20) for {label}')
        adsp = matrix(QQ, [D.list() for D in ders]).row_space()
        check(all(vector(QQ, A.list()) in adsp for A in L.ad_basis()),
              f'2.4-2.5: ad g consists of derivations ({label})')

    # (21), (22) and Example 11.2 (p. 37): the tangent algebra of GA(V)
    # is V (+)_id gl(V).
    n = 2
    R = PolynomialRing(QQ, names('xy', n) + names('vw', n, 1))
    X, Y = generic(R, 'x', n), generic(R, 'y', n)
    v, w = generic(R, 'v', n, 1), generic(R, 'w', n, 1)

    def aff0(M, u):
        return block_matrix(R, [[M, u], [zero_matrix(R, 1, n),
                                         zero_matrix(R, 1, 1)]])
    check(br(aff0(X, v), aff0(Y, w)) == aff0(br(X, Y), X * w - Y * v),
          'formula (21) with beta = id: tangent algebra of GA(V)')
    check(br(aff0(X, 0 * v), aff0(zero_matrix(R, n), v))
          == aff0(zero_matrix(R, n), X * v), 'formula (22)')

    # Exercise 3 (p. 38): under x = y + s(y, y) (s symmetric bilinear)
    # the symmetric part alpha(x, y) + alpha(y, x) changes by -4 s(x, y),
    # so any commutative operation can be reached.  Dimension 2, generic
    # alpha and s, modulo degree 3.
    names3 = (['x0', 'x1', 'y0', 'y1']
              + [f'al{k}{i}{j}' for k in range(2) for i in range(2)
                 for j in range(2)]
              + [f'sg{k}{i}{j}' for k in range(2) for i in range(2)
                 for j in range(i, 2)])
    R = PolynomialRing(QQ, names3)
    xv = vector(R, [R('x0'), R('x1')])
    yv = vector(R, [R('y0'), R('y1')])

    def alpha(a, b):
        return vector(R, [sum(R(f'al{k}{i}{j}') * a[i] * b[j]
                              for i in range(2) for j in range(2))
                          for k in range(2)])

    def sform(a, b):
        return vector(R, [sum(R(f'sg{k}{min(i, j)}{max(i, j)}') * a[i] * b[j]
                              for i in range(2) for j in range(2))
                          for k in range(2)])
    idx = tuple(range(4))

    def tr3(vec):
        return vector(R, [truncate(e, idx, 3) for e in vec])

    def mu(a, b):  # group law in the old coordinates, to order 2
        return a + b + alpha(a, b)
    # old = new + s(new, new); new = old - s(old, old) + O(3)
    X_old, Y_old = xv + sform(xv, xv), yv + sform(yv, yv)
    prod_old = mu(X_old, Y_old)
    prod_new = tr3(prod_old - sform(prod_old, prod_old))
    alpha_new = tr3(prod_new - xv - yv)
    sym_new = alpha_new + tr3(alpha_new.apply_map(
        lambda e: e.subs({R('x0'): R('y0'), R('x1'): R('y1'),
                          R('y0'): R('x0'), R('y1'): R('x1')})))
    check(sym_new == alpha(xv, yv) + alpha(yv, xv) - 4 * sform(xv, yv),
          'Exercise 2.3: symmetric part shifts by -4 s')

    # Exercise 13 (p. 39): Im((au + b)/(cu + d)) = (ad - bc) Im u /
    # |cu + d|^2, so SL_2(Z) preserves the upper half-plane.
    R = PolynomialRing(QQ, 'a,b,c,d,x,y')
    a, b, c, d, x, y = R.gens()
    # (au + b)(c conj(u) + d), u = x + iy: imaginary part.
    re1, im1 = a * x + b, a * y
    re2, im2 = c * x + d, -c * y
    check(re1 * im2 + im1 * re2 == (a * d - b * c) * y,
          'Exercise 2.13: Im of the Moebius transform')

    # Exercise 19 (p. 39).
    K2 = QuadraticField(2, 'r2')
    r2 = K2.gen()
    c = (K2(0), K2(1), 1 + r2)
    # printed reading: diagonal matrices with x1 : x2 : x3 = c1 : c2 : c3,
    # a one-dimensional algebra; ad = 0, so Int g = exp(ad g) = {E} is
    # always a Lie subgroup.  For c = (0, 1, 1 + sqrt 2) the differences
    # c1 - c2 = -1, c2 - c3 = -sqrt 2 are incommensurable.
    Lp = MatrixLie([matrix.diagonal(K2, c)], K2)
    check(Lp.ad_basis()[0] == 0, 'Exercise 2.19 printed: g commutative')
    check(((c[1] - c[2]) / (c[0] - c[1])) not in QQ,
          'Exercise 2.19: c1 - c2, c2 - c3 incommensurable for (0, 1, 1+r2)')
    # The printed equivalence "Int g is a Lie subgroup iff the differences
    # are commensurable": the left side is true (Int g = {E}), the right
    # side false.
    int_is_lie_subgroup = True
    commensurable = ((c[1] - c[2]) / (c[0] - c[1])) in QQ
    refuted(int_is_lie_subgroup == commensurable,
            'Exercise 2.19 as printed ("diagonal"): "iff commensurable"')
    # the reading "all 3 x 3 matrices with this diagonal" is not a
    # subalgebra: for c = (0, 1, 3), [E_12, E_21] = diag(1, -1, 0) has a
    # diagonal not proportional to c.
    diag = br(unit(3, 0, 1), unit(3, 1, 0)).diagonal()
    refuted(matrix(QQ, [diag, [0, 1, 3]]).rank() == 1,
            'Exercise 2.19: "matrices with this diagonal" closed under [,]')
    # corrected reading: triangular matrices with this diagonal.
    Rc = PolynomialRing(QQ, 'c1,c2,c3')
    c1, c2, c3 = Rc.gens()
    D, X, Y, Z = ex19_basis((c1, c2, c3), Rc)
    check(br(D, X) == (c1 - c2) * X and br(D, Y) == (c2 - c3) * Y
          and br(D, Z) == (c1 - c3) * Z and br(X, Y) == Z
          and br(X, Z) == 0 and br(Y, Z) == 0,
          'Exercise 2.19 corrected: brackets, weights c1-c2, c2-c3, c1-c3')
    # phi acts diagonally by (1, a, b, ab) in the basis (D, X, Y, Z); it is
    # an automorphism iff [phi u, phi v] = phi [u, v] on the nonzero
    # brackets [D, X], [D, Y], [D, Z], [X, Y] (the others vanish on both
    # sides).
    Ra = PolynomialRing(Rc, 'a,b')
    a, b = Ra.gens()
    basis = [M.change_ring(Ra) for M in (D, X, Y, Z)]
    scal = [Ra(1), a, b, a * b]
    images = [sc * M for sc, M in zip(scal, basis)]
    brackets = {(0, 1): (c1 - c2, 1), (0, 2): (c2 - c3, 2),
                (0, 3): (c1 - c3, 3), (1, 2): (Rc(1), 3)}
    check(all(br(images[i], images[j]) == coef * images[k]
              for (i, j), (coef, k) in brackets.items())
          and all(br(images[i], images[j]) == 0
                  for i, j in ((1, 3), (2, 3))),
          'Exercise 2.19 corrected: (D, X, Y, Z) -> (D, aX, bY, abZ) '
          'are automorphisms')
    for cc, K in (((0, 1, 1 + r2), K2), ((0, 1, 3), QQ)):
        L = MatrixLie(ex19_basis(cc, K), K)
        ders = L.derivations()
        ads = L.ad_basis()
        adsp = matrix(K, [A.list() for A in ads])
        check(adsp.rank() == 4, f'Exercise 2.19 corrected: center 0, c = {cc}')
        check(len(ders) == 5,
              f'Exercise 2.19 corrected: dim Der = 5, c = {cc}')
        delta = matrix.diagonal(K, [0, 1, 0, 1])
        check(vector(K, delta.list()) in matrix(K, [Dd.list() for Dd in ders])
              .row_space() and vector(K, delta.list()) not in adsp.row_space(),
              f'Exercise 2.19 corrected: Der = ad g + <delta>, c = {cc}')

    # Hint 21 (p. 41), corrected to "Problem 19 and Theorem 3":
    # a subspace is Ad(G)-invariant iff it is ad(g)-invariant (Problem 19
    # for R = Ad, d Ad = ad by Theorem 3).  Example: x -> ax + b.
    Rg = PolynomialRing(QQ, 'a,b').fraction_field()
    a, b = Rg.gens()
    g = matrix(Rg, [[a, b], [0, 1]])
    X, Y = (M.change_ring(Rg) for M in aff_basis())
    check((g * Y * g.inverse()) == a * Y and br(X, Y) == Y,
          'Hint 2.21: <Y> is Ad- and ad-invariant (an ideal)')
    check((g * X * g.inverse() - X) == -b * Y and br(Y, X) == -Y,
          'Hint 2.21: <X> is neither Ad- nor ad-invariant')


# ---------------------------------------------------------------------------
# § 3. Connectedness and simple connectedness (13-connectedness.typ).


def pseudo_form(k, l):
    return matrix.diagonal(QQ, [1] * k + [-1] * l)


def section_3():
    # p. 44: O_(k,l) has dimension n(n - 1)/2.
    for n in range(2, 9):
        for k in range(1, n):
            Q = pseudo_form(k, n - k)
            dim = len(lie_from_kernel(lambda X: X.transpose() * Q + Q * X, n))
            check(dim == n * (n - 1) // 2, f'p. 44: dim O_({k},{n - k})')
            # Hint 10 (p. 49): the orbit map at e_1 on the hyperboloid
            # q = 1 has rank n - 1, the stabilizer O_(k-1,l) has dimension
            # (n - 1)(n - 2)/2.
            basis = lie_from_kernel(lambda X: X.transpose() * Q + Q * X, n)
            e1 = vector(QQ, [1] + [0] * (n - 1))
            rk = matrix(QQ, [list(B * e1) for B in basis]).rank()
            check(rk == n - 1 and dim - rk == (n - 1) * (n - 2) // 2,
                  f'Hint 3.10: hyperboloid, (k, l) = ({k}, {n - k})')

    # Problem 9 (p. 44) and Exercise 5 (p. 48) on random points
    # of O_(k,l)(Q): products of reflections in anisotropic rational vectors.
    rng = random.Random(20260924)
    for k, l in [(1, 1), (1, 2), (2, 1), (2, 2), (1, 3), (3, 1), (2, 3),
                 (3, 2), (1, 4)]:
        n = k + l
        Q = pseudo_form(k, l)
        samples = []
        while len(samples) < 40:
            A = identity_matrix(QQ, n)
            for _ in range(rng.randint(1, 6)):
                v = vector(QQ, [rng.randint(-3, 3) for _ in range(n)])
                qv = v * Q * v
                if qv == 0:
                    continue
                A = A * (identity_matrix(QQ, n)
                         - 2 * v.column() * (v.row() * Q) / qv)
            samples.append(A)
        check(all(A.transpose() * Q * A == Q for A in samples),
              f'O_({k},{l}) samples preserve q')
        dk = [A.submatrix(0, 0, k, k).det() for A in samples]
        check(all(x != 0 for x in dk), f'3.9: d_k != 0 on O_({k},{l})')

        def sgn(x):
            return 1 if x > 0 else -1
        check(all(sgn((A * B).submatrix(0, 0, k, k).det())
                  == sgn(A.submatrix(0, 0, k, k).det())
                  * sgn(B.submatrix(0, 0, k, k).det())
                  for A in samples for B in samples),
              f'Exercise 3.5: sign d_k is multiplicative on O_({k},{l})')
        pairs = {(sgn(A.submatrix(0, 0, k, k).det()), sgn(A.det()))
                 for A in samples}
        check(pairs == {(1, 1), (1, -1), (-1, 1), (-1, -1)},
              f'Exercise 3.5: four components visible in O_({k},{l})')
        Dm = matrix.diagonal(QQ, [-1] + [1] * (n - 2) + [-1])
        check(Dm.transpose() * Q * Dm == Q and Dm.det() == 1
              and Dm.submatrix(0, 0, k, k).det() < 0,
              f'p. 44: a diagonal matrix of SO_({k},{l}) with d_k < 0')

    # Hints 6, 7, 8 (p. 49): stabilizers of a point.
    for n in range(2, 9):
        basis = sl_basis(n)
        e1 = vector(QQ, [1] + [0] * (n - 1))
        rk = matrix(QQ, [list(B * e1) for B in basis]).rank()
        check(rk == n and len(basis) - rk == ((n - 1) ** 2 - 1) + (n - 1),
              f'Hint 3.6: SL_{n} on K^n - 0, stabilizer SL_(n-1) x K^(n-1)')
        basis = so_basis(n)
        rk = matrix(QQ, [list(B * e1) for B in basis]).rank()
        check(rk == n - 1 and len(basis) - rk == (n - 1) * (n - 2) // 2,
              f'Hint 3.7: SO_{n} on the sphere, stabilizer SO_(n-1)')
    for n in range(1, 7):
        basis = sp_basis(2 * n)
        e1 = vector(QQ, [1] + [0] * (2 * n - 1))
        rk = matrix(QQ, [list(B * e1) for B in basis]).rank()
        stab = len(basis) - rk
        check(rk == 2 * n, f'Hint 3.8: Sp_{2 * n} transitive on K^(2n) - 0')
        check(stab == (n - 1) * (2 * n - 1) + (2 * n - 1),
              f'Hint 3.8: stabilizer Sp_(2n-2) x K^(2n-1), n = {n}')
        if n >= 2 and n % 2 == 0:
            m = n - 2  # printed Sp_(n-2), book's index = matrix size
            refuted(stab == m * (m + 1) // 2 + (2 * n - 1),
                    f'Hint 3.8 printed: Sp_(n-2) x K^(2n-1), n = {n}')

    # Example 2 of 2° (pp. 44-45): SL_2(C) -> SO_3(C).
    R = PolynomialRing(QQ, 'p,q,r,s,a,b,c').fraction_field()
    p, q, r, s, a, b, c = R.gens()
    A = matrix(R, [[p, q], [r, s]])
    X = matrix(R, [[a, b], [c, -a]])
    check((A * X * A.inverse()).det() == X.det(),
          'Example 3.2.2: det is Ad-invariant')
    sl2 = MatrixLie(sl_basis(2))
    # polar form of det on sl_2, Gram matrix in the chosen basis
    Bs = sl2.basis

    def polar(U, V):
        return ((U + V).det() - U.det() - V.det()) / 2
    Gram = matrix(QQ, 3, 3, lambda i, j: polar(Bs[i], Bs[j]))
    check(Gram.det() != 0, 'Example 3.2.2: det is nondegenerate on sl_2')
    ads = sl2.ad_basis()
    check(all(M.transpose() * Gram + Gram * M == 0 for M in ads)
          and matrix(QQ, [M.list() for M in ads]).rank() == 3,
          'Example 3.2.2: ad sl_2 = o(sl_2, det) (dim 3)')
    Rp = PolynomialRing(QQ, 'p,q,r,s')
    p, q, r, s = Rp.gens()
    A = matrix(Rp, [[p, q], [r, s]])
    eqs = [e for B in sl_basis(2) for e in (A * B - B * A).list()]
    Ivar = Rp.ideal(eqs + [A.det() - 1])
    ker_ad = {tuple(QQ(pt[x]) for x in (p, q, r, s))
              for pt in Ivar.variety(QQbar)}
    check(ker_ad == {(1, 0, 0, 1), (-1, 0, 0, -1)},
          'Example 3.2.2: Ker Ad = {E, -E}')

    # Problem 11 (p. 44): with "into" the equivalence fails.  The
    # embedding j: R -> R^2 has trivial (discrete) kernel, but d j has rank
    # 1 < 2: condition 2) holds, 4) fails.  With "onto": R -> T, x -> e^(ix),
    # d f(1) = i != 0, an isomorphism of one-dimensional tangent algebras.
    dj = matrix(QQ, [[1], [0]])
    refuted(dj.rank() == 2, 'Problem 3.11 with "into": 2) => 4)')
    check(matrix(QQ, [[1]]).rank() == 1, 'Example 3.2.1: d f iso for R -> T')

    # Exercise 6 (p. 48): SU_2 -> SO_3.  A = [[al, -conj be],
    # [be, conj al]], Ad(A) on su_2 in the basis i sigma_1, i sigma_2,
    # i sigma_3; with N = |al|^2 + |be|^2: R^T R = N^2 E, det R = N^3
    # (A X A^* instead of A X A^-1, so R = N * rotation); kernel {E, -E}.
    Ki = QuadraticField(-1, 'i')
    ii = Ki.gen()
    Rq = PolynomialRing(QQ, 'a1,a2,b1,b2')
    Rk = PolynomialRing(Ki, 'a1,a2,b1,b2')
    a1, a2, b1, b2 = Rk.gens()
    al, alb, be, beb = a1 + ii * a2, a1 - ii * a2, b1 + ii * b2, b1 - ii * b2
    A = matrix(Rk, [[al, -beb], [be, alb]])
    Astar = matrix(Rk, [[alb, beb], [-be, al]])
    basis = [matrix(Rk, [[0, ii], [ii, 0]]), matrix(Rk, [[0, 1], [-1, 0]]),
             matrix(Rk, [[ii, 0], [0, -ii]])]

    def part(poly, k):
        return Rq({e: cf.list()[k] for e, cf in poly.dict().items()})

    def coords(M):  # M = x1 i s1 + x2 i s2 + x3 i s3
        return [part(M[0, 1], 1), part(M[0, 1], 0), part(M[0, 0], 1)]
    Rot = matrix(Rq, [coords(A * B * Astar) for B in basis]).transpose()
    Nn = sum(x ** 2 for x in Rq.gens())
    check(Rot.transpose() * Rot == Nn ** 2 * identity_matrix(Rq, 3)
          and Rot.det() == Nn ** 3, 'Exercise 3.6: Ad(SU_2) in SO_3')
    Iker = Rq.ideal((Rot - identity_matrix(Rq, 3)).list() + [Nn - 1])
    pts = {tuple(QQ(pt[x]) for x in Rq.gens())
           for pt in Iker.variety(QQbar)}
    check(pts == {(1, 0, 0, 0), (-1, 0, 0, 0)},
          'Exercise 3.6: kernel {E, -E}')

    # Fundamental groups: pi_1(K) = Gamma/I (Hall, Corollary 13.18),
    # Gamma = kernel lattice of exp on the maximal torus (coordinates as in
    # Hall), I = coroot lattice, coroot of alpha = 2 alpha/(alpha, alpha).
    def e(i, m):
        return vector(ZZ, [int(j == i) for j in range(m)])

    def roots_of(kind, m):
        rs = []
        if kind == 'A':
            return [e(i, m) - e(j, m) for i in range(m) for j in range(m)
                    if i != j]
        for i in range(m):
            for j in range(i + 1, m):
                for si, sj in product((1, -1), repeat=2):
                    rs.append(si * e(i, m) + sj * e(j, m))
            if kind == 'B':
                rs += [e(i, m), -e(i, m)]
            if kind == 'C':
                rs += [2 * e(i, m), -2 * e(i, m)]
        return rs

    def pi1(kind, m, gamma):
        L = ZZ ** m
        cor = [vector(ZZ, 2 * a / (a * a)) for a in roots_of(kind, m)]
        G = L.span(gamma)
        Iq = L.span(cor) if cor else L.span([L.zero()])
        assert Iq.is_submodule(G)
        return (G / Iq).invariants()

    def sage_roots(kind, m):
        return {tuple(r.to_vector()) for r in
                RootSystem([kind, m]).ambient_space().roots()}
    for kind, ranks in (('B', range(2, 5)), ('C', range(2, 9)),
                        ('D', range(3, 5)), ('A', range(1, 8))):
        for m in ranks:
            mine = {tuple(r) for r in roots_of(kind, m + 1 if kind == 'A'
                                                else m)}
            check(mine == sage_roots(kind, m),
                  f'root list {kind}{m} agrees with Sage')
    for n in range(3, 9):
        m = n // 2
        kind = 'B' if n % 2 else 'D'
        inv = pi1(kind, m, [e(i, m) for i in range(m)])
        check(inv == (2,), f'Exercise 3.9, Problem 3.18: pi_1(SO_{n}) = Z_2')
    check(pi1('D', 1, [e(0, 1)]) == (0,), 'boundary: pi_1(SO_2) = Z')
    for n in range(2, 9):
        gamma = [e(i, n) - e(n - 1, n) for i in range(n - 1)]
        check(pi1('A', n, gamma) == (), f'Exercise 3.8, Problem 3.17: '
                                        f'pi_1(SU_{n}) = 0')
        check(pi1('A', n, [e(i, n) for i in range(n)]) == (0,),
              f'boundary: pi_1(U_{n}) = Z')
    for m in range(1, 9):
        check(pi1('C', m, [e(i, m) for i in range(m)]) == (),
              f'Exercise 3.8, Problem 3.17: pi_1(Sp_{m}) = 0')
    # p. 48: pi_1(SO_3(C)) = Z_2 from SO_3(C) = SL_2(C)/{E, -E}:
    # the kernel found above has order 2 (Problem 15: N = pi_1).
    check(len(ker_ad) == 2 and pi1('B', 1, [e(0, 1)]) == (2,),
          'p. 48: pi_1(SO_3(C)) = Z_2 = Ker(SL_2(C) -> SO_3(C))')
    # Hints 17, 18: Corollary 1 of Theorem 4 needs pi_1 = pi_2 = 0 of the
    # base: C^n - 0 ~ S^(2n-1) (n >= 2), complex sphere ~ S^(n-1) (n > 3).
    check(all(2 * n - 1 >= 3 for n in range(2, 9))
          and all(n - 1 >= 3 for n in range(4, 9)),
          'Hints 3.17, 3.18: the spheres have pi_1 = pi_2 = 0')

    # Exercise 10 (p. 48): a nonabelian two-dimensional Lie algebra
    # [x, y] = alpha x + beta y != 0 has a basis with [X, Y] = Y.
    R = PolynomialRing(QQ, 'al,be').fraction_field()
    al, be = R.gens()
    # bracket on coordinate vectors: [u, v] = det(u, v) (al, be)
    def lb(u, v):
        return (u[0] * v[1] - u[1] * v[0]) * vector(R, [al, be])
    Xb, Yb = vector(R, [1 / be, 0]), vector(R, [al, be])  # case be != 0
    check(lb(Xb, Yb) == Yb, 'Exercise 3.10: [X, Y] = Y (beta != 0)')
    Xa, Ya = vector(R, [0, -1 / al]), vector(R, [al, 0])
    check(lb(Xa, Ya).subs({be: 0}) == Ya,
          'Exercise 3.10: [X, Y] = Y (beta = 0, alpha != 0)')


# ---------------------------------------------------------------------------
# § 4. The derived algebra and the radical (14-derived-algebra.typ).


def section_4():
    # Hint 1 (p. 57): x(s) = E + sA + s^2 C, y(s) = E + sB + s^2 D;
    # (x(s), y(s)) = E + s^2 [A, B] + O(s^3), its inverse E - s^2 [A, B] + ...
    for n in (2, 3):
        R = PolynomialRing(QQ, ['s'] + names('abcd', n))
        s = R('s')
        A, B, C, D = (generic(R, p, n) for p in 'abcd')
        E = identity_matrix(R, n)
        x, y = E + s * A + s ** 2 * C, E + s * B + s ** 2 * D

        def mul(*Ms):  # product modulo s^3
            out = E
            for M in Ms:
                out = trunc_mat(out * M, (0,), 3)
            return out

        def inv3(M):  # (E + M)^-1 mod s^3, M divisible by s
            return trunc_mat(E - M + M * M, (0,), 3)
        comm = mul(x, y, inv3(x - E), inv3(y - E))
        check(comm == E + s ** 2 * br(A, B),
              f'Hint 4.1: commutator = E + s^2 [xi, eta], n = {n}')
        check(inv3(comm - E) == E - s ** 2 * br(A, B),
              f'Hint 4.1: inverse commutator, n = {n}')

    # Hint 3 (p. 57) and Problem 3 (p. 51).
    for n in range(2, 9):
        ok = all(br(unit(n, i, i) - unit(n, j, j), unit(n, i, j))
                 == 2 * unit(n, i, j)
                 and br(unit(n, i, j), unit(n, j, i))
                 == unit(n, i, i) - unit(n, j, j)
                 for i in range(n) for j in range(n) if i != j)
        check(ok, f'Hint 4.3: matrix unit identities, n = {n}')
        L = MatrixLie(sl_basis(n))
        check(L.bracket_space(L.whole(), L.whole()).dimension() == n * n - 1,
              f'Hint 4.3: sl_{n}\' = sl_{n}')
    # Exercise 1 (p. 56): gl_n' = sl_n.
    for n in range(1, 9):
        L = MatrixLie(unit_basis(n))
        der = L.bracket_space(L.whole(), L.whole())
        check(der.dimension() == n * n - 1
              and all(L.element(v).trace() == 0 for v in der.basis()),
              f'Exercise 4.1: gl_{n}\' = sl_{n}')
    # Exercise 2: so_n' = so_n (n >= 3); so_2 is commutative; the group
    # statement O_2' = SO_2: the commutator of the reflection diag(1, -1) and
    # a rotation R is R^-2 (rational parametrization of the circle).
    for n in range(3, 9):
        L = MatrixLie(so_basis(n))
        check(L.bracket_space(L.whole(), L.whole()).dimension()
              == n * (n - 1) // 2, f'Exercise 4.2: so_{n}\' = so_{n}')
    R = PolynomialRing(QQ, 'u').fraction_field()
    u = R.gen()
    cs, sn = (1 - u ** 2) / (1 + u ** 2), 2 * u / (1 + u ** 2)
    Rot = matrix(R, [[cs, -sn], [sn, cs]])
    sig = matrix.diagonal(R, [1, -1])
    check(sig * Rot * sig.inverse() * Rot.inverse() == Rot.inverse() ** 2,
          'Exercise 4.2: (reflection, R) = R^-2 in O_2')
    # Exercise 3: u_n' = su_n (real Lie algebras; X = A + iB as pairs).
    for n in range(1, 7):
        # u_n = {A skew, B symmetric}, realized in gl_2n(R) via
        # A + iB -> [[A, -B], [B, A]].
        basis = []
        for M in so_basis(n):
            basis.append(block_matrix(QQ, [[M, zero_matrix(QQ, n)],
                                           [zero_matrix(QQ, n), M]]))
        for i in range(n):
            for j in range(i, n):
                S = unit(n, i, j) + unit(n, j, i) if i != j else unit(n, i, i)
                basis.append(block_matrix(QQ, [[zero_matrix(QQ, n), -S],
                                               [S, zero_matrix(QQ, n)]]))
        L = MatrixLie(basis)
        check(L.d == n * n and L.bracket_space(L.whole(), L.whole())
              .dimension() == n * n - 1, f'Exercise 4.3: u_{n}\' = su_{n}')

    # Examples 1, 2 (pp. 53-54): B_(n,k) and b_(n,k).
    for n in range(2, 6):
        for k in range(0, n):
            R = PolynomialRing(QQ, names('ab', n)).fraction_field()

            def elem(pfx, R=R, n=n, k=k):
                # B_(n,k): a_ij = delta_ij for j - i < k, free otherwise
                # (for k = 0 this is B_n: zero below the diagonal).
                return matrix(R, n, n, lambda i, j: R(f'{pfx}{i}{j}')
                              if j - i >= k else R(int(i == j)))
            A, B = elem('a'), elem('b')
            AB = A * B
            diag = [(i, i + k) for i in range(n - k)]
            if k >= 1:
                check(all(AB[i, j] == A[i, j] + B[i, j] for i, j in diag),
                      f'Example 4.1: map (1) additive on B_({n},{k})')
            else:
                check(all(AB[i, i] == A[i, i] * B[i, i] for i in range(n)),
                      f'Example 4.1: k = 0, the diagonal is multiplicative')
                refuted(all(AB[i, i] == A[i, i] + B[i, i] for i in range(n)),
                        f'Example 4.1 printed: B_({n},0) onto the vector '
                        f'group K^{n}')
            if n <= 4 or k >= 1:
                C = A * B * A.inverse() * B.inverse()
                check(all(C[i, j] == int(i == j) for i in range(n)
                          for j in range(n) if j - i < k + 1),
                      f'Example 4.1: B_({n},{k})\' in B_({n},{k + 1})')
            Rl = PolynomialRing(QQ, names('xy', n))
            Xl = matrix(Rl, n, n, lambda i, j: Rl(f'x{i}{j}') if j - i >= k
                        else 0)
            Yl = matrix(Rl, n, n, lambda i, j: Rl(f'y{i}{j}') if j - i >= k
                        else 0)
            Cl = br(Xl, Yl)
            check(all(Cl[i, j] == 0 for i in range(n) for j in range(n)
                      if j - i < k + 1),
                  f'Example 4.2: [b_({n},{k}), b_({n},{k})] '
                  f'in b_({n},{k + 1})')
    for n in range(1, 9):
        L = MatrixLie(b_basis(n))
        series = L.derived_series(L.whole())
        check(len(series) - 1 <= n and series[-1].dimension() == 0,
              f'Example 4.2: b_{n}^(({n})) = 0')

    # Semisimplicity via the Killing form (Humphreys, Introduction to Lie
    # Algebras and Representation Theory, § 5.1, p. 22: L is semisimple iff
    # its Killing form is nondegenerate).  Exercise 10 (p. 56) and
    # p. 56: SL_n(K), SO_n(K) (n >= 3), Sp_n(K) are semisimple.
    for n in range(2, 9):
        check(MatrixLie(sl_basis(n)).killing().det() != 0,
              f'Exercise 4.10: sl_{n} semisimple')
    for n in range(3, 9):
        check(MatrixLie(so_basis(n)).killing().det() != 0,
              f'p. 56: so_{n} semisimple')
    check(MatrixLie(so_basis(2)).killing().det() == 0,
          'p. 56: so_2 is not (hence "n >= 3")')
    for n in range(2, 9, 2):
        check(MatrixLie(sp_basis(n)).killing().det() != 0,
              f'p. 56: sp_{n} semisimple')

    # Problem 13 (p. 56) as printed: "semisimple iff no commutative
    # ideals".  The zero ideal of sl_2 is commutative, and sl_2 is
    # semisimple, so the literal statement fails; corrected "no nonzero".
    sl2 = MatrixLie(sl_basis(2))
    zero = sl2.span([])
    semisimple = sl2.killing().det() != 0
    zero_is_commutative_ideal = (sl2.is_ideal(zero) and sl2.bracket_space(
        zero, zero).dimension() == 0)
    check(semisimple and zero_is_commutative_ideal,
          'Problem 4.13: sl_2 semisimple, 0 is a commutative ideal')
    refuted(semisimple == (not zero_is_commutative_ideal),
            'Problem 4.13 as printed ("no commutative ideals") for sl_2')

    # Hint 13 (p. 58) and Exercise 8: for non-semisimple g the last
    # nonzero derived algebra of rad g is a nonzero commutative ideal.  rad g
    # is certified: R is a solvable ideal and g/R is semisimple (Killing form
    # of the quotient nondegenerate, or g/R = 0), so R = rad g.
    def scalars(n):
        return [identity_matrix(QQ, n)]

    cases = []
    for n in range(1, 6):
        cases.append((f'gl_{n}', unit_basis(n), scalars(n)))
    for n in range(2, 6):
        cases.append((f'b_{n}', b_basis(n), b_basis(n)))
    cases.append(('n_3', heis_basis(), heis_basis()))
    cases.append(('ax+b', aff_basis(), aff_basis()))
    ga = ga_basis(2)
    cases.append(('ga_2', ga, [unit(3, 0, 2), unit(3, 1, 2),
                               unit(3, 0, 0) + unit(3, 1, 1)]))
    for label, basis, rad in cases:
        L = MatrixLie(basis)
        Rsp = L.span([L.coords(M) for M in rad])
        solv = L.is_solvable(Rsp)
        ideal = L.is_ideal(Rsp)
        q = L.d - Rsp.dimension()
        semis = (q == 0) or L.quotient_killing(Rsp).det() != 0
        check(solv and ideal and semis, f'Hint 4.13: rad {label} certified')
        last = [S for S in L.derived_series(Rsp) if S.dimension() > 0][-1]
        check(L.is_ideal(last) and L.bracket_space(last, last).dimension()
              == 0, f'Hint 4.13: nonzero commutative ideal in {label}')

    # Exercise 12 (p. 57): rad gl(V; U) = {A: scalar on U and on V/U}
    # (Lie algebras), dim V = n <= 5, dim U = p.
    for n in range(2, 6):
        for p in range(1, n):
            basis = [unit(n, i, j) for i in range(n) for j in range(n)
                     if not (i >= p and j < p)]
            L = MatrixLie(basis)
            rad = ([sum((unit(n, i, i) for i in range(p)), zero_matrix(QQ, n)),
                    sum((unit(n, i, i) for i in range(p, n)),
                        zero_matrix(QQ, n))]
                   + [unit(n, i, j) for i in range(p) for j in range(p, n)])
            Rsp = L.span([L.coords(M) for M in rad])
            q = L.d - Rsp.dimension()
            ok = (L.is_ideal(Rsp) and L.is_solvable(Rsp)
                  and (q == 0 or L.quotient_killing(Rsp).det() != 0))
            check(ok and Rsp.dimension() == 2 + p * (n - p),
                  f'Exercise 4.12: rad gl(V; U), n = {n}, p = {p}')

    # Exercise 4 (p. 56): commutators of unitriangular 3 x 3 matrices
    # are E + (a12 b23 - a23 b12) E_13, central.
    R = PolynomialRing(QQ, 'a12,a13,a23,b12,b13,b23')
    a12, a13, a23, b12, b13, b23 = R.gens()
    A = matrix(R, [[1, a12, a13], [0, 1, a23], [0, 0, 1]])
    B = matrix(R, [[1, b12, b13], [0, 1, b23], [0, 0, 1]])
    C = A * B * A.inverse() * B.inverse()
    Z = matrix(R, [[0, 0, 1], [0, 0, 0], [0, 0, 0]])
    check(C == identity_matrix(R, 3) + (a12 * b23 - a23 * b12) * Z,
          'Exercise 4.4: (A, B) = E + (a12 b23 - a23 b12) E_13')
    N = identity_matrix(R, 3) + Z
    check(N * A == A * N, 'Exercise 4.4: E + E_13 is central')

    # Exercise 15 (p. 57) as printed: G = {x -> ax + b, a > 0},
    # H = {x -> ax}: H is connected, commutative (so solvable), of
    # codimension 1, but not normal, so G = H x| P (H normal, § 1, 11°) is
    # impossible.  Tangent algebras: h = <X> is not an ideal ([X, Y] = Y).
    g = matrix(QQ, [[1, 1], [0, 1]])
    h = matrix(QQ, [[2, 0], [0, 1]])
    conj = g * h * g.inverse()
    check(conj == matrix(QQ, [[2, -1], [0, 1]]),
          'Exercise 4.15: g h g^-1 = [[2, -1], [0, 1]]')
    refuted(conj[0, 1] == 0,
            'Exercise 4.15 as printed: H = {x -> ax} normal in ax + b')
    L = MatrixLie(aff_basis())
    hx = L.span([vector(QQ, [1, 0])])
    refuted(L.is_ideal(hx), 'Exercise 4.15: h = <X> an ideal')
    # corrected (H normal): H = {x -> x + b}, P = {x -> ax}; every element
    # is uniquely h p, H normal, H and P meet in E.
    Rg = PolynomialRing(QQ, 'a,b,c').fraction_field()
    a, b, c = Rg.gens()
    gg = matrix(Rg, [[a, b], [0, 1]])
    hh = matrix(Rg, [[1, b], [0, 1]])
    pp = matrix(Rg, [[a, 0], [0, 1]])
    tc = matrix(Rg, [[1, c], [0, 1]])
    check(gg == hh * pp
          and gg * tc * gg.inverse() == matrix(Rg, [[1, a * c], [0, 1]]),
          'Exercise 4.15 corrected: G = H x| P, H = {x -> x + b} normal')
    hy = L.span([vector(QQ, [0, 1])])
    check(L.is_ideal(hy), 'Exercise 4.15 corrected: h = <Y> is an ideal')


def main():
    section_1()
    section_2()
    section_3()
    section_4()
    print(f'ok chapter-1: {COUNT[0]} checks')


if __name__ == '__main__':
    main()
