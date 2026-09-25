"""Exact checks of Chapter 5 (Real Semisimple Lie Groups), §§ 1-4.

Expected values are the book's, written below as literals taken from the
printed book: § 1 on printed pp. 221-237, § 2 on pp. 238-254, § 3 on
pp. 254-268, § 4 on pp. 268-281; for comparison Table 7 (pp. 307-309),
Table 9 (pp. 312-317: classical rows, and dim k of
the exceptional rows) and Table 10 (pp. 318-321: the columns
Z(G) and Lambda(G) as abstract groups, and Z(G)/Lambda(G) as implied by the
printed generators).  Where the book is wrong the printed reading stays as a
`refuted` check beside the corrected one.  Our Typst source is not an input.
Every computation is exact (QQ, ZZ, QQ(i), the algebraic reals AA).

Models.  The real forms of § 1, 2° are built from their real structures
(tangent maps of the printed S(A)): sl_n(R): X -> conj X; sl_m(H):
X -> -S_m conj(X) S_m; su_{p,q}: X -> -I conj(X)^T I; so_{p,q}:
X -> I conj(X) I (Example 2, the form L so_{p,q} L^-1); u*_m(H):
X -> -S_m conj(X) S_m; sp_n(R): X -> conj X; sp_{p,q}: X -> -K conj(X)^T K
(Example 5); the compact structure is tau(X) = -X^*.  g(C) is sl_n(C)
(trace 0), so_n(C) (X^T = -X), sp_n(C) (X^T S + S X = 0, S = S_m).
Ranges: RANK_B = 6 for Theorems 1.5, 1.6 and the lattices of § 3 (sl_n,
n = 2..7; so_n, n = 3, 5..13; sp_2m, m = 1..6), RANK_C = 4 for the real
forms (sl_n, n <= 5; so_n, n <= 9; sp_2m, m <= 4).

Checked, in the order of main():
  check_theorems_5_6 (Theorems 1.5, 1.6, p. 233; Table 7): every sigma is an
     involutive antilinear automorphism of g(C) commuting with tau (Example
     of 4°); theta = sigma tau is the printed theta, item by item (Hint 41);
     g^theta, an explicit Cartan subalgebra t of g^theta (commuting
     Hermitian matrices, equal to their centralizer in g^theta), the roots
     and the type of g^theta, its centre; inner <=> dim t = rk g(C)
     (Problems 4.4.17, 1.38); the Kac type (I: inner, g^theta semisimple;
     II: inner, centre of dimension 1; III: outer) against the type column
     and against Table 7.  Printed 2) a) "I and II" refuted (odd p, even
     n); the candidate "I and III for p != 0, 2" refuted at n = 3,
     p = 1 (type II); corrected "I and III for p != 0, 2, n - 2; II for
     p = 2, n - 2" confirmed; printed 2) b) III refuted, II confirmed;
     printed 1) a), b) at n = 2 refuted (-X^T = Ad S_1 is inner, 1 b) is
     the identity).  The number of items against the number of classes of
     involutions from Kac diagrams (orbits of labels s, k sum a_j s_j = 2,
     under the automorphisms of Sage's affine diagram) and distinctness by
     the type of g^theta (Problem 39): complete and without repetitions for
     all listed n except sl_2 and so_8, where the printed claims are
     refuted and the repetitions identified (1a ~ 1c(p = 1), 1b = 1c(p = 0);
     Ad I_(2,6) ~ Ad S_4).
  check_lattices (§ 3, Problems 25-30, Theorems 6, 7, 9, pp. 262-265): for
     every noncompact model, t Hermitian, E(x) = exp 2 pi i x; L_0 =
     Q^v(k(C)') from the coroots of g^theta; L_1 = P^v cap t (dual of the
     weights of t on g(C)); Q^v cap t from the coroots of g(C) (for outer
     theta via h = z(t), a Cartan subalgebra, 4.4.11); L(G) = {x in t:
     integer eigenvalues} for the matrix group G.  Asserted L_0 < Q^v cap t
     < L(G) < L_1 (Theorem 6; Lambda(G) = 1 for the linear G); Z(G~) =
     L_1/L_0, Lambda(G~) = (Q^v cap t)/L_0, Z/Lambda = L_1/(Q^v cap t)
     against Table 10; pi_1(G) = L(G)/L_0 against Exercise 2.8 (SU_{k,l},
     SL_n(R), Sp_2n(R), U*_m(H), the O^0_{k,l} table); SL~_2(R): Z = Z,
     Lambda = 2 Z(G) (Remark 4 of 2°, Example of 6°).  Table 10 fails for
     the Lorentz algebras only (printed row so_{2p,2(l-p)-1}, 2 <= p <= l,
     at p = l: computed Z2 and Lambda = 1; so_{1,2l-1}, l >= 4: no row,
     computed Z2, Lambda = 1): printed, not this chapter (see
     tables-9-10.py); listed in TABLE10_FAILS.
  check_exceptional_lattices (Table 10, p. 321): inner forms from root data
     (theta = exp(pi i ad x), roots of k(C): even coefficient at the black
     vertex; the form recognised by dim k of Table 9); EIV and EI from
     t_tau of E6 (restricted roots = F4, checked; k(C) = F4, resp. all C4
     subsystems of F4 containing the short roots).
  check_real_forms (Problems 1.13, 1.37, 3.2-3.4; § 4; Table 9): Killing
     form from ad; -B > 0 on k, B > 0 on p, B(k, p) = 0; dim k = dim_C
     g^theta; a maximal abelian a in p (greedy, maximality tested);
     restricted roots with multiplicities against Table 9; Theorem 4.2 (a
     root system, possibly non-reduced); Problem 4.8; Theorem 4.5 (k + a +
     n direct, n nilpotent, [d, d] in n); split <=> rk_R = rk g(C) <=> in
     the list of 4° (classical part, up to su_{1,1} = sl_2(R)).
  check_exercise_1_15: each of the printed isomorphisms preserves (dim,
     dim k, rk_R, Sigma with multiplicities) -- necessary conditions only;
     the printed so_15 = sl_2(H) refuted by dimension.
  check_section_1_examples: Example 2 (the printed L O_{k,l} L equals
     L O_{k,l} L^-1 as a set, since L^2 = I in O_{k,l}; checked on Cayley
     elements), Examples 3, 4, 5 (the printed matrix forms; Example 5
     symbolically; M^T K S M = S; G^S = M Sp_{k,l} M^-1 at the Lie algebra
     level and on Cayley elements, A K S A^T = K S); the quaternionic
     picture (q j -> (-conj w, conj z); conj(q) j q' has j-part z z' + w w');
     Example 4 of 1°: S(AB) = S(A) S(B) (printed "anti-automorphism"
     refuted); Problems 19, 25 for sl_n; Exercise 1.2 (printed pairwise
     order not involutive for q >= 2, block order involutive).
  check_section_3_misc: (3.11) on X = E, Y = (2, 1; 1, 2): printed
     sum x_i/y_ii refuted, corrected sum x_i (Y^-1)_ii (symbolic identity,
     n = 3); the bound of Lemma 1 on examples; Problem 15; Hint 17 printed
     refuted, corrected confirmed (polynomials in e^t); Example of 1°:
     b_theta = 2 Re h_tau on sl_2(C)^R, sl_3(C)^R (printed "= h_tau"
     refuted); Hint 18: X -> -X^T has det -1 on sl_3 (Ad G in SL(g) fails
     for G = Aut g), tr ad y = 0 on p.
  check_section_2_misc: Hint 20 with (3.1.3) and the convention of 3.1,
     Hint 19 (printed a_ki(g^-1) refuted, a_k1(g) confirmed, symbolic);
     Lemma 2, Problems 13, 14 on two explicit extensions (printed (6) with
     h(y) refuted); Theorem 2.1 polar decompositions in SL_2(R), Sp_4(R),
     SO_{1,2} (over AA; k and p lie in G); § 4, Example: SL_3(R) = SO_3 A N
     by Cholesky (over AA).
  check_exercises_9_10: Exercises 1.9, 1.10 (component counts) from the
     scalar ambiguity of Ad; only the determinant and anti-isometry steps
     are computed.

Not established: the families only for the listed ranks; the theorems of
Kac and Cartan are used, not proved (the classes of involutions are counted
from Kac diagrams; Problem 4.4.30 is used in the form P^v cap t for L_1);
the isomorphisms of Exercise 1.15 only through invariants; the Table 10
generator and b_0 columns and the Satake diagrams of Table 9 are not
checked; nothing here compares our text with the printed book.

Run with:  sage -python checks/sage/chapter-5.py   (about 8 minutes)
"""
import hashlib
import time
from itertools import combinations, product

from sage.all import (AA, QQ, ZZ, CartanType, DiGraph, PolynomialRing,
                      QuadraticField, QuaternionAlgebra, RootSystem,
                      block_diagonal_matrix, block_matrix, diagonal_matrix,
                      gcd, identity_matrix, matrix, vector, zero_matrix)
from sage.version import version as SAGE_VERSION

N_CHECKS = 0
REFUTED = 0


def check(condition, what):
    """A check that must hold."""
    global N_CHECKS
    assert condition, what
    N_CHECKS += 1


def refuted(condition, what):
    """A printed reading that must fail."""
    global N_CHECKS, REFUTED
    assert not condition, "printed reading unexpectedly holds: " + what
    N_CHECKS += 1
    REFUTED += 1


# Ranges.  Rank of g(C) <= RANK_B for Theorems 5, 6 and the lattices;
# RANK_C for the real forms (Killing form, restricted roots).
RANK_B = 6
RANK_C = 4

K = QuadraticField(-1, 'I')
I = K.gen()


# ------------------------------------------------------------ matrices
def conj(M):
    return M.apply_map(lambda z: z.galois_conjugate())


def star(M):
    return conj(M).transpose()


def br(x, y):
    return x * y - y * x


def E_(N, i, j):
    M = zero_matrix(K, N)
    M[i, j] = 1
    return M


def S_(m):
    E = identity_matrix(K, m)
    Z = zero_matrix(K, m)
    return block_matrix(K, [[Z, -E], [E, Z]], subdivide=False)


def I_(p, q):
    return diagonal_matrix(K, [1] * p + [-1] * q)


def L_(p, q):
    return diagonal_matrix(K, [1] * p + [I] * q)


def Kmat(p, q):
    return block_diagonal_matrix(I_(p, q), I_(p, q), subdivide=False)


def Mmat(p, q):
    return block_diagonal_matrix(L_(p, q), L_(p, q), subdivide=False)


def realvec(M):
    return [c for z in M.list() for c in list(z)]


def is_rational(z):
    return list(K(z))[1] == 0


def QQof(z):
    z = K(z)
    assert is_rational(z), z
    return QQ(list(z)[0])


# ------------------------------------------------------------ spaces
class CSpace:
    """A complex subspace of M_N(C) (entries in QQ(i)), echelon basis."""

    def __init__(self, mats, N):
        self.N = N
        mats = list(mats)
        if not mats:
            self.dim, self.basis, self.piv, self.E = 0, [], (), None
            return
        E = matrix(K, [m.list() for m in mats]).echelon_form()
        r = E.rank()
        self.E = E.matrix_from_rows(range(r))
        self.piv = self.E.pivots()
        self.dim = r
        self.basis = [matrix(K, N, N, list(row)) for row in self.E.rows()]

    def coords(self, M, verify=True):
        v = M.list()
        c = vector(K, [v[p] for p in self.piv])
        if verify:
            assert c * self.E == vector(K, v), "not in the subspace"
        return c

    def contains(self, M):
        if self.dim == 0:
            return M == 0
        v = M.list()
        c = vector(K, [v[p] for p in self.piv])
        return c * self.E == vector(K, v)

    def op(self, f):
        """Matrix (columns) of a linear map of the space into itself."""
        return matrix(K, [self.coords(f(b)) for b in self.basis]).transpose()

    def combo(self, c):
        return sum((x * b for x, b in zip(c, self.basis)),
                   zero_matrix(K, self.N))

    def sub(self, vecs):
        return CSpace([self.combo(c) for c in vecs], self.N)


