"""Exact checks of Chapter 4, "Complex Semisimple Lie Groups" (Sage).

Onishchik, Vinberg, *Lie Groups and Algebraic Groups* (Springer, 1990),
Chapter 4, printed pp. 136-220.  Our files: content/40-complex-semisimple.typ,
41-preliminaries.typ, 42-root-systems.typ, 42-root-systems-2.typ,
43-existence-uniqueness.typ, 44-automorphisms.typ.

Expected values are the book's, written in the script as literals taken
from the printed book (matrices of Examples 4-8 of 1.5 deg, the table of Problem 2.8,
Fig. 1, the table of Exercise 2.9, the drawn Dynkin diagrams, the black
vertices of Exercise 3.13, the formulas of the hints); the chapter files are
not parsed.  Check messages name the statement ("Problem 2.53" = § 2,
Problem 53).  Where the book was corrected the printed reading is kept as a
refuted check.  Computations are exact (QQ, ZZ, QQ(sqrt 3), QQ(sqrt 2,
sqrt 3) with a real embedding, cyclotomic fields, QQbar for cosines).

4.1 (pp. 136-152)
  * Examples 4-8 (gl_2..5, sl_2..5, so_4..9 = so_2l, so_2l+1, sp_2..6):
    the printed block forms are the Lie algebras of the forms J; t_g; every
    printed root vector is in g with the printed root; dim g = dim t + |Delta|;
    Phi_Id; every printed h_alpha recomputed from (3), (5) with (X, Y) = tr XY;
    formula (6); Problem 34 (h_alpha integral).
  * 6 deg: [e_a, e_-a] = h_a etc. for every root (printed "-2 e_alpha"
    refuted), Problem 30, n_alpha = exp e exp(-f) exp e with Problems 36, 37
    and Theorem 5; Killing form proportional to tr XY and nondegenerate
    (Exercise 2, Theorem 1); the corrected "C u_lambda in t".
  * Problems 40-43 and Exercises 27, 28 for every root and weight of eight
    representations (adjoint sl_3, sl_3 adjoint (x) adjoint, standard so_5,
    so_5 standard (x) adjoint, sp_4 standard (x) standard, adjoint so_7,
    adjoint G_2, adjoint B_2); the repaired Hint 41 (direct sum, invariance,
    s = p + q, rho(e_-a) rho(e_a)^k v = -k(mu(h_a) + k - 1) rho(e_a)^(k-1) v);
    the printed Hint 41 refuted.
4.2 (pp. 153-181)
  * For A_1..A_8, B_2..B_8, C_3..C_8, D_4..D_8, E_6-8, F_4, G_2: Problems 9,
    10, 11, 24, 46, 47, formula (1), Exercises 5, 8, 9 (corrected table,
    printed one refuted for l >= 3), 10, 11, 12, 16, 18, 19, 28; Exercise
    3.6 (nu = -w_0) and the parity rule of Exercise 3.13 for these types.
  * Fig. 1 (Problems 2-4, Example 1), Problem 8 table (exact cosines),
    Example 2 (bases of the classical algebras for the lexicographic order;
    so_4 decomposable), Theorem 7 (number of bases = |W| for A_2, B_2, G_2,
    A_3, B_3, C_3, A_4, D_4), Exercises 6 and 13 on every element of W(A_3,
    B_3, C_3, D_4, G_2, A_4, B_4, F_4), the GL_n example (W = S_n, n <= 5),
    B+ upper triangular ("nil-triangular" refuted), Problem 41 / Theorem 10
    with the counterexamples O_2(C) and {diag(t, +-1)} (need G connected).
  * Theorem 12 by exhaustive enumeration of all connected admissible
    matrices with <= 9 vertices (see enumerate_admissible for the exact
    PSD test and why the search is complete): the Dynkin ones are A-G, the
    affine ones L^(1), A_(2l-1)^(2), A_(2l)^(2), D_(l+1)^(2), E_6^(2),
    D_4^(3), in agreement with Sage's affine types; (D1)-(D8), Corollary of
    Theorem 11, Problems 51-55 (printed Problem 53 refuted by A_1 + A_1),
    Proposition 1 with its angle sums, Examples 3-5 as drawn against the
    constructions (alpha_0 pinned, adjoined root = lowest short root),
    Problem 56 (l <= 16), Problem 57 (printed 7-vertex E_7^(1) refuted),
    Problem 59.
  * BC_l (l <= 6), Problems 60-62, Theorem 14 (doubling W-orbits of every
    type of rank <= 5); formula (6), Problems 65, 66 (P/Q from Smith forms,
    cyclic unless D_2s) for ranks <= 12; Exercises 36, 39 (all three
    conditions), 42 (maximality iff n_i prime), 43 for ranks <= 8.
4.3 (pp. 181-201)
  * The printed ideal of the free Lie algebra (degree-2 part) refuted, the
    corrected one confirmed; relations (2) with a_ij = <alpha_i|alpha_j>,
    Serre relations with exponent 1 - a_ij (least possible; printed
    1 - a_ji refuted in every non-simply-laced type) for ranks <= 8;
    Problem 1.42 and generation by h_i, e_i, f_i (small types).
  * sl_2 example (k <= 8), Exercises 10, 11 (invariant forms of R_k).
  * V(Lambda) = V^/M^(Lambda) built literally from formulas (7) and the
    recursion of Exercise 3 (lambda != Lambda) for 10 modules: weight
    multiplicities equal Sage's; Problems 19, 20, 28, 34, Theorem 4; the
    printed rule (lambda = Lambda allowed) refuted.
  * Theorems 5, 7, 8, Problem 2.67, Exercises 26, 29 for SL_2-6, Sp_2-8,
    SO_3-9, SO_4-10 (book matrices); Example 2 of 5 deg (D_4..D_10);
    Exercises 34, 36 (Spin_5..16); Exercises 27, 28 (characters);
    Exercises 5, 7, 12, 13 by Frobenius-Schur indicators of fundamental
    representations of dimension <= 400.
4.4 (pp. 202-220)
  * Aut Pi (Theorem 1, 6 deg), D_4: S_3 with two classes.
  * tau-hat built on Sage's Chevalley basis for A_2..A_7, D_4..D_6, E_6
    (order 2) and D_4 (order 3), checked to be an automorphism of order k;
    Problems 17, 28, 30, 44-49 (the fixed algebra, the unique lowest
    weight of ad_(1/k), Pi^tau, marks n_j, the diagram L^(k)); formula (9)
    and Problem 61 (corrected l - t; printed n - t refuted) for all Kac
    coordinates of small order, also for 8 inner cases.
  * tau = id, ranks <= 8: Exercise 6 (corrected vertex list; printed one
    refuted), Problem 43, Exercises 15, 16; Exercise 3 and Problem 41 for
    ranks <= 4.

Not established: none of the general theorems is proved here.  Checks over
types are exhaustive only for the listed types and ranks; the enumeration
of admissible matrices covers <= 9 vertices; representation-level checks
cover the listed representations; Sage's LieAlgebra, WeylGroup,
WeylCharacterRing and CartanType are trusted as independent computations
(ambient-space root systems, Chevalley bases, characters).  The literals of
figures and diagrams were read off the printed figures; nothing here
compares our Typst text with the printed book.

Run with:  sage -python checks/sage/chapter-4.py
"""
import itertools


from sage.all import (
    AA, QQ, ZZ, QQbar, CyclotomicField, DiGraph, FreeModule, LieAlgebra,
    NumberField, PolynomialRing, QuadraticField, RootSystem, WeylCharacterRing,
    WeylGroup, block_matrix, factorial, gcd,
    identity_matrix, lcm, matrix, prod, vector, zero_matrix,
)

SCOPE = 'chapter-4'
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
# General helpers: Cartan matrices in the book's convention
# ---------------------------------------------------------------------------
#
# The book (2.5 deg) writes a_ij = <gamma_i|gamma_j> = 2(gamma_i, gamma_j) /
# (gamma_j, gamma_j).  Sage's cartan_matrix() is the transpose.  Everything
# below is computed from vectors with the book's formula, so no convention of
# Sage enters the expected values.

def pairing(x, y):
    """<x|y> = 2(x, y)/(y, y) (2.1 deg) for vectors with the dot product."""
    return 2 * (x * y) / (y * y)


def book_cartan(vectors):
    """The matrix A(Gamma) of 2.5 deg: a_ij = <gamma_i|gamma_j>."""
    n = len(vectors)
    return matrix(QQ, n, n, lambda i, j: pairing(vectors[i], vectors[j]))


def ambient(ct):
    """Simple roots (in Sage's numbering) and all roots of a finite type."""
    R = RootSystem(ct).ambient_space()
    simple = [vector(QQ, list(R.simple_root(i).to_vector()))
              for i in R.index_set()]
    roots = [vector(QQ, list(a.to_vector())) for a in R.roots()]
    return simple, roots


def coords(simple, v):
    """Coordinates of v in the basis `simple` (exact)."""
    S = matrix(QQ, simple)
    return S.solve_left(v)


def roots_from_cartan(A):
    """All roots, in simple-root coordinates, of the finite root system with
    book-convention Cartan matrix A: the orbit of the simple roots under the
    reflections s_i(b) = b - <b|a_i> a_i, <b|a_i> = sum_j b_j a_ji."""
    n = A.nrows()
    simple = [tuple(1 if j == i else 0 for j in range(n)) for i in range(n)]
    seen = set(simple)
    todo = list(simple)
    while todo:
        b = todo.pop()
        for i in range(n):
            c = sum(b[j] * A[j, i] for j in range(n))
            nb = tuple(b[j] - (c if j == i else 0) for j in range(n))
            if nb not in seen:
                seen.add(nb)
                todo.append(nb)
                assert len(seen) < 10 ** 5, 'not a finite type'
    return sorted(seen)


def components(A):
    """Index sets of the connected components of the diagram of A."""
    n = A.nrows()
    comp, seen = [], set()
    for s in range(n):
        if s in seen:
            continue
        c, todo = [], [s]
        seen.add(s)
        while todo:
            i = todo.pop()
            c.append(i)
            for j in range(n):
                if j not in seen and A[i, j] != 0:
                    seen.add(j)
                    todo.append(j)
        comp.append(sorted(c))
    return comp


def length_squares(A):
    """Relative squared lengths d_i of the simple roots of a connected
    admissible diagram without cycles: d_i/d_j = a_ij/a_ji."""
    n = A.nrows()
    d = {0: QQ(1)}
    todo = [0]
    while todo:
        i = todo.pop()
        for j in range(n):
            if A[i, j] != 0 and i != j and j not in d:
                d[j] = d[i] * A[j, i] / A[i, j]
                todo.append(j)
    return [d[i] for i in range(n)]


def type_name(A):
    """Name of a finite (possibly decomposable) Cartan matrix, found by
    counting roots and root lengths of each component: sorted list such as
    ['A1', 'A1'] or ['D4'].  B2 = C2 is called 'B2', D3 = A3 'A3'."""
    names = []
    for c in components(A):
        Ac = A.matrix_from_rows_and_columns(c, c)
        l = len(c)
        rts = roots_from_cartan(Ac)
        N = len(rts)
        d = length_squares(Ac)
        G = matrix(QQ, l, l, lambda i, j: Ac[i, j] * d[j] / 2)
        lens = [vector(QQ, r) * G * vector(QQ, r) for r in rts]
        short = min(lens)
        nshort = sum(1 for x in lens if x == short)
        two = nshort != N
        if not two and N == l * (l + 1):
            names.append('A%d' % l)
        elif not two and l >= 4 and N == 2 * l * (l - 1):
            names.append('D%d' % l)
        elif not two and (l, N) in ((6, 72), (7, 126), (8, 240)):
            names.append('E%d' % l)
        elif two and (l, N) == (4, 48):
            names.append('F4')
        elif two and (l, N) == (2, 12):
            names.append('G2')
        elif two and N == 2 * l * l and nshort == 2 * l:
            names.append('B%d' % l)
        elif two and N == 2 * l * l and N - nshort == 2 * l:
            names.append('C%d' % l)
        else:
            raise ValueError('unknown type %s' % A)
    return sorted(names)


def matrix_digraph(A):
    """The Dynkin diagram of an admissible matrix as a digraph with edge
    labels a_ij (i != j, a_ij != 0); isomorphism of these digraphs is
    isomorphism of the matrices up to one permutation of rows and columns."""
    n = A.nrows()
    D = DiGraph(n, loops=False, multiedges=False)
    for i in range(n):
        for j in range(n):
            if i != j and A[i, j] != 0:
                D.add_edge(i, j, int(A[i, j]))
    return D


def matrix_key(A, pinned=None):
    """Canonical form of A up to simultaneous permutation of rows and
    columns (optionally keeping the vertex `pinned` fixed)."""
    D = matrix_digraph(A)
    n = A.nrows()
    if pinned is None:
        C = D.canonical_label(edge_labels=True)
    else:
        part = [[pinned], [i for i in range(n) if i != pinned]]
        part = [p for p in part if p]
        C = D.canonical_label(partition=part, edge_labels=True)
    return (n, pinned is not None,
            tuple(sorted(C.edges(labels=True, sort=True))))


def diagram_automorphisms(A):
    """All permutations p with a_(p(i) p(j)) = a_ij."""
    D = matrix_digraph(A)
    G = D.automorphism_group(edge_labels=True)
    auts = []
    for g in G:
        auts.append(tuple(g(i) for i in range(A.nrows())))
    return auts


def orthogonality_connected(vs):
    """Is the system indecomposable (2.1 deg): the graph with an edge when
    (a, b) != 0 is connected."""
    n = len(vs)
    seen, todo = {0}, [0]
    while todo:
        i = todo.pop()
        for j in range(n):
            if j not in seen and vs[i] * vs[j] != 0:
                seen.add(j)
                todo.append(j)
    return len(seen) == n


def is_base(simple, roots):
    """Pi is a base (2.2 deg): linearly independent and every root is an
    integral combination with coefficients of one sign."""
    S = matrix(QQ, simple)
    if S.rank() != len(simple):
        return False
    for r in roots:
        try:
            c = S.solve_left(r)
        except ValueError:
            return False
        if not all(x in ZZ for x in c):
            return False
        if not (all(x >= 0 for x in c) or all(x <= 0 for x in c)):
            return False
    return True


def positive_from_base(simple, roots):
    S = matrix(QQ, simple)
    return [r for r in roots if all(x >= 0 for x in S.solve_left(r))]


def highest_root(simple, roots):
    """The unique maximal root (Problem 47): the positive root of largest
    height; uniqueness is asserted separately."""
    S = matrix(QQ, simple)
    pos = positive_from_base(simple, roots)
    return max(pos, key=lambda r: sum(S.solve_left(r)))


def is_root_system(roots):
    """Axioms 1)-3) of 2.1 deg for a finite set of vectors."""
    rs = set(tuple(r) for r in roots)
    for a in roots:
        if a.is_zero():
            return False
        for b in roots:
            c = pairing(b, a)
            if c not in ZZ:
                return False
            if tuple(b - c * a) not in rs:
                return False
    return True


def is_reduced(roots):
    rs = set(tuple(r) for r in roots)
    for a in roots:
        for c in (2, QQ(1) / 2):
            if tuple(c * a) in rs:
                return False
    return True


# ---------------------------------------------------------------------------
# 4.1 Preliminaries: the classical matrix algebras of 1.5 deg
# ---------------------------------------------------------------------------

def E(n, i, j):
    """Matrix unit E_ij (1-based, as in the book)."""
    M = zero_matrix(QQ, n, n)
    M[i - 1, j - 1] = 1
    return M


def diag_at(n, entries):
    """diag with the given {position: value} (1-based)."""
    M = zero_matrix(QQ, n, n)
    for p, x in entries.items():
        M[p - 1, p - 1] = x
    return M


def solution_space(J):
    """Basis of {X : X^T J + J X = 0} (the Lie algebra of the form J)."""
    n = J.nrows()
    rows = []
    units = [E(n, i, j) for i in range(1, n + 1) for j in range(1, n + 1)]
    # linear map X -> X^T J + J X, as a matrix on the coordinates of X
    cols = [(U.transpose() * J + J * U).list() for U in units]
    M = matrix(QQ, cols).transpose()
    K = M.right_kernel()
    for v in K.basis():
        rows.append(sum(c * U for c, U in zip(v, units)))
    return rows


def span_of(mats):
    return matrix(QQ, [m.list() for m in mats]).row_space()


def classical(kind, l):
    """The book's realization (Examples 4-8 of 1.5 deg) of gl_n, sl_n
    (n = l + 1 for sl, n = l for gl), so_2l, so_2l+1, sp_2l.

    Returns a dict: n, J (form or None), t (basis of t_g), eps (list of
    functions t -> QQ, the weights epsilon_i), roots: list of (name,
    coefficient vector in the epsilon_i, root vector as printed, h_alpha as
    printed)."""
    data = {}
    if kind in ('gl', 'sl'):
        n = l if kind == 'gl' else l + 1
        data['n'] = n
        data['J'] = None
        if kind == 'gl':
            data['t'] = [E(n, i, i) for i in range(1, n + 1)]
        else:
            data['t'] = [E(n, i, i) - E(n, i + 1, i + 1) for i in range(1, n)]
        data['eps'] = [(lambda H, i=i: H[i - 1, i - 1])
                       for i in range(1, n + 1)]
        roots = []
        for i in range(1, n + 1):
            for j in range(1, n + 1):
                if i != j:
                    c = [0] * n
                    c[i - 1], c[j - 1] = 1, -1
                    roots.append(('alpha_%d%d' % (i, j), c, E(n, i, j),
                                  diag_at(n, {i: 1, j: -1})))
        data['roots'] = roots
        return data
    n = 2 * l if kind in ('so_even', 'sp') else 2 * l + 1
    data['n'] = n
    I = identity_matrix(QQ, l)
    Z = zero_matrix(QQ, l)
    if kind == 'so_even':
        J = block_matrix([[Z, I], [I, Z]])
    elif kind == 'sp':
        J = block_matrix([[Z, I], [-I, Z]])
    else:
        J = block_matrix([[Z, I, zero_matrix(QQ, l, 1)],
                          [I, Z, zero_matrix(QQ, l, 1)],
                          [zero_matrix(QQ, 1, l), zero_matrix(QQ, 1, l),
                           identity_matrix(QQ, 1)]])
    data['J'] = matrix(QQ, J)
    data['t'] = [E(n, i, i) - E(n, l + i, l + i) for i in range(1, l + 1)]
    data['eps'] = [(lambda H, i=i: H[i - 1, i - 1]) for i in range(1, l + 1)]
    roots = []
    sign = 1 if kind == 'sp' else -1
    for i in range(1, l + 1):
        for j in range(1, l + 1):
            if i != j:
                c = [0] * l
                c[i - 1], c[j - 1] = 1, -1
                roots.append(('alpha_%d%d' % (i, j), c,
                              E(n, i, j) - E(n, l + j, l + i),
                              diag_at(n, {i: 1, l + j: 1, j: -1, l + i: -1})))
    for i in range(1, l + 1):
        for j in range(i, l + 1):
            if i == j and kind != 'sp':
                continue
            c = [0] * l
            c[i - 1] += 1
            c[j - 1] += 1
            if i == j:   # sp only: beta_ii = 2 eps_i
                ev = E(n, i, l + j) + E(n, j, l + i)
                emv = E(n, l + i, j) + E(n, l + j, i)
                h = diag_at(n, {i: 1, l + i: -1})
            else:
                ev = E(n, i, l + j) + sign * E(n, j, l + i)
                emv = E(n, l + i, j) + sign * E(n, l + j, i)
                h = diag_at(n, {i: 1, j: 1, l + i: -1, l + j: -1})
            roots.append(('beta_%d%d' % (i, j), c, ev, h))
            roots.append(('-beta_%d%d' % (i, j), [-x for x in c], emv, -h))
    if kind == 'so_odd':
        m = 2 * l + 1
        for i in range(1, l + 1):
            c = [0] * l
            c[i - 1] = 1
            h = diag_at(n, {i: 2, l + i: -2})
            roots.append(('eps_%d' % i, c, E(n, i, m) - E(n, m, l + i), h))
            roots.append(('-eps_%d' % i, [-x for x in c],
                          E(n, l + i, m) - E(n, m, i), -h))
    data['roots'] = roots
    return data