class RSpace:
    """A real subspace of M_N(C) (real coordinates in QQ^(2N^2))."""

    def __init__(self, mats, N):
        self.N = N
        mats = list(mats)
        if not mats:
            self.dim, self.basis, self.piv, self.E = 0, [], (), None
            return
        E = matrix(QQ, [realvec(m) for m in mats]).echelon_form()
        r = E.rank()
        self.E = E.matrix_from_rows(range(r))
        self.piv = self.E.pivots()
        self.dim = r
        self.basis = [self.tomat(row) for row in self.E.rows()]

    def tomat(self, row):
        row = list(row)
        return matrix(K, self.N, self.N,
                      [row[2 * k] + row[2 * k + 1] * I
                       for k in range(self.N * self.N)])

    def coords(self, M, verify=True):
        v = realvec(M)
        c = vector(QQ, [v[p] for p in self.piv])
        if verify:
            assert c * self.E == vector(QQ, v), "not in the real subspace"
        return c

    def contains(self, M):
        if self.dim == 0:
            return M == 0
        v = realvec(M)
        c = vector(QQ, [v[p] for p in self.piv])
        return c * self.E == vector(QQ, v)

    def combo(self, c):
        return sum((x * b for x, b in zip(c, self.basis)),
                   zero_matrix(K, self.N))

    def op(self, f):
        return matrix(QQ, [self.coords(f(b)) for b in self.basis]).transpose()


# ------------------------------------------------------------ g(C)
def g_basis(fam, N):
    if fam == 'sl':
        out = [E_(N, i, j) for i in range(N) for j in range(N) if i != j]
        out += [E_(N, i, i) - E_(N, i + 1, i + 1) for i in range(N - 1)]
        return out
    if fam == 'so':
        return [E_(N, i, j) - E_(N, j, i)
                for i in range(N) for j in range(i + 1, N)]
    m = N // 2
    Sinv = S_(m).inverse()
    return [Sinv * (E_(N, i, j) + E_(N, j, i))
            for i in range(N) for j in range(i, N)]