def trace_form_u(data, coeff):
    """u_lambda in t with (u_lambda, H) = tr(u_lambda H) = lambda(H) for all
    H in t (formula (3)); lambda = sum coeff_i eps_i."""
    t = data['t']
    G = matrix(QQ, len(t), len(t), lambda a, b: (t[a] * t[b]).trace())
    lam = vector(QQ, [sum(c * e(H) for c, e in zip(coeff, data['eps']))
                      for H in t])
    x = G.solve_right(lam)
    return sum(xi * H for xi, H in zip(x, t))


def weight_of(data, coeff, H):
    return sum(c * e(H) for c, e in zip(coeff, data['eps']))


def nil_exp(X):
    """exp X for a nilpotent matrix (a finite sum, exact)."""
    n = X.nrows()
    assert (X ** n).is_zero()
    S = identity_matrix(X.base_ring(), n)
    P = S
    for k in range(1, n):
        P = P * X / k
        S = S + P
    return S


def section_4_1_classical():
    """Examples 4-8 of 1.5 deg (printed pp. 145-147) and the
    three-dimensional subalgebras of 1.6 deg (pp. 147-148)."""
    cases = ([('gl', n) for n in range(2, 6)]
             + [('sl', l) for l in range(1, 5)]
             + [('so_even', l) for l in range(2, 5)]
             + [('so_odd', l) for l in range(1, 4)]
             + [('sp', l) for l in range(1, 4)])
    for kind, l in cases:
        d = classical(kind, l)
        n, J, t = d['n'], d['J'], d['t']
        tag = '%s(l=%d)' % (kind, l)
        if J is None:
            gbasis = [E(n, i, j) for i in range(1, n + 1)
                      for j in range(1, n + 1) if i != j] + t
        else:
            gbasis = solution_space(J)
            # the block description printed in Examples 6-8:
            # (X, Y; Z, -X^T), Y^T = -Y, Z^T = -Z (so), Y, Z symmetric (sp)
            l_ = l
            O = zero_matrix(QQ, l_)
            blocks = []
            for i in range(1, l_ + 1):
                for j in range(1, l_ + 1):
                    Xm = E(l_, i, j)
                    blocks.append(block_matrix([[Xm, O],
                                                [O, -Xm.transpose()]]))
            sgn = 1 if kind == 'sp' else -1
            for i in range(1, l_ + 1):
                for j in range(i, l_ + 1):
                    if i == j and kind != 'sp':
                        continue
                    Y = E(l_, i, j) + sgn * E(l_, j, i) if i != j \
                        else E(l_, i, i)
                    blocks.append(block_matrix([[O, Y], [O, O]]))
                    blocks.append(block_matrix([[O, O], [Y, O]]))
            blocks = [matrix(QQ, b) for b in blocks]
            if kind == 'so_odd':
                big = []
                for b in blocks:
                    Mb = zero_matrix(QQ, n, n)
                    Mb.set_block(0, 0, b)
                    big.append(Mb)
                for i in range(1, l_ + 1):
                    # U = e_i: last column i-th entry, last row -U^T in the
                    # columns l+1..2l;  V = e_i: last column (l+i)-th entry,
                    # last row -V^T in the columns 1..l.
                    big.append(E(n, i, n) - E(n, n, l_ + i))
                    big.append(E(n, l_ + i, n) - E(n, n, i))
                blocks = big
            check(span_of(blocks) == span_of(gbasis),
                  '1.5 Examples 6-8 (pp. 146-147): the printed block form is '
                  'the Lie algebra of the form J, %s' % tag)
        dim_g = span_of(gbasis).dimension()
        roots = d['roots']
        # t_g consists of diagonal matrices of g and is its own centralizer
        gspan = span_of(gbasis)
        check(all(H.is_diagonal() and vector(QQ, H.list()) in gspan
                  for H in t),
              '1.5: the printed t_g consists of diagonal matrices of g, %s'
              % tag)
        diag_part = span_of([X for X in gbasis]).intersection(
            span_of([E(n, i, i) for i in range(1, n + 1)]))
        check(diag_part == span_of(t),
              '1.5: t_g is all of the diagonal part of g, %s' % tag)
        check(dim_g == len(t) + len(roots),
              '1.5: g = t_g + the printed root spaces (dimension %d), %s'
              % (dim_g, tag))
        for name, c, ev, h in roots:
            check(J is None or (ev.transpose() * J + J * ev).is_zero(),
                  '1.5: root vector of %s lies in g, %s' % (name, tag))
            check(all(H * ev - ev * H == weight_of(d, c, H) * ev for H in t),
                  '1.5: [H, e] = %s(H) e on t_g, %s' % (name, tag))
            if kind == 'sl':
                continue      # h_alpha of sl_n: see below (same as gl_n)
            u = trace_form_u(d, c)
            aa = weight_of(d, c, u)
            check(aa > 0 and 2 * u / aa == h,
                  '1.4 (5) with (X, Y) = tr XY: h_%s is the printed matrix, %s'
                  % (name, tag))
            check(all(weight_of(d, c2, h) == 2 * weight_of(d, c2, u) / aa
                      for _, c2, _, _ in roots),
                  '1.4 (6): mu(h_lambda) = 2(mu, lambda)/(lambda, lambda), '
                  '%s, %s' % (name, tag))
        if kind == 'sl':
            # "The subspaces g_alpha and vectors h_alpha are the same as in
            # Example 4": h_alpha computed inside the traceless t_g
            for name, c, ev, h in roots:
                u = trace_form_u(d, c)
                aa = weight_of(d, c, u)
                check(2 * u / aa == h,
                      '1.5 Example 5: h_%s of sl_%d equals that of gl_%d'
                      % (name, n, n))
        # distinct roots, each with a one-dimensional root space (Thm 6)
        coeffs = [tuple(c) for _, c, _, _ in roots]
        check(len(set(coeffs)) == len(coeffs),
              '1.5: the printed roots are distinct, so each root space is '
              'the printed line (Theorem 6), %s' % tag)
        # Phi_Id: the standard basis vectors are weight vectors
        if kind in ('so_even', 'so_odd', 'sp'):
            wts = sorted(set(tuple(H[p, p] for H in t) for p in range(n)))
            exp_w = set()
            for i in range(l):
                v = [0] * l
                v[i] = 1
                exp_w.add(tuple(v))
                exp_w.add(tuple(-x for x in v))
            if kind == 'so_odd':
                exp_w.add(tuple([0] * l))
            check(set(wts) == exp_w,
                  '1.5 Examples 6-8: Phi_Id = {+-eps_i}%s, %s'
                  % (' and 0' if kind == 'so_odd' else '', tag))
        # h_alpha in t(Z): integer diagonal (Problem 34)
        check(all(all(x in ZZ for x in h.diagonal()) for _, _, _, h in roots),
              'Problem 34 (p. 148): h_alpha in t(Z) (integer diagonal '
              'matrices), %s' % tag)
        # three-dimensional subalgebras (1.6 deg) and n_alpha
        by_c = {tuple(c): (ev, h) for _, c, ev, h in roots}
        for name, c, ev, h in roots:
            emv0, _ = by_c[tuple(-x for x in c)]
            u = trace_form_u(d, c)
            aa = weight_of(d, c, u)
            s = (ev * emv0).trace()
            check(s != 0, 'Problem 27: (g_alpha, g_-alpha) != 0, %s' % tag)
            emv = emv0 * (2 / aa) / s        # (e_alpha, e_-alpha) = 2/(a, a)
            br = ev * emv - emv * ev
            check(br == h and h * ev - ev * h == 2 * ev
                  and h * emv - emv * h == -2 * emv,
                  '1.6 (p. 147): [e_a, e_-a] = h_a, [h_a, e_a] = 2 e_a, '
                  '[h_a, e_-a] = -2 e_-a for %s, %s' % (name, tag))
            refuted(h * emv - emv * h == -2 * ev,
                    '1.6 printed [h_a, e_-a] = -2 e_a for %s, %s'
                    % (name, tag))
            check(br == (ev * emv).trace() * u
                  and br == QQ(1) / 2 * (ev * emv).trace() * aa * h,
                  'Problem 30: [x, y] = (x, y) u_a = 1/2 (x, y)(a, a) h_a, '
                  '%s, %s' % (name, tag))
            # n_alpha = F_alpha((0, 1; -1, 0)) = exp(e) exp(-f) exp(e)
            na = nil_exp(ev) * nil_exp(-emv) * nil_exp(ev)
            ni = na.inverse()
            conj = [na * H * ni for H in t]
            check(all(C.is_diagonal() for C in conj),
                  'Problem 37: n_a T n_a^-1 = T (Ad n_a keeps t), %s %s'
                  % (name, tag))
            check(na * h * ni == -h,
                  'Problem 36: (Ad n_a) h_a = -h_a, %s %s' % (name, tag))
            # Ad n_a on t(R) is the orthogonal reflection r_a
            ok = True
            for H in t:
                refl = H - weight_of(d, c, H) * h
                ok = ok and (na * H * ni == refl)
            check(ok, 'Problem 37: Ad n_a | t(R) = r_a (x -> x - a(x) h_a), '
                  '%s %s' % (name, tag))
            # Theorem 5: (Ad n_a) g_b = g_{r_a(b)}
            ok = True
            for name2, c2, ev2, h2 in roots:
                img = na * ev2 * ni
                rb = [x - weight_of(d, c2, h) * y for x, y in zip(c2, c)]
                ev3, _ = by_c[tuple(rb)]
                ok = ok and (span_of([img]) == span_of([ev3]))
            check(ok, 'Theorem 5: (Ad n_a) g_b = g_{r_a(b)}, r_a(Delta) = '
                  'Delta, %s %s' % (name, tag))
    # SL_2: (1, 1; 0, 1)(1, 0; -1, 1)(1, 1; 0, 1) = (0, 1; -1, 0)
    e2, f2 = matrix(QQ, [[0, 1], [0, 0]]), matrix(QQ, [[0, 0], [1, 0]])
    check(nil_exp(e2) * nil_exp(-f2) * nil_exp(e2)
          == matrix(QQ, [[0, 1], [-1, 0]]),
          '1.6: (0, 1; -1, 0) = exp(e) exp(-f) exp(e) in SL_2, so n_alpha is '
          'computed as exp(e_a) exp(-e_-a) exp(e_a)')
    # Hint 36: (0, 1; -1, 0) h (0, 1; -1, 0)^-1 = -h
    w = matrix(QQ, [[0, 1], [-1, 0]])
    hh = matrix(QQ, [[1, 0], [0, -1]])
    check(w * hh * w.inverse() == -hh, 'Hint 36 (p. 152): w h w^-1 = -h')
    # Example 8: sp_2 = sl_2
    check(span_of(solution_space(matrix(QQ, [[0, 1], [-1, 0]])))
          == span_of([e2, f2, hh]),
          'Example 8 (p. 147): sp_2(C) = sl_2(C)')
    # Correction p. 141: the line C u_lambda is not inside t(R)
    Ki = QuadraticField(-1, 'i')
    iu = Ki.gen() * matrix(Ki, diag_at(3, {1: 1, 2: -1}))
    check(not all(x in QQ for x in iu.diagonal()),
          '1.4 (p. 141): i u_lambda is on the line C u_lambda but not in '
          't(R) (real diagonal matrices); corrected "C u_lambda in t"')
    # Killing form proportional to the trace form on simple algebras
    # (Exercise 1.2) -- for the algebras above of rank <= 3
    for kind, l in (('sl', 1), ('sl', 2), ('sl', 3), ('so_odd', 1),
                    ('so_odd', 2), ('so_even', 3), ('sp', 2), ('sp', 3)):
        d = classical(kind, l)
        n = d['n']
        if d['J'] is None:
            gb = [E(n, i, j) for i in range(1, n + 1)
                  for j in range(1, n + 1) if i != j] + d['t']
        else:
            gb = solution_space(d['J'])
        B = matrix(QQ, [X.list() for X in gb])
        def ad(X):
            return matrix(QQ, [B.solve_left(vector(QQ, (X * Y - Y * X).list()))
                               for Y in gb]).transpose()
        ads = [ad(X) for X in gb]
        kill = matrix(QQ, len(gb), len(gb),
                      lambda a, b: (ads[a] * ads[b]).trace())
        tr = matrix(QQ, len(gb), len(gb),
                    lambda a, b: (gb[a] * gb[b]).trace())
        kexp = kill[0, 0] / tr[0, 0] if tr[0, 0] else None
        if kexp is None:
            j = next(j for j in range(len(gb)) if tr[0, j] != 0)
            kexp = kill[0, j] / tr[0, j]
        check(kexp != 0 and kill == kexp * tr and kill.det() != 0,
              'Exercise 1.2 / Theorem 1: the Cartan scalar product is a '
              'multiple (%s) of tr XY and nondegenerate on %s(l=%d)'
              % (kexp, kind, l))


# ---------------------------------------------------------------------------
# 4.1, 6 deg: alpha-strings of weights, Problem 41 and its Hint
# ---------------------------------------------------------------------------

def rep_classical(kind, l, which):
    """The identity ('std') or adjoint ('adj') representation of a classical
    algebra of 1.5 deg, in a weight basis.  Returns {'H': [rho(H_k)],
    'E': {root tuple: rho(e_root)}} with roots as tuples of values on the
    basis H_k of t_g."""
    d = classical(kind, l)
    t = d['t']
    rts = [(tuple(weight_of(d, c, H) for H in t), ev) for _, c, ev, _ in
           d['roots']]
    if which == 'std':
        return {'H': list(t), 'E': dict(rts)}
    basis = list(t) + [ev for _, ev in rts]
    B = matrix(QQ, [X.list() for X in basis])

    def ad(X):
        return matrix(QQ, [B.solve_left(vector(QQ, (X * Y - Y * X).list()))
                           for Y in basis]).transpose()
    return {'H': [ad(H) for H in t], 'E': {r: ad(ev) for r, ev in rts}}


def rep_sage_adjoint(ct):
    """Adjoint representation of the Chevalley-basis Lie algebra of Sage,
    in its basis (root vectors and coroots)."""
    L = LieAlgebra(QQ, cartan_type=ct)
    basis = list(L.basis())
    B = matrix(QQ, [b.to_vector() for b in basis])

    def ad(x):
        return matrix(QQ, [B.solve_left(L.bracket(x, b).to_vector())
                           for b in basis]).transpose()
    idx = RootSystem(ct).root_lattice().index_set()
    # h_i = [e_i, f_i] as in (2) of 4.3
    Hs = [ad(L.bracket(L.e(i), L.f(i))) for i in idx]
    Es = {}
    for b in basis:
        key = b.leading_support()
        if 'check' in str(key):
            continue
        M = ad(b)
        # the root as its values on the h_j: [h_j, e_b] = b(h_j) e_b
        i0, j0 = next((i, j) for i in range(M.nrows())
                      for j in range(M.ncols()) if M[i, j] != 0)
        wt = tuple((Hj * M - M * Hj)[i0, j0] / M[i0, j0] for Hj in Hs)
        Es[wt] = M
    return {'H': Hs, 'E': Es}


def rep_tensor(r1, r2):
    n1 = r1['H'][0].nrows()
    n2 = r2['H'][0].nrows()
    I1, I2 = identity_matrix(QQ, n1), identity_matrix(QQ, n2)
    return {'H': [A.tensor_product(I2) + I1.tensor_product(B)
                  for A, B in zip(r1['H'], r2['H'])],
            'E': {r: r1['E'][r].tensor_product(I2)
                  + I1.tensor_product(r2['E'][r]) for r in r1['E']}}


def weights_of(rep):
    Hs = rep['H']
    n = Hs[0].nrows()
    assert all(H.is_diagonal() for H in Hs)
    wts = {}
    for p in range(n):
        wts.setdefault(tuple(H[p, p] for H in Hs), []).append(p)
    return wts


def span_cols(n, cols):
    if not cols:
        return FreeModule(QQ, n).subspace([])
    return matrix(QQ, cols).row_space()


def image(M, W):
    """M(W) for a subspace W (rows = basis)."""
    return span_cols(M.nrows(), [M * v for v in W.basis()])


def check_strings(rep, tag):
    """Problems 40, 41 (with the repaired Hint 41) and Exercises 27, 28 on
    one representation, for every root alpha and weight lambda.  The basis
    of the representation consists of weight vectors, so V_lambda is spanned
    by the basis vectors with positions wts[lambda]."""
    wts = weights_of(rep)
    n = rep['H'][0].nrows()
    for a, Ea in rep['E'].items():
        Fa = rep['E'][tuple(-x for x in a)]
        Hc = Ea * Fa - Fa * Ea
        i0, j0 = next((i, j) for i in range(n) for j in range(n)
                      if Ea[i, j] != 0)
        c = (Hc * Ea - Ea * Hc)[i0, j0] / Ea[i0, j0]
        check(c != 0, 'normalization of e_-alpha, %s' % tag)
        Fa = Fa * 2 / c                     # now [h_a, e_a] = 2 e_a
        Ha = Ea * Fa - Fa * Ea
        check(Ha.is_diagonal() and Ha * Ea - Ea * Ha == 2 * Ea
              and Ha * Fa - Fa * Ha == -2 * Fa,
              '1.6: <e_a, e_-a, h_a> is sl_2 in %s' % tag)
        powers = [identity_matrix(QQ, n)]

        def Epow(k):
            while len(powers) <= k:
                powers.append(powers[-1] * Ea)
            return powers[k]
        for lam in wts:
            vals = set(Ha[p, p] for p in wts[lam])
            check(len(vals) == 1 and list(vals)[0] in ZZ,
                  'Problem 43: lambda(h_alpha) is an integer, %s' % tag)
            lh = list(vals)[0]

            def shift(k):
                return tuple(x + k * y for x, y in zip(lam, a))
            ks = [k for k in range(-12, 13) if shift(k) in wts]
            p, q = -min(ks), max(ks)
            check(ks == list(range(-p, q + 1)) and p - q == lh,
                  'Problem 40: the alpha-string through lambda is unbroken, '
                  'p - q = lambda(h_alpha), %s' % tag)
            if lh < 0:
                check(shift(1) in wts, 'Problem 40: lambda(h_a) < 0 => '
                      'lambda + alpha is a weight, %s' % tag)
            if lh > 0:
                check(shift(-1) in wts, 'Problem 40: lambda(h_a) > 0 => '
                      'lambda - alpha is a weight, %s' % tag)
            mu = shift(-p)
            cols = wts[mu]

            def piece(k):
                return Epow(k).matrix_from_columns(cols)
            check(piece(p + q).rank() > 0,
                  'Problem 41: rho(e_a)^(p+q) V_(lambda - p alpha) != 0, %s'
                  % tag)
            # Repaired Hint 41: s = the maximal k with rho(e_a)^k V_mu != 0
            s = max(k for k in range(0, p + q + 3) if piece(k).rank() > 0)
            check(piece(s + 1).is_zero(),
                  'Hint 41 (repaired): rho(e_a)^(s+1) V_mu = 0, so U is '
                  'invariant under rho(e_a), %s' % tag)
            ok = True
            for k in range(s + 1):
                allowed = set(wts.get(shift(k - p), []))
                M = piece(k)
                ok = ok and all(M[i, j] == 0 for i in range(n)
                                for j in range(M.ncols()) if i not in allowed)
            check(ok, 'Hint 41 (repaired): rho(e_a)^k V_mu lies in '
                  'V_(mu + k alpha), so the sum U is direct and '
                  'h_alpha-invariant, %s' % tag)
            mh = Ha[cols[0], cols[0]]
            check(mh == -(p + q) and (Fa.matrix_from_columns(cols)).is_zero(),
                  'Hint 41: mu(h_a) = -(p + q) and rho(e_-a) V_mu = 0, %s'
                  % tag)
            ok = all(Fa * piece(k) == -k * (mh + k - 1) * piece(k - 1)
                     for k in range(1, s + 2))
            check(ok, 'Hint 41: rho(e_-a) rho(e_a)^k v = -k(mu(h_a) + k - 1)'
                  ' rho(e_a)^(k-1) v on V_mu, so U is rho(e_-a)-invariant, %s'
                  % tag)
            check(s == p + q,
                  'Hint 41 (repaired): s = p + q, i.e. the h_alpha-weights '
                  '-(p+q), ..., -(p+q) + 2s of U are symmetric, %s' % tag)
            # Exercise 27
            if shift(1) in wts:
                A = Ea.matrix_from_rows_and_columns(wts[shift(1)], wts[lam])
                if lh < 0:
                    check(A.rank() == A.ncols(), 'Exercise 1.27 a): '
                          'lambda(h_a) < 0 => A injective, %s' % tag)
                if lh >= -1:
                    check(A.rank() == A.nrows(), 'Exercise 1.27 b): '
                          'lambda(h_a) >= -1 => A surjective, %s' % tag)
            # Exercise 28
            idx = wts[lam]
            EF = (Ea * Fa).matrix_from_rows_and_columns(idx, idx)
            total = 0
            for cval, mult in EF.charpoly().roots(QQ):
                K = (EF - cval).right_kernel()
                total += K.dimension()
                for w in list(K.basis()) + [sum(K.basis())]:
                    v = vector(QQ, n)
                    for pos, x in zip(idx, w):
                        v[pos] = x
                    pp, u = 0, Fa * v
                    while not u.is_zero():
                        pp, u = pp + 1, Fa * u
                    qq, u = 0, Ea * v
                    while not u.is_zero():
                        qq, u = qq + 1, Ea * u
                    check(pp - qq == lh and cval == pp * (qq + 1),
                          'Exercise 1.28: p - q = lambda(h_a), c = p(q + 1),'
                          ' %s' % tag)
            check(total == len(idx),
                  'Exercise 1.28: rho(e_a) rho(e_-a) is diagonalizable with '
                  'rational eigenvalues on V_lambda, %s' % tag)


def section_4_1_strings():
    reps = [
        ('adjoint sl_3', rep_classical('sl', 2, 'adj')),
        ('adjoint sl_3 (x) adjoint', None),
        ('standard so_5', rep_classical('so_odd', 2, 'std')),
        ('standard so_5 (x) adjoint so_5', None),
        ('standard sp_4 (x) standard sp_4', None),
        ('adjoint so_7', rep_classical('so_odd', 3, 'adj')),
        ('adjoint G_2', rep_sage_adjoint(['G', 2])),
        ('adjoint B_2', rep_sage_adjoint(['B', 2])),
    ]
    reps[1] = (reps[1][0], rep_tensor(reps[0][1], reps[0][1]))
    reps[3] = (reps[3][0], rep_tensor(reps[2][1],
                                      rep_classical('so_odd', 2, 'adj')))
    s4 = rep_classical('sp', 2, 'std')
    reps[4] = (reps[4][0], rep_tensor(s4, s4))
    for tag, rep in reps:
        check_strings(rep, tag)
    # The printed Hint 41: s = minimal k with rho(e_a) V_(lambda - k a) != 0
    # and U = sum rho(e_a)^k V_(lambda - k a).  Adjoint sl_3, lambda = alpha:
    rep = rep_classical('sl', 2, 'adj')
    wts = weights_of(rep)
    n = rep['H'][0].nrows()
    V = FreeModule(QQ, n)
    a, Ea = next(iter(rep['E'].items()))
    Fa = rep['E'][tuple(-x for x in a)]
    lam = a

    def Vw(w):
        return V.subspace([V.gen(p) for p in wts.get(w, [])])
    s = next(k for k in range(0, 5)
             if image(Ea, Vw(tuple(x - k * y for x, y in zip(lam, a))))
             .dimension() > 0)
    summands = [image(Ea ** k, Vw(tuple(x - k * y for x, y in zip(lam, a))))
                for k in range(s + 1)]
    Up = sum(summands[1:], summands[0])
    refuted(Up.dimension() == sum(W.dimension() for W in summands)
            and image(Fa, Up).is_subspace(Up),
            'Hint 41 as printed (p. 152): for sl_3, lambda = alpha the '
            'printed U = V_alpha + rho(e_a) V_0 is not a direct sum and is '
            'not invariant under rho(e_-a)')
    check(all(W.is_subspace(Vw(lam)) for W in summands),
          'Hint 41 as printed: every summand rho(e_a)^k V_(lambda-k alpha) '
          'lies in V_lambda')


# ---------------------------------------------------------------------------
# 4.2 Root systems: generic statements over all types of rank <= 8
# ---------------------------------------------------------------------------

def all_types(maxrank=8):
    ts = [('A', n) for n in range(1, maxrank + 1)]
    ts += [('B', n) for n in range(2, maxrank + 1)]
    ts += [('C', n) for n in range(3, maxrank + 1)]
    ts += [('D', n) for n in range(4, maxrank + 1)]
    ts += [('E', 6), ('E', 7), ('E', 8), ('F', 4), ('G', 2)]
    return ts


class RootData(object):
    """A reduced indecomposable root system of a given type, from Sage's
    ambient space (book numbering of Example 2 of 2.2 deg for A-D; alpha_1
    short for G_2).  Roots are also kept as integer coordinate tuples in the
    simple roots, with the Gram matrix G of the simple roots."""

    def __init__(self, X, n):
        self.name = '%s%d' % (X, n)
        self.simple, self.roots = ambient([X, n])
        S = matrix(QQ, self.simple)
        self.S = S
        self.l = len(self.simple)
        self.G = S * S.transpose()
        self.A = book_cartan(self.simple)
        self.co = {}
        for r in self.roots:
            c = tuple(ZZ(x) for x in S.solve_left(r))
            self.co[c] = r
        self.rset = set(self.co)
        self.pos = [c for c in self.co if all(x >= 0 for x in c)]
        self.delta = max(self.pos, key=sum)

    def ip(self, a, b):
        return vector(QQ, a) * self.G * vector(QQ, b)

    def pair(self, a, b):
        return 2 * self.ip(a, b) / self.ip(b, b)

    def add(self, a, b, k=1):
        return tuple(x + k * y for x, y in zip(a, b))

    def refl(self, i, b):
        e = [0] * self.l
        e[i] = 1
        return self.add(b, tuple(e), -self.pair(b, tuple(e)))


def section_4_2_generic():
    """Problems 9, 10, 11, 24, 46, 47, formula (1) and Exercises 5, 8-12,
    16-19 of 4.2 (printed pp. 155-176) for A_1..A_8, B_2..B_8, C_3..C_8,
    D_4..D_8, E_6, E_7, E_8, F_4, G_2."""
    # Exercise 9 table as printed (p. 175): rows Delta_min, Delta_max,
    # columns B_l, C_l, F_4, G_2.
    printed_ex9 = {'B': ('D', 'A1^l'), 'C': ('A1^l', 'D'),
                   'F': ('D4', 'D4'), 'G': ('A2', 'A2')}
    for X, n in all_types():
        R = RootData(X, n)
        tag = R.name
        roots = list(R.co)
        # Problem 9 and Problem 10 for all pairs of nonproportional roots
        ok9 = ok10 = ok10b = True
        for a in roots:
            for b in roots:
                if b == a or b == tuple(-x for x in a):
                    continue
                ab = R.ip(a, b)
                if ab > 0:
                    ok9 = ok9 and R.add(a, b, -1) in R.rset
                if ab < 0:
                    ok9 = ok9 and R.add(a, b) in R.rset
                ks = [k for k in range(-4, 5) if R.add(b, a, k) in R.rset]
                p, q = -min(ks), max(ks)
                ok10 = ok10 and ks == list(range(-p, q + 1)) \
                    and p - q == R.pair(b, a)
                if R.add(b, a, -1) not in R.rset:
                    ok10b = ok10b and ((R.add(b, a) in R.rset) == (ab < 0))
        check(ok9, 'Problem 2.9: (a, b) > 0 => a - b in Delta, (a, b) < 0 '
              '=> a + b in Delta, %s' % tag)
        check(ok10, 'Problem 2.10: every alpha-string is unbroken with '
              'p - q = <b|a>, %s' % tag)
        check(ok10b, 'Problem 2.10: b - a not a root => (b + a in Delta iff '
              '(b, a) < 0), %s' % tag)
        # formula (1), Problem 11, Problem 24: the dual root system
        cor = [2 * r / (r * r) for r in R.roots]
        check(all(pairing(2 * a / (a * a), 2 * b / (b * b)) == pairing(b, a)
                  for a in R.roots for b in R.roots),
              'formula (2.1): <a^v|b^v> = <b|a>, %s' % tag)
        check(is_root_system(cor) and is_reduced(cor)
              and matrix(QQ, cor).rank() == R.l
              and set(tuple(2 * c / (c * c)) for c in cor)
              == set(tuple(r) for r in R.roots),
              'Problem 2.11: Delta^v is a reduced root system of the same '
              'rank and (Delta^v)^v = Delta, %s' % tag)
        scor = [2 * a / (a * a) for a in R.simple]
        check(is_base(scor, cor),
              'Problem 2.24: Pi^v is a base of Delta^v, %s' % tag)
        # Problems 46, 47: the maximal roots
        maximal = [d for d in R.pos
                   if not any(R.add(d, (1 if j == i else 0 for j in
                                        range(R.l))) in R.rset
                              for i in range(R.l))]
        check(len(maximal) == 1 and maximal[0] == R.delta
              and all(x > 0 for x in R.delta)
              and all(all(x >= 0 for x in R.add(R.delta, g, -1))
                      for g in roots),
              'Problem 2.47: a unique maximal root delta = sum n_a a with '
              'all n_a positive integers, and delta >= every root, %s' % tag)
        e_i = [tuple(1 if j == i else 0 for j in range(R.l))
               for i in range(R.l)]
        ips = [R.ip(R.delta, a) for a in e_i]
        check(all(x >= 0 for x in ips) and any(x > 0 for x in ips),
              'Problem 2.46: (delta, a) >= 0 for a in Pi, > 0 for some, %s'
              % tag)
        # Exercise 5: rho = half sum of positive roots
        rho = sum(vector(QQ, c) for c in R.pos) / 2
        check(all(R.pair(tuple(rho), a) == 1 for a in e_i)
              and all(vector(QQ, R.refl(i, tuple(rho)))
                      == rho - vector(QQ, e_i[i]) for i in range(R.l)),
              'Exercise 2.5: r_b(rho) = rho - b and <rho|b> = 1 (b in Pi), '
              'so rho = pi_1 + ... + pi_l, %s' % tag)
        # Exercise 8: one or two lengths; W transitive on each length
        lens = {}
        for c in roots:
            lens.setdefault(R.ip(c, c), set()).add(c)
        orbits = []
        seen = set()
        for c in roots:
            if c in seen:
                continue
            orb, todo = {c}, [c]
            while todo:
                x = todo.pop()
                for i in range(R.l):
                    y = R.refl(i, x)
                    if y not in orb:
                        orb.add(y)
                        todo.append(y)
            seen |= orb
            orbits.append(orb)
        check(len(lens) in (1, 2)
              and sorted(map(len, orbits)) == sorted(map(len, lens.values()))
              and all(any(o == s for s in lens.values()) for o in orbits),
              'Exercise 2.8: one or two root lengths, W transitive on the '
              'roots of each length, %s' % tag)
        # Exercises 9-12 for two root lengths
        if len(lens) == 2:
            short, long_ = min(lens), max(lens)

            def subtype(cs):
                vs = [R.co[c] for c in cs]
                # a base of the subsystem: indecomposable positive roots
                # with respect to a generic functional
                f = vector(QQ, [3 ** i + QQ(1) / (7 + i)
                                for i in range(len(vs[0]))])
                posv = [v for v in vs if v * f > 0]
                sums = set(tuple(u + w) for u in posv for w in posv)
                base = [v for v in posv if tuple(v) not in sums]
                check(is_root_system(vs) and matrix(QQ, vs).rank() == R.l,
                      'Exercise 2.9: the roots of one length form a root '
                      'system of rank l, %s' % tag)
                return type_name(book_cartan(base))
            tmin = subtype(lens[short])
            tmax = subtype(lens[long_])
            l = R.l

            def expand(code):
                if code == 'A1^l':
                    return ['A1'] * l
                if code == 'D':
                    return {2: ['A1', 'A1'], 3: ['A3']}.get(l, ['D%d' % l])
                return [code]
            pmin, pmax = printed_ex9[X]
            # corrected table: the row heads Delta_min, Delta_max exchanged
            check(tmin == sorted(expand(pmax))
                  and tmax == sorted(expand(pmin)),
                  'Exercise 2.9 table, corrected (row heads exchanged): '
                  '%s has Delta_min = %s, Delta_max = %s' % (tag, tmin, tmax))
            if X in 'BC' and n >= 3:     # for l = 2 both rows are D_2
                refuted(tmin == sorted(expand(pmin)),
                        'Exercise 2.9 table as printed: %s has Delta_min = %s'
                        % (tag, pmin))
            check(R.ip(R.delta, R.delta) == long_,
                  'Exercise 2.10: the highest root is long, %s' % tag)
            hs = max(lens[short], key=sum)
            check(all(all(x >= 0 for x in R.add(hs, c, -1))
                      for c in lens[short]),
                  'Exercise 2.10: Delta_min has a unique maximal element '
                  '(the highest short root), %s' % tag)
            # Exercise 12: coroots of long roots = short roots of Delta^v;
            # delta^v is the highest short root of Delta^v w.r.t. Pi^v
            corl = set(tuple(2 * R.co[c] / (R.co[c] * R.co[c]))
                       for c in lens[long_])
            cl = {}
            for c in cor:
                cl.setdefault(c * c, set()).add(tuple(c))
            check(corl == cl[min(cl)],
                  'Exercise 2.12: (Delta_max)^v = (Delta^v)_min, %s' % tag)
            dv = 2 * R.co[R.delta] / (R.co[R.delta] * R.co[R.delta])
            Sv = matrix(QQ, scor)
            check(all(all(x >= 0 for x in Sv.solve_left(dv - vector(QQ, c)))
                      for c in cl[min(cl)]),
                  'Exercise 2.12: delta^v is the highest short root of '
                  'Delta^v, %s' % tag)
        # Exercise 11: Delta^v ~ Delta except B_n, C_n (n >= 3)
        tv = type_name(book_cartan(scor))
        expected = {'B': 'C%d' % n, 'C': 'B%d' % n}.get(X, R.name) \
            if not (X in 'BC' and n == 2) else 'B2'
        check(tv == [expected],
              'Exercise 2.11: Delta^v of %s is %s' % (tag, expected))
        # Exercises 16-19: -e in W
        W = WeylGroup(RootSystem([X, n]).ambient_space(), prefix='s')
        w0 = W.long_element().matrix()
        minus = all(w0 * v == -v for v in R.simple)
        ex19 = not (X == 'A' and n >= 2 or X == 'D' and n % 2 == 1
                    or (X, n) == ('E', 6))
        check(minus == ex19,
              'Exercise 2.19: -e %s W for %s' % ('in' if ex19 else 'not in',
                                                  tag))
        nu = []
        for v in R.simple:
            img = -(w0 * v)
            nu.append(next(j for j, u in enumerate(R.simple) if u == img))
        check(sorted(nu) == list(range(R.l))
              and all(R.A[i, j] == R.A[nu[i], nu[j]]
                      for i in range(R.l) for j in range(R.l)),
              'Exercise 3.6: nu = -w_0 is an automorphism of Pi, %s' % tag)
        check((nu == list(range(R.l))) == ex19,
              'Exercise 3.6: nu = e exactly when -e in W, %s' % tag)
        diag_aut = diagram_automorphisms(R.A)
        if len(diag_aut) == 1:
            check(minus, 'Exercise 2.16: Aut Pi trivial => -e in W, %s' % tag)
        if len(diag_aut) == 2 and not ex19:
            check(tuple(nu) in diag_aut and tuple(nu) != tuple(range(R.l)),
                  'Exercise 3.6: nu is the only nontrivial symmetry of the '
                  'diagram, %s' % tag)
        el = [x for x in R.A.change_ring(ZZ).elementary_divisors() if x != 1]
        if minus:
            check(all(x in (1, 2) for x in el),
                  'Exercise 2.18: -e in W => pi(Delta) has exponent <= 2, %s'
                  % tag)
        # Exercise 2.28 / 3.12: h = sum of h_a (a > 0) = sum r_b h_b with
        # positive integers r_b, and b(h) = 2 for b in Pi
        hvec = sum(2 * R.co[c] / (R.co[c] * R.co[c]) for c in R.pos)
        r = matrix(QQ, scor).solve_left(hvec)
        check(all(x in ZZ and x > 0 for x in r)
              and all(a * hvec == 2 for a in R.simple),
              'Exercise 2.28: h = sum_(a>0) h_a = sum r_b h_b, r_b positive '
              'integers, b(h) = 2 (b in Pi), %s' % tag)
        # Exercise 3.13: the black vertices are those with odd r_b among
        # the nu-fixed vertices; the book's pictures (p. 197)
        black = exercise13_black(X, n)
        orbs = set(tuple(sorted({i, nu[i]})) for i in range(R.l))
        ok = all((sum(r[i] for i in o) - sum(1 for i in o if i in black))
                 % 2 == 0 for o in orbs)
        check(ok, 'Exercise 3.13: for self-dual labels, sum r_b Lambda_b = '
              'sum over the black vertices (mod 2), %s' % tag)