def in_g(fam, X):
    N = X.nrows()
    if fam == 'sl':
        return X.trace() == 0
    if fam == 'so':
        return X.transpose() == -X
    S = S_(N // 2)
    return X.transpose() * S + S * X == 0


def rank_g(fam, N):
    return N - 1 if fam == 'sl' else N // 2


_GC = {}


def gC(fam, N):
    if (fam, N) not in _GC:
        _GC[(fam, N)] = CSpace(g_basis(fam, N), N)
    return _GC[(fam, N)]


# ------------------------------------------------------------ root data
DIM_EXC = {"E6": 78, "E7": 133, "E8": 248, "F4": 52, "G2": 14}


def dim_type(name):
    X, r = name[0], int(name[1:])
    if name in DIM_EXC:
        return DIM_EXC[name]
    return {"A": r * (r + 2), "B": r * (2 * r + 1), "C": r * (2 * r + 1),
            "D": r * (2 * r - 1)}[X]


def digraph(A):
    n = A.nrows()
    G = DiGraph(n)
    for i in range(n):
        for j in range(n):
            if i != j and A[i, j] != 0:
                G.add_edge(i, j, int(A[i, j]))
    return G


def same_cartan(A, B):
    if A.nrows() != B.nrows():
        return False
    return digraph(A).is_isomorphic(digraph(B), edge_labels=True)


def identify_irreducible(A):
    r = A.nrows()
    cands = ["A%d" % r]
    if r >= 2:
        cands += ["B%d" % r]
    if r >= 3:
        cands += ["C%d" % r]
    if r >= 4:
        cands += ["D%d" % r]
    cands += [x for x in DIM_EXC if int(x[1]) == r]
    found = [c for c in cands if same_cartan(
        A, matrix(ZZ, CartanType([c[0], int(c[1:])]).cartan_matrix()))]
    assert len(found) == 1, (A, found)
    return found[0]


def canonical(name):
    """B1 = C1 = A1, C2 = B2, D3 = A3 (as root systems up to iso)."""
    X, r = name[0], int(name[1:])
    if X in "BC" and r == 1:
        return "A1"
    if name == "C2":
        return "B2"
    if name == "D3":
        return "A3"
    return name


def identify(A):
    """Sorted component names of a Cartan matrix (Sage convention)."""
    n = A.nrows()
    if n == 0:
        return ()
    comps = digraph(A).to_undirected().connected_components()
    out = []
    for comp in comps:
        comp = sorted(comp)
        out.append(identify_irreducible(
            A.matrix_from_rows_and_columns(comp, comp)))
    return tuple(sorted(canonical(x) for x in out))


def generic_positive(vectors, dim):
    """A rational functional positive/negative on each nonzero vector."""
    for trial in range(50):
        w = vector(QQ, [(7 ** k + 3 * trial) % 97 + k + 1
                        for k in range(dim)])
        if all(v * w != 0 for v in vectors):
            return w
    raise AssertionError("no generic functional")


# ------------------------------------------------------------ weights
def joint_eigen(ops, space_dim, field):
    """Joint eigen-decomposition of commuting diagonalizable operators.
    Returns [(weight tuple, basis of the joint eigenspace)]."""
    r = len(ops)
    for trial in range(30):
        c = [((trial + 2) ** k * 13 + 5 * k + 1) for k in range(r)]
        A = sum((ci * op for ci, op in zip(c, ops)),
                zero_matrix(field, space_dim))
        roots = A.charpoly().roots(field)
        assert sum(m for _, m in roots) == space_dim, "does not split"
        out, ok = [], True
        for mu, mult in roots:
            V = (A - mu).right_kernel().basis()
            assert len(V) == mult, "not diagonalizable"
            w = []
            for op in ops:
                v0 = V[0]
                img = op * v0
                idx = next(i for i in range(space_dim) if v0[i] != 0)
                lam = img[idx] / v0[idx]
                if any(op * v != lam * v for v in V):
                    ok = False
                    break
                w.append(lam)
            if not ok:
                break
            out.append((tuple(w), V))
        if ok:
            return out
    raise AssertionError("joint eigenspaces not separated")


def zbasis(rows, dim):
    """A Z-basis (rows) of the Z-span of rational vectors."""
    rows = [vector(QQ, r) for r in rows]
    if not rows:
        return matrix(QQ, 0, dim)
    D = 1
    for r in rows:
        for x in r:
            D = D * x.denominator() // gcd(D, x.denominator())
    M = matrix(ZZ, [[x * D for x in r] for r in rows]).echelon_form()
    M = M.matrix_from_rows([i for i in range(M.nrows()) if M.row(i) != 0])
    return M.change_ring(QQ) / D


def dual_lattice(W, dim):
    """{x in Q^dim: w.x in Z for all rows w of W} (W of full rank)."""
    B = zbasis(W.rows(), dim)
    assert B.nrows() == dim and B.rank() == dim
    return B.inverse().transpose()


def quotient(big, small, dim):
    """Invariants of the abelian group Z-span(big) / Z-span(small), as a
    sorted tuple of orders, 0 = infinite cyclic, trivial factors dropped."""
    B = zbasis(big.rows() if hasattr(big, 'rows') else big, dim)
    r = B.nrows()
    gens = small.rows() if hasattr(small, 'rows') else small
    if not gens:
        return tuple([0] * r)
    G = matrix(QQ, gens)
    C = B.solve_left(G)
    assert G == C * B, "small not inside the span of big"
    assert all(x in ZZ for x in C.list()), "small not inside big"
    D = C.change_ring(ZZ).smith_form()[0]
    k = min(D.nrows(), r)
    ds = [abs(D[i, i]) for i in range(k)] + [0] * (r - k)
    return tuple(sorted([d for d in ds if d != 1], key=lambda d: (d == 0, d)))


def group_str(inv):
    if not inv:
        return "1"
    return " x ".join("Z" if d == 0 else "Z%d" % d for d in inv)


class TBasis:
    """Coordinates with respect to a list of linearly independent
    matrices (in QQ(i)); used for Hermitian bases of toral subalgebras."""

    def __init__(self, mats):
        self.mats = list(mats)
        self.N = self.mats[0].nrows()
        self.T = matrix(K, [m.list() for m in self.mats])
        assert self.T.rank() == len(self.mats)
        self.cols = self.T.pivots()
        self.inv = self.T.matrix_from_columns(self.cols).inverse()

    def coords(self, M):
        v = M.list()
        c = vector(K, [v[j] for j in self.cols]) * self.inv
        assert c * self.T == vector(K, v), "not in the toral subalgebra"
        return vector(QQ, [QQof(x) for x in c])

    def combo(self, c):
        return sum((x * m for x, m in zip(c, self.mats)),
                   zero_matrix(K, self.N))


def rot(N, a, b):
    """The Hermitian matrix i(E_ab - E_ba)."""
    return I * (E_(N, a, b) - E_(N, b, a))


def hermitian_toral(t):
    return (all(x == star(x) for x in t)
            and all(br(x, y) == 0 for x in t for y in t))


# ------------------------------------------------ Theorems 5, 6 (p. 233)
def tau(X):
    """Compact real structure (Example of 3°): -X^*."""
    return -star(X)


def items(fam, N):
    """The items of Theorems 5 and 6 for g(C) = fam_N (N = matrix size):
    item label, p, real form (Theorem 6), its sigma, the printed theta of
    Theorem 5, and a Hermitian basis of a Cartan subalgebra of g^theta."""
    out = []
    n = N
    if fam == 'sl':
        out.append(dict(item='1a', p=None, rf=('slR', n),
                        sigma=lambda X: conj(X),
                        theta=lambda X: -X.transpose(),
                        t=[rot(N, 2 * j, 2 * j + 1) for j in range(n // 2)]))
        if n % 2 == 0:
            m = n // 2
            S, Si = S_(m), S_(m).inverse()
            out.append(dict(item='1b', p=None, rf=('slH', m),
                            sigma=lambda X, S=S: -S * conj(X) * S,
                            theta=lambda X, S=S, Si=Si:
                            -S * X.transpose() * Si,
                            t=[E_(N, j, j) - E_(N, m + j, m + j)
                               for j in range(m)]))
        for p in range(n // 2 + 1):
            Ip = I_(p, n - p)
            out.append(dict(item='1c', p=p, rf=('su', p, n - p),
                            sigma=lambda X, Ip=Ip: -Ip * star(X) * Ip,
                            theta=lambda X, Ip=Ip: Ip * X * Ip,  # Ip^-1 = Ip
                            t=[E_(N, j, j) - E_(N, j + 1, j + 1)
                               for j in range(n - 1)]))
    elif fam == 'so':
        for p in range(n // 2 + 1):
            Ip = I_(p, n - p)
            pairs = [(a, a + 1) for a in range(0, p - 1, 2)]
            pairs += [(a, a + 1) for a in range(p, n - 1, 2)
                      if (a - p) % 2 == 0]
            out.append(dict(item='2a', p=p, rf=('so', p, n - p),
                            sigma=lambda X, Ip=Ip: Ip * conj(X) * Ip,
                            theta=lambda X, Ip=Ip: Ip * X * Ip,  # Ip^-1 = Ip
                            t=[rot(N, a, b) for a, b in pairs]))
        if n % 2 == 0:
            m = n // 2
            S, Si = S_(m), S_(m).inverse()
            out.append(dict(item='2b', p=None, rf=('u*H', m),
                            sigma=lambda X, S=S: -S * conj(X) * S,
                            theta=lambda X, S=S, Si=Si: S * X * Si,
                            t=[rot(N, m + j, j) for j in range(m)]))
    else:
        m = n // 2
        S, Si = S_(m), S_(m).inverse()
        out.append(dict(item='3a', p=None, rf=('spR', m),
                        sigma=lambda X: conj(X),
                        theta=lambda X, S=S, Si=Si: S * X * Si,
                        t=[rot(N, m + j, j) for j in range(m)]))
        for p in range(m // 2 + 1):
            Kp = Kmat(p, m - p)
            out.append(dict(item='3b', p=p, rf=('sp', p, m - p),
                            sigma=lambda X, Kp=Kp: -Kp * star(X) * Kp,
                            theta=lambda X, Kp=Kp: Kp * X * Kp,  # Kp^-1 = Kp
                            t=[E_(N, j, j) - E_(N, m + j, m + j)
                               for j in range(m)]))
    for it in out:
        it['fam'], it['N'] = fam, N
    return out


def is_identity(it):
    return it['p'] == 0 or (it['item'] == '1b' and it['N'] == 2)


class FixedAlgebra:
    """g^theta with an explicit Cartan subalgebra t (Hermitian basis)."""

    def __init__(self, it):
        fam, N = it['fam'], it['N']
        g = gC(fam, N)
        self.g = g
        Th = g.op(it['theta'])
        self.Th = Th
        ker = (Th - 1).right_kernel().basis()
        self.fix = g.sub(ker)
        self.t = TBasis(it['t'])
        self.dim = self.fix.dim
        # roots of g^theta with respect to t
        ops = [self.fix.op(lambda X, x=x: br(x, X)) for x in it['t']]
        self.eig = joint_eigen(ops, self.fix.dim, K)
        self.roots = {}
        zero = None
        for w, V in self.eig:
            wq = tuple(QQof(x) for x in w)
            if all(x == 0 for x in wq):
                zero = V
            else:
                assert len(V) == 1, "root space of g^theta not 1-dim"
                self.roots[wq] = self.fix.combo(V[0])
        self.zero_dim = len(zero) if zero else 0
        self.coroots = {}
        for a, e in self.roots.items():
            f = self.roots[tuple(-x for x in a)]
            H = self.t.coords(br(e, f))
            val = vector(QQ, a) * H
            assert val != 0
            self.coroots[a] = 2 * H / val

    def cartan_type(self):
        roots = [vector(QQ, a) for a in self.roots]
        if not roots:
            return ()
        w = generic_positive(roots, len(self.t.mats))
        pos = [a for a in self.roots if vector(QQ, a) * w > 0]
        pset = set(pos)
        simple = [a for a in pos
                  if not any(tuple(x - y for x, y in zip(a, b)) in pset
                             for b in pos)]
        A = matrix(ZZ, len(simple), len(simple),
                   lambda i, j: vector(QQ, simple[j])
                   * self.coroots[simple[i]])
        return identify(A)

    def centre_dim(self):
        """Centre of g^theta = {x in t: alpha(x) = 0 for all roots}; valid
        since g^theta = t + root spaces (verified) and t = z(t)."""
        r = len(self.t.mats)
        if not self.roots:
            return r
        return r - matrix(QQ, [list(a) for a in self.roots]).rank()


def t_is_cartan(it, F):
    """t consists of commuting Hermitian elements of g^theta and equals its
    centralizer in g^theta (a maximal toral subalgebra)."""
    t = it['t']
    ok = hermitian_toral(t) and all(F.fix.contains(x) for x in t)
    ok = ok and F.zero_dim == len(t)
    return ok


def kac_type(it, F):
    inner = len(it['t']) == rank_g(it['fam'], it['N'])
    c = F.centre_dim()
    if not inner:
        assert c == 0
        return 'III'
    return {0: 'I', 1: 'II'}[c]


def printed_type(it, reading):
    """The type column of Theorem 5 (p. 233) in three readings: 'printed',
    'text' (a candidate correction: II/III of 2a and 2b exchanged back),
    'corrected' (also n - p = 2).
    Returns the set of allowed types, or None for theta = id."""
    item, p, n = it['item'], it['p'], it['N']
    if item == '1a':
        return {'III'}
    if item == '1b':
        return {'III'}
    if item == '1c':
        return None if p == 0 else {'II'}
    if item == '2a':
        if p == 0:
            return None
        if reading == 'printed':
            return {'II'} if p == 2 else {'I', 'II'}
        if reading == 'text':
            return {'II'} if p == 2 else {'I', 'III'}
        return {'II'} if p in (2, n - 2) else {'I', 'III'}
    if item == '2b':
        return {'III'} if reading == 'printed' else {'II'}
    if item == '3a':
        return {'II'}
    if item == '3b':
        return None if p == 0 else {'I'}


def affine_types(fam, N):
    """Kac's affine diagrams of the involutions of g(C) (Theorem 4.4.8,
    (5.1.12)): (Sage type, k)."""
    if fam == 'sl':
        n = N
        return ([(['A', 1, 1], 1)] if n == 2 else
                [(['A', n - 1, 1], 1), (['A', n - 1, 2], 2)])
    if fam == 'so':
        n = N
        if n == 3:
            return [(['A', 1, 1], 1)]
        if n % 2 == 1:
            return [(['B', (n - 1) // 2, 1], 1)]
        return [(['D', n // 2, 1], 1), (['D', n // 2, 2], 2)]
    m = N // 2
    return [(['A', 1, 1], 1)] if m == 1 else [(['C', m, 1], 1)]


def kac_classes(fam, N):
    """Number of conjugacy classes of automorphisms of order 2: orbits of
    label vectors s (s_j >= 0, gcd 1, k sum a_j s_j = 2) under the
    automorphisms of the affine diagram."""
    total = 0
    for t, k in affine_types(fam, N):
        ct = CartanType(t)
        nodes = list(ct.index_set())
        A = matrix(ZZ, ct.cartan_matrix())
        a = ct.a()
        marks = [a[i] for i in nodes]
        n = len(nodes)
        auts = [[g(v) for v in range(n)] for g in
                digraph(A).automorphism_group(edge_labels=True)]
        sols = [s for s in product(range(3), repeat=n)
                if k * sum(x * y for x, y in zip(marks, s)) == 2
                and gcd(list(s)) == 1]
        orbits = set(frozenset(tuple(s[q.index(i)] for i in range(n))
                               for q in auts) for s in sols)
        total += len(orbits)
    return total


def table7_type(rf):
    """Type (I, II, III) under which Table 7 (pp. 307-309) lists a classical
    noncompact real form: I: so_(2p,2(l-p)+1), so_(2p,2(l-p)) (p >= 2),
    sp_(p,l-p); II: su_(p,q), so_(2,*), sp_2l(R), u*_l(H); III: sl_n(R),
    sl_l(H), so_(2p+1,2(l-p)+1).  Low ranks through sl_2 = so_3 = sp_2,
    so_5 = sp_4, so_6 = sl_4 (the rows of Table 7 in these ranks agree)."""
    kind = rf[0]
    if kind in ('slR', 'slH'):
        return 'II' if rf == ('slR', 2) else 'III'
    if kind in ('su', 'u*H', 'spR'):
        return 'II'
    if kind == 'sp':
        return 'I'
    p, q = rf[1], rf[2]
    if p % 2 == 1 and q % 2 == 1:
        return 'III'
    even = p if p % 2 == 0 else q
    return 'II' if even == 2 else 'I'


def fam_ranges():
    out = []
    for n in range(2, RANK_B + 2):
        out.append(('sl', n))
    for n in [3] + list(range(5, 2 * RANK_B + 2)):
        out.append(('so', n))
    for m in range(1, RANK_B + 1):
        out.append(('sp', 2 * m))
    return out


FIXED = {}          # (fam, N, item, p) -> (item, FixedAlgebra)


def check_theorems_5_6():
    for fam, N in fam_ranges():
        g = gC(fam, N)
        its = items(fam, N)
        descr = {}
        for it in its:
            what = "Thm 1.5/1.6 %s_%d item %s p=%s" % (fam, N, it['item'],
                                                      it['p'])
            sig = it['sigma']
            # sigma: antilinear involution of g(C), commuting with tau;
            # theta = sigma tau is the printed theta (item by item).
            bas = g.basis
            check(all(g.contains(sig(b)) and sig(sig(b)) == b
                      and sig(I * b) == -I * sig(b) for b in bas),
                  what + ": sigma involutive antilinear on g(C)")
            sample = bas[::max(1, len(bas) // 7)]
            check(all(sig(br(x, y)) == br(sig(x), sig(y))
                      for x in sample for y in sample),
                  what + ": sigma preserves brackets")
            check(all(sig(tau(b)) == tau(sig(b)) for b in bas),
                  what + ": sigma tau = tau sigma (Example of 4°)")
            check(all(sig(tau(b)) == it['theta'](b) for b in bas),
                  what + ": sigma tau = printed theta")
            th = it['theta']
            check(all(g.contains(th(b)) and th(th(b)) == b for b in bas)
                  and all(th(br(x, y)) == br(th(x), th(y))
                          for x in sample for y in sample),
                  what + ": theta involutive automorphism")
            F = FixedAlgebra(it)
            FIXED[(fam, N, it['item'], it['p'])] = (it, F)
            check(t_is_cartan(it, F), what + ": t is a Cartan subalgebra "
                  "of g^theta")
            key = (F.cartan_type(), F.centre_dim())
            if is_identity(it):
                check(F.dim == g.dim, what + ": theta = id")
                descr.setdefault(key, []).append(it)
                continue
            typ = kac_type(it, F)
            it['type'] = typ
            descr.setdefault(key, []).append(it)
            # real form dimension of k = dim_C g^theta (Theorem 4, 37)
            it['dim_k'] = F.dim
            check(typ == table7_type(it['rf']),
                  what + ": Table 7 lists %s under type %s"
                  % (it['rf'], table7_type(it['rf'])))
            if fam == 'sl' and N == 2 and it['item'] == '1a':
                # 1) a) for n = 2: -X^T = Ad S_1 is inner (type II); the
                # corrected theorem has n >= 3 in 1).
                refuted(typ in printed_type(it, 'printed'),
                        what + ": printed type III for n = 2")
                continue
            corrected = printed_type(it, 'corrected')
            check(typ in corrected, what + ": type %s (corrected)" % typ)
            text = printed_type(it, 'text')
            if typ not in text:
                refuted(typ in text, what + ": the candidate reading")
            printed = printed_type(it, 'printed')
            if typ not in printed:
                refuted(typ in printed, what + ": printed column")
        # sl_2: 1b is the identity; its row in the type column is refuted
        if fam == 'sl' and N == 2:
            F = FIXED[(fam, N, '1b', None)][1]
            refuted(F.dim != g.dim,
                    "Thm 1.5 1) b) n = 2: printed III, theta = id")
        # completeness and distinctness (Problem 39)
        classes = 1 + kac_classes(fam, N)
        degenerate = (fam, N) in (('sl', 2), ('so', 8))
        check(len(descr) == classes,
              "%s_%d: g^theta types = %d classes of involutions"
              % (fam, N, classes))
        if degenerate:
            refuted(len(its) == classes,
                    "%s_%d: printed items pairwise non-conjugate" % (fam, N))
            dup = [v for v in descr.values() if len(v) > 1]
            if fam == 'sl':
                check(sorted(sorted(x['item'] + str(x['p']) for x in v)
                             for v in dup)
                      == [['1a' + 'None', '1c1'], ['1bNone', '1c0']],
                      "sl_2: 1a ~ 1c(p=1) (sl2(R) = su11), 1b = 1c(p=0)")
            else:
                check(sorted(sorted(x['item'] + str(x['p']) for x in v)
                             for v in dup) == [['2a2', '2bNone']],
                      "so_8: Ad I_(2,6) ~ Ad S_4 (so_(2,6) = u*_4(H))")
        else:
            check(len(its) == classes,
                  "%s_%d: items = classes (complete, each once)" % (fam, N))


# ------------------------------------------- § 3: Theorems 6, 7, 9 (p. 264)
def hermitian_qbasis(space):
    """A Q-basis of the Hermitian Gaussian-rational elements of a complex
    subspace closed under X -> X^*."""
    mats = []
    for b in space.basis:
        assert space.contains(star(b))
        mats += [(b + star(b)) / 2, (b - star(b)) / (2 * I)]
    return TBasis(RSpace(mats, space.N).basis)


def coroots_of(space, tb):
    """Roots of the ad-action of the toral tb on the space (a Lie algebra),
    each with 1-dim root space, and coroots h_alpha in tb-coordinates."""
    ops = [space.op(lambda X, x=x: br(x, X)) for x in tb.mats]
    eig = joint_eigen(ops, space.dim, K)
    roots = {}
    for w, V in eig:
        wq = tuple(QQof(x) for x in w)
        if any(wq):
            assert len(V) == 1
            roots[wq] = space.combo(V[0])
    cor = {}
    for a, e in roots.items():
        f = roots[tuple(-x for x in a)]
        H = tb.coords(br(e, f))
        cor[a] = 2 * H / (vector(QQ, a) * H)
    return roots, cor


def lattices(it, F):
    """L_0, L_1, Q^v cap t, L(G) (rows, t-coordinates) for the item."""
    fam, N = it['fam'], it['N']
    g = gC(fam, N)
    tb = F.t
    r = len(tb.mats)
    # weights of t on g(C) (the roots of g(C) restricted to t)
    ops = [g.op(lambda X, x=x: br(x, X)) for x in tb.mats]
    eig = joint_eigen(ops, g.dim, K)
    weights = [tuple(QQof(x) for x in w) for w, V in eig
               if any(QQof(x) for x in w)]
    L1 = dual_lattice(matrix(QQ, weights), r)            # Problem 29
    L0 = [F.coroots[a] for a in F.roots]                 # Problem 28
    if r == rank_g(fam, N):
        roots, cor = coroots_of(g, tb)
        Qv = zbasis(list(cor.values()), r)
    else:
        # h = centralizer of t in g(C), a Cartan subalgebra (4.4.11)
        rows = matrix(K, [sum((list(g.coords(br(b, x))) for x in tb.mats),
                              []) for b in g.basis])
        h = g.sub(rows.left_kernel().basis())
        check(h.dim == rank_g(fam, N), "%s_%d %s: z(t) is a Cartan "
              "subalgebra" % (fam, N, it['item']))
        hb = hermitian_qbasis(h)
        roots, cor = coroots_of(g, hb)
        l = len(hb.mats)
        Qh = zbasis(list(cor.values()), l)
        T = matrix(QQ, [hb.coords(x) for x in tb.mats])     # t inside h
        Y = T.right_kernel_matrix().transpose()
        M = Qh * Y
        den = 1
        for x in M.list():
            den = den * x.denominator() // gcd(den, x.denominator())
        ker = matrix(ZZ, M * den).left_kernel().basis_matrix()
        Qv = matrix(QQ, [T.solve_left(vector(QQ, k) * Qh)
                         for k in ker.rows()])
    # L(G) for the matrix group: x in t with integer eigenvalues
    std = joint_eigen([x for x in tb.mats], N, K)
    LG = dual_lattice(matrix(QQ, [[QQof(c) for c in w] for w, V in std]), r)
    return dict(L0=L0, L1=L1, Qv=Qv, LG=LG, r=r)


def table10(rf):
    """Table 10 (pp. 319-321): (Z(G), Lambda(G), Z(G)/Lambda(G) implied by
    the printed generators), groups as invariant tuples (0 = Z); None if
    no printed row covers the real form.  Rows are matched literally,
    including the printed ranges."""
    kind = rf[0]
    if kind == 'slR':
        n = rf[1]
        if n == 2:                              # = sp_2(R), p = 0
            return ((0,), (0,), (2,)), 'sp_{4p+2}(R), p = 0'
        if n % 2 == 1:
            return ((2,), (2,), ()), 'sl_{2p+1}(R)'
        if n % 4 == 2:
            return ((4,), (2,), (2,)), 'sl_{4p+2}(R)'
        return ((2, 2), (2,), (2,)), 'sl_{4p}(R)'
    if kind == 'slH':
        return ((2,), (), (2,)), 'sl_p(H)'
    if kind == 'su':
        p, q = sorted(rf[1:])
        d = gcd(p, q)
        return (((d, 0) if d > 1 else (0,)), (0,), None), 'su_{p,q}'
    if kind == 'spR':
        m = rf[1]
        if m % 2 == 1:
            return ((0,), (0,), (2,)), 'sp_{4p+2}(R)'
        return ((2, 0), (0,), (2,)), 'sp_{4p}(R)'
    if kind == 'sp':
        return ((2,), (), (2,)), 'sp_{p,q}'
    if kind == 'u*H':
        l = rf[1]
        if l % 2 == 1:
            return ((0,), (0,), (4,)), 'u*_l(H), l = 2p + 1'
        if l % 4 == 2:
            return ((2, 0), (0,), (2, 2)), 'u*_l(H), l = 4p + 2'
        return ((2, 0), (0,), (2, 2)), 'u*_l(H), l = 4p'
    p, q = sorted(rf[1:])
    n = p + q
    if n == 3:                                  # so_(1,2) = sl_2(R)
        return table10(('slR', 2))
    if (p, q) == (1, 5):                        # so_(1,5) = sl_2(H)
        return table10(('slH', 2))
    if n % 2 == 1:
        l = (n - 1) // 2
        e = p if p % 2 == 0 else q
        if e == 2:
            return ((2, 0), (0,), (2,)), 'so_{2,2l-1}'
        return ((2, 2), (2,), (2,)), 'so_{2p,2(l-p)-1} (2 <= p <= l)'
    l = n // 2
    if p % 2 == 1:
        pp = (p - 1) // 2
        if 1 <= pp <= (l - 1) // 2:
            return ((2, 2), (2,), (2,)), 'so_{2p+1,2(l-p)-1}'
        return None, None
    pp = p // 2
    if pp == 1:
        return (((2, 0), (0,), (2, 2) if l % 2 == 0 else (4,)),
                'so_{2,2l-2}')
    if l % 2 == 1:
        return ((2, 4), (2,), (4,)), 'so_{2p,2(l-p)}, l odd'
    if pp % 2 == 1:
        return ((2, 4), (2,), (2, 2)), 'so_{2p,2(l-p)}, l even, p odd'
    return ((2, 2, 2), (2,), (2, 2)), 'so_{2p,2(l-p)}, l, p even'


def exercise_2_8(rf):
    """pi_1 of the classical groups, Exercise 2.8 (p. 251), or None."""
    kind = rf[0]
    if kind == 'su' and min(rf[1:]) > 0:
        return (0,)
    if kind == 'slR':
        return (2,) if rf[1] >= 3 else None
    if kind == 'spR':
        return (0,)
    if kind == 'u*H':
        return (0,)
    if kind == 'so':
        k, l = sorted(rf[1:])
        if k == 0 or (k, l) == (1, 1):
            return None
        if k > 2:
            return (2, 2)
        if k == 1:
            return (2,) if l > 2 else (0,)
        return (2, 0) if l > 2 else (0, 0)
    return None


# Table 10 rows whose printed ranges fail (found by this check; the table is
# not in this chapter, see tables-9-10.py): the B_l row at p = l
# (so_(2l,1)) and the missing so_(1,2l-1).
TABLE10_FAILS = []


def check_lattices():
    for (fam, N, item, p), (it, F) in sorted(FIXED.items(),
                                             key=lambda x: str(x[0])):
        if is_identity(it) or (fam, N) == ('so', 4):
            continue
        rf = it['rf']
        what = "§ 3 lattices %s" % (rf,)
        D = lattices(it, F)
        r = D['r']
        # Theorem 6: L_0 subset L(G) subset L_1; Theorem 9: Lambda(G) = 1
        # for the linear group G (Q^v cap t subset L(G))
        # quotient() asserts that the smaller lattice lies in the larger
        chain = [quotient(D['L1'], D['LG'], r), quotient(D['LG'], D['Qv'], r),
                 quotient(D['Qv'], D['L0'], r)]
        check(len(chain) == 3, what + ": L_0 < Q^v cap t < L(G) < L_1")
        Z = quotient(D['L1'], D['L0'], r)            # Theorem 7
        Lam = quotient(D['Qv'], D['L0'], r)          # Theorem 9
        pi1 = quotient(D['LG'], D['L0'], r)          # Theorem 7 for G
        ZoverLam = quotient(D['L1'], D['Qv'], r)
        it['Z'], it['Lambda'], it['pi1'] = Z, Lam, pi1
        pi = exercise_2_8(rf)
        if pi is not None:
            check(pi1 == pi, what + ": pi_1(G) = %s (Exercise 2.8)"
                  % group_str(pi))
        if fam == 'sl' and N == 2 and item == '1a':
            # Remark 4 of 2° and the Example of 6°: Z(SL~_2(R)) = Z,
            # Lambda = 2 Z(G), pi_1(PSL_2(R)) = pi_1(SL_2(R)) = Z
            check(Z == (0,) and Lam == (0,) and ZoverLam == (2,)
                  and pi1 == (0,), "SL~_2(R): Z = Z, Lambda = 2Z(G)")
        exp, row = table10(rf)
        n = N
        if exp is None:
            TABLE10_FAILS.append((rf, "no row", Z, Lam))
            continue
        ok = Z == exp[0] and Lam == exp[1] and (exp[2] is None
                                               or ZoverLam == exp[2])
        if not ok:
            TABLE10_FAILS.append((rf, row, Z, Lam, ZoverLam, exp))
            refuted(ok, what + ": Table 10 row %s" % row)
        else:
            check(ok, what + ": Table 10 row %s: Z = %s, Lambda = %s"
                  % (row, group_str(Z), group_str(Lam)))


def coroot_coords(alpha, index):
    return vector(QQ, [alpha.associated_coroot().coefficient(i)
                       for i in index])


def check_exceptional_lattices():
    """Theorems 3.7, 3.9 for the exceptional forms (Table 10, p. 321).
    Inner forms: theta = exp(pi i ad x), alpha_p(x) = 1/2 for a vertex p
    whose coefficient in the highest root is 1 or 2 (Problem 1.38, types
    II and I), t = h; the roots of k(C) are those with even coefficient at
    p.  The form is recognised by dim k (Table 9, pp. 314-317).  Lattices in
    simple coroot coordinates: Q^v = Z^l, P^v = rows of A^-1."""
    rows = [("EII", "E", 6, 38, (6,), (2,), (3,)),
            ("EIII", "E", 6, 46, (0,), (0,), (3,)),
            ("EV", "E", 7, 63, (4,), (2,), (2,)),
            ("EVI", "E", 7, 69, (2, 2), (2,), (2,)),
            ("EVII", "E", 7, 79, (0,), (0,), (2,)),
            ("EVIII", "E", 8, 120, (2,), (2,), ()),
            ("EIX", "E", 8, 136, (2,), (2,), ()),
            ("FI", "F", 4, 24, (2,), (2,), ()),
            ("FII", "F", 4, 36, (), (), ()),
            ("G", "G", 2, 6, (2,), (2,), ())]
    for X, l in (("E", 6), ("E", 7), ("E", 8), ("F", 4), ("G", 2)):
        R = RootSystem([X, l])
        Q = R.root_lattice()
        idx = list(R.index_set())
        A = matrix(QQ, CartanType([X, l]).cartan_matrix())
        pos = list(Q.positive_roots())
        hi = Q.highest_root()
        Pv = A.inverse()
        Qv = identity_matrix(QQ, l)
        found = {}
        for p in idx:
            c = hi.coefficient(p)
            if c not in (1, 2):
                continue
            kpos = [a for a in pos if a.coefficient(p) % 2 == 0]
            dimk = l + 2 * len(kpos)
            L0 = [coroot_coords(a, idx) for a in kpos]
            Z = quotient(Pv, L0, l)
            Lam = quotient(Qv, L0, l)
            ZL = quotient(Pv, Qv, l)
            found.setdefault(dimk, set()).add((Z, Lam, ZL))
        for name, XX, ll, dk, z, lam, zl in rows:
            if (XX, ll) != (X, l):
                continue
            what = "Table 10 %s (%s%d)" % (name, X, l)
            check(dk in found and len(found[dk]) == 1,
                  what + ": dim k = %d is realised (Table 9)" % dk)
            (Z, Lam, ZL), = found[dk]
            check((Z, Lam, ZL) == (z, lam, zl),
                  what + ": Z = %s, Lambda = %s, Z/Lambda = %s"
                  % (group_str(Z), group_str(Lam), group_str(ZL)))
    # EI and EIV (outer): t = t_tau, the restricted roots r(alpha) of E6
    # form F4 (checked); k(C) contains every short restricted root (one
    # theta-fixed line in each g_alpha + g_tau(alpha)); for EIV all long,
    # for EI a set S of long roots with short + S of type C4 (all such S
    # are tried).  Coroots of k(C): 2 beta/(beta, beta) in the invariant
    # form; Q^v cap t = tau-invariant coroots of E6; P^v cap t = the
    # coweights of E6 in t.
    R = RootSystem(["E", 6])
    Q = R.root_lattice()
    idx = list(R.index_set())
    A = matrix(QQ, CartanType(["E", 6]).cartan_matrix())   # symmetric
    tau6 = {1: 6, 2: 2, 3: 5, 4: 4, 5: 3, 6: 1}
    roots = [vector(QQ, [a.coefficient(i) for i in idx])
             for a in Q.roots()]
    tv = lambda v: vector(QQ, [v[tau6[i + 1] - 1] for i in range(6)])
    check(all(tv(v) in roots for v in roots) and A == A.transpose()
          and all(A[i, j] == A[tau6[i + 1] - 1, tau6[j + 1] - 1]
                  for i in range(6) for j in range(6)),
          "E6: tau is a diagram automorphism")
    form = lambda u, v: u * A * v
    restr = {}
    for v in roots:
        w = (v + tv(v)) / 2
        restr.setdefault(tuple(w), []).append(v)
    R4 = [vector(QQ, w) for w in restr]
    # t_tau basis: orbit sums of simple coroots
    orbits = [[0, 5], [1], [2, 4], [3]]
    Tb = matrix(QQ, [[1 if i in o else 0 for i in range(6)]
                     for o in orbits])
    # the restricted roots form F4 (Cartan matrix of the simple ones)
    ww = generic_positive(R4, 6)
    posr = [w for w in R4 if w * ww > 0]
    pset = set(tuple(w) for w in posr)
    simple = [w for w in posr if not any(tuple(w - u) in pset
                                         for u in posr)]
    C = matrix(ZZ, 4, 4, lambda i, j: 2 * form(simple[i], simple[j])
               / form(simple[i], simple[i]))
    check(len(R4) == 48 and identify(C) == ("F4",),
          "E6 -> t_tau: restricted roots form F4 (Problem 4.4.30)")
    coroot = lambda w: 2 * w / form(w, w)
    short = [w for w in R4 if form(w, w) == 1]
    long_ = [w for w in R4 if form(w, w) == 2]
    check(len(short) == 24 and len(long_) == 24
          and all(len(restr[tuple(w)]) == 2 for w in short)
          and all(len(restr[tuple(w)]) == 1 for w in long_),
          "E6: short = 2-orbits, long = fixed roots")
    # Elements of h in simple coroot coordinates x (E6 simply laced: the
    # coroot of a root has its coefficient vector); alpha(x) = x A a.
    # t_tau: x = y Tb.  P^v cap t = {y: y Tb A integral} = dual of the
    # Z-span of the columns of Tb A; Q^v cap t = Z-span of the orbit sums.
    to_y = lambda v: Tb.solve_left(v)
    Pvt = dual_lattice(matrix(QQ, (Tb * A).columns()), 4)
    Qvt = identity_matrix(QQ, 4)
    eiv = [to_y(coroot(w)) for w in R4]
    Z = quotient(Pvt, eiv, 4)
    Lam = quotient(Qvt, eiv, 4)
    check(Z == () and Lam == (),
          "Table 10 EIV: Z = 1, Lambda = 1 (k(C) = F4 = g^tau-hat)")
    posl = [w for w in long_ if w * ww > 0]
    frames = []
    for S in combinations(posl, 4):
        if any(form(a, b) != 0 for a, b in combinations(S, 2)):
            continue
        Sall = list(S) + [-a for a in S]
        roots_k = short + Sall
        rset = set(tuple(w) for w in roots_k)
        closed = all(tuple(b - 2 * form(a, b) / form(a, a) * a) in rset
                     for a in roots_k for b in roots_k)
        if not closed:
            continue
        posk = [w for w in roots_k if w * ww > 0]
        pk = set(tuple(w) for w in posk)
        sk = [w for w in posk if not any(tuple(w - u) in pk for u in posk)]
        Ck = matrix(ZZ, len(sk), len(sk), lambda i, j: 2 * form(sk[i], sk[j])
                    / form(sk[i], sk[i]))
        if identify(Ck) != ("C4",):
            continue
        L0 = [to_y(coroot(w)) for w in roots_k]
        frames.append((quotient(Pvt, L0, 4), quotient(Qvt, L0, 4)))
    check(len(frames) > 0 and set(frames) == {((2,), (2,))},
          "Table 10 EI: Z = Z2, Lambda = Z2 for all %d C4 subsystems "
          "containing the short roots" % len(frames))


# ------------------------------------------------ real forms (§§ 3, 4)
class RealAlg:
    """A real Lie algebra of complex matrices stable under X -> -X^*,
    with the Cartan involution theta(X) = -X^* (Problems 3.3, 3.4)."""

    def __init__(self, name, mats, N):
        self.name, self.N = name, N
        self.h = RSpace(mats, N)
        h = self.h
        self.dim = h.dim
        assert all(h.contains(br(x, y)) for x in h.basis[:6]
                   for y in h.basis), name + ": not a subalgebra"
        assert all(h.contains(tau(b)) for b in h.basis), name + ": theta"
        self.k = RSpace([(b + tau(b)) / 2 for b in h.basis], N)
        self.p = RSpace([(b - tau(b)) / 2 for b in h.basis], N)
        self.ad = [h.op(lambda X, x=x: br(x, X)) for x in h.basis]
        V = matrix(QQ, [A.list() for A in self.ad])
        W = matrix(QQ, [A.transpose().list() for A in self.ad])
        self.B = V * W.transpose()          # Killing form tr(ad x ad y)

    def gram(self, X, Y):
        CX = matrix(QQ, [self.h.coords(x) for x in X])
        CY = matrix(QQ, [self.h.coords(y) for y in Y])
        return CX * self.B * CY.transpose()

    def killing(self, x, y):
        return self.h.coords(x) * self.B * self.h.coords(y)

    def cartan_decomposition_ok(self):
        k, p = self.k.basis, self.p.basis
        ok = self.k.dim + self.p.dim == self.dim
        if k and p:
            ok = ok and self.gram(k, p) == 0
        if k:
            ok = ok and (-self.gram(k, k)).is_positive_definite()
        if p:
            ok = ok and self.gram(p, p).is_positive_definite()
        return ok

    def max_abelian_in_p(self):
        a = []
        P = self.p.basis
        while True:
            if a:
                rows = matrix(QQ, [sum((realvec(br(y, x)) for x in a), [])
                                   for y in P])
                cent = [self.p.combo(c) for c in
                        rows.left_kernel().basis()]
            else:
                cent = list(P)
            A = RSpace(a, self.N) if a else None
            new = [y for y in cent if A is None or not A.contains(y)]
            if not new:
                self.a = a
                return a
            a.append(new[0])

    def restricted_roots(self):
        a = self.a
        r = len(a)
        self.Ga = self.gram(a, a) if a else matrix(QQ, 0, 0)
        if not a:
            self.Sigma = {}
            return {}
        ops = [self.h.op(lambda X, x=x: br(x, X)) for x in a]
        eig = joint_eigen(ops, self.dim, QQ)
        self.spaces = {w: [self.h.combo(v) for v in V] for w, V in eig}
        self.Sigma = {w: len(V) for w, V in eig if any(w)}
        return self.Sigma

    def ip(self, u, v):
        return vector(QQ, u) * self.Ga.inverse() * vector(QQ, v)

    def root_system_ok(self):
        """Theorem 4.2: Cartan integers and reflections."""
        S = [vector(QQ, w) for w in self.Sigma]
        Sset = set(self.Sigma)
        for al in S:
            for be in S:
                n = 2 * self.ip(be, al) / self.ip(al, al)
                if n not in ZZ or tuple(be - n * al) not in Sset:
                    return False
        return True

    def sigma_type(self):
        S = [vector(QQ, w) for w in self.Sigma]
        if not S:
            return ()
        nonred = any(tuple(2 * s) in self.Sigma for s in S)
        indiv = [s for s in S if tuple(s / 2) not in self.Sigma]
        w = generic_positive(indiv, len(self.a))
        pos = [s for s in indiv if s * w > 0]
        pset = set(tuple(s) for s in pos)
        simple = [s for s in pos if not any(tuple(s - u) in pset
                                            for u in pos)]
        C = matrix(ZZ, len(simple), len(simple),
                   lambda i, j: 2 * self.ip(simple[i], simple[j])
                   / self.ip(simple[i], simple[i]))
        t = identify(C)
        if nonred:
            assert len(t) == 1 and t[0][0] in "BA"
            return ("BC%d" % len(self.a),)
        return t

    def multiplicities(self):
        lens = {w: self.ip(w, w) for w in self.Sigma}
        mn = min(lens.values())
        out = {}
        for w, m in self.Sigma.items():
            out.setdefault(lens[w] / mn, set()).add(m)
        return {k: v.pop() if len(v) == 1 else tuple(sorted(v))
                for k, v in out.items()}

    def invariants(self):
        """(dim, dim k, rk_R, type of Sigma, sorted (ratio, m, count))."""
        lens = {w: self.ip(w, w) for w in self.Sigma}
        mn = min(lens.values()) if lens else 1
        cnt = {}
        for w, m in self.Sigma.items():
            key = (lens[w] / mn, m)
            cnt[key] = cnt.get(key, 0) + 1
        return (self.dim, self.k.dim, len(self.a), self.sigma_type(),
                tuple(sorted(cnt.items())))

    def problem_8_ok(self):
        """[x, theta x] = (alpha, alpha)/2 (x, theta x) h_alpha,
        (x, theta x) < 0, for a basis vector x of each g_alpha."""
        Gi = self.Ga.inverse()
        for w in self.Sigma:
            x = self.spaces[w][0]
            tx = tau(x)
            b = self.killing(x, tx)
            c = Gi * vector(QQ, w)
            H = sum((ci * ai for ci, ai in zip(c, self.a)),
                    zero_matrix(K, self.N))          # (alpha,alpha)/2 h_a
            if not (b < 0 and br(x, tx) == b * H):
                return False
        return True

    def iwasawa_ok(self):
        """Theorem 4.5: g = k + a + n direct, n nilpotent, [a+n, a+n] in n
        (d solvable)."""
        if not self.a:
            return True
        w = generic_positive([vector(QQ, s) for s in self.Sigma],
                             len(self.a))
        n = [x for s, V in self.spaces.items()
             if any(s) and vector(QQ, s) * w > 0 for x in V]
        tot = RSpace(self.k.basis + self.a + n, self.N)
        ok = (tot.dim == self.dim == self.k.dim + len(self.a) + len(n))
        Nsp = RSpace(n, self.N)
        d = self.a + n
        ok = ok and all(Nsp.contains(br(x, y)) for x in d for y in d)
        cur, steps = n, 0
        while cur and steps <= self.dim:
            cur = RSpace([br(x, y) for x in n for y in cur], self.N).basis
            steps += 1
        return ok and not cur


def real_form(name, fam, N, sigma):
    g = gC(fam, N)
    mats = []
    for b in g.basis:
        mats += [b + sigma(b), I * b + sigma(I * b)]
    return RealAlg(name, mats, N)


def table9(rf):
    """Table 9 (pp. 312-317) for the classical rows, with the compact forms:
    (dim k, rk_R, type of Sigma, {length ratio: dim g_lambda})."""
    kind = rf[0]
    if kind == 'slR':
        n = rf[1]
        return n * (n - 1) // 2, n - 1, ("A%d" % (n - 1),), {1: 1}
    if kind == 'slH':
        m = rf[1]
        if m == 1:
            return 3, 0, (), {}
        return m * (2 * m + 1), m - 1, ("A%d" % (m - 1),), {1: 4}
    if kind in ('su', 'so', 'sp'):
        p, q = sorted(rf[1:])
        dk = {'su': p * p + q * q - 1,
              'so': p * (p - 1) // 2 + q * (q - 1) // 2,
              'sp': p * (2 * p + 1) + q * (2 * q + 1)}[kind]
        if p == 0:
            return dk, 0, (), {}
        mult = {'su': 2, 'so': 1, 'sp': 4}[kind]
        if kind == 'so':
            if p == q:
                return dk, p, (canonical("D%d" % p),), {1: 1}
            if p == 1:
                return dk, 1, ("A1",), {1: q - p}
            return dk, p, ("B%d" % p,), {1: q - p, 2: 1}
        top = {'su': 1, 'sp': 3}[kind]
        if p == q:
            if p == 1:
                return dk, 1, ("A1",), {1: top}
            return dk, p, (canonical("C%d" % p),), {1: mult, 2: top}
        if p == 1:
            return dk, 1, ("BC1",), {1: mult * (q - p), 4: top}
        return dk, p, ("BC%d" % p,), {1: mult * (q - p), 2: mult, 4: top}
    if kind == 'u*H':
        m = rf[1]
        p = m // 2
        if m % 2 == 0:
            if p == 1:
                return 4, 1, ("A1",), {1: 1}
            return m * m, p, (canonical("C%d" % p),), {1: 4, 2: 1}
        if p == 1:
            return m * m, 1, ("BC1",), {1: 4, 4: 1}
        return m * m, p, ("BC%d" % p,), {1: 4, 2: 4, 4: 1}
    if kind == 'spR':
        m = rf[1]
        if m == 1:
            return 1, 1, ("A1",), {1: 1}
        return m * m, m, (canonical("C%d" % m),), {1: 1, 2: 1}


REALFORMS = {}


def check_real_forms():
    for fam, N in fam_ranges():
        if rank_g(fam, N) > RANK_C:
            continue
        for it in items(fam, N):
            rf = it['rf']
            if fam == 'sl' and N == 2 and it['item'] == '1b':
                rf = ('slH', 1)
            what = "real form %s" % (rf,)
            R = real_form(str(rf), fam, N, it['sigma'])
            REALFORMS[rf] = R
            check(R.dim == gC(fam, N).dim, what + ": dim_R = dim_C g(C)")
            check(R.cartan_decomposition_ok(),
                  what + ": -B > 0 on k, B > 0 on p, B(k, p) = 0 (3.2)")
            a = R.max_abelian_in_p()
            check(all(br(x, y) == 0 for x in a for y in a),
                  what + ": a abelian, maximal in p")
            R.restricted_roots()
            dk, rk, typ, mult = table9(rf)
            key = (fam, N, it['item'], it['p'])
            if key in FIXED:
                check(R.k.dim == FIXED[key][1].dim,
                      what + ": dim k = dim_C g^theta (Problem 1.37)")
            check(R.k.dim == dk, what + ": dim k = %d (Table 9)" % dk)
            check(R.p.dim == R.dim - dk, what + ": dim p (Table 9)")
            check(len(a) == rk, what + ": rk_R = %d (Table 9)" % rk)
            if not a:
                continue
            check(R.root_system_ok(), what + ": Sigma is a root system "
                  "(Theorem 4.2)")
            check(R.sigma_type() == typ, what + ": Sigma of type %s" % typ)
            check(R.multiplicities() == mult,
                  what + ": dim g_lambda %s (Table 9)" % mult)
            check(R.problem_8_ok(), what + ": Problem 4.8")
            check(R.iwasawa_ok(), what + ": Iwasawa, Theorem 4.5")
            # 4°, Example: split <=> rk_R = rk g(C); the printed list
            split = len(a) == rank_g(fam, N)
            # (up to isomorphism: su_(1,1) = sl_2(R), Exercise 1.15)
            printed_split = (rf[0] in ('slR', 'spR') or rf == ('su', 1, 1)
                             or (rf[0] == 'so' and abs(rf[1] - rf[2]) == 1)
                             or (rf[0] == 'so' and rf[1] == rf[2] >= 3))
            check(split == printed_split,
                  what + ": split iff in the list of 4° (%s)" % split)


def direct_sum(name, A, B):
    Z1, Z2 = zero_matrix(K, A.N), zero_matrix(K, B.N)
    mats = ([block_diagonal_matrix(x, Z2, subdivide=False)
             for x in A.h.basis]
            + [block_diagonal_matrix(Z1, y, subdivide=False)
               for y in B.h.basis])
    return RealAlg(name, mats, A.N + B.N)


def analysed(R):
    R.max_abelian_in_p()
    R.restricted_roots()
    return R.invariants()


def check_exercise_1_15():
    """Exercise 1.15 (p. 235): each printed isomorphism preserves (dim,
    dim k, rk_R, type of Sigma, multiplicities) -- necessary conditions,
    computed on the two sides independently."""
    F = REALFORMS
    so4 = real_form("so4", 'so', 4, lambda X: conj(X))
    so13 = real_form("so13", 'so', 4, lambda X: I_(1, 3) * conj(X) * I_(1, 3))
    so22 = real_form("so22", 'so', 4, lambda X: I_(2, 2) * conj(X) * I_(2, 2))
    S2 = S_(2)
    us2 = real_form("u*2", 'so', 4, lambda X: -S2 * conj(X) * S2)
    g = gC('sl', 2)
    sl2C = RealAlg("sl2(C)^R", g.basis + [I * b for b in g.basis], 2)
    su2, sl2R = F[('su', 0, 2)], F[('slR', 2)]
    pairs = [
        ("so_3 = su_2", F[('so', 0, 3)], su2),
        ("su_2 = sp_1", su2, F[('sp', 0, 1)]),
        ("so_(1,2) = su_(1,1)", F[('so', 1, 2)], F[('su', 1, 1)]),
        ("su_(1,1) = sl_2(R)", F[('su', 1, 1)], sl2R),
        ("sl_2(R) = sp_2(R)", sl2R, F[('spR', 1)]),
        ("so_4 = su_2 + su_2", so4, direct_sum("su2+su2", su2, su2)),
        ("so_(1,3) = sl_2(C)^R", so13, sl2C),
        ("so_(2,2) = sl_2(R) + sl_2(R)", so22,
         direct_sum("sl2R+sl2R", sl2R, sl2R)),
        ("so_5 = sp_2", F[('so', 0, 5)], F[('sp', 0, 2)]),
        ("so_(1,4) = sp_(1,1)", F[('so', 1, 4)], F[('sp', 1, 1)]),
        ("so_(2,3) = sp_4(R)", F[('so', 2, 3)], F[('spR', 2)]),
        ("so_6 = su_4", F[('so', 0, 6)], F[('su', 0, 4)]),
        ("so_(1,5) = sl_2(H)", F[('so', 1, 5)], F[('slH', 2)]),
        ("so_(2,4) = su_(2,2)", F[('so', 2, 4)], F[('su', 2, 2)]),
        ("so_(3,3) = sl_4(R)", F[('so', 3, 3)], F[('slR', 4)]),
        ("u*_2(H) = su_2 + sl_2(R)", us2,
         direct_sum("su2+sl2R", su2, sl2R)),
        ("u*_3(H) = su_(1,3)", F[('u*H', 3)], F[('su', 1, 3)]),
        ("u*_4(H) = so_(2,6)", F[('u*H', 4)], F[('so', 2, 6)]),
    ]
    for what, A, B in pairs:
        check(A.cartan_decomposition_ok() and B.cartan_decomposition_ok(),
              "Exercise 1.15 " + what + ": Cartan decompositions")
        ia, ib = analysed(A), analysed(B)
        check(ia == ib, "Exercise 1.15 %s: %s" % (what, ia))
    # the printed "so_15 = sl_2(H)" (p. 235): dim so_15 = 105
    refuted(15 * 14 // 2 == F[('slH', 2)].dim,
            "Exercise 1.15 printed so_15 = sl_2(H)")


# ---------------------------------------------- § 1: examples (pp. 225-234)
def intersection_dim(A, B):
    return A.dim + B.dim - RSpace(A.basis + B.basis, A.N).dim


def cayley(X):
    """(E - sX)^-1 (E + sX) for the first s with E - sX invertible: it
    preserves every form preserved infinitesimally by X."""
    E = identity_matrix(X.base_ring(), X.nrows())
    for s in (1, QQ(1) / 3, QQ(2) / 7, QQ(1) / 11):
        if (E - s * X).det() != 0:
            return (E - s * X).inverse() * (E + s * X)
    raise AssertionError("no Cayley element")


def check_section_1_examples():
    # Example 2 (p. 225): G^S = L O_(k,l) L^-1 (printed: L O_(k,l) L)
    for k, l in ((1, 1), (1, 2), (2, 2), (1, 3), (2, 3)):
        n = k + l
        Ik, L = I_(k, l), L_(k, l)
        check(L * L == Ik and conj(L) == L.inverse(),
              "Example 1.2: L^2 = I, conj L = L^-1 (k, l = %d, %d)" % (k, l))
        Y = matrix(K, n, n, lambda i, j: (i - j) * (i + 2 * j + 1))
        X = Ik * (Y - Y.transpose())            # X^T I + I X = 0
        B = cayley(X)
        check(B.transpose() * Ik * B == Ik and all(is_rational(z)
                                                   for z in B.list()),
              "Example 1.2: Cayley element of O_(k,l)")
        A = L * B * L.inverse()
        check(A.transpose() * A == identity_matrix(K, n)
              and Ik * conj(A) * Ik == A,
              "Example 1.2: L O_(k,l) L^-1 = fixed points of S (k, l = "
              "%d, %d)" % (k, l))
        # the printed L O_(k,l) L (no inverse) is the same set: L B L =
        # L (B I) L^-1 and I in O_(k,l); for SO it would differ (l odd)
        A2 = L * B * L
        check(A2 == L * (B * Ik) * L.inverse()
              and (B * Ik).transpose() * Ik * (B * Ik) == Ik
              and A2.transpose() * A2 == identity_matrix(K, n)
              and Ik * conj(A2) * Ik == A2,
              "Example 1.2: printed L O_(k,l) L = L O_(k,l) L^-1")
        check(B.det() == 1 and A2.det() == (-1) ** l,
              "Example 1.2: L SO_(k,l) L differs for odd l (the book has "
              "L SO_(k,l) L^-1)")
        # the matrix form (X, iY; -iY^T, Z) of L so_(k,l) L^-1
        fam = []
        for i in range(n):
            for j in range(i + 1, n):
                same = (i < k) == (j < k)
                c = 1 if same else I
                fam.append(c * (E_(n, i, j) - E_(n, j, i)))
        so = gC('so', n)
        check(all(so.contains(x) and Ik * conj(x) * Ik == x for x in fam)
              and RSpace(fam, n).dim == so.dim,
              "Example 1.2: form (X, iY; -iY^T, Z), k, l = %d, %d" % (k, l))
    # Example 3 (p. 226): su_(k,l) = (X, Y; conj(Y)^T, Z)
    for k, l in ((1, 1), (1, 2), (2, 2)):
        n = k + l
        Ik = I_(k, l)
        fam = []
        for i in range(n):
            for j in range(n):
                if i == j:
                    continue
                if (i < k) == (j < k):
                    x = E_(n, i, j) - E_(n, j, i)
                    fam += [x, I * (E_(n, i, j) + E_(n, j, i))]
                elif i < k:
                    x = E_(n, i, j) + E_(n, j, i)
                    fam += [x, I * (E_(n, i, j) - E_(n, j, i))]
        fam += [I * (E_(n, i, i) - E_(n, i + 1, i + 1)) for i in range(n - 1)]
        sl = gC('sl', n)
        ok = all(sl.contains(x) and -Ik * star(x) * Ik == x for x in fam)
        check(ok and RSpace(fam, n).dim == sl.dim,
              "Example 1.3: form (X, Y; conj(Y)^T, Z) of su_(%d,%d)" % (k, l))
    # Example 4 (pp. 226-227): gl_m(H) = (X, Y; -conj Y, conj X); the real
    # structure J A J^-1 = -S conj(A) S
    for m in (1, 2, 3):
        S = S_(m)
        n = 2 * m
        fam = []
        for i in range(m):
            for j in range(m):
                for c in (1, I):
                    X = c * E_(m, i, j)
                    Z = zero_matrix(K, m)
                    fam.append(block_matrix(K, [[X, Z], [Z, conj(X)]],
                                            subdivide=False))
                    fam.append(block_matrix(K, [[Z, X], [-conj(X), Z]],
                                            subdivide=False))
        glH = RSpace(fam, n)
        gl = RSpace([E_(n, i, j) * c for i in range(n) for j in range(n)
                     for c in (1, I)], n)
        check(all(-S * conj(x) * S == x for x in fam)
              and glH.dim == 4 * m * m,
              "Example 1.4: gl_%d(H) = (X, Y; -conj Y, conj X)" % m)
        # fixed points of the real structure on gl_2m(C): real dim 4m^2
        Fix = RSpace([x - S * conj(x) * S for x in gl.basis], n)
        check(Fix.dim == 4 * m * m and all(glH.contains(x)
                                           for x in Fix.basis),
              "Example 1.4: gl_2m(C)^S = gl_%d(H)" % m)
        # sl_m(H): tr X + tr conj X = 0;  u*_m(H): X^T = -X, Y^T = conj Y
        sl = RSpace(gC('sl', n).basis + [I * b for b in gC('sl', n).basis], n)
        check(intersection_dim(glH, sl) == 4 * m * m - 1,
              "Example 1.4: dim sl_%d(H) = 4m^2 - 1" % m)
        so = RSpace(gC('so', n).basis + [I * b for b in gC('so', n).basis], n)
        uf = []
        Zm = zero_matrix(K, m)
        for i in range(m):
            for j in range(m):
                if i < j:
                    for c in (1, I):
                        X = c * (E_(m, i, j) - E_(m, j, i))
                        uf.append(block_matrix(K, [[X, Zm], [Zm, conj(X)]],
                                               subdivide=False))
                        Y = (E_(m, i, j) + E_(m, j, i) if c == 1 else
                             I * (E_(m, i, j) - E_(m, j, i)))
                        uf.append(block_matrix(K, [[Zm, Y], [-conj(Y), Zm]],
                                               subdivide=False))
                if i == j:
                    Y = E_(m, i, i)
                    uf.append(block_matrix(K, [[Zm, Y], [-conj(Y), Zm]],
                                           subdivide=False))
        U = RSpace(uf, n)
        check(all(so.contains(x) and glH.contains(x) for x in uf)
              and U.dim == intersection_dim(glH, so) == m * (2 * m - 1),
              "Example 1.4: u*_%d(H): X^T = -X, Y^T = conj Y" % m)
    # the quaternionic picture: q = z + j w -> (z, w)
    R = PolynomialRing(QQ, 'a,b,c,d,e,f,g,h')
    a, b, c, d, e, f, g_, h = R.gens()
    H = QuaternionAlgebra(R.fraction_field(), -1, -1)
    qi, qj, qk = H.gens()

    def quat(z, w):          # z = z0 + z1 i, w = w0 + w1 i
        return z[0] + z[1] * qi + qj * (w[0] + w[1] * qi)

    def pair(x):             # x = z + j w
        x0, x1, x2, x3 = list(x)
        return (x0, x1), (x2, -x3)
    q = quat((a, b), (c, d))
    q2 = quat((e, f), (g_, h))
    zz, ww = pair(q * qj)
    check(zz == (-c, d) and ww == (a, -b),
          "Example 1.4: q j -> (-conj w, conj z)")
    zj, wj = pair(q.conjugate() * qj * q2)
    # j-part: z z' + w w' (complex bilinear); complex part: conj(w) z' -
    # conj(z) w'
    check(wj == (a * e - b * f + c * g_ - d * h, a * f + b * e + c * h + d * g_)
          and zj == (c * e + d * f - a * g_ - b * h,
                     c * f - d * e - a * h + b * g_),
          "Example 1.4: conj(q) j q' = (conj w z' - conj z w') + j(z z' + "
          "w w')")
    # Example 4 of 1°: S(A) = conj(A) is an automorphism of GL_2(C), not an
    # anti-automorphism
    A = matrix(K, [[1, I], [2, 3]])
    B = matrix(K, [[0, 1], [1 + I, 5]])
    check(conj(A * B) == conj(A) * conj(B),
          "Example 1.4 (1°): S(AB) = S(A) S(B)")
    refuted(conj(A * B) == conj(B) * conj(A),
            "Example 1.4 (1°) printed 'anti-automorphism' S(AB) = S(B)S(A)")
    # Example 5 (p. 227): the printed matrix of sp_(k,l), symbolically
    for k, l in ((1, 0), (0, 1), (1, 1), (2, 1), (1, 2)):
        check(example_5_ok(k, l),
              "Example 1.5: printed sp_(%d,%d) in sp and fixed by S" % (k, l))
        n = k + l
        params = (k * k + l * l + k * (k + 1) + l * (l + 1) + 4 * k * l)
        check(params == n * (2 * n + 1),
              "Example 1.5: the printed form has dim sp_2n parameters")
    # M_(k,l): M^T (K S) M = S, and M^-1 (printed algebra) M satisfies
    # the defining conditions of sp_(k,l); Cayley elements of Sp_(k,l)
    for k, l in ((1, 1), (2, 1)):
        n = k + l
        Kk, M, S = Kmat(k, l), Mmat(k, l), S_(n)
        check(M.transpose() * (Kk * S) * M == S,
              "Example 1.5: M^T (K S) M = S")
        sp = gC('sp', 2 * n)
        fix = [x for x in sp.basis]
        fam = [x + (-Kk * star(x) * Kk) for x in fix] + \
              [I * x + (-Kk * star(I * x) * Kk) for x in fix]
        Rf = RSpace(fam, 2 * n)
        ok = True
        for X in Rf.basis[:6]:
            Y = M.inverse() * X * M
            ok = ok and Y == -S * conj(Y) * S \
                and star(Y) * Kk + Kk * Y == 0
            A_ = cayley(Y)
            ok = ok and A_ == -S * conj(A_) * S \
                and star(A_) * Kk * A_ == Kk \
                and A_ * (Kk * S) * A_.transpose() == Kk * S
        check(ok, "Example 1.5: G^S = M Sp_(k,l) M^-1 (Lie algebra, "
              "Cayley elements), A (K S) A^T = K S")
    # Problem 19 for sl_n: sigma(X) = -conj(X)^T, h_sigma > 0 (Problem 25)
    for n in (2, 3, 4):
        s = lambda X: -star(X)
        ok = all(s(E_(n, i, i) - E_(n, i + 1, i + 1))
                 == -(E_(n, i, i) - E_(n, i + 1, i + 1))
                 and s(E_(n, i, i + 1)) == -E_(n, i + 1, i)
                 and s(E_(n, i + 1, i)) == -E_(n, i, i + 1)
                 for i in range(n - 1))
        g = gC('sl', n)
        mats = g.basis + [I * b for b in g.basis]
        G = matrix(QQ, len(mats), len(mats),
                   lambda i, j: QQof((2 * n * (mats[i] * star(mats[j]))
                                      .trace() + 2 * n * (mats[j]
                                      * star(mats[i])).trace()) / 2))
        check(ok and G.is_positive_definite(),
              "Problems 1.19, 1.25: sl_%d, h_sigma positive definite" % n)
    # Exercise 2 of § 1 (p. 234): the middle block of S
    for q in range(1, 5):
        pairwise = []
        for j in range(q):
            pairwise += [q + j, j]            # printed order
        block = list(range(q, 2 * q)) + list(range(q))
        inv = lambda perm: all(perm[perm[i]] == i for i in range(2 * q))
        if q == 1:
            check(inv(pairwise), "Exercise 1.2, q = 1: involution")
        else:
            refuted(inv(pairwise), "Exercise 1.2 printed pairwise order, "
                    "q = %d: S^2 = id" % q)
        check(inv(block), "Exercise 1.2 block order, q = %d: S^2 = id" % q)


def example_5_ok(k, l):
    """The printed matrix of Example 5 (p. 227) lies in
    sp_2n(C) (X^T S + S X = 0) and is fixed by X -> -K conj(X)^T K, for
    generic blocks (real and imaginary parts are variables)."""
    n = k + l
    shapes = {'11': (k, k), '12': (k, l), '13': (k, k), '14': (k, l),
              '22': (l, l), '24': (l, l)}
    names = []
    for bl, (r, c) in shapes.items():
        for i in range(r):
            for j in range(c):
                names += ['a%s_%d_%d' % (bl, i, j), 'b%s_%d_%d' % (bl, i, j)]
    R = PolynomialRing(K, names)
    gens = dict(zip(names, R.gens()))

    def cj(M):
        return M.apply_map(lambda p: p.map_coefficients(
            lambda z: z.galois_conjugate()))
    X = {}
    for bl, (r, c) in shapes.items():
        X[bl] = matrix(R, r, c, lambda i, j: gens['a%s_%d_%d' % (bl, i, j)]
                       + I * gens['b%s_%d_%d' % (bl, i, j)])
    X11 = X['11'] - cj(X['11']).transpose()        # conj(X11)^T = -X11
    X22 = X['22'] - cj(X['22']).transpose()
    X13 = X['13'] + X['13'].transpose()            # X13^T = X13
    X24 = X['24'] + X['24'].transpose()
    X12, X14 = X['12'], X['14']
    M = block_matrix(R, [[X11, X12, X13, X14],
                         [cj(X12).transpose(), X22, X14.transpose(), X24],
                         [-cj(X13), cj(X14), cj(X11), -cj(X12)],
                         [cj(X14).transpose(), -cj(X24), -X12.transpose(),
                          cj(X22)]], subdivide=False)
    E = identity_matrix(R, n)
    Z = zero_matrix(R, n)
    S = block_matrix(R, [[Z, -E], [E, Z]], subdivide=False)
    Ik = diagonal_matrix(R, [1] * k + [-1] * l)
    Kk = block_diagonal_matrix(Ik, Ik, subdivide=False)
    return (M.transpose() * S + S * M == 0
            and -Kk * cj(M).transpose() * Kk == M)


# ------------------------------------------------ § 3: formula (11) etc.
def check_section_3_misc():
    # formula (11) (p. 260): X = E, Y = [[2, 1], [1, 2]]
    X = identity_matrix(QQ, 2)
    Y = matrix(QQ, [[2, 1], [1, 2]])
    r = (X * Y.inverse()).trace()
    check(r == QQ(4) / 3, "(3.8): r(E, Y) = tr Y^-1 = 4/3")
    refuted(r == sum(X[i, i] / Y[i, i] for i in range(2)),
            "(3.11) printed r(X, Y) = sum x_i / y_ii")
    Yi = Y.inverse()
    check(r == sum(X[i, i] * Yi[i, i] for i in range(2)),
          "(3.11) corrected: (y_ij) matrix of Y^-1, r = sum x_i y_ii")
    # symbolically for diagonal X, symmetric Y (n = 3)
    R = PolynomialRing(QQ, 'x1,x2,x3,y11,y12,y13,y22,y23,y33')
    x1, x2, x3, y11, y12, y13, y22, y23, y33 = R.gens()
    F = R.fraction_field()
    Ys = matrix(F, [[y11, y12, y13], [y12, y22, y23], [y13, y23, y33]])
    Xs = diagonal_matrix(F, [x1, x2, x3])
    Ysi = Ys.inverse()
    check((Xs * Ysi).trace() == sum(Xs[i, i] * Ysi[i, i] for i in range(3)),
          "(3.11) corrected, symbolic n = 3")
    # the bound of Lemma 1: (Y^-1)_ii >= 1/lambda_max(Y) > 0 (on examples)
    for Yx in (Y, matrix(QQ, [[3, 1, 0], [1, 2, 1], [0, 1, 4]])):
        lmax = max(Yx.change_ring(AA).eigenvalues())
        Yxi = Yx.inverse()
        check(all(AA(Yxi[i, i]) >= 1 / lmax for i in range(Yx.nrows())),
              "Lemma 3.1: (Y^-1)_ii >= 1/lambda_max(Y)")
    # Problem 15: r(A X A^*, A Y A^*) = r(X, Y)
    A = matrix(QQ, [[1, 2], [0, 3]])
    X2 = matrix(QQ, [[5, 1], [1, 1]])
    check(((A * X2 * A.transpose()) * (A * Y * A.transpose()).inverse())
          .trace() == (X2 * Y.inverse()).trace(), "Problem 3.15")
    # Hint 17: log X = diag(1, 0), f(t) = tr(X^t Y^-1) as a polynomial in
    # u = e^t
    P = PolynomialRing(QQ, 'u')
    u = P.gen()
    f = Yi[0, 0] * u + Yi[1, 1]
    refuted(f == u / Y[0, 0] + 1 / Y[1, 1], "Hint 3.17 printed "
            "sum e^(t lambda_i) / y_ii")
    check(f == (QQ(2) / 3) * u + QQ(2) / 3 and all(Yi[i, i] > 0
                                                 for i in range(2)),
          "Hint 3.17 corrected: sum e^(t lambda_i) y_ii, y_ii > 0")
    # Example of 1° (p. 255): b_theta = 2 Re h_tau on g^R, theta = tau
    for n in (2, 3):
        g = gC('sl', n)
        gR = RealAlg("sl%d(C)^R" % n, g.basis + [I * b for b in g.basis], n)
        adC = [g.op(lambda Z, x=x: br(x, Z)) for x in g.basis]
        # the complex Killing form is 2n tr(xy) (checked on the basis)
        check(all((adC[i] * adC[j]).trace()
                  == 2 * n * (g.basis[i] * g.basis[j]).trace()
                  for i in range(len(adC)) for j in range(len(adC))),
              "sl_%d(C): Killing form = 2n tr(xy)" % n)
        kC = lambda x, y: 2 * n * (x * y).trace()
        htau = lambda x, y: -kC(x, tau(y))
        ok, differs = True, False
        for x in gR.h.basis:
            for y in gR.h.basis:
                btheta = -gR.killing(x, tau(y))
                ok = ok and btheta == 2 * list(K(htau(x, y)))[0]
                differs = differs or btheta != htau(x, y)
        check(ok, "§ 3 Example: b_theta = 2 Re h_tau on sl_%d(C)^R" % n)
        refuted(not differs, "§ 3 Example printed b_theta = h_tau, "
                "sl_%d(C)" % n)
    # Hint 18: theta(X) = -X^T (an automorphism of sl_3(R), outer) has
    # det -1 on g; exp ad y (y in p) has det exp(tr ad y) = 1
    g = gC('sl', 3)
    Th = g.op(lambda X: -X.transpose())
    refuted(Th.det() == 1, "Hint 3.18: Ad G subset SL(g) for G = Aut g")
    R3 = REALFORMS[('slR', 3)]
    check(all(A.trace() == 0 for A in [R3.h.op(lambda X, x=x: br(x, X))
                                       for x in R3.p.basis]),
          "Hint 3.18: tr ad y = 0 (y in p), exp ad p in SL(g)")


# ------------------------------------------------ § 2 (pp. 238-254)
def check_section_2_misc():
    # Hint 20 (p. 253) with (3.1.3) (r_*(g) f)(x) = f(x g) and the matrix
    # elements of 3.1, Hint 19: f_j(x g) = sum_i a_ij(g) f_i(x).
    # G = GL_2, f(g) = g_11, V = span(f_1 = x11, f_2 = x12).
    R = PolynomialRing(QQ, 'x11,x12,x21,x22,g11,g12,g21,g22')
    x11, x12, x21, x22, g11, g12, g21, g22 = R.gens()
    x = matrix(R, [[x11, x12], [x21, x22]])
    gg = matrix(R, [[g11, g12], [g21, g22]])
    fs = [lambda m: m[0, 0], lambda m: m[0, 1]]
    xs = [x11, x12]                      # f_1 = x11, f_2 = x12
    xg = x * gg
    # a_ij(g): f_j(x g) = sum_i a_ij(g) f_i(x)
    a = matrix(R, 2, 2, lambda i, j: fs[j](xg).coefficient(xs[i]))
    ok = all(fs[j](xg) == sum(a[i, j] * fs[i](x) for i in range(2))
             for j in range(2))
    check(ok and a == gg, "Hint 2.20: matrix of r_*(g) in (f_1, f_2) is g")
    E2 = identity_matrix(R, 2)
    fe = [fs[k](E2) for k in range(2)]
    check(fs[0](gg) == sum(a[k, 0] * fe[k] for k in range(2)),
          "Hint 2.20 corrected: f(g) = sum a_k1(g) f_k(e)")
    ainv = a.change_ring(R.fraction_field()).inverse()
    for i in range(2):
        refuted(fs[0](gg) == sum(ainv[k, i] * fe[k] for k in range(2)),
                "Hint 2.20 printed f(g) = sum a_ki(g^-1) f_k(e), i = %d"
                % (i + 1))
    # Lemma 2, Problems 13, 14 (pp. 242-243): G = A x| L_0, a section psi
    # with a nontrivial factor set f (5); h of Problem 14 satisfies (8) and
    # phi = h psi is a homomorphism.  L_0 = Z/2 on Q (sign) and
    # L_0 = Z/2 x Z/2 on Q^2 (diagonal signs), psi with arbitrary shifts.
    cases = []
    L1 = [0, 1]
    cases.append((L1, lambda x, y: (x + y) % 2,
                  lambda x: matrix(QQ, [[(-1) ** x]]),
                  {0: vector(QQ, [5]), 1: vector(QQ, [1])}))
    L2 = [(0, 0), (0, 1), (1, 0), (1, 1)]
    cases.append((L2, lambda x, y: ((x[0] + y[0]) % 2, (x[1] + y[1]) % 2),
                  lambda x: diagonal_matrix(QQ, [(-1) ** x[0],
                                                 (-1) ** (x[0] + x[1])]),
                  {(0, 0): vector(QQ, [1, 2]), (0, 1): vector(QQ, [3, -1]),
                   (1, 0): vector(QQ, [0, 7]), (1, 1): vector(QQ, [2, 2])}))
    for L0, mul, R0, v in cases:
        # G = A x| L_0 with (a, l)(b, m) = (a + R0(l) b, l m); psi(x) =
        # (v_x, x); (5): psi(x) psi(y) = f(x, y) psi(x y), additively
        f = {(x_, y_): v[x_] + R0(x_) * v[y_] - v[mul(x_, y_)]
             for x_ in L0 for y_ in L0}
        check(all(f[(x_, mul(y_, z_))] + R0(x_) * f[(y_, z_)]
                  == f[(mul(x_, y_), z_)] + f[(x_, y_)]
                  for x_ in L0 for y_ in L0 for z_ in L0),
              "Problem 2.13: cocycle identity")
        hh = {x_: -sum((f[(x_, y_)] for y_ in L0), 0 * v[L0[0]]) / len(L0)
              for x_ in L0}
        check(all(f[(x_, y_)] == hh[mul(x_, y_)] - hh[x_] - R0(x_) * hh[y_]
                  for x_ in L0 for y_ in L0),
              "Problem 2.14: h satisfies (8)")
        refuted(all(f[(x_, y_)] == hh[y_] - hh[x_] - R0(x_) * hh[y_]
                    for x_ in L0 for y_ in L0),
                "(2.6) printed with h(y) in place of h(x y)")
        phi = {x_: hh[x_] + v[x_] for x_ in L0}
        check(all(phi[x_] + R0(x_) * phi[y_] == phi[mul(x_, y_)]
                  for x_ in L0 for y_ in L0),
              "Lemma 2.2: phi = h psi is a homomorphism")
    # Theorem 2.1: polar decompositions over AA of elements of self-adjoint
    # algebraic groups; k, p lie in G
    S4 = matrix(QQ, [[0, 0, -1, 0], [0, 0, 0, -1], [1, 0, 0, 0],
                     [0, 1, 0, 0]])
    I12 = diagonal_matrix(QQ, [1, -1, -1])
    boost = matrix(QQ, [[5, 4, 0], [4, 5, 0], [0, 0, 3]]) / 3
    rot3 = matrix(QQ, [[5, 0, 0], [0, 3, -4], [0, 4, 3]]) / 5
    # Sp_4(R): k1 D k2 with k1, k2 in Sp_4 cap O_4 (from unitary 2 x 2
    # matrices A + iB -> (A, -B; B, A)) and D = diag(2, 3, 1/2, 1/3), so
    # that g^T g has rational eigenvalues (AA stays small)
    A1 = matrix(QQ, [[3, -4], [4, 3]]) / 5
    Z2 = zero_matrix(QQ, 2)
    k1 = block_matrix(QQ, [[A1, Z2], [Z2, A1]], subdivide=False)
    A2, B2 = diagonal_matrix(QQ, [QQ(3) / 5, 1]), diagonal_matrix(
        QQ, [QQ(4) / 5, 0])
    k2 = block_matrix(QQ, [[A2, -B2], [B2, A2]], subdivide=False)
    D4 = diagonal_matrix(QQ, [2, 3, QQ(1) / 2, QQ(1) / 3])
    samples = [("SL_2(R)", matrix(QQ, [[2, 1], [3, 2]]),
                lambda m: m.det() == 1),
               ("Sp_4(R)", k1 * D4 * k2,
                lambda m: m.transpose() * S4 * m == S4),
               ("SO_(1,2)", boost * rot3,
                lambda m: m.transpose() * I12 * m == I12 and m.det() == 1)]
    for name, gq, inG in samples:
        check(inG(gq), "Theorem 2.1: sample in " + name)
        q = (gq.transpose() * gq).change_ring(AA)
        ev = q.eigenvectors_right()
        cols, vals = [], []
        for lam, vecs, mult in ev:
            # orthonormal basis of the eigenspace (Gram-Schmidt over AA)
            basis = []
            for w in vecs:
                w = vector(AA, w)
                for b in basis:
                    w = w - (w * b) * b
                w = w / w.norm()
                basis.append(w)
            cols += basis
            vals += [lam] * len(basis)
        U = matrix(AA, cols).transpose()
        p = U * diagonal_matrix(AA, [x.sqrt() for x in vals]) * \
            U.transpose()
        kk = gq.change_ring(AA) * p.inverse()
        n = gq.nrows()
        check(p * p == q and p == p.transpose() and all(x > 0 for x in vals)
              and kk.transpose() * kk == identity_matrix(AA, n)
              and kk * p == gq.change_ring(AA),
              "Theorem 2.1: g = k p over AA in " + name)
        check(inG(kk) and inG(p), "Theorem 2.1: k, p in " + name)
    # § 4, Example (p. 276): Iwasawa of SL_3(R) by Cholesky of g^T g
    g3 = (matrix(QQ, [[2, 1, 0], [1, 1, 0], [0, 0, 1]])
          * matrix(QQ, [[1, 0, 0], [0, 1, 2], [0, 1, 3]])).change_ring(AA)
    Lc = (g3.transpose() * g3).cholesky()
    Rr = Lc.transpose()
    kk = g3 * Rr.inverse()
    a_ = diagonal_matrix(AA, [Rr[i, i] for i in range(3)])
    nn = a_.inverse() * Rr
    check(kk.transpose() * kk == identity_matrix(AA, 3) and kk.det() == 1
          and all(Rr[i, j] == 0 for i in range(3) for j in range(i))
          and all(Rr[i, i] > 0 for i in range(3)) and Rr.det() == 1
          and all(nn[i, i] == 1 for i in range(3)) and kk * a_ * nn == g3,
          "§ 4 Example: SL_3(R) = SO_3 A N (Gram-Schmidt)")


def check_exercises_9_10():
    """Exercises 1.9, 1.10 (p. 235), as counted from the scalar ambiguity of
    Ad: Q Int = {Ad g: g in G(C), conj(g) = c g}.  sl_n(R): Q Int =
    PGL_n(R), two components iff det(-E_n) > 0 (n even).  so_(p,q):
    c = +-1; c = 1 gives SO_(p,q) (2 components, p, q > 0) modulo -E, which
    lies in SO^0 iff det(-E_p) > 0 (the p x p block criterion); c = -1
    needs g = i h, h real, h^T I h = -I (only p = q; h = swap, and
    det(i h) = 1).  Only these steps are computed."""
    for n in range(2, 9):
        comps = 1 if (-identity_matrix(QQ, n)).det() < 0 else 2
        check(comps == (2 if n % 2 == 0 else 1),
              "Exercise 1.9: Q Int sl_%d(R) has %d component(s)" % (n, comps))
    table = {"odd": 2, "even_ne": 2, "even_eq": 4, "odd_ne": 1, "odd_eq": 2}
    for p in range(1, 6):
        for q in range(p, 7):
            n = p + q
            Ipq = diagonal_matrix(QQ, [1] * p + [-1] * q)
            base = 2
            if n % 2 == 0:
                in_id = (-identity_matrix(QQ, p)).det() > 0
                base = 2 if in_id else 1
                if p == q:
                    h = block_matrix(QQ, [[0, identity_matrix(QQ, p)],
                                          [identity_matrix(QQ, p), 0]],
                                     subdivide=False)
                    ok = (h.transpose() * Ipq * h == -Ipq
                          and K(I) ** n * h.det() == 1)
                    base *= 2 if ok else 1
            key = ("odd" if n % 2 else
                   ("even" if p % 2 == 0 else "odd")
                   + ("_eq" if p == q else "_ne"))
            check(base == table[key],
                  "Exercise 1.10: so_(%d,%d): %d components" % (p, q, base))


def main():
    t0 = time.time()
    check_theorems_5_6()
    check_lattices()
    check_exceptional_lattices()
    check_real_forms()
    check_exercise_1_15()
    check_section_1_examples()
    check_section_3_misc()
    check_section_2_misc()
    check_exercises_9_10()
    for x in TABLE10_FAILS:
        print("Table 10 (not this chapter; see tables-9-10.py):", x)
    sha = hashlib.sha256(open(__file__, 'rb').read()).hexdigest()[:12]
    print("Sage %s, script %s, %.0f s, %d refuted printed readings"
          % (SAGE_VERSION, sha, time.time() - t0, REFUTED))
    print("ok chapter-5: %d checks" % N_CHECKS)


if __name__ == "__main__":
    main()