def section_4_2_small():
    """Fig. 1, Problems 2-4, 8, Examples 1-2, Theorem 7, the GL_n example,
    Problem 41 / Theorem 10 (connectedness), Exercises 6 and 13."""
    K = QuadraticField(3, 's3')
    s3 = K.gen()
    # Fig. 1 (p. 154), as printed: A_2 with alpha_1
    # horizontal, alpha_2 at 120 deg; B_2 with alpha_1 long at 135 deg and
    # alpha_2 short horizontal; G_2 with alpha_1 short horizontal and
    # alpha_2 long at 150 deg; BC_2 with alpha_1 horizontal and alpha_2,
    # 2 alpha_2 at 135 deg (so its axes are at 45 deg).
    def vec(*xs):
        return vector(K, xs)
    hexa = [vec(1, 0), vec(QQ(1) / 2, s3 / 2), vec(-QQ(1) / 2, s3 / 2)]
    hexa = hexa + [-v for v in hexa]
    g2long = [vec(QQ(3) / 2, s3 / 2), vec(0, s3), vec(-QQ(3) / 2, s3 / 2)]
    g2long = g2long + [-v for v in g2long]
    b2 = [vec(x, y) for x, y in ((1, 0), (0, 1), (1, 1), (1, -1))]
    b2 = b2 + [-v for v in b2]
    bc2 = [vec(x, y) for x, y in ((1, 1), (1, -1), (2, 2), (2, -2), (2, 0),
                                  (0, 2))]
    bc2 = bc2 + [-v for v in bc2]
    fig1 = {
        'A1': ([vec(1, 0), vec(-1, 0)], [vec(1, 0)]),
        'BC1': ([vec(1, 0), vec(-1, 0), vec(2, 0), vec(-2, 0)], [vec(1, 0)]),
        'A1+A1': ([vec(1, 0), vec(-1, 0), vec(0, 1), vec(0, -1)],
                  [vec(1, 0), vec(0, 1)]),
        'A2': (hexa, [vec(1, 0), vec(-QQ(1) / 2, s3 / 2)]),
        'B2': (b2, [vec(-1, 1), vec(1, 0)]),
        'BC2': (bc2, [vec(2, 0), vec(-1, 1)]),
        'G2': (hexa + g2long, [vec(1, 0), vec(-QQ(3) / 2, s3 / 2)]),
    }

    def kbase(simple, roots):
        S = matrix(K, simple)
        for r in roots:
            c = S.solve_left(r)
            if not all(x in QQ and QQ(x) in ZZ for x in c):
                return False
            if not (all(QQ(x) >= 0 for x in c) or all(QQ(x) <= 0 for x in c)):
                return False
        return S.rank() == len(simple)
    invariants = {}
    for name, (roots, base) in fig1.items():
        rs = set(tuple(r) for r in roots)
        ok = all(all(pairing(b, a) in ZZ and tuple(b - pairing(b, a) * a)
                     in rs for b in roots) for a in roots)
        check(ok, 'Problem 2.3: the system %s of Fig. 1 is a root system'
              % name)
        red = not any(tuple(2 * a) in rs for a in roots)
        check(red == (name not in ('BC1', 'BC2')),
              'Problem 2.3: %s is %sreduced' % (name, '' if red else 'not '))
        check(kbase(base, roots),
              'Example 2.1 (p. 157): the labelled roots of %s form a base'
              % name)
        indec = orthogonality_connected(roots)
        check(indec == (name != 'A1+A1'),
              'Fig. 1: %s is %sdecomposable' % (name, 'in' if indec else ''))
        A = matrix(QQ, len(base), len(base),
                   lambda i, j: QQ(pairing(base[i], base[j])))
        invariants[name] = (len(roots), matrix_key(A))
    check(len(set(invariants.values())) == len(invariants),
          'Problem 2.3: the seven systems of Fig. 1 are pairwise '
          'nonisomorphic')
    # Problem 2 / Problem 4: multiples of a root; rank-1 root systems
    cands = [QQ(1) / 2, 1, 2]
    found = set()
    for k in range(1, 4):
        for S in itertools.combinations(cands, k):
            if 1 not in S:
                continue
            rts = [vector(QQ, [c]) for c in S] + [vector(QQ, [-c]) for c in S]
            if is_root_system(rts):
                m = min(S)
                found.add(tuple(sorted(c / m for c in S)))
    check(found == {(1,), (1, 2)},
          'Problems 2.2, 2.4: up to scaling the rank-1 root systems are A_1 '
          '= {+-a} and BC_1 = {+-a, +-2a}')
    ok = True
    for roots, _ in fig1.values():
        for a in roots:
            for b in roots:
                if matrix(K, [a, b]).rank() == 1:
                    c = (b * a) / (a * a)
                    ok = ok and c in (QQ(1) / 2, -QQ(1) / 2, 1, -1, 2, -2)
    check(ok, 'Problem 2.2: proportional roots b = c a have c = +-1/2, +-1, '
          '+-2 (all systems of Fig. 1)')
    # Problem 3: root systems of sl_2, sl_3, so_4, so_3, so_5, sl_2+sl_2,
    # sp_4 computed from Examples 5-8 of 1.5 deg
    def algebra_type(kind, l):
        d = classical(kind, l)
        rts = [(tuple(c), h) for _, c, _, h in d['roots']]
        # base by Problem 23: lexicographic order in the eps basis
        pos = [c for c, _ in rts if next(x for x in c if x != 0) > 0]
        sums = set(tuple(x + y for x, y in zip(a, b)) for a in pos
                   for b in pos)
        base = [c for c in pos if c not in sums]
        hh = dict(rts)
        A = matrix(QQ, len(base), len(base),
                   lambda i, j: weight_of(d, base[i], hh[base[j]]))
        return type_name(A), base
    expect = {('sl', 1): ['A1'], ('sl', 2): ['A2'],
              ('so_even', 2): ['A1', 'A1'],
              ('so_odd', 1): ['A1'], ('so_odd', 2): ['B2'], ('sp', 2): ['B2']}
    for key, tn in expect.items():
        check(algebra_type(*key)[0] == tn,
              'Problem 2.3: the root system of %s(l=%d) is %s'
              % (key[0], key[1], '+'.join(tn)))
    # Example 2 of 2.2 (pp. 159-160): positive and simple roots for the
    # lexicographic order, printed bases
    for l in range(2, 6):
        base = algebra_type('sl', l - 1)[1] if l >= 2 else None
        exp_b = [tuple(1 if j == i else (-1 if j == i + 1 else 0)
                       for j in range(l)) for i in range(l - 1)]
        check(sorted(base) == sorted(exp_b),
              'Example 2.2: Pi(sl_%d) = {eps_i - eps_(i+1)}' % l)
    for kind, lo in (('so_even', 2), ('so_odd', 1), ('sp', 1)):
        for l in range(lo, 6):
            tn, base = algebra_type(kind, l)
            exp_b = [tuple(1 if j == i else (-1 if j == i + 1 else 0)
                           for j in range(l)) for i in range(l - 1)]
            last = [0] * l
            if kind == 'so_even':
                last[l - 2] = last[l - 1] = 1
            elif kind == 'so_odd':
                last[l - 1] = 1
            else:
                last[l - 1] = 2
            exp_b.append(tuple(last))
            check(sorted(base) == sorted(exp_b),
                  'Example 2.2: the printed Pi of %s(l=%d)' % (kind, l))
            dec = len(tn) > 1
            check(dec == (kind == 'so_even' and l == 2),
                  'Example 2.2: Pi of %s(l=%d) is %sdecomposable'
                  % (kind, l, '' if dec else 'in'))
    # Problem 8 table (p. 155)
    printed8 = [((1, 2), 0, 0, None), ((2, 3), -1, -1, 1), ((3, 4), -1, -2, 2),
                ((5, 6), -1, -3, 3), ((1, 1), -2, -2, 1), ((1, 1), -1, -4, 4)]
    found8 = set()
    for a in range(-4, 1):
        for b in range(-4, 1):
            if a * b <= 4 and (a == 0) == (b == 0) and abs(a) <= abs(b):
                found8.add((a, b))
    check(found8 == set((x[1], x[2]) for x in printed8),
          'Problem 2.8 (p. 155): the printed pairs (<a|b>, <b|a>) are all '
          'nonpositive integer pairs with product <= 4, |b| >= |a|')
    for (pn, pd), ab, ba, ratio in printed8:
        z = QQbar.zeta(2 * pd) ** pn
        cos = (z + z ** -1) / 2
        check(4 * cos ** 2 == ab * ba,
              'Problem 2.8: 4 cos^2(%d pi/%d) = %d' % (pn, pd, ab * ba))
        if ratio is not None:
            check(QQ(ba) / QQ(ab) == ratio,
                  'Problem 2.8: |b|^2/|a|^2 = <b|a>/<a|b> = %s' % ratio)
    # Theorem 7: the number of bases equals |W| (simple transitivity)
    for X, n in (('A', 2), ('B', 2), ('G', 2), ('A', 3), ('B', 3), ('C', 3),
                 ('A', 4), ('D', 4)):
        simple, roots = ambient([X, n])
        cnt = sum(1 for S in itertools.combinations(roots, n)
                  if is_base(list(S), roots))
        W = WeylGroup([X, n])
        check(cnt == W.cardinality(),
              'Theorem 2.7: %s%d has |W| = %d bases' % (X, n, cnt))
    # Exercise 6 (length = number of positive roots made negative) and
    # Exercise 13 (the reflections of W are the r_alpha)
    for X, n in (('A', 3), ('B', 3), ('C', 3), ('D', 4), ('G', 2),
                 ('A', 4), ('B', 4), ('F', 4)):
        simple, roots = ambient([X, n])
        S = matrix(QQ, simple)
        pos = positive_from_base(simple, roots)
        W = WeylGroup(RootSystem([X, n]).ambient_space(), prefix='s')
        ok6 = True
        refl = 0
        for w in W:
            M = w.matrix()
            neg = sum(1 for r in pos
                      if any(x < 0 for x in S.solve_left(M * r)))
            ok6 = ok6 and neg == w.length()
            if M != 1 and (M - 1).rank() == 1 and M * M == 1:
                refl += 1
        check(ok6, 'Exercise 2.6: l(w) = #{a > 0: w(a) < 0} for all w in '
              'W(%s%d)' % (X, n))
        check(refl == len(pos),
              'Exercise 2.13: W(%s%d) contains exactly |Delta+| = %d '
              'reflections' % (X, n, len(pos)))
    # Example of 2.4 deg (p. 163): W(GL_n) = S_n via r_(alpha_ij)
    for n in range(2, 6):
        d = classical('gl', n)
        gens = []
        for name, c, ev, h in d['roots']:
            M = matrix(QQ, [[d['eps'][b](H - weight_of(d, c, H) * h)
                             for H in d['t']] for b in range(n)])
            gens.append(M)
        ok = True
        for (name, c, ev, h), M in zip(d['roots'], gens):
            i, j = c.index(1), c.index(-1)
            P = identity_matrix(QQ, n)
            P.swap_rows(i, j)
            ok = ok and M == P
        check(ok, 'Example 2.4: r_(alpha_ij) transposes E_ii and E_jj and '
              'fixes the other E_kk (n = %d)' % n)
        from sage.all import MatrixGroup
        check(MatrixGroup(gens).cardinality() == factorial(n),
              'Example 2.4: W(GL_%d) = S_%d has order %d'
              % (n, n, factorial(n)))
    # 2.3 deg (p. 160): B+ = upper triangular; nil-triangular matrices do
    # not form a group
    for n in range(2, 5):
        d = classical('gl', n)
        pos = [ev for _, c, ev, _ in d['roots']
               if next(x for x in c if x != 0) > 0]
        upper = [E(n, i, j) for i in range(1, n + 1)
                 for j in range(i, n + 1)]
        check(span_of(d['t'] + pos) == span_of(upper),
              '2.3: b+ = t + n+ is the algebra of upper triangular matrices '
              '(GL_%d, chamber x_1 > ... > x_n)' % n)
        refuted(vector(QQ, identity_matrix(QQ, n).list()) in span_of(pos),
                '2.3 as printed: B+ = the "nil-triangular" (strictly upper '
                'triangular) matrices; they do not even contain E (n = %d), '
                'while B+ contains T' % n)
    # Problem 41 / Theorem 10 need G connected (4 deg): O_2(C) with the form
    # xy (matrix (0, 1; 1, 0)), T = SO_2 = {diag(t, 1/t)}, Delta_G empty
    R = PolynomialRing(QQ, 't')
    t = R.gen()
    F = R.fraction_field()
    J = matrix(QQ, [[0, 1], [1, 0]])
    Tt = matrix(F, [[t, 0], [0, 1 / t]])
    sw = matrix(F, [[0, 1], [1, 0]])
    check(Tt.transpose() * J * Tt == J and sw.transpose() * J * sw == J
          and sw.det() == -1,
          'Theorem 2.10 counterexample: T = {diag(t, 1/t)} and the swap s '
          'lie in O_2(C)')
    so2 = solution_space(J)
    check(len(so2) == 1 and so2[0].is_diagonal(),
          'Theorem 2.10 counterexample: so_2 = t is commutative, so Delta_G '
          'is empty and W = {e}')
    check((sw * Tt * sw.inverse()).is_diagonal()
          and sw * so2[0] * sw.inverse() == -so2[0],
          'Theorem 2.10 counterexample: s normalizes T and Ad s = -1 on t, '
          'so N(T)/T = O_2/SO_2 has order 2 while W = {e}; the statement '
          'needs G connected')
    # G = C^* x {+-1} (diag(t, +-1) in GL_2): the kernel of nu is not T
    m1 = matrix(F, [[1, 0], [0, -1]])
    T1 = matrix(F, [[t, 0], [0, 1]])
    check(m1 * T1 * m1.inverse() == T1 and m1 not in [T1.subs(t=c)
                                                      for c in (1, -1)],
          'Problem 2.41 counterexample: in G = {diag(t, +-1)}, T = '
          '{diag(t, 1)}, the element diag(1, -1) centralizes T, so Ker nu '
          '= G != T for a nonconnected G')


# ---------------------------------------------------------------------------
# 4.2, 5-7 deg: Dynkin diagrams, admissible matrices, classification
# ---------------------------------------------------------------------------

def diagram(vertices, bonds):
    """Book-convention matrix of a drawn Dynkin diagram.  bonds: (x, y, m,
    target) with target the vertex the arrow points to (the shorter root,
    rule 3) of 2.5 deg) or None; m = 4 without arrow is a_xy = a_yx = -2."""
    n = len(vertices)
    pos = {v: i for i, v in enumerate(vertices)}
    A = 2 * identity_matrix(QQ, n)
    for x, y, m, to in bonds:
        i, j = pos[x], pos[y]
        if to is None:
            a = {1: -1, 4: -2}[m]
            A[i, j] = A[j, i] = a
        else:
            t, o = (i, j) if to == x else (j, i)
            A[t, o] = -1
            A[o, t] = -m
    return A


def chain(names):
    return [(names[k], names[k + 1], 1, None) for k in range(len(names) - 1)]


def drawn_extended(fam, l):
    """The diagrams of Examples 3-5 (pp. 166-167) as drawn, for a
    given l; vertex 'a0' is the adjoined root alpha_0 (the only labelled
    vertex in the book, or the left end for Examples 4, 5)."""
    a = ['a%d' % i for i in range(l + 1)]
    if fam == 'A1':
        return a, diagram(a, chain(a[1:]) + [('a0', 'a1', 1, None),
                                             ('a0', a[l], 1, None)])
    if fam == 'A1^(1)':
        return a[:2], diagram(a[:2], [('a0', 'a1', 4, None)])
    if fam in ('B1', 'A2l-1^(2)'):
        to = a[l] if fam == 'B1' else a[l - 1]
        return a, diagram(a, chain(a[1:l]) + [('a0', 'a2', 1, None),
                                              (a[l - 1], a[l], 2, to)])
    if fam == 'D1':
        return a, diagram(a, chain(a[1:l - 1]) + [
            ('a0', 'a2', 1, None), (a[l - 2], a[l - 1], 1, None),
            (a[l - 2], a[l], 1, None)])
    if fam == 'C1':
        return a, diagram(a, chain(a[1:l]) + [('a0', 'a1', 2, 'a1'),
                                              (a[l - 1], a[l], 2, a[l - 1])])
    if fam == 'G1':
        return a[:3], diagram(a[:3], [('a1', 'a2', 3, 'a1'),
                                      ('a2', 'a0', 1, None)])
    if fam == 'D(l+1)^(2)':
        return a, diagram(a, chain(a[1:l]) + [('a0', 'a1', 2, 'a0'),
                                              (a[l - 1], a[l], 2, a[l])])
    if fam == 'D4^(3)':
        return a[:3], diagram(a[:3], [('a0', 'a1', 1, None),
                                      ('a1', 'a2', 3, 'a1')])
    if fam == 'A2l^(2)':
        return a, diagram(a, chain(a[1:l]) + [('a0', 'a1', 2, 'a1'),
                                              (a[l - 1], a[l], 2, a[l])])
    raise ValueError(fam)


def extended_from_vectors(simple, extra):
    """Matrix of Pi together with an adjoined vector (index 0)."""
    return book_cartan([extra] + list(simple))


def eps(n, *pairs):
    v = vector(QQ, n)
    for i, c in pairs:
        v[i - 1] += c
    return v


def expected_diagrams(maxv):
    """Connected Dynkin and affine diagrams with <= maxv vertices, computed
    from vectors: Pi of each type, Pi with -delta (untwisted), and the
    constructions of Examples 4, 5 and Problem 56 (twisted)."""
    cartan, affine = {}, {}
    for X, n in all_types(maxv):
        simple, roots = ambient([X, n])
        cartan['%s%d' % (X, n)] = book_cartan(simple)
        if n + 1 <= maxv:
            d = highest_root(simple, roots)
            # the book lists B_l^(1) for l >= 3 and C_l^(1) for l >= 2
            name = 'C2^(1)' if (X, n) == ('B', 2) else '%s%d^(1)' % (X, n)
            affine[name] = extended_from_vectors(simple, -d)
    for l in range(1, maxv):
        if l + 1 > maxv:
            continue
        if l >= 3:
            simple, _ = ambient(['C', l])
            affine['A%d^(2)' % (2 * l - 1)] = extended_from_vectors(
                simple, -eps(l, (1, 1), (2, 1)))
        if l >= 2:
            simple, _ = ambient(['B', l])
            affine['D%d^(2)' % (l + 1)] = extended_from_vectors(
                simple, -eps(l, (1, 1)))
        simple = ambient(['B', l])[0] if l >= 2 else [vector(QQ, [1])]
        affine['A%d^(2)' % (2 * l)] = extended_from_vectors(
            simple, -2 * eps(l, (1, 1)))
    simple, _ = ambient(['G', 2])
    affine['D4^(3)'] = extended_from_vectors(
        simple, -(2 * simple[0] + simple[1]))
    affine['E6^(2)'] = affine['F4^(1)'].transpose()
    return cartan, affine


def enumerate_admissible(maxv):
    """All connected admissible matrices (conditions 1)-4) of 2.6 deg) with
    at most maxv vertices, up to simultaneous permutation, by adding one
    vertex at a time to the connected admissible matrices of one size less
    (removing a non-cut vertex of a connected admissible matrix leaves a
    connected admissible matrix, so nothing is missed).

    Positive semidefiniteness of G(A) (entries -sqrt(m_ij)/2) is decided
    exactly in QQ(sqrt 2, sqrt 3) with a real embedding: for a positive
    definite G_A by the Schur complement 1 - g^T G_A^-1 g; for a singular
    G_A with null vector z > 0 by g.z (if g.z != 0 the form
    Q(z, t) = 2 t g.z + t^2 takes negative values).  A new vertex needs
    sum of m_j <= 4 over its neighbours: with y_j = sqrt(m_j)/2 >= 0 one
    has Q(1, y) <= 1 - sum m_j/4 because all other off-diagonal entries
    are <= 0."""
    x = PolynomialRing(QQ, 'x').gen()
    K4 = NumberField(x ** 4 - 10 * x ** 2 + 1, "a",
                    embedding=AA(2).sqrt() + AA(3).sqrt())
    a = K4.gen()
    s2, s3 = (a ** 3 - 9 * a) / 2, (11 * a - a ** 3) / 2
    assert s2 ** 2 == 2 and s3 ** 2 == 3 and s2 > 0 and s3 > 0
    sq = {0: K4(0), 1: K4(1), 2: s2, 3: s3, 4: K4(2)}

    def G(A):
        n = A.nrows()
        return matrix(K4, n, n, lambda i, j: 1 if i == j
                      else -sq[A[i, j] * A[j, i]] / 2)
    bonds = [(-1, -1), (-1, -2), (-2, -1), (-1, -3), (-3, -1), (-2, -2),
             (-1, -4), (-4, -1)]

    def assignments(n, j=0, budget=4):
        if j == n:
            yield []
            return
        for rest in assignments(n, j + 1, budget):
            yield rest
        for b in bonds:
            m = b[0] * b[1]
            if m <= budget:
                for rest in assignments(n, j + 1, budget - m):
                    yield [(j, b)] + rest
    first = matrix(QQ, [[2]])
    levels = {1: {matrix_key(first): (first, 'cartan')}}
    for n in range(1, maxv):
        new = {}
        for A, kind in levels[n].values():
            GA = G(A)
            if kind == 'cartan':
                Gi = GA.inverse()
            else:
                z = GA.right_kernel().basis()[0]
                if z[0] < 0:
                    z = -z
                assert all(c > 0 for c in z)
            for asg in assignments(n):
                if not asg:
                    continue
                g = {j: -sq[b[0] * b[1]] / 2 for j, b in asg}
                if kind == 'cartan':
                    s = 1 - sum(g[i] * g[j] * Gi[i, j] for i in g for j in g)
                    if s < 0:
                        continue
                    k2 = 'cartan' if s > 0 else 'affine'
                else:
                    if sum(g[j] * z[j] for j in g) != 0:
                        continue
                    raise AssertionError('unexpected: g.z = 0')
                B = matrix(QQ, n + 1, n + 1)
                B.set_block(0, 0, A)
                B[n, n] = 2
                for j, (avj, ajv) in asg:
                    B[n, j], B[j, n] = avj, ajv
                key = matrix_key(B)
                if key not in new:
                    new[key] = (B, k2)
        levels[n + 1] = new
    return levels


def section_4_2_classification():
    MAXV = 9
    levels = enumerate_admissible(MAXV)
    cartan, affine = expected_diagrams(MAXV)
    ck = {matrix_key(A): name for name, A in cartan.items()}
    ak = {matrix_key(A): name for name, A in affine.items()}
    check(len(ck) == len(cartan) and len(ak) == len(affine)
          and not set(ck) & set(ak),
          'Theorem 2.12 / 2.13: the listed Dynkin diagrams A_l, B_l (l>=2), '
          'C_l (l>=3), D_l (l>=4), E_6-8, F_4, G_2 are pairwise distinct, as '
          'are the listed affine ones, and no diagram is both (D5)')
    enum_c = {k for n in levels for k, (A, kind) in levels[n].items()
              if kind == 'cartan'}
    enum_a = {k for n in levels for k, (A, kind) in levels[n].items()
              if kind == 'affine'}
    check(enum_c == set(ck),
          'Theorem 2.12: the connected Dynkin diagrams with <= %d vertices '
          'are exactly A_l, B_l, C_l, D_l, E_6, E_7, E_8, F_4, G_2 '
          '(exhaustive enumeration)' % MAXV)
    check(enum_a == set(ak),
          'Theorem 2.12: the connected affine diagrams with <= %d vertices '
          'are exactly L_l^(1), A_(2l-1)^(2), A_(2l)^(2), D_(l+1)^(2), '
          'E_6^(2), D_4^(3) (exhaustive enumeration)' % MAXV)
    # Sage's affine Cartan types (Kac's tables) agree up to transposition
    from sage.all import CartanType
    sage_keys = set()
    for X, n in all_types(8):
        sage_keys.add(matrix_key(matrix(QQ, CartanType([X, n, 1])
                                        .cartan_matrix())))
    for l in range(3, 9):
        sage_keys.add(matrix_key(matrix(QQ, CartanType(['A', 2 * l - 1, 2])
                                        .cartan_matrix())))
    for l in range(1, 9):
        sage_keys.add(matrix_key(matrix(QQ, CartanType(['A', 2 * l, 2])
                                        .cartan_matrix())))
    for l in range(2, 9):
        sage_keys.add(matrix_key(matrix(QQ, CartanType(['D', l + 1, 2])
                                        .cartan_matrix())))
    sage_keys.add(matrix_key(matrix(QQ, CartanType(['E', 6, 2])
                                    .cartan_matrix())))
    sage_keys.add(matrix_key(matrix(QQ, CartanType(['D', 4, 3])
                                    .cartan_matrix())))
    tclosed = set(ak) | {matrix_key(A.transpose()) for A in affine.values()}
    check(sage_keys == set(ak) and tclosed == set(ak),
          'Theorem 2.12: the affine list agrees with Sage\'s affine Cartan '
          'types and is closed under transposition (D2)')
    names_c = {v: k for k, v in ck.items()}
    names_a = {v: k for k, v in ak.items()}
    allmats = [(A, kind) for n in levels for (A, kind) in levels[n].values()]
    # (D3), (D4), (D7), (D8), Problems 51, 52
    for A, kind in allmats:
        n = A.nrows()
        ms = [A[i, j] * A[j, i] for i in range(n) for j in range(i + 1, n)]
        edges = sum(1 for m in ms if m)
        cyc = edges >= n
        name = ck.get(matrix_key(A)) or ak.get(matrix_key(A))
        if kind == 'cartan':
            check(max(ms + [0]) <= 3 and not cyc,
                  '(D3), (D4): edges of multiplicity <= 3 and no cycles in '
                  'the Dynkin diagram %s' % name)
        else:
            if n > 2:
                check(max(ms) <= 3, '(D7): multiplicities <= 3 in %s' % name)
            check(cyc == (name.startswith('A') and name.endswith('^(1)')
                          and n >= 3),
                  '(D8), Problem 2.51: %s has a cycle iff it is A_l^(1), '
                  'l >= 2' % name)
            if 4 in ms:
                check(n == 2, 'Problem 2.52: an edge of multiplicity 4 only '
                      'in a 2 x 2 affine matrix (%s)' % name)
            # (D6): every proper subdiagram is a Dynkin diagram
            for v in range(n):
                idx = [i for i in range(n) if i != v]
                B = A.matrix_from_rows_and_columns(idx, idx)
                for c in components(B):
                    Bc = B.matrix_from_rows_and_columns(c, c)
                    check(matrix_key(Bc) in ck,
                          '(D6): proper subdiagrams of %s are Dynkin' % name)
            check(A.det() == 0, 'Corollary of Theorem 2.11: det = 0 for the '
                  'affine %s' % name)
        if kind == 'cartan':
            check(A.det() > 0, 'Corollary of Theorem 2.11: det > 0 for the '
                  'Cartan matrix %s' % name)
            for v in range(n):
                idx = [i for i in range(n) if i != v]
                B = A.matrix_from_rows_and_columns(idx, idx)
                for c in components(B):
                    Bc = B.matrix_from_rows_and_columns(c, c)
                    check(matrix_key(Bc) in ck,
                          '(D1): subdiagrams of %s are Dynkin' % name)
    # Problem 53 (p. 169): rank 1 and 2 Dynkin diagrams
    rank12 = set()
    for a12, a21 in [(0, 0)] + [(b[0], b[1]) for b in
                                [(-1, -1), (-1, -2), (-2, -1), (-1, -3),
                                 (-3, -1)]]:
        rank12.add(matrix_key(matrix(QQ, [[2, a12], [a21, 2]])))
    rank12.add(matrix_key(matrix(QQ, [[2]])))
    printed53 = {matrix_key(cartan[x]) for x in ('A1', 'A2', 'B2', 'G2')}
    refuted(rank12 == printed53,
            'Problem 2.53 as printed: "the only Dynkin diagrams of rank 1 and '
            '2 are A_1, A_2, B_2, G_2"; A_1 + A_1 = (2, 0; 0, 2) is one more')
    conn12 = {k for k in rank12 if k in enum_c}
    check(conn12 == printed53 and len(levels[1]) == 1 and
          {k for k, (A, kind) in levels[2].items() if kind == 'cartan'}
          == {matrix_key(cartan[x]) for x in ('A2', 'B2', 'G2')},
          'Problem 2.53 corrected: the only connected Dynkin diagrams of '
          'rank 1 and 2 are A_1, A_2, B_2, G_2')
    aff1 = {k for k, (A, kind) in levels[2].items() if kind == 'affine'}
    drawn53 = {matrix_key(diagram(['a', 'b'], [('a', 'b', 4, None)])),
               matrix_key(diagram(['a', 'b'], [('a', 'b', 4, 'b')]))}
    check(aff1 == drawn53 and drawn53 == {matrix_key(affine['A1^(1)']),
                                          matrix_key(affine['A2^(2)'])},
          'Problem 2.53: the connected affine diagrams of rank 1 are the '
          'drawn A_1^(1), A_2^(2)')
    # Proposition 1 (p. 170)
    c3 = {ck[k] for k, (A, kind) in levels[3].items() if kind == 'cartan'}
    a3 = {ak[k] for k, (A, kind) in levels[3].items() if kind == 'affine'}
    check(c3 == {'A3', 'B3', 'C3'},
          'Proposition 2.1: the connected Dynkin diagrams of rank 3 are A_3, '
          'B_3, C_3')
    check(a3 == {'A2^(1)', 'C2^(1)', 'D3^(2)', 'A4^(2)', 'G2^(1)', 'D4^(3)'},
          'Proposition 2.1: the connected affine diagrams of rank 2 are '
          'A_2^(1), C_2^(1), D_3^(2), A_4^(2), G_2^(1), D_4^(3)')
    nmap = {0: 2, 1: 3, 2: 4, 3: 6}
    for k, (A, kind) in levels[3].items():
        ms = sorted(A[i, j] * A[j, i] for i, j in ((0, 1), (0, 2), (1, 2)))
        ns = [nmap[m] for m in ms]
        s = sum(QQ(1) / x for x in ns)
        if kind == 'cartan':
            check(s > 1 and sorted(ns) in ([2, 3, 3], [2, 3, 4])
                  and ms in ([0, 1, 1], [0, 1, 2]),
                  'Proposition 2.1: rank 3: 1/n12 + 1/n13 + 1/n23 > 1 with '
                  'n-set {2,3,3} or {2,3,4}')
        else:
            check(s == 1 and sorted(ns) in ([3, 3, 3], [2, 4, 4], [2, 3, 6])
                  and ms in ([1, 1, 1], [0, 2, 2], [0, 1, 3]),
                  'Proposition 2.1: affine rank 2: the sum is 1 with n-set '
                  '{3,3,3}, {2,4,4} or {2,3,6}')
    # Corollary of Proposition 1, Problems 54, 55
    for A, kind in allmats:
        n = A.nrows()
        name = ck.get(matrix_key(A)) or ak.get(matrix_key(A))
        rank = n if kind == 'cartan' else n - 1
        mult = [[A[i, j] * A[j, i] if i != j else 0 for j in range(n)]
                for i in range(n)]
        if rank >= 3:
            check(max(max(r) for r in mult) <= 2,
                  'Corollary of Proposition 2.1: rank >= 3, edges of '
                  'multiplicity 1, 2 only (%s)' % name)
            vmax = max(sum(r) for r in mult)
            if kind == 'cartan' or name not in ('B3^(1)', 'A5^(2)', 'D4^(1)'):
                check(vmax <= 3, 'Problem 2.54: vertex sums <= 3 in %s'
                      % name)
            else:
                check(vmax == 4, 'Problem 2.54: %s is a true exception' % name)
        branch = sum(1 for r in mult if sum(1 for m in r if m) > 2)
        multi = sum(1 for i in range(n) for j in range(i + 1, n)
                    if mult[i][j] >= 2)
        sing = branch + multi
        if kind == 'cartan':
            check(sing <= 1, 'Problem 2.55: %s has <= 1 singularity' % name)
        else:
            fam = None
            for pat, lo in (('B%d^(1)', 3), ('C%d^(1)', 2), ('D%d^(1)', 5)):
                for l in range(lo, 9):
                    if name == pat % l:
                        fam = name
            for l in range(2, 9):
                if name in ('D%d^(2)' % (l + 1), 'A%d^(2)' % (2 * l)):
                    fam = name
            for l in range(3, 9):
                if name == 'A%d^(2)' % (2 * l - 1):
                    fam = name
            check((sing >= 2) == (fam is not None),
                  'Problem 2.55: %s has %d singularities' % (name, sing))
    check(ak.get(matrix_key(affine['D4^(1)'])) == 'D4^(1)'
          and affine['D4^(1)'].nrows() - 1 == 4,
          'Problem 2.54: D_4^(1) has rank 4, so the exception list needs '
          '"rank >= 3" (the printed "rank 3" cannot mean it)')
    # Examples 3-5 as drawn vs the constructions (alpha_0 pinned)
    def same(drawn, computed):
        return matrix_key(drawn, pinned=0) == matrix_key(computed, pinned=0)
    for l in range(2, 9):
        simple, roots = ambient(['A', l])
        comp = extended_from_vectors(simple, -highest_root(simple, roots))
        check(same(drawn_extended('A1', l)[1], comp),
              'Example 2.3: A_%d^(1) as drawn (cycle through alpha_0)' % l)
    simple, roots = ambient(['A', 1])
    check(same(drawn_extended('A1^(1)', 1)[1],
               extended_from_vectors(simple, -highest_root(simple, roots))),
          'Example 2.3: A_1^(1) as drawn (quadruple edge)')
    for fam, X, lo in (('B1', 'B', 3), ('D1', 'D', 4), ('C1', 'C', 2)):
        for l in range(lo, 9):
            simple, roots = ambient([X, l])
            comp = extended_from_vectors(simple, -highest_root(simple, roots))
            check(same(drawn_extended(fam, l)[1], comp),
                  'Example 2.3: %s_%d^(1) as drawn' % (X, l))
    simple, roots = ambient(['G', 2])
    check(same(drawn_extended('G1', 2)[1],
               extended_from_vectors(simple, -highest_root(simple, roots))),
          'Example 2.3: G_2^(1) as drawn')
    # Example 4: reversing the arrows of B_l^(1), C_l^(1), G_2^(1)
    for fam, fam1, X, adj, lo in (
            ('A2l-1^(2)', 'B1', 'C', lambda l: -eps(l, (1, 1), (2, 1)), 3),
            ('D(l+1)^(2)', 'C1', 'B', lambda l: -eps(l, (1, 1)), 2)):
        for l in range(lo, 9):
            simple, roots = ambient([X, l])
            dr = drawn_extended(fam, l)[1]
            check(same(dr, drawn_extended(fam1, l)[1].transpose()),
                  'Example 2.4: %s (l = %d) is %s^(1) with the arrows '
                  'reversed' % (fam, l, fam1[0]))
            check(same(dr, extended_from_vectors(simple, adj(l))),
                  'Example 2.4: %s (l = %d) is Pi(%s_%d) with the printed '
                  'root adjoined at the left end' % (fam, l, X, l))
            short = min(r * r for r in roots)
            shorts = [r for r in roots if r * r == short]
            S = matrix(QQ, simple)
            check(adj(l) in shorts and all(
                all(c >= 0 for c in S.solve_left(r - adj(l))) for r in shorts),
                'Example 2.4: the adjoined root is the lowest short root of '
                '%s_%d' % (X, l))
    simple, roots = ambient(['G', 2])
    adjg = -(2 * simple[0] + simple[1])
    check(same(drawn_extended('D4^(3)', 2)[1],
               drawn_extended('G1', 2)[1].transpose())
          and same(drawn_extended('D4^(3)', 2)[1],
                   extended_from_vectors(simple, adjg)),
          'Example 2.4: D_4^(3) = G_2^(1) reversed = Pi(G_2) + '
          '(-(2 alpha_1 + alpha_2))')
    short = min(r * r for r in roots)
    S = matrix(QQ, simple)
    check(simple[0] * simple[0] == short and adjg * adjg == short and all(
        all(c >= 0 for c in S.solve_left(r - adjg))
        for r in roots if r * r == short),
        'Example 2.4: alpha_1 is short in G_2 and -(2 alpha_1 + alpha_2) is '
        'the lowest short root')
    for l in range(2, 9):
        simple, roots = ambient(['B', l])
        adj = -2 * eps(l, (1, 1))
        check(same(drawn_extended('A2l^(2)', l)[1],
                   extended_from_vectors(simple, adj))
              and tuple(adj) not in set(tuple(r) for r in roots),
              'Example 2.5: A_%d^(2) as drawn is Pi(B_%d) + (-2 eps_1) (not '
              'a root of B_%d)' % (2 * l, l, l))
    # Problem 56 (p. 171): determinants of E_l, F_l, F_l^v as drawn
    def E_l(l):
        v = ['v%d' % i for i in range(1, l)] + ['p']
        return diagram(v, chain(v[:-1]) + [('v3', 'p', 1, None)])

    def F_l(l):
        v = ['v%d' % i for i in range(1, l + 1)]
        bonds = [b for b in chain(v) if (b[0], b[1]) != ('v2', 'v3')]
        return diagram(v, bonds + [('v2', 'v3', 2, 'v2')])
    for l in range(6, 17):
        check(E_l(l).det() == 9 - l,
              'Problem 2.56: delta(E_%d) = 9 - %d = %d' % (l, l, 9 - l))
    for l in range(4, 17):
        check(F_l(l).det() == 5 - l and F_l(l).transpose().det() == 5 - l,
              'Problem 2.56: delta(F_%d) = delta(F_%d^v) = %d' % (l, l, 5 - l))
    for L in (E_l, F_l):
        for l in range(8, 17):
            check(L(l).det() == 2 * L(l - 1).det() - L(l - 2).det(),
                  'Hint 2.56: delta(L_l) = 2 delta(L_(l-1)) - delta(L_(l-2))')
    check(all(matrix_key(E_l(l)) == matrix_key(cartan['E%d' % l])
              for l in (6, 7, 8))
          and matrix_key(F_l(4)) == matrix_key(cartan['F4'])
          and matrix_key(F_l(4).transpose()) == matrix_key(cartan['F4']),
          'Problem 2.56: E_6, E_7, E_8, F_4 = F_4^v are Dynkin diagrams')
    check(matrix_key(E_l(9)) == matrix_key(affine['E8^(1)'])
          and matrix_key(F_l(5)) == matrix_key(affine['F4^(1)'])
          and matrix_key(F_l(5).transpose())
          == matrix_key(matrix(QQ, CartanType(['E', 6, 2]).cartan_matrix())
                        .transpose()),
          'Problem 2.56: E_9 = E_8^(1), F_5 = F_4^(1), F_5^v = E_6^(2) '
          '(E_6^(2) as in Sage/Kac)')
    check(all(E_l(l).det() < 0 for l in range(10, 17))
          and all(F_l(l).det() < 0 for l in range(6, 17)),
          'Problem 2.56: E_l (l >= 10), F_l (l >= 6) are not admissible')
    # Problem 57 (p. 171)
    v6 = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
    E61 = diagram(v6, chain(['a', 'b', 'c', 'd', 'e'])
                  + [('c', 'f', 1, None), ('f', 'g', 1, None)])
    v7 = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'p']
    E71 = diagram(v7, chain(v7[:7]) + [('d', 'p', 1, None)])
    check(matrix_key(E61) == matrix_key(affine['E6^(1)'])
          and E61.det() == 0
          and matrix_key(E61.matrix_from_rows_and_columns(
              range(6), range(6))) == matrix_key(cartan['E6']),
          'Problem 2.57: the drawn E_6^(1) is affine and contains E_6')
    check(matrix_key(E71) == matrix_key(affine['E7^(1)'])
          and E71.det() == 0
          and matrix_key(E71.matrix_from_rows_and_columns(
              [1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 7]))
          == matrix_key(cartan['E7']),
          'Problem 2.57 corrected: the 8-vertex E_7^(1) (chain of 7, one '
          'vertex at the middle) is affine and contains E_7')
    v7p = ['a', 'b', 'c', 'd', 'e', 'f', 'p']
    E7p = diagram(v7p, chain(v7p[:6]) + [('c', 'p', 1, None)])
    refuted(E7p.det() == 0,
            'Problem 2.57 as printed: the 7-vertex graph (chain of 6, one '
            'vertex at the third) is affine; its determinant is %s, it is E_7'
            % E7p.det())
    check(matrix_key(E7p) == matrix_key(cartan['E7']),
          'Problem 2.57 as printed: the printed graph is the Dynkin diagram '
          'E_7 itself')
    # Problem 59: the extended diagrams of E_6-8, F_4
    for nm in ('E6', 'E7', 'E8', 'F4'):
        check(matrix_key(affine[nm + '^(1)']) in ak,
              'Problem 2.59: the extended diagram of %s is %s^(1)' % (nm, nm))
    return cartan, affine


def closure(R, gens):
    """Smallest symmetric closed subset of R containing gens (2.8 deg,
    Exercises 29-43: closed = a, b in M, a + b in Delta => a + b in M)."""
    M = set(gens) | set(tuple(-x for x in g) for g in gens)
    todo = list(M)
    while todo:
        a = todo.pop()
        for b in list(M):
            s = R.add(a, b)
            if s in R.rset and s not in M:
                M.add(s)
                M.add(tuple(-x for x in s))
                todo.append(s)
                todo.append(tuple(-x for x in s))
    return M


def zspan_roots(R, gens):
    """[M] of 2.8 deg: roots that are integral combinations of gens
    (gens linearly independent)."""
    Gm = matrix(QQ, gens)
    out = set()
    for c in R.co:
        try:
            x = Gm.solve_left(vector(QQ, c))
        except ValueError:
            continue
        if all(y in ZZ for y in x):
            out.add(c)
    return out


def is_maximal(R, sub, gens):
    """Is the symmetric closed subsystem `sub` (with base gens) maximal?
    Enough to test one root of each W(sub)-orbit outside it."""
    if sub == R.rset:
        return False
    rest = R.rset - sub
    while rest:
        b = next(iter(rest))
        orb, todo = {b}, [b]
        while todo:
            x = todo.pop()
            for g in gens:
                y = R.add(x, g, -R.pair(x, g))
                if y not in orb:
                    orb.add(y)
                    todo.append(y)
        rest -= orb
        if closure(R, list(sub) + [b]) != R.rset:
            return False
    return True


def section_4_2_subsystems_lattices():
    """Theorem 14 and Problems 60-62 (BC_l), Problems 63-67 and 2.8 deg
    (P/Q), Exercises 36, 39, 42, 43."""
    # BC_l and Theorem 14
    for l in range(1, 7):
        rts = []
        for i in range(1, l + 1):
            for c in (1, 2):
                rts += [c * eps(l, (i, 1)), -c * eps(l, (i, 1))]
            for j in range(i + 1, l + 1):
                for si in (1, -1):
                    for sj in (1, -1):
                        rts.append(eps(l, (i, si), (j, sj)))
        rs = set(tuple(r) for r in rts)
        d0 = [r for r in rts if tuple(r / 2) not in rs]
        check(is_root_system(rts) and not is_reduced(rts)
              and orthogonality_connected(rts),
              'Theorem 2.14: BC_%d = B_%d u C_%d is an indecomposable '
              'nonreduced root system' % (l, l, l))
        Bl = ambient(['B', l])[1] if l >= 2 else [vector(QQ, [1]),
                                                   vector(QQ, [-1])]
        check(set(tuple(r) for r in d0) == set(tuple(r) for r in Bl)
              and is_reduced(d0),
              'Problems 2.60, 2.61: Delta_0 of BC_%d is B_%d' % (l, l))
        base = ambient(['B', l])[0] if l >= 2 else [vector(QQ, [1])]
        check(is_base(base, rts),
              'Problem 2.60: a base of Delta_0 = B_%d is a base of BC_%d'
              % (l, l))
        short = min(r * r for r in d0)
        check(rs - set(tuple(r) for r in d0)
              == set(tuple(2 * r) for r in d0 if r * r == short),
              'Hint 2.62: Delta - Delta_0 = doubled short roots of Delta_0 '
              '(BC_%d)' % l)
    # Theorem 14: no other reduced Delta_0 admits doubled roots
    for X, n in [('A', 1)] + all_types(5):
        R = RootData(X, n)
        orbs = {}
        for c in R.co:
            orbs.setdefault(R.ip(c, c), []).append(R.co[c])
        for k in range(1, len(orbs) + 1):
            for S in itertools.combinations(sorted(orbs), k):
                doubled = [2 * r for L in S for r in orbs[L]]
                ok = is_root_system(R.roots + doubled)
                expect = (X == 'A' and n == 1) or \
                    (X == 'B' and S == (min(orbs),))
                check(ok == expect,
                      'Theorem 2.14: doubling %s roots of %s%d %s a root '
                      'system' % ('/'.join(str(x) for x in S), X, n,
                                  'gives' if expect else 'does not give'))
    # Lattices: formula (6), Problems 65, 66, P/Q cyclic except D_2s
    for X, n in all_types(12):
        simple, roots = ambient([X, n])
        l = len(simple)
        A = book_cartan(simple)
        cor = matrix(QQ, [2 * a / (a * a) for a in simple])
        # pi_i: <pi_i|alpha_j> = pi_i . alpha_j^v = delta_ij, pi_i in span
        S = matrix(QQ, simple)
        C = cor * S.transpose()           # alpha_j^v . alpha_k
        coeff = C.inverse().transpose()   # pi_i = sum_k coeff[i, k] alpha_k
        pis = coeff * S
        check(pis * cor.transpose() == identity_matrix(QQ, l)
              and S == A * pis,
              'formula (2.6): alpha_i = sum_j a_ij pi_j, %s%d' % (X, n))
        M = FreeModule(ZZ, l)
        Qlat = M.submodule([M(list(r)) for r in A.rows()])
        inv = [x for x in M.quotient(Qlat).invariants()]
        Az = A.change_ring(ZZ)
        ed = [x for x in Az.elementary_divisors() if x != 1]
        check(sorted(inv) == sorted(ed) and prod(inv) == A.det(),
              'Problem 2.65: pi(Delta) = P/Q = sum Z_(m_i) over the '
              'invariant factors of A, |pi| = det A = %d, %s%d'
              % (A.det(), X, n))
        cyc = len(inv) <= 1
        check(cyc == (not (X == 'D' and n % 2 == 0)),
              '2.8: pi(Delta) is cyclic unless Delta = D_2s (%s%d)' % (X, n))
        check(Az.transpose().elementary_divisors() == Az.elementary_divisors(),
              'Problem 2.66 / Hint 2.63: pi(Delta^v) = pi(Delta), %s%d'
              % (X, n))
        # Q^v = P^*: the simple coroots are the basis dual to pi_j
        check(cor * pis.transpose() == identity_matrix(QQ, l),
              'Problem 2.66: Q^v = P^* (alpha_i^v(pi_j) = delta_ij), %s%d'
              % (X, n))
    # Exercises 39, 42, 43, 36
    for X, n in all_types(8):
        R = RootData(X, n)
        l = R.l
        ns = list(R.delta)
        a0 = tuple(-x for x in R.delta)
        e_ = [tuple(1 if j == i else 0 for j in range(l)) for i in range(l)]
        ext = [a0] + e_
        Aext = matrix(QQ, l + 1, l + 1, lambda i, j: R.pair(ext[i], ext[j]))
        auts = diagram_automorphisms(Aext)
        # a regular point of the fundamental chamber: (rho, alpha_j) = 1
        rho = R.G.inverse() * vector(QQ, [1] * l)
        for i in range(1, l + 1):
            G_ = [ext[j] for j in range(l + 1) if j != i]
            base_ok = is_base([vector(QQ, c) * R.S for c in G_], R.roots)
            # (iii) of Exercise 39
            found = False
            for s in auts:
                if s[0] != i:
                    continue
                Wm = matrix(QQ, [list(ext[s[j]]) for j in range(1, l + 1)])
                # the linear map w in simple-root coordinates: rows = w(e_j)
                if vector(QQ, a0) * Wm != vector(QQ, ext[s[0]]):
                    continue
                v = rho * Wm        # w(rho) in simple-root coordinates
                word = []
                for _ in range(10 ** 4):
                    j = next((j for j in range(l)
                              if (v * R.G)[j] < 0), None)
                    if j is None:
                        break
                    ej = vector(QQ, e_[j])
                    v = v - R.pair(tuple(v), e_[j]) * ej
                    word.append(j)
                imgs = []
                for j in range(l):
                    x = tuple(Wm.row(j))
                    for t in word:
                        x = R.refl(t, x)
                    imgs.append(x)
                if imgs == e_:
                    found = True
            check(base_ok == (ns[i - 1] == 1) and found == (ns[i - 1] == 1),
                  'Exercise 2.39: n_%d = %d; Pi~ - {alpha_%d} is %sa base '
                  'and %s w in W with w(Pi~) = Pi~, w(alpha_0) = alpha_%d, '
                  '%s' % (i, ns[i - 1], i, '' if base_ok else 'not ',
                          'there is' if found else 'no', i, R.name))
            if ns[i - 1] > 1:
                sub = zspan_roots(R, G_)
                mx = is_maximal(R, sub, G_)
                prime = ZZ(ns[i - 1]).is_prime()
                check(mx == prime,
                      'Exercise 2.42: [Pi~ - {alpha_%d}] (n = %d) is %s'
                      'maximal, %s' % (i, ns[i - 1], '' if mx else 'not ',
                                       R.name))
            Gp = [e_[j] for j in range(l) if j != i - 1]
            sub = zspan_roots(R, Gp) if Gp else set()
            mx = is_maximal(R, sub, Gp)
            check(mx == (ns[i - 1] == 1),
                  'Exercise 2.43: [Pi - {alpha_%d}] is %smaximal (n = %d), %s'
                  % (i, '' if mx else 'not ', ns[i - 1], R.name))
            check((zspan_roots(R, G_) == R.rset) == (ns[i - 1] == 1),
                  'Exercise 2.36: [Gamma\'] = [Pi] iff alpha_%d has '
                  'coefficient 1 in -alpha_0, %s' % (i, R.name))


# ---------------------------------------------------------------------------
# 4.3 Existence and uniqueness theorems
# ---------------------------------------------------------------------------

def irr(WR, labels):
    """The irreducible character with the given numerical labels (built from
    the fundamental weights: WR(k) with one integer is k times the trivial
    character, not the representation with label k)."""
    fw = WR.fundamental_weights()
    idx = list(fw.keys())
    return WR(sum(c * fw[i] for c, i in zip(labels, idx)))


def hw_module_dims(X, n, Lam, depth, printed_rule=False):
    """Dimensions of the weight spaces of V(Lambda) = V^/M^(Lambda) built as
    in 4.3, 2-3 deg: V^ has the basis v_(i_1 ... i_k), the operators are
    formulas (7) (with the book's a_ij = <alpha_i|alpha_j>), and M^(Lambda)
    is computed by the recursion of Exercise 3 (p. 195): v in V^_lambda
    (lambda != Lambda) is in M iff e_i v is in M for all i.  With
    printed_rule=True the recursion is applied to lambda = Lambda as well
    (the printed statement).  Returns {counts c: dim of the quotient at
    Lambda - sum c_i alpha_i} for all c of height <= depth."""
    simple, _ = ambient([X, n])
    A = book_cartan(simple)
    l = len(simple)
    memo = {}

    def e_act(i, seq):
        key = (i, seq)
        if key in memo:
            return memo[key]
        res = {}
        if seq:
            i1, rest = seq[0], seq[1:]
            if i == i1:
                c = Lam[i] - sum(A[j, i] for j in rest)
                if c:
                    res[rest] = res.get(rest, 0) + c
            for s2, c2 in e_act(i, rest).items():
                t = (i1,) + s2
                res[t] = res.get(t, 0) + c2
        res = {k: v for k, v in res.items() if v}
        memo[key] = res
        return res
    seqs = {(0,) * l: [()]}
    P = {(0,) * l: matrix(QQ, 0, 1) if printed_rule
         else identity_matrix(QQ, 1)}
    dims = {(0,) * l: P[(0,) * l].nrows()}
    level = [()]
    for d in range(1, depth + 1):
        level = [(i,) + s for i in range(l) for s in level]
        groups = {}
        for s in level:
            c = [0] * l
            for i in s:
                c[i] += 1
            groups.setdefault(tuple(c), []).append(s)
        for c, S in groups.items():
            seqs[c] = S
            blocks = []
            for i in range(l):
                if c[i] == 0:
                    continue
                cu = tuple(c[j] - (1 if j == i else 0) for j in range(l))
                Su = seqs[cu]
                pos = {s: k for k, s in enumerate(Su)}
                Ei = matrix(QQ, len(Su), len(S))
                for col, s in enumerate(S):
                    for t, v in e_act(i, s).items():
                        Ei[pos[t], col] += v
                blocks.append(P[cu] * Ei)
            Z = block_matrix([[b] for b in blocks]) if blocks else \
                matrix(QQ, 0, len(S))
            Z = matrix(QQ, Z)
            rs = Z.row_space().basis_matrix() if Z.nrows() else \
                matrix(QQ, 0, len(S))
            P[c] = rs
            dims[c] = rs.nrows()
    return dims, P, seqs


def section_4_3():
    """4.3 (printed pp. 181-201)."""
    # 1 deg: the printed ideal I (p. 182).  In the free algebra the degree-2
    # part of the ideal generated by the x_i x_i and the Jacobi sums of
    # generators is spanned by the x_i x_i (products raise the degree and
    # the Jacobi sums have degree 3), so x_1 x_2 + x_2 x_1 is not in it.
    words = [(1, 1), (1, 2), (2, 1), (2, 2)]
    I2 = matrix(QQ, [[1, 0, 0, 0], [0, 0, 0, 1]]).row_space()
    anti = vector(QQ, [0, 1, 1, 0])
    refuted(anti in I2,
            '4.3.1 as printed (p. 182): the ideal generated by x_i x_i and '
            'the Jacobi sums of generators contains x_1 x_2 + x_2 x_1 '
            '(needed for anticommutativity)')
    uu = vector(QQ, [1, 1, 1, 1])    # (x_1 + x_2)(x_1 + x_2)
    I2c = matrix(QQ, [[1, 0, 0, 0], [0, 0, 0, 1], list(uu)]).row_space()
    check(anti in I2c,
          '4.3.1 corrected: with u u for all u in the ideal, x_1 x_2 + '
          'x_2 x_1 = (x_1 + x_2)^2 - x_1^2 - x_2^2 is in it')
    # Problem 4 (relations (2)), Problem 26 (Serre relations), Problem 1.42
    for X, n in all_types(8):
        simple, roots = ambient([X, n])
        A = book_cartan(simple)
        L = LieAlgebra(QQ, cartan_type=[X, n])
        idx = list(RootSystem([X, n]).root_lattice().index_set())
        e = [L.e(i) for i in idx]
        f = [L.f(i) for i in idx]
        h = [L.bracket(e[i], f[i]) for i in range(n)]
        ok = True
        for i in range(n):
            for j in range(n):
                ok = ok and L.bracket(h[i], h[j]) == 0
                ok = ok and L.bracket(h[i], e[j]) == A[j, i] * e[j]
                ok = ok and L.bracket(h[i], f[j]) == -A[j, i] * f[j]
                if i != j:
                    ok = ok and L.bracket(e[i], f[j]) == 0
        check(ok, 'Problem 3.4: relations (2) [h_i, e_j] = a_ji e_j, '
              '[h_i, f_j] = -a_ji f_j, [e_i, f_j] = delta_ij h_i hold with '
              'a_ij = <alpha_i|alpha_j>, %s%d' % (X, n))
        okS = okSharp = True
        bad_printed = False
        for i in range(n):
            for j in range(n):
                if i == j:
                    continue
                for gen in (e, f):
                    x = gen[i]
                    powers = [x]
                    for k in range(1, 5):
                        powers.append(L.bracket(gen[j], powers[-1]))
                    okS = okS and powers[1 - A[i, j]] == 0
                    okSharp = okSharp and powers[-A[i, j]] != 0
                    if 1 - A[j, i] < 1 - A[i, j] and powers[1 - A[j, i]] != 0:
                        bad_printed = True
        check(okS, 'Problem 3.26: (ad e_j)^(1 - a_ij) e_i = (ad f_j)^'
              '(1 - a_ij) f_i = 0 (i != j), %s%d' % (X, n))
        check(okSharp, 'Problem 3.26: the exponent 1 - a_ij is the least '
              'possible, %s%d' % (X, n))
        if X in 'BCFG':
            refuted(not bad_printed,
                    'Problem 3.26 as printed: (ad e_j)^(1 - a_ji) e_i = 0 for '
                    'all i != j fails in %s%d' % (X, n))
        else:
            check(A == A.transpose(), 'simply laced: the printed and the '
                  'corrected exponents agree, %s%d' % (X, n))
    # B_2 counterexample written out (the log's example)
    L = LieAlgebra(QQ, cartan_type=['B', 2])
    simple, _ = ambient(['B', 2])
    A = book_cartan(simple)
    check(A[0, 1] == -2 and A[1, 0] == -1
          and L.bracket(L.e(2), L.bracket(L.e(2), L.e(1))) != 0,
          'Problem 3.26: in B_2 (alpha_1 long) a_12 = -2, a_21 = -1 and '
          '[e_2, [e_2, e_1]] != 0 (alpha_1 + 2 alpha_2 is a root)')
    # Problem 1.42 and generation (Problem 3.4) for small types
    for X, n in (('A', 2), ('A', 3), ('B', 2), ('B', 3), ('C', 3), ('D', 4),
                 ('G', 2), ('F', 4)):
        L = LieAlgebra(QQ, cartan_type=[X, n])
        basis = list(L.basis())
        byroot = {}
        for b in basis:
            k = b.leading_support()
            if 'check' not in str(k):
                byroot[k] = b
        ok = all(L.bracket(byroot[a], byroot[b]) != 0 for a in byroot
                 for b in byroot if a + b in byroot)
        check(ok, 'Problem 1.42: [g_a, g_b] = g_(a+b) whenever a, b, a + b '
              'are roots, %s%d' % (X, n))
        idx = list(RootSystem([X, n]).root_lattice().index_set())
        gens = [L.e(i) for i in idx] + [L.f(i) for i in idx]
        span = matrix(QQ, [g.to_vector() for g in gens]).row_space()
        frontier = list(gens)
        while frontier:
            new = []
            for x in frontier:
                for g in gens:
                    y = L.bracket(g, x)
                    v = y.to_vector()
                    if v not in span:
                        span = span + matrix(QQ, [v]).row_space()
                        new.append(y)
            frontier = new
        check(span.dimension() == L.dimension(),
              'Problem 3.4: h_i, e_i, f_i generate %s%d (dimension %d)'
              % (X, n, L.dimension()))
    # Example of 3 deg (pp. 188-189): rho_k on homogeneous polynomials of
    # degree k in x, y; e = x d/dy, f = y d/dx, h = x d/dx - y d/dy
    Rxy = PolynomialRing(QQ, 'x,y')
    x, y = Rxy.gens()
    for k in range(0, 9):
        mons = [x ** (k - j) * y ** j for j in range(k + 1)]

        def mat(op):
            return matrix(QQ, [[op(m).monomial_coefficient(mm) if op(m) != 0
                                else 0 for m in mons] for mm in mons])
        Em = mat(lambda p: x * p.derivative(y))
        Fm = mat(lambda p: y * p.derivative(x))
        Hm = mat(lambda p: x * p.derivative(x) - y * p.derivative(y))
        check(Hm * Em - Em * Hm == 2 * Em and Hm * Fm - Fm * Hm == -2 * Fm
              and Em * Fm - Fm * Em == Hm,
              'Example 3.3: rho_%d is a representation of sl_2' % k)
        v0 = vector(QQ, [1] + [0] * k)
        vs = [v0]
        for s in range(1, k + 1):
            vs.append(Fm * vs[-1])
        check(all(Em * vs[s] == s * (k - s + 1) * vs[s - 1]
                  for s in range(1, k + 1)) and (Em * v0).is_zero()
              and (Fm * vs[k]).is_zero() and len(vs) == k + 1
              and matrix(QQ, vs).rank() == k + 1,
              'Example 3.3: rho_k(e) v_(Lambda - s alpha) = s(k - s + 1) '
              'v_(Lambda - (s-1) alpha), dim V = k + 1 (k = %d)' % k)
        check(sorted(Hm.diagonal()) == sorted(k - 2 * s for s in range(k + 1)),
              'Example 3.3: Phi(rho_k) = {k, k - 2, ..., -k} alpha/2 (k = %d)'
              % k)
        # invariant bilinear forms B (Gram matrix): M^T B + B M = 0
        n1 = k + 1
        Bv = PolynomialRing(QQ, ['b%d' % i for i in range(n1 * n1)])
        Bm = matrix(Bv, n1, n1, Bv.gens())
        eqsB = []
        for M in (Em, Fm, Hm):
            eqsB += [q for q in (M.transpose() * Bm + Bm * M).list() if q]
        Mx = matrix(QQ, len(eqsB), n1 * n1,
                    [[eq.monomial_coefficient(g) for g in Bv.gens()]
                     for eq in eqsB])
        K = Mx.right_kernel()
        check(K.dimension() == 1,
              'Exercise 3.10: rho_%d has a one-dimensional space of '
              'invariant bilinear forms' % k)
        Bf = matrix(QQ, n1, n1, list(K.basis()[0]))
        check(Bf.det() != 0 and
              (Bf == Bf.transpose()) == (k % 2 == 0) and
              (Bf == -Bf.transpose()) == (k % 2 == 1),
              'Exercise 3.11: R_%d is %s' % (k, 'orthogonal' if k % 2 == 0
                                             else 'symplectic'))
        check((-1) ** k == (1 if k % 2 == 0 else -1),
              'Example 3.6: R_k(-E) = (-1)^k E, so SO_3 has the even k')
    # Highest weight modules via the recursion of Exercise 3 (p. 195)
    cases = [('A', 2, (1, 1)), ('A', 2, (2, 0)), ('A', 3, (1, 0, 1)),
             ('B', 2, (1, 0)), ('B', 2, (0, 1)), ('B', 2, (0, 2)),
             ('B', 3, (0, 0, 1)), ('G', 2, (1, 0)), ('G', 2, (0, 1)),
             ('C', 3, (0, 1, 0))]
    for X, n, Lam in cases:
        WR = WeylCharacterRing([X, n], style='coroots')
        V = irr(WR, Lam)
        simple, roots = ambient([X, n])
        A = book_cartan(simple)
        sr = WR.simple_roots()
        idx = list(sr.keys())
        # weights by their numerical labels <w|alpha_j>
        mult = {}
        for w, m in V.weight_multiplicities().items():
            lab = tuple(2 * w.inner_product(sr[j]) / sr[j].inner_product(sr[j])
                        for j in idx)
            mult[lab] = mult.get(lab, 0) + m
        Lv = vector(QQ, Lam)
        depth = max(sum(A.solve_left(Lv - vector(QQ, lab))) for lab in mult)
        dims, Pm, seqs = hw_module_dims(X, n, Lam, depth + 2)
        ok = True
        total = 0
        for c, dq in dims.items():
            lab = tuple(Lv - vector(QQ, c) * A)
            ok = ok and dq == mult.get(lab, 0)
            total += dq
        top = sum(Lam[i] * WR.fundamental_weights()[idx[i]] for i in range(n))
        allw = V.weight_multiplicities()
        check(ok and total == V.degree() and dims[(0,) * n] == 1,
              'Exercise 3.3 (corrected, lambda != Lambda) and Theorem 3.4: '
              'V^/M^(Lambda) has the weight multiplicities of the '
              'irreducible module %s%d%s (dim %d), dim V_Lambda = 1'
              % (X, n, Lam, V.degree()))
        check(all(d == 0 for c, d in dims.items() if sum(c) > depth),
              'Theorem 3.4 / Problem 3.20: the quotient vanishes below the '
              'lowest weight, %s%d%s' % (X, n, Lam))
        # Problem 28: f_i^(Lambda_i + 1) v_0 lies in M
        ok = True
        for i in range(n):
            c = tuple(Lam[i] + 1 if j == i else 0 for j in range(n))
            if sum(c) <= depth + 2:
                S = seqs[c]
                pos = S.index((i,) * (Lam[i] + 1))
                ok = ok and Pm[c].column(pos).is_zero()
        check(ok, 'Problem 3.28: rho(f_i)^(Lambda_i + 1) v_0 = 0, %s%d%s'
              % (X, n, Lam))
        # Problem 34: (lambda, lambda) <= (Lambda, Lambda)
        check(all(w.inner_product(w) <= top.inner_product(top)
                  for w in allw),
              'Problem 3.34: (lambda, lambda) <= (Lambda, Lambda), %s%d%s'
              % (X, n, Lam))
        dimsP, _, _ = hw_module_dims(X, n, Lam, min(depth, 3),
                                     printed_rule=True)
        refuted(sum(dimsP.values()) > 0,
                'Exercise 3.3 as printed (also for lambda = Lambda): '
                'e_i v_0 = '
                '0 would put v_0 into M^(Lambda) and kill the module, %s%d%s'
                % (X, n, Lam))
    # Theorems 5, 7, 8, Problem 2.67, Exercise 29: the classical groups
    groups = ([('SL', 'sl', l) for l in range(1, 6)]
              + [('Sp', 'sp', l) for l in range(1, 5)]
              + [('SO_odd', 'so_odd', l) for l in range(1, 5)]
              + [('SO_even', 'so_even', l) for l in range(2, 6)])
    for G, kind, l in groups:
        d = classical(kind, l)
        rts = {tuple(c): h for _, c, _, h in d['roots']}
        pos = [c for c in rts if next(x for x in c if x != 0) > 0]
        sums = set(tuple(a + b for a, b in zip(u, v)) for u in pos
                   for v in pos)
        base = [c for c in pos if c not in sums]
        base.sort(key=lambda c: [-x for x in c])
        r = len(base)
        hs = [rts[c] for c in base]
        # numerical labels of eps_i and of the simple roots
        neps = len(d['eps'])
        X_T = [[d['eps'][i](h) for h in hs] for i in range(neps)]
        Qrows = [[weight_of(d, c, h) for h in hs] for c in base]
        M = FreeModule(ZZ, r)
        Xl = M.submodule([M(v) for v in X_T])
        Ql = M.submodule([M(v) for v in Qrows])
        check(Ql.is_submodule(Xl) and Xl.is_submodule(M),
              'Problem 2.67: Q in X(T) in P for %s (l = %d)' % (G, l))
        pi1 = M.quotient(Xl).invariants()
        Z = Xl.quotient(Ql).invariants()
        n_ = d['n']
        exp_pi1 = () if G in ('SL', 'Sp') else (2,)
        exp_Z = {'SL': (n_,) if n_ > 1 else (), 'Sp': (2,),
                 'SO_odd': (), 'SO_even': (2,)}[G]
        check(tuple(pi1) == exp_pi1,
              'Theorem 3.8 / Exercise 3.29: pi_1(%s_%d) = P/X(T) = %s'
              % (G, n_, pi1))
        check(tuple(Z) == exp_Z,
              'Theorem 3.7: Z(%s_%d) = X(T)/Q = %s (the scalar matrices in '
              'the group)' % (G, n_, Z))
        if G in ('SL', 'Sp'):
            check(Xl == M, 'Theorem 3.5: %s_%d is simply connected and '
                  'X(T) = P' % (G, n_))
        # Exercise 26: labels of the identity representation (highest
        # weight eps_1)
        lab = X_T[0]
        exp_lab = [2] if (G == 'SO_odd' and l == 1) else \
            [1] + [0] * (r - 1)
        if G == 'SO_even' and l == 2:
            exp_lab = [1, 1]      # D_2 = A_1 + A_1: SO_4 on C^4
        check(list(lab) == exp_lab,
              'Exercise 3.26: the diagram of Id of %s_%d has labels %s'
              % (G, n_, exp_lab))
    # Example 2 of 5 deg (p. 193): D_2s, the classes of subgroups of order 2
    for s in range(2, 6):
        l = 2 * s
        simple, _ = ambient(['D', l])
        A = book_cartan(simple).change_ring(ZZ)
        M = FreeModule(ZZ, l)
        Ql = M.submodule([M(list(r)) for r in A.rows()])
        Qt = M.quotient(Ql)
        check(tuple(Qt.invariants()) == (2, 2),
              'Example 3.2: pi(D_%d) = Z_2 + Z_2' % l)
        auts = diagram_automorphisms(book_cartan(simple))
        elems = [Qt(M.gen(i)) for i in range(l)]
        nonzero = sorted(set(tuple(Qt(v).vector()) for v in
                             [M.gen(0), M.gen(l - 2), M.gen(l - 1)]))
        check(len(nonzero) == 3 and all(any(x) for x in nonzero),
              'Example 3.2: pi_1, pi_(l-1), pi_l give the three nonzero '
              'classes of pi(D_%d)' % l)
        cls = {}
        for i in (0, l - 2, l - 1):
            cls[i] = tuple(Qt(M.gen(i)).vector())
        orbits = set()
        for i in cls:
            orb = frozenset(tuple(Qt(M.gen(p[i])).vector()) for p in auts)
            orbits.add(orb)
        check(len(orbits) == (1 if s == 2 else 2)
              and len(auts) == (6 if s == 2 else 2),
              'Example 3.2: |Aut| = %d and the three subgroups of order 2 '
              'form %d class(es), so there are %s group(s) with centre Z_2 '
              '(D_%d)' % (6 if s == 2 else 2, 1 if s == 2 else 2,
                          'one' if s == 2 else 'exactly two', l))
    # Exercise 34: Spin_n for n = 3..6 via the root systems of Examples 6-8
    def base_type(kind, l):
        d = classical(kind, l)
        rts = {tuple(c): h for _, c, _, h in d['roots']}
        pos = [c for c in rts if next(x for x in c if x != 0) > 0]
        sums = set(tuple(a + b for a, b in zip(u, v)) for u in pos
                   for v in pos)
        base = [c for c in pos if c not in sums]
        Am = matrix(QQ, len(base), len(base),
                    lambda i, j: weight_of(d, base[i], rts[base[j]]))
        return type_name(Am)
    for so, other in ((('so_odd', 1), ('sl', 1)),
                      (('so_even', 2), None),
                      (('so_odd', 2), ('sp', 2)),
                      (('so_even', 3), ('sl', 3))):
        t1 = base_type(*so)
        t2 = base_type(*other) if other else ['A1', 'A1']
        check(t1 == t2, 'Exercise 3.34: Spin_%d has the root system of the '
              'group on the right (%s)' % (classical(*so)['n'], t1))
    # Exercise 36: faithful representations of Spin_n
    for n in range(5, 17):
        if n % 2:
            X, l, lams = 'B', (n - 1) // 2, [[(n - 1) // 2 - 1]]
        else:
            X, l = 'D', n // 2
            lams = [[l - 2]] if n % 4 == 2 else [[l - 2, l - 1]]
        if X == 'D' and l < 3:
            continue
        simple, _ = ambient([X, l])
        A = book_cartan(simple).change_ring(ZZ)
        M = FreeModule(ZZ, l)
        for lam in lams:
            gens = [M(list(r)) for r in A.rows()] + [M.gen(i) for i in lam]
            check(M.submodule(gens) == M,
                  'Exercise 3.36: the weights of the printed representation '
                  'generate P, so it is faithful on Spin_%d' % n)
            if len(lam) == 2:
                for i in lam:
                    g1 = [M(list(r)) for r in A.rows()] + [M.gen(i)]
                    check(M.submodule(g1) != M,
                          'Exercise 3.36: one half-spin representation is '
                          'not faithful on Spin_%d' % n)
    # Exercises 27, 28 (Lambda^p Id, S^p Id) and 3.12-3.13 via characters
    for n in range(2, 7):
        WR = WeylCharacterRing(['A', n - 1], style='coroots')
        std = irr(WR, [1] + [0] * (n - 2))
        for p in range(1, n):
            lab = [1 if j == p - 1 else 0 for j in range(n - 1)]
            check(std.exterior_power(p) == irr(WR, lab),
                  'Exercise 3.27: Lambda^%d Id of SL_%d is irreducible with '
                  'the unit at the %d-th place' % (p, n, p))
        for p in range(1, 6):
            check(std.symmetric_power(p) == irr(WR, [p] + [0] * (n - 2)),
                  'Exercise 3.28: S^%d Id of SL_%d is irreducible with label '
                  '%d at alpha_1' % (p, n, p))
    for X, rng, pmax in (('B', range(2, 6), lambda m: m - 1),
                         ('D', range(3, 7), lambda m: m - 2)):
        for m in rng:
            WR = WeylCharacterRing([X, m], style='coroots')
            std = irr(WR, [1] + [0] * (m - 1))
            for p in range(1, pmax(m) + 1):
                lab = [1 if j == p - 1 else 0 for j in range(m)]
                check(std.exterior_power(p) == irr(WR, lab),
                      'Exercise 3.27: Lambda^%d Id of SO_%d is irreducible '
                      'with the unit at the %d-th place'
                      % (p, 2 * m + (1 if X == 'B' else 0), p))
    fs_types = ([('A', k) for k in range(1, 8)]
                + [('B', k) for k in range(2, 7)]
                + [('C', k) for k in range(2, 7)]
                + [('D', k) for k in range(4, 8)]
                + [('G', 2), ('F', 4), ('E', 6), ('E', 7)])
    for X, n in fs_types:
        WR = WeylCharacterRing([X, n], style='coroots')
        black = exercise13_black(X, n)
        simple, _ = ambient([X, n])
        W = WeylGroup(RootSystem([X, n]).ambient_space(), prefix='s')
        w0 = W.long_element().matrix()
        nu = [next(j for j, u in enumerate(simple) if u == -(w0 * v))
              for v in simple]
        for i in range(n):
            lab = [1 if j == i else 0 for j in range(n)]
            V = irr(WR, lab)
            if V.degree() > 400:
                continue
            ind = V.frobenius_schur_indicator()
            dlab = [0] * n
            dlab[nu[i]] = 1
            check(V.dual() == irr(WR, dlab),
                  'Exercise 3.5: the dual of %s%d%s has the highest weight '
                  '-w_0 Lambda' % (X, n, lab))
            if V.dual() != V:
                check(ind == 0, 'Exercise 3.7: %s%d%s is not self-dual'
                      % (X, n, lab))
                continue
            check(ind == (-1 if i in black else 1),
                  'Exercise 3.13: %s%d%s (dim %d) is %s' %
                  (X, n, lab, V.degree(),
                   'symplectic' if i in black else 'orthogonal'))
    for k in range(0, 8):
        WR = WeylCharacterRing(['A', 1], style='coroots')
        check(irr(WR, [k]).frobenius_schur_indicator()
              == (1 if k % 2 == 0 else -1),
              'Exercise 3.11: R_%d of SL_2 by the Frobenius-Schur indicator'
              % k)


# ---------------------------------------------------------------------------
# 4.4 Automorphisms: tau-hat, affine roots, Kac coordinates
# ---------------------------------------------------------------------------

class TwistedData(object):
    """The Lie algebra g of type (X, n) (Sage's Chevalley basis), a diagram
    automorphism sigma of order k, the automorphism tau-hat of (4.1)
    (e_i -> e_sigma(i), f_i -> f_sigma(i)) built on the whole basis, and the
    affine roots (alpha, m/k) of 4.4 deg: alpha = r(beta) in the basis
    Pi_0 = r(Pi) (one coordinate per <sigma>-orbit), m/k the eigenvalue
    exponent of tau-hat on g_alpha."""

    def __init__(self, X, n, sigma):
        L = LieAlgebra(QQ, cartan_type=[X, n])
        self.L = L
        Qr = RootSystem([X, n]).root_lattice()
        idx = list(Qr.index_set())
        self.idx = idx
        basis = list(L.basis())
        self.dim = len(basis)
        B = matrix(QQ, [b.to_vector() for b in basis])
        self.B = B
        pos = {}
        roots = {}
        for p, b in enumerate(basis):
            key = b.leading_support()
            pos[key] = p
            if 'check' not in str(key):
                roots[key] = b
        l0 = len(idx)
        simple = [Qr.simple_root(i) for i in idx]
        sig = {idx[i]: idx[sigma[i]] for i in range(l0)}
        self.k = 1
        p_ = list(range(l0))
        while True:
            p_ = [sigma[i] for i in p_]
            if p_ == list(range(l0)):
                break
            self.k += 1
        k = self.k
        # tau-hat on the basis
        e = {i: L.e(i) for i in idx}
        f = {i: L.f(i) for i in idx}
        img = {}
        for i in idx:
            img[pos[L.bracket(e[i], f[i]).leading_support()]] = \
                L.bracket(e[sig[i]], f[sig[i]])
        def coordvec(x):
            return B.solve_left(x.to_vector())
        for sgn, gen in ((1, e), (-1, f)):
            keys = sorted([r for r in roots if all(
                sgn * c >= 0 for c in r.coefficients())],
                key=lambda r: sgn * sum(r.coefficients()))
            done = {}
            for r in keys:
                cs = r.coefficients()
                if sum(abs(c) for c in cs) == 1:
                    i = next(i for i in idx if r == sgn * Qr.simple_root(i))
                    done[r] = gen[sig[i]]
                    continue
                for i in idx:
                    rr = r - sgn * Qr.simple_root(i)
                    if rr in done:
                        br = L.bracket(gen[i], roots[rr])
                        if br != 0:
                            c = coordvec(br)[pos[r]]
                            assert c != 0
                            done[r] = L.bracket(gen[sig[i]], done[rr]) / c
                            break
            for r, v in done.items():
                img[pos[r]] = v
        T = matrix(QQ, [coordvec(img[p]) for p in range(self.dim)]
                    ).transpose()
        self.T = T
        self.basis = basis
        self.pos = pos
        # orbits and the restriction r
        orbits = []
        seen = set()
        for i in range(l0):
            if i in seen:
                continue
            o, j = [], i
            while j not in o:
                o.append(j)
                j = sigma[j]
            seen |= set(o)
            orbits.append(sorted(o))
        self.orbits = orbits
        self.l = len(orbits)
        self.sigma = sigma
        self.n = l0
        self.rootkeys = roots

        def rcoord(r):
            cs = [r.coefficient(i) for i in idx]
            return tuple(sum(cs[j] for j in o) for o in orbits)
        self.rcoord = rcoord
        # symmetric form on h^*: (alpha_i, alpha_j) from the simply laced
        # (or general) Cartan matrix, and averaged vectors for r(beta)
        sv, _ = ambient([X, n])
        self.G0 = matrix(QQ, sv) * matrix(QQ, sv).transpose()
        self.avg = []
        for o in orbits:
            v = vector(QQ, l0)
            for j in o:
                v[j] = QQ(1) / len(o)
            self.avg.append(v)
        # eigen-decomposition of tau-hat on each g_alpha
        K = CyclotomicField(k) if k > 2 else QQ
        zeta = K.gen() if k > 2 else QQ(-1) if k == 2 else QQ(1)
        self.K, self.zeta = K, zeta
        groups = {}
        for r in roots:
            groups.setdefault(rcoord(r), []).append(pos[r])
        hpos = [p for key, p in pos.items() if 'check' in str(key)]
        groups[tuple([0] * self.l)] = hpos
        self.groups = groups
        self.aff = {}
        for a, ps in groups.items():
            Ta = T.matrix_from_rows_and_columns(ps, ps).change_ring(K)
            for m in range(k):
                d = (Ta - zeta ** m).right_kernel().dimension()
                if d:
                    self.aff[(a, m)] = d
            assert sum(v for (b, m), v in self.aff.items() if b == a) \
                == len(ps)

    def vec(self, a):
        """The averaged vector of h^* representing r-coordinates a."""
        return sum(c * v for c, v in zip(a, self.avg))

    def ip(self, a, b):
        return self.vec(a) * self.G0 * self.vec(b)

    def pair(self, a, b):
        return 2 * self.ip(a, b) / self.ip(b, b)


def section_4_4():
    """4.4 (printed pp. 202-220)."""
    # Theorem 1 context and 6 deg: Aut Pi of the simple Lie algebras
    for X, n in all_types(8):
        simple, _ = ambient([X, n])
        auts = diagram_automorphisms(book_cartan(simple))
        nontriv = (X == 'A' and n >= 2) or X == 'D' or (X, n) == ('E', 6)
        check((len(auts) > 1) == nontriv
              and len(auts) == (6 if (X, n) == ('D', 4) else
                                2 if nontriv else 1),
              '4.6: Aut Pi(%s%d) has order %d' % (X, n, len(auts)))
        if (X, n) == ('D', 4):
            from sage.all import PermutationGroup
            Gp = PermutationGroup([[p[i] + 1 for i in range(4)]
                                   for p in auts])
            orders = sorted(g.order() for g in Gp)
            check(orders == [1, 2, 2, 2, 3, 3]
                  and len(Gp.conjugacy_classes_representatives()) == 3,
                  '4.6: Aut Pi(D_4) = S_3 with the classes of elements of '
                  'order 2 and 3')
    # The twisted cases and tau = id for small types
    cases = [('A', 2, 'A2^(2)'), ('A', 3, 'D3^(2)'), ('A', 4, 'A4^(2)'),
             ('A', 5, 'A5^(2)'), ('A', 6, 'A6^(2)'), ('A', 7, 'A7^(2)'),
             ('D', 4, 'D4^(2)'), ('D', 5, 'D5^(2)'), ('D', 6, 'D6^(2)'),
             ('E', 6, 'E6^(2)'), ('D', 4, 'D4^(3)')]
    cartan, affine = expected_diagrams(9)
    expected_fixed = {('A', 2): 'A1', ('A', 3): 'B2', ('A', 4): 'B2',
                      ('A', 5): 'C3', ('A', 6): 'B3', ('A', 7): 'C4',
                      ('D', 4): 'B3', ('D', 5): 'B4', ('D', 6): 'B5',
                      ('E', 6): 'F4'}
    for X, n, name in cases:
        simple, _ = ambient([X, n])
        A0 = book_cartan(simple)
        auts = diagram_automorphisms(A0)
        want_order = 3 if name == 'D4^(3)' else 2
        sigma = None
        for p in auts:
            q, o = list(p), 1
            while q != list(range(n)):
                q, o = [p[i] for i in q], o + 1
            if o == want_order:
                sigma = p
                break
        D = TwistedData(X, n, sigma)
        k, l, T = D.k, D.l, D.T
        tag = '%s%d, tau of order %d' % (X, n, k)
        check(T ** k == 1 and all(T ** j != 1 for j in range(1, k)),
              '4.1: tau-hat has order k = %d, %s' % (k, tag))
        ok = True
        L = D.L
        for a_ in range(D.dim):
            for b_ in range(a_ + 1, D.dim):
                xa, xb = D.basis[a_], D.basis[b_]
                lhs = T * D.B.solve_left(L.bracket(xa, xb).to_vector())
                ra = L.from_vector(D.B.transpose() * (T.column(a_)))
                rb = L.from_vector(D.B.transpose() * (T.column(b_)))
                rhs = D.B.solve_left(L.bracket(ra, rb).to_vector())
                ok = ok and lhs == rhs
        check(ok, 'Theorem 3.1 / (4.1): tau-hat is an automorphism of g, %s'
              % tag)
        # Problem 17
        hpos = D.groups[tuple([0] * l)]
        Th = T.matrix_from_rows_and_columns(hpos, hpos)
        check((Th - 1).right_kernel().dimension() == l == len(D.orbits),
              'Problem 4.17: dim t_tau = number of <tau>-orbits in Pi = %d, '
              '%s' % (l, tag))
        rts = [a for a in D.groups if any(a)]
        check(all(all(x >= 0 for x in a) or all(x <= 0 for x in a)
                  for a in rts) and all(any(a) for a in rts),
              'Problem 4.17: r(Delta) has coefficients of one sign in Pi_0 '
              'and r(beta) != 0, so z(t_tau) = h, %s' % tag)
        Gm = matrix(QQ, l, l, lambda i, j: D.ip(tuple(1 if x == i else 0
                                                      for x in range(l)),
                                               tuple(1 if x == j else 0
                                                     for x in range(l))))
        check(Gm.det() != 0, 'Problem 4.17: r(Pi) is a basis of t_tau^*, %s'
              % tag)
        unit = [tuple(1 if x == i else 0 for x in range(l)) for i in range(l)]
        check(all(len(D.groups[u]) == len(D.orbits[i])
                  for i, u in enumerate(unit)),
              'Problem 4.17: r(beta) in r(Pi) only for beta in Pi, %s' % tag)
        # Problem 45: imaginary roots; Problem 28: real root spaces
        imag = sorted(m for (a, m) in D.aff if not any(a))
        check(imag == list(range(k)),
              'Problem 4.45: the imaginary roots are (0, m/k), m in Z, %s'
              % tag)
        real = {(a, m): d for (a, m), d in D.aff.items() if any(a)}
        check(all(d == 1 for d in real.values()),
              'Problem 4.28: dim g^xi = 1 for real xi, %s' % tag)
        ok = True
        for (a, m) in real:
            for c in (2, 3):
                ca = tuple(c * x for x in a)
                ok = ok and (ca, (c * m) % k) not in real
        check(ok, 'Problem 4.28: c xi (c != 0, +-1) is not an affine root, '
              '%s' % tag)
        if X == 'A' and n % 2 == 0:
            check(any(tuple(2 * x for x in a) in D.groups for a in rts),
                  'Problem 4.28 is not empty: r(Delta) contains alpha and '
                  '2 alpha here (%s)' % tag)
        # Problem 30: g^tau-hat, Pi_0, its type
        fixed = [a for (a, m) in real if m == 0]
        pos0 = [a for a in fixed if all(x >= 0 for x in a)]
        check(all(u in fixed for u in unit)
              and all(all(x >= 0 for x in a) or all(x <= 0 for x in a)
                      for a in fixed),
              'Problem 4.30: Pi_0 = r(Pi) is a base of the roots of '
              'g^tau-hat, %s' % tag)
        A_Pi0 = matrix(QQ, l, l, lambda i, j: D.pair(unit[i], unit[j]))
        tname = type_name(A_Pi0)
        check(tname == [expected_fixed[(X, n)]] if k == 2 else
              tname == ['G2'],
              'Problems 4.30, 4.44: g^tau-hat is simple of type %s, %s'
              % (tname, tag))
        nroots = len(roots_from_cartan(A_Pi0))
        check(len(fixed) == nroots,
              'Problem 4.30: the roots of g^tau-hat are the alpha with '
              '(alpha, 0) in Delta^tau (%d), %s' % (nroots, tag))
        # Problem 46: the lowest weight of ad_(1/k)
        Kf = D.K
        z = D.zeta
        eps_pos = [p for (a, m), d in D.aff.items() if m == 1
                   for p in D.groups[a]]
        Tk = T.change_ring(Kf)
        Eeps = (Tk - z).right_kernel()
        basis_f = []
        for o in D.orbits:
            x = sum(D.L.f(D.idx[j]) for j in o)
            basis_f.append(x)

        def admat(x):
            return matrix(QQ, [D.B.solve_left(D.L.bracket(x, b).to_vector())
                               for b in D.basis]).transpose()
        adf = [admat(x).change_ring(Kf) for x in basis_f]
        check(all(T * admat(x) == admat(x) * T for x in basis_f),
              'Hint 4.30: e_(-beta) = sum over the orbit of f_j is fixed '
              'by tau-hat, %s' % tag)
        Wsp = Eeps
        for M in adf:
            Wsp = Wsp.intersection((M).right_kernel())
        check(Wsp.dimension() == 1,
              'Problem 4.46: ad_(1/k) has a unique lowest vector (so it is '
              'irreducible), %s' % tag)
        v = Wsp.basis()[0]
        supp = [p for p in range(D.dim) if v[p] != 0]
        wt = set()
        for a, ps in D.groups.items():
            if any(p in ps for p in supp):
                wt.add(a)
        check(len(wt) == 1, 'Problem 4.46: the lowest vector is a weight '
              'vector, %s' % tag)
        a0 = list(wt)[0]
        ns = [-x for x in a0]
        check(all(x in ZZ and x > 0 for x in ns),
              'Problem 4.47: alpha_0 = -sum n_j alpha_j with positive '
              'integers n_j = %s, %s' % (ns, tag))
        Psi = [a0] + unit
        APsi = matrix(QQ, l + 1, l + 1, lambda i, j: D.pair(Psi[i], Psi[j]))
        check(APsi.det() == 0 and all(
            APsi.matrix_from_rows_and_columns(
                [x for x in range(l + 1) if x != v_],
                [x for x in range(l + 1) if x != v_]).det() > 0
            for v_ in range(l + 1)),
              'Problem 4.48: A(Psi) is an indecomposable affine Cartan '
              'matrix, %s' % tag)
        check(matrix_key(APsi) == matrix_key(affine[name]),
              'Problem 4.49: tau corresponds to the affine diagram %s, %s'
              % (name, tag))
        if name in ('A2^(2)',):
            drawn = diagram(['a0', 'a1'], [('a0', 'a1', 4, 'a1')])
            check(matrix_key(APsi, pinned=0) == matrix_key(drawn, pinned=0),
                  'Problem 4.49: A_2^(2) with alpha_0 at the long end')
        # Problem 46: Pi^tau = {(alpha_j, 0)} u {(alpha_0, 1/k)}
        window = []
        for (a, m), d in D.aff.items():
            for s in (m, m + k):
                if s <= k:
                    window.append((a, s))    # s in units of 1/k
        posw = [(a, s) for (a, s) in window
                if s > 0 or (s == 0 and any(a) and all(x >= 0 for x in a))]
        pset = set(posw)
        simple_aff = [x for x in posw if not any(
            (tuple(p - q for p, q in zip(x[0], y[0])), x[1] - y[1]) in pset
            for y in posw)]
        check(sorted(simple_aff) == sorted([(u, 0) for u in unit]
                                           + [(a0, 1)]),
              'Problems 4.32, 4.46: Pi^tau = {(alpha_j, 0)} u {(alpha_0, '
              '1/k)} (all positive roots with s <= 1 examined), %s' % tag)
        Mpi = matrix(QQ, [list(a) + [s] for a, s in simple_aff])
        check(Mpi.rank() == l + 1 and all(
            all(c >= 0 and c in ZZ for c in Mpi.solve_left(
                vector(QQ, list(a) + [s]))) for a, s in posw),
              'Problems 4.33, 4.46: Pi^tau is a basis of a(R)^ and every '
              'positive root is a nonnegative integral combination, %s' % tag)
        kac_checks(D, ns, APsi, tag)
    # tau = id (k = 1): Kac coordinates of inner automorphisms
    for X, n in (('A', 2), ('A', 3), ('B', 2), ('B', 3), ('C', 3), ('D', 4),
                 ('G', 2), ('F', 4)):
        D = TwistedData(X, n, list(range(n)))
        l = D.l
        unit = [tuple(1 if x == i else 0 for x in range(l)) for i in range(l)]
        rts = [a for a in D.groups if any(a)]
        delta = max(rts, key=sum)
        ns = list(delta)
        a0 = tuple(-x for x in delta)
        Psi = [a0] + unit
        APsi = matrix(QQ, l + 1, l + 1, lambda i, j: D.pair(Psi[i], Psi[j]))
        kac_checks(D, ns, APsi, '%s%d, tau = id' % (X, n))
    # tau = id: the affine Weyl group (5 deg, Problems 41-43, Exercises 3,
    # 6, 15, 16)
    for X, n in all_types(8):
        simple, roots = ambient([X, n])
        l = len(simple)
        A = book_cartan(simple)
        S = matrix(QQ, simple)
        d = highest_root(simple, roots)
        ns = list(S.solve_left(d))
        # Exercise 6: the vertices of D_0 in the coordinates y_j = alpha_j(x)
        # (x in h(R)); walls y_j = 0 (j >= 1) and gamma_0 = 1 - sum n_j y_j
        walls = [vector(QQ, [1 if i == j else 0 for i in range(l)] + [0])
                 for j in range(l)] + [vector(QQ, [-x for x in ns] + [1])]
        verts = set()
        for skip in range(l + 1):
            rows = [w for j, w in enumerate(walls) if j != skip]
            Mw = matrix(QQ, [list(w[:l]) for w in rows])
            rhs = vector(QQ, [-w[l] for w in rows])
            verts.add(tuple(Mw.solve_right(rhs)))
        exp_v = set([tuple([0] * l)]) | set(
            tuple(QQ(1) / ns[j] if i == j else 0 for i in range(l))
            for j in range(l))
        check(verts == exp_v and len(verts) == l + 1,
              'Exercise 4.6 corrected: the vertices of D_0 are a~ = 0 and '
              'x_alpha/(k n_alpha), l + 1 = %d points, %s%d' % (l + 1, X, n))
        printed = set(tuple(QQ(1) / ns[j] if i == j else 0 for i in range(l))
                      for j in range(l))
        refuted(printed == verts,
                'Exercise 4.6 as printed: the l points x_alpha/(k n_alpha) '
                'are all the vertices of D_0 (%s%d)' % (X, n))
        # Problem 43, Exercise 16: lattice points in D_0
        Az = A.change_ring(ZZ)
        cand = [tuple([0] * l)] + [tuple(1 if i == j else 0 for i in range(l))
                                   for j in range(l) if ns[j] == 1]
        # for x = sum c_i alpha_i^v: y_j = alpha_j(x) = sum_i a_ji c_i,
        # i.e. y = A c
        inQv = [y for y in cand
                if all(c in ZZ for c in A.solve_right(vector(QQ, y)))]
        check(inQv == [tuple([0] * l)],
              'Problem 4.43: D_0-bar meets Q^v only in 0, %s%d' % (X, n))
        check(len(cand) == 1 + sum(1 for x in ns if x == 1)
              == prod(Az.elementary_divisors()),
              'Exercise 4.16: #{alpha_i in Pi~: n_i = 1} = |pi(Delta)| = %d, '
              '%s%d' % (len(cand), X, n))
        # Exercise 15: |Aut Pi~| = |Aut Pi| |pi(Delta)|
        Aext = extended_from_vectors(simple, -d)
        check(len(diagram_automorphisms(Aext))
              == len(diagram_automorphisms(A)) * Az.det(),
              'Exercise 4.15: |Aut Pi~| = |Aut Pi| |pi(Delta)|, %s%d'
              % (X, n))
        # Exercise 3: (r_i r_j)^(n_ij) = e for the affine reflections
        if l <= 4:
            gam = [(-vector(QQ, ns), 1)] + [
                (vector(QQ, [1 if i == j else 0 for i in range(l)]), 0)
                for j in range(l)]
            vecs = [-d] + list(simple)

            def refl(j):
                # y -> y - (alpha(y) + s) <alpha_i|alpha> in y-coordinates
                cvec, s = gam[j]
                M = identity_matrix(QQ, l + 1)
                for i in range(l):
                    ci = pairing(simple[i], vecs[j])
                    for t in range(l):
                        M[i, t] -= ci * cvec[t]
                    M[i, l] -= ci * s
                return M
            Rs = [refl(j) for j in range(l + 1)]
            nmap = {0: 2, 1: 3, 2: 4, 3: 6}
            for i in range(l + 1):
                for j in range(i + 1, l + 1):
                    m = pairing(vecs[i], vecs[j]) * pairing(vecs[j], vecs[i])
                    P = Rs[i] * Rs[j]
                    if m in nmap:
                        check(P ** nmap[m] == 1 and all(
                            P ** t != 1 for t in range(1, nmap[m])),
                            'Exercise 4.3: (r_%d r_%d)^%d = e, %s%d'
                            % (i, j, nmap[m], X, n))
                    else:
                        check(all(P ** t != 1 for t in range(1, 13)),
                              'Exercise 4.3: n_ij = oo, %s%d' % (X, n))
            # Problem 41: r_(alpha, s) r_alpha = t_(-s h_alpha)
            Rp = PolynomialRing(QQ, ['y%d' % i for i in range(l)] + ['s'])
            ys = vector(Rp, Rp.gens()[:l])
            s_ = Rp.gens()[l]
            ok = True
            for r in roots:
                cvec = S.solve_left(r)
                h = vector(QQ, [pairing(sj, r) for sj in simple])
                ra = ys - (cvec * ys) * h
                raff = ra - ((cvec * ra) + s_) * h
                ok = ok and raff == ys - s_ * h
            check(ok, 'Problem 4.41: r_(alpha,s) r_alpha = t_(-s h_alpha) '
                  'for all roots, %s%d' % (X, n))


def kac_checks(D, ns, APsi, tag):
    """Problem 57 (orders of canonical automorphisms, formula (9)) and
    Problem 61 (the fixed-point subalgebra) for all Kac coordinates with
    small order.  theta = pi(u) acts on g^(alpha, m/k) by
    exp 2 pi i (m/k + alpha(x)), alpha(x) = sum c_j u_j (Hint 57,
    corrected)."""
    k, l = D.k, D.l
    nall = [1] + list(ns)
    count = 0
    for m in range(1, 9 if l <= 4 else 7):
        # s_j >= 0 with k * sum n_j s_j = m
        if m % k:
            continue
        target = m // k
        for s in itertools.product(*[range(target // nj + 1) for nj in nall]):
            if sum(a * b for a, b in zip(s, nall)) != target:
                continue
            if gcd(list(s)) != 1:
                continue
            u = [QQ(x) / m for x in s]
            dens = [1]
            fixdim = 0
            fixroots = []
            for (a, mm), d in D.aff.items():
                ex = QQ(mm) / k + sum(c * uj for c, uj in zip(a, u[1:]))
                dens.append(ex.denominator())
                if ex in ZZ:
                    fixdim += d
                    if any(a):
                        fixroots.append(a)
            order = lcm(dens)
            check(order == m,
                  'Problem 4.57: labels s = %s give an automorphism of order '
                  'm = k sum n_j s_j = %d, %s' % (s, m, tag))
            zeros = [j for j in range(l + 1) if s[j] == 0]
            t = len(zeros)
            sub = APsi.matrix_from_rows_and_columns(zeros, zeros)
            nr = len(roots_from_cartan(sub)) if t else 0
            rk = matrix(QQ, fixroots).rank() if fixroots else 0
            check(fixdim == l + nr and rk == t and
                  fixdim - (t + len(fixroots)) == l - t,
                  'Problem 4.61: g^theta = t_tau + roots of the zero-label '
                  'subdiagram; dim Z(g^theta) = l - t = %d, %s, s = %s'
                  % (l - t, tag, s))
            if D.n != l:
                refuted(fixdim - (t + len(fixroots)) == D.n - t,
                        'Problem 4.61 as printed: dim Z(g^theta) = n - t '
                        '(n = %d = rank of g), %s, s = %s' % (D.n, tag, s))
            count += 1
    check(count > 0, 'Problem 4.57: Kac coordinates enumerated, %s' % tag)


def exercise13_black(X, n):
    """Black vertices of Exercise 3.13 (p. 197), 0-based, in the book's
    numbering: A_(4q+1): the middle vertex; B_(4q+1), B_(4q+2): alpha_l;
    C_(2q): alpha_1, alpha_3, ..., alpha_(2q-1); C_(2q+1): the odd ones up to
    alpha_(2q+1); D_(4q+2): the two end vertices alpha_(l-1), alpha_l;
    E_7 (chain a-b-c-d-e-f, g at c): d, f, g = alpha_5, alpha_7, alpha_2 of
    Bourbaki; other types: none."""
    if X == 'A' and n % 4 == 1:
        return {(n - 1) // 2}
    if X == 'B' and n % 4 in (1, 2):
        return {n - 1}
    if X == 'C':
        return set(range(0, n, 2))
    if X == 'D' and n % 4 == 2:
        return {n - 2, n - 1}
    if (X, n) == ('E', 7):
        return {4, 6, 1}          # Bourbaki alpha_5, alpha_7, alpha_2
    return set()


def main():
    section_4_1_classical()
    section_4_2_generic()
    section_4_2_small()
    section_4_2_classification()
    section_4_2_subsystems_lattices()
    section_4_3()
    section_4_4()
    section_4_1_strings()
    print('ok %s: %d checks' % (SCOPE, COUNT[0]))


if __name__ == '__main__':
    main()
