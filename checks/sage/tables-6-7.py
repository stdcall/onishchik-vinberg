"""Exact checks of Table 6 (affine Dynkin diagrams) and Table 7 (involutive
automorphisms of the complex simple Lie algebras) of the Reference Chapter.

Expected values are the book's, written below as literals taken from the
printed book: Table 6 on printed p. 306, Table 7 on pp. 307-309, the Dynkin
diagrams of
Table 1 on pp. 293-294 and the compact subalgebras k of Table 9
on pp. 312, 314, 316.  Diagrams are transcribed as
numbered vertices and bonds `(a, b, n, to)`: n lines between a and b, the
arrow pointing to `to`.  In the book the arrow points to the shorter root
(Table 1: B_l, alpha_l = eps_l), which gives the Cartan matrix
a_ij = 2(alpha_i, alpha_j)/(alpha_i, alpha_i) of Kac and of Sage.  Our
Typst source is not an input.  Families are expanded for the ranks in
`RANKS` below; the expansion of the printed "..." is an interpretation.

Independent computations (Sage 10.9, exact over QQ):
  * finite root systems (`RootSystem`), the Chevalley basis
    (`LieAlgebra(QQ, cartan_type=...)`) for the signs of the diagram
    automorphism on fixed roots, and Sage's catalogue of affine Cartan types
    (Kac, Infinite Dimensional Lie Algebras, 3rd ed., Tables Aff 1-3);
  * the system Psi of Problems 4.4.46-47 rebuilt from (g, tau): for tau = id
    the simple roots and the lowest root; for tau != id the restrictions
    r(Pi) to t_tau and the lowest weight alpha_0 of ad_{1/k};
  * for an order-2 automorphism theta with Kac labels s (Problems 4.4.57,
    5.1.38) the fixed algebra g^theta from the eigenvalues of theta on the
    root spaces, not from the Kac diagram: its dimension, its root system
    and type, and the dimension of its centre.

Checked:
  A. Table 6 (p. 306), every row: affine Cartan matrix (det 0, proper
     principal minors > 0); printed marks = the positive relatively prime
     null vector (Problem 4.4.47); isomorphic to Sage's type of the same
     name, with Kac's labels; the list of rows is exactly Kac's list of
     affine types for 3-9 vertices; Psi rebuilt from (g, tau) is the diagram
     of the printed name L_n^(k), n = type of g, k = order of tau, with
     alpha_0 at a vertex of mark 1 (Problems 4.4.46-49).
  B. Table 7 (pp. 307-309), every row, every rank and every p of the printed
     range: the diagram is the Table 6 diagram of the column "Type of affine
     diagram" (printed F_7^(1) refuted, F_4^(1) confirmed); vertex 0 has mark
     1 and is alpha_0; vertices 1..l are the Table 1 diagram, with its
     numbering, of g^tau-hat (printed "of g^theta" refuted, corrected "of
     g^tau-hat" confirmed); black vertices satisfy k sum n_j s_j = 2 with all
     nonzero labels 1/2; types I/II/III as described; the column "Type of
     g^theta" against the deletion rule of Problem 4.4.61 and against the
     independent g^theta; dim g^theta = dim of the printed type = dim k of
     the printed real form (Table 9); the type of k(C) is the printed type.
     The sl_2(C) row: printed all-white diagram refuted, both vertices black
     confirmed.
  C. For every simple g of rank <= 8: the printed rows give exactly the
     conjugacy classes of involutions (all order-2 Kac diagrams up to
     diagram automorphisms, Theorem 4.4.8), each once, except so_8(C), whose
     two type II rows are one class (triality); distinct classes have
     non-isomorphic g^theta (Problem 5.1.39); the real forms of the classical
     rows are those of Theorem 5.1.6 minus the compact one.
  D. Cross-checks of Theorem 5.1.5 with explicit matrices (outside the
     tables; findings for 51-real-forms): Ad S_m on so_2m(C) is inner with a
     centre (type II, printed III); Ad I_(p, n-p) with n even, p odd is outer
     (type III); for sl_2(C) item 1b) is the identity and 1a) is inner.

Coverage: Table 6 families for l = 2..8 (A_2l^(2) up to A_16^(2)), 54
diagrams (16 rows, 7 families expanded); Psi rebuilt for every untwisted type of rank <= 8 and for
(A_2l, flip) l = 1..4, (A_2l-1, flip) l = 3, 4, (D_l+1, swap) l = 2..7,
(E_6, flip), (D_4, triality); Table 7: 133 instances (row, l, p), classical
rows for l <= 8 (sl_2l+1, sl_2l: l <= 4; so_2l+2: l <= 7); part C: every
simple g of rank <= 8.

Sage (= Kac) numbering against the book's (checked in check_psi,
check_sage_twisted_labels; recorded here from the certificates): untwisted
types A, B, C, D, G_2: the same (node 0 = lowest root); E_6: book 1..6 =
Sage 1, 3, 4, 5, 6, 2; E_7: book 1..7 = Sage 7, 6, 5, 4, 3, 1, 2; E_8: book
1..8 = Sage 8, 7, 6, 5, 4, 3, 1, 2; F_4: book j = Sage 5 - j.  Twisted:
A_2l^(2) (and A_2^(2)): book j = Sage/Kac l - j (Kac numbers A_2l^(2) with
a_0 = 2; the book's vertex 0 is Kac's alpha_l, the vertex eps = l of Kac
8.3, Case 5); A_2l-1^(2), D_l+1^(2), E_6^(2), D_4^(3): the same numbering.
Sage writes A_2l^(2) = BC_l~, A_2l-1^(2) = B_l~*, D_l+1^(2) = C_l~*,
E_6^(2) = F_4~*, D_4^(3) = G_2~* (relabelled).

Not established: the families are checked for the listed ranks only, not
for all l; the check does not prove Kac's classification or Cartan's
correspondence (it uses them: real form <-> class of theta via k(C) =
g^theta, Theorem 5.1.4); it does not check the drawing of our Typst diagrams
against the printed book.

Run with:  sage -python checks/sage/tables-6-7.py
"""
from itertools import combinations, product

from sage.all import CartanType, DiGraph, LieAlgebra, QQ, RootSystem, ZZ
from sage.all import gcd, matrix, vector

N_CHECKS = 0


def check(condition, what):
    """A check that must hold."""
    global N_CHECKS
    assert condition, what
    N_CHECKS += 1


def refuted(condition, what):
    """A printed reading that must fail."""
    global N_CHECKS
    assert not condition, "printed reading unexpectedly holds: " + what
    N_CHECKS += 1


RANKS = range(2, 9)          # l for the families of Tables 6 and 7
MAX_RANK = 8                 # simple g of rank <= 8 in part C


# ---------------------------------------------------------------- diagrams
def chain(names, last=None):
    """Single bonds along `names`; `last = (n, to)` makes the last bond
    n-fold with the arrow to vertex `to`."""
    bonds = [(a, b, 1, None) for a, b in zip(names, names[1:])]
    if last is not None:
        a, b, _, _ = bonds[-1]
        bonds[-1] = (a, b, last[0], last[1])
    return bonds


class Diagram:
    """A diagram as drawn: vertices in a fixed order, bonds (a, b, n, to)."""

    def __init__(self, vertices, bonds, marks=None):
        self.vertices = list(vertices)
        self.bonds = list(bonds)
        self.marks = marks
        self.index = {v: i for i, v in enumerate(self.vertices)}
        assert len(self.index) == len(self.vertices)

    def cartan(self):
        n = len(self.vertices)
        A = matrix(ZZ, n, n)
        for i in range(n):
            A[i, i] = 2
        for a, b, m, to in self.bonds:
            i, j = self.index[a], self.index[b]
            assert A[i, j] == 0 and A[j, i] == 0, "bond drawn twice"
            if m == 1:
                assert to is None
                A[i, j] = A[j, i] = -1
            elif m == 4 and to is None:          # A_1^(1)
                A[i, j] = A[j, i] = -2
            else:
                assert to in (a, b) and m in (2, 3, 4)
                short, long = (i, j) if to == a else (j, i)
                A[short, long] = -m
                A[long, short] = -1
        return A


def digraph(A):
    n = A.nrows()
    G = DiGraph(n)
    for i in range(n):
        for j in range(n):
            if i != j and A[i, j] != 0:
                G.add_edge(i, j, int(A[i, j]))
    return G


def isomorphism(A, B):
    """p with A[i, j] = B[p[i], p[j]] for all i, j, or None."""
    if A.nrows() != B.nrows():
        return None
    ok, cert = digraph(A).is_isomorphic(digraph(B), certificate=True,
                                        edge_labels=True)
    if not ok:
        return None
    p = [cert[i] for i in range(A.nrows())]
    n = A.nrows()
    assert all(A[i, j] == B[p[i], p[j]] for i in range(n) for j in range(n))
    return p


def automorphisms(A):
    n = A.nrows()
    group = digraph(A).automorphism_group(edge_labels=True)
    auts = [[g(v) for v in range(n)] for g in group]
    for p in auts:
        assert all(A[i, j] == A[p[i], p[j]] for i in range(n)
                   for j in range(n))
    return auts


def all_isomorphisms(A, B):
    p = isomorphism(A, B)
    if p is None:
        return []
    return [[p[a[i]] for i in range(A.nrows())] for a in automorphisms(A)]


def null_marks(A):
    """The positive relatively prime null vector of an affine matrix."""
    K = A.right_kernel()
    assert K.dimension() == 1
    v = K.basis()[0]
    v = v if v[0] > 0 else -v
    assert all(x > 0 for x in v) and gcd(list(v)) == 1
    return tuple(int(x) for x in v)


def is_affine(A):
    """Kac, Prop. 4.7 b): det A = 0, all proper principal minors > 0."""
    n = A.nrows()
    if A.det() != 0:
        return False
    for r in range(1, n):
        for S in combinations(range(n), r):
            if A.matrix_from_rows_and_columns(S, S).det() <= 0:
                return False
    return True


# ------------------------------------------------- finite types, canonical
DIM = {"A": lambda r: r * (r + 2), "B": lambda r: r * (2 * r + 1),
       "C": lambda r: r * (2 * r + 1), "D": lambda r: r * (2 * r - 1)}
DIM_EXC = {"E6": 78, "E7": 133, "E8": 248, "F4": 52, "G2": 14}


def candidates(r):
    names = ["A%d" % r]
    if r >= 2:
        names.append("B%d" % r)
    if r >= 3:
        names.append("C%d" % r)
    if r >= 4:
        names.append("D%d" % r)
    names += [x for x in DIM_EXC if int(x[1]) == r]
    return names


def sage_cartan(name):
    return matrix(ZZ, CartanType([name[0], int(name[1:])]).cartan_matrix())


def identify(A):
    """Sorted names of the simple components of a finite Cartan matrix."""
    n = A.nrows()
    if n == 0:
        return ()
    comps = digraph(A).to_undirected().connected_components()
    names = []
    for comp in comps:
        comp = sorted(comp)
        M = A.matrix_from_rows_and_columns(comp, comp)
        found = [c for c in candidates(len(comp))
                 if isomorphism(M, sage_cartan(c)) is not None]
        assert len(found) == 1, (M, found)
        names.append(found[0])
    return tuple(sorted(names))


def canon(parts, centre=0):
    """(sorted component names, dim of centre) of a printed type; low ranks
    as in the book's families: A_0, B_0 = 0; B_1 = C_1 = A_1; C_2 = B_2;
    D_1 = C (centre); D_2 = A_1 + A_1; D_3 = A_3."""
    names = []
    for X, r in parts:
        if X in ("E", "F", "G"):
            names.append("%s%d" % (X, r))
        elif r == 0:
            continue
        elif X == "A":
            names.append("A%d" % r)
        elif X in ("B", "C") and r == 1:
            names.append("A1")
        elif X == "C" and r == 2:
            names.append("B2")
        elif X == "D" and r == 1:
            centre += 1
        elif X == "D" and r == 2:
            names += ["A1", "A1"]
        elif X == "D" and r == 3:
            names.append("A3")
        else:
            names.append("%s%d" % (X, r))
    return (tuple(sorted(names)), centre)


def dim_of(t):
    names, centre = t
    return centre + sum(DIM_EXC[x] if x in DIM_EXC
                        else DIM[x[0]](int(x[1:])) for x in names)


def rank_of(t):
    names, centre = t
    return centre + sum(int(x[1:]) for x in names)


def gram_cartan(vectors, gram):
    n = len(vectors)
    ip = [[vectors[i] * gram * vectors[j] for j in range(n)]
          for i in range(n)]
    A = matrix(QQ, n, n, [[2 * ip[i][j] / ip[i][i] for j in range(n)]
                          for i in range(n)])
    assert all(x in ZZ for x in A.list())
    return A.change_ring(ZZ)


def indecomposable(positive):
    """Simple roots of a root system given by its positive roots."""
    S = set(positive)
    return sorted(b for b in S
                  if not any(tuple(x - y for x, y in zip(b, c)) in S
                             for c in S))


# ---------------------------------------------- Table 1 (pp. 293-294)
def table1(X, l):
    """Dynkin diagrams of Table 1 with the book's numbering."""
    v = list(range(1, l + 1))
    if X == "A":
        return Diagram(v, chain(v) if l > 1 else [])
    if X == "B":
        return Diagram(v, chain(v, last=(2, l)))
    if X == "C":
        return Diagram(v, chain(v, last=(2, l - 1)))
    if X == "D":
        return Diagram(v, chain(v[:l - 2]) + [(l - 2, l - 1, 1, None),
                                              (l - 2, l, 1, None)])
    if (X, l) == ("E", 6):
        return Diagram(v, chain([1, 2, 3, 4, 5]) + [(3, 6, 1, None)])
    if (X, l) == ("E", 7):
        return Diagram(v, chain([1, 2, 3, 4, 5, 6]) + [(4, 7, 1, None)])
    if (X, l) == ("E", 8):
        return Diagram(v, chain(v[:7]) + [(5, 8, 1, None)])
    if (X, l) == ("F", 4):
        return Diagram(v, [(1, 2, 1, None), (2, 3, 2, 2), (3, 4, 1, None)])
    if (X, l) == ("G", 2):
        return Diagram(v, [(1, 2, 3, 1)])
    raise ValueError((X, l))


def check_table1():
    """Table 1 diagrams are the Dynkin diagrams of their types (p. 293)."""
    for X, rng in (("A", range(1, 9)), ("B", range(2, 9)),
                   ("C", range(2, 9)), ("D", range(3, 9))):
        for l in rng:
            check(identify(table1(X, l).cartan())
                  == canon([(X, l)])[0], "Table 1 %s%d" % (X, l))
    for X, l in (("E", 6), ("E", 7), ("E", 8), ("F", 4), ("G", 2)):
        check(identify(table1(X, l).cartan()) == ("%s%d" % (X, l),),
              "Table 1 %s%d" % (X, l))


# ---------------------------------------------------- Table 6 (p. 306)
def marked(spec):
    """spec: list of (name, mark) and bonds -> Diagram with marks."""
    vertices, bonds = spec
    return Diagram([v for v, _ in vertices], bonds,
                   marks={v: m for v, m in vertices})


def t6_A1(l):
    c = ["c%d" % i for i in range(1, l + 1)]
    return marked(([(x, 1) for x in c] + [("o", 1)],
                   chain(c) + [("o", c[0], 1, None), ("o", c[-1], 1, None)]))


def t6_A11(_):
    return marked(([("a", 1), ("b", 1)], [("a", "b", 4, None)]))


def t6_B1(l):
    c = ["c%d" % i for i in range(1, l)]
    return marked(([("f1", 1), ("f2", 1)] + [(x, 2) for x in c],
                   [("f1", "c1", 1, None), ("f2", "c1", 1, None)]
                   + chain(c, last=(2, c[-1]))))


def t6_C1(l):
    c = ["c%d" % i for i in range(1, l)]
    return marked(([("a", 1)] + [(x, 2) for x in c] + [("e", 1)],
                   [("a", "c1", 2, "c1")] + chain(c)
                   + [(c[-1], "e", 2, c[-1])]))


def t6_D1(l):
    c = ["c%d" % i for i in range(1, l - 2)]
    return marked(([("f1", 1), ("f2", 1)] + [(x, 2) for x in c]
                   + [("g1", 1), ("g2", 1)],
                   [("f1", "c1", 1, None), ("f2", "c1", 1, None)] + chain(c)
                   + [(c[-1], "g1", 1, None), (c[-1], "g2", 1, None)]))


def t6_E6(_):
    return marked(([("a", 1), ("b", 2), ("c", 3), ("d", 2), ("e", 1),
                    ("f", 2), ("g", 1)],
                   chain("abcde") + [("c", "f", 1, None),
                                     ("f", "g", 1, None)]))


def t6_E7(_):
    return marked(([("a", 1), ("b", 2), ("c", 3), ("d", 4), ("e", 3),
                    ("f", 2), ("g", 1), ("h", 2)],
                   chain("abcdefg") + [("d", "h", 1, None)]))


def t6_E8(_):
    return marked(([("a", 1), ("b", 2), ("c", 3), ("d", 4), ("e", 5),
                    ("f", 6), ("g", 4), ("h", 2), ("i", 3)],
                   chain("abcdefgh") + [("f", "i", 1, None)]))


def t6_F4(_):
    return marked(([("a", 2), ("b", 4), ("c", 3), ("d", 2), ("e", 1)],
                   [("a", "b", 1, None), ("b", "c", 2, "b"),
                    ("c", "d", 1, None), ("d", "e", 1, None)]))


def t6_G2(_):
    return marked(([("a", 3), ("b", 2), ("c", 1)],
                   [("a", "b", 3, "a"), ("b", "c", 1, None)]))


def t6_A2l_2(l):
    c = ["c%d" % i for i in range(1, l + 1)]
    return marked(([("a", 1)] + [(x, 2) for x in c],
                   [("a", "c1", 2, "c1")] + chain(c, last=(2, c[-1]))))


def t6_A22(_):
    return marked(([("a", 1), ("b", 2)], [("a", "b", 4, "b")]))


def t6_A2lm1_2(l):
    c = ["c%d" % i for i in range(1, l - 1)]
    return marked(([("f1", 1), ("f2", 1)] + [(x, 2) for x in c]
                   + [("e", 1)],
                   [("f1", "c1", 1, None), ("f2", "c1", 1, None)] + chain(c)
                   + [(c[-1], "e", 2, c[-1])]))


def t6_Dl1_2(l):
    c = ["c%d" % i for i in range(1, l)]
    return marked(([("a", 1)] + [(x, 1) for x in c] + [("e", 1)],
                   [("a", "c1", 2, "a")] + chain(c) + [(c[-1], "e", 2, "e")]))


def t6_E6_2(_):
    return marked(([("a", 1), ("b", 2), ("c", 3), ("d", 2), ("e", 1)],
                   [("a", "b", 1, None), ("b", "c", 1, None),
                    ("c", "d", 2, "c"), ("d", "e", 1, None)]))


def t6_D4_3(_):
    return marked(([("a", 1), ("b", 2), ("c", 1)],
                   [("a", "b", 1, None), ("b", "c", 3, "b")]))


# name: (builder, printed range of l, Sage type as a function of l)
TABLE6 = {
    "A_l^(1)": (t6_A1, range(2, 9), lambda l: ["A", l, 1]),
    "A_1^(1)": (t6_A11, [1], lambda l: ["A", 1, 1]),
    "B_l^(1)": (t6_B1, range(3, 9), lambda l: ["B", l, 1]),
    "C_l^(1)": (t6_C1, range(2, 9), lambda l: ["C", l, 1]),
    "D_l^(1)": (t6_D1, range(4, 9), lambda l: ["D", l, 1]),
    "E_6^(1)": (t6_E6, [6], lambda l: ["E", 6, 1]),
    "E_7^(1)": (t6_E7, [7], lambda l: ["E", 7, 1]),
    "E_8^(1)": (t6_E8, [8], lambda l: ["E", 8, 1]),
    "F_4^(1)": (t6_F4, [4], lambda l: ["F", 4, 1]),
    "G_2^(1)": (t6_G2, [2], lambda l: ["G", 2, 1]),
    "A_2l^(2)": (t6_A2l_2, range(2, 9), lambda l: ["A", 2 * l, 2]),
    "A_2^(2)": (t6_A22, [1], lambda l: ["A", 2, 2]),
    "A_2l-1^(2)": (t6_A2lm1_2, range(3, 9), lambda l: ["A", 2 * l - 1, 2]),
    "D_l+1^(2)": (t6_Dl1_2, range(2, 9), lambda l: ["D", l + 1, 2]),
    "E_6^(2)": (t6_E6_2, [4], lambda l: ["E", 6, 2]),
    "D_4^(3)": (t6_D4_3, [2], lambda l: ["D", 4, 3]),
}

# Kac, Tables Aff 1-3: the families and their ranges (number of vertices
# l + 1); used for the completeness of Table 6.
KAC_AFFINE = ([(["A", l, 1], l) for l in range(1, 9)]
              + [(["B", l, 1], l) for l in range(3, 9)]
              + [(["C", l, 1], l) for l in range(2, 9)]
              + [(["D", l, 1], l) for l in range(4, 9)]
              + [(["E", 6, 1], 6), (["E", 7, 1], 7), (["E", 8, 1], 8),
                 (["F", 4, 1], 4), (["G", 2, 1], 2)]
              + [(["A", 2 * l, 2], l) for l in range(1, 9)]
              + [(["A", 2 * l - 1, 2], l) for l in range(3, 9)]
              + [(["D", l + 1, 2], l) for l in range(2, 9)]
              + [(["E", 6, 2], 4), (["D", 4, 3], 2)])


def check_table6():
    instances = []
    for name, (build, rng, sage_type) in TABLE6.items():
        for l in rng:
            D = build(l)
            A = D.cartan()
            what = "Table 6 %s, l = %d" % (name, l)
            check(A.nrows() == l + 1, what + ": l + 1 vertices")
            check(is_affine(A), what + ": affine Cartan matrix")
            printed = tuple(D.marks[v] for v in D.vertices)
            check(null_marks(A) == printed, what + ": marks = null vector")
            ct = CartanType(sage_type(l))
            S = matrix(ZZ, ct.cartan_matrix())
            p = isomorphism(A, S)
            check(p is not None, what + ": isomorphic to Sage " + str(ct))
            nodes = list(ct.index_set())
            kac = ct.a()
            check(all(kac[nodes[p[i]]] == printed[i]
                      for i in range(l + 1)), what + ": Kac's labels")
            instances.append((name, l, A))
    # Kac's list (3-9 vertices) = the rows of Table 6, no two isomorphic.
    kac = []
    for t, l in KAC_AFFINE:
        kac.append((str(t), matrix(ZZ, CartanType(t).cartan_matrix())))
    for n in range(2, 10):
        book = [x for x in instances if x[2].nrows() == n]
        theirs = [x for x in kac if x[1].nrows() == n]
        for i, j in combinations(range(len(book)), 2):
            check(isomorphism(book[i][2], book[j][2]) is None,
                  "Table 6: rows %s and %s differ" % (book[i][:2],
                                                     book[j][:2]))
        check(len(book) == len(theirs), "Table 6: %d vertices, %d rows vs "
              "%d of Kac" % (n, len(book), len(theirs)))
        for t, S in theirs:
            check(sum(isomorphism(S, A) is not None for _, _, A in book)
                  == 1, "Table 6 contains Kac's " + t)


# ------------------------------------------------- g, tau and the system Psi
class Finite:
    """Root data of a finite type in Sage's (Bourbaki) numbering."""

    def __init__(self, X, n):
        self.X, self.n = X, n
        self.ct = CartanType([X, n])
        RS = RootSystem(self.ct)
        Q = RS.root_lattice()
        self.Q = Q
        idx = list(range(1, n + 1))
        self.pos = [tuple(int(b.coefficient(i)) for i in idx)
                    for b in Q.positive_roots()]
        amb = RS.ambient_space()
        sr = amb.simple_roots()
        self.gram = matrix(QQ, n, n, [[sr[i].scalar(sr[j]) for j in idx]
                                      for i in idx])
        self.cartan = matrix(ZZ, self.ct.cartan_matrix())
        assert self.cartan == gram_cartan(
            [vector(QQ, [int(i == j) for j in idx]) for i in idx], self.gram)
        self.highest = tuple(int(Q.highest_root().coefficient(i))
                             for i in idx)

    def dim(self):
        return self.n + 2 * len(self.pos)


class Psi:
    """The admissible system Psi = {alpha_0, alpha_1, ..., alpha_l} of
    Problems 4.4.46-47 for (g, tau), rebuilt from the root system.  Vertex 0
    is alpha_0; vertex j >= 1 is the restriction to t_tau of the simple
    roots of g in the j-th tau-orbit (orbits ordered by least index)."""

    def __init__(self, X, n, tau=None):
        F = Finite(X, n)
        self.F = F
        tau = tau or {i: i for i in range(1, n + 1)}
        self.tau = tau
        idx = list(range(1, n + 1))
        E = [vector(QQ, [int(i == j) for j in idx]) for i in idx]
        # tau is an automorphism of the Dynkin diagram of g
        assert all(F.cartan[i - 1, j - 1] == F.cartan[tau[i] - 1, tau[j] - 1]
                   for i in idx for j in idx)
        k = 1
        while any(self.power(tau, k)[i] != i for i in idx):
            k += 1
        self.k = k
        orbits = []
        for i in idx:
            if not any(i in o for o in orbits):
                orbits.append(sorted({self.power(tau, j)[i]
                                      for j in range(k)}))
        self.orbits = orbits
        self.orbit_of = {i: j + 1 for j, o in enumerate(orbits) for i in o}
        self.l = len(orbits)
        roots = F.pos + [tuple(-x for x in b) for b in F.pos]
        self.roots = roots
        self.act = lambda b: tuple(b[self.inverse(tau)[i] - 1] for i in idx)
        self.restrict = {b: sum((vector(QQ, self.orbit_iter(b)[j])
                                 for j in range(k)), vector(QQ, [0] * n)) / k
                         for b in roots}
        self.pi0 = [self.restrict[tuple(int(i == j) for j in idx)]
                    for i in (o[0] for o in orbits)]
        self.sigma = self.signs() if k > 1 else {}
        if k == 1:
            alpha0 = -vector(QQ, F.highest)
        else:
            alpha0 = self.lowest_weight()
        self.alpha0 = alpha0
        self.vectors = [alpha0] + self.pi0
        self.cartan = gram_cartan(self.vectors, F.gram)
        # Problem 47: alpha_0 = -sum n_j alpha_j, n_j positive integers
        P = matrix(QQ, self.pi0)
        n_rest = P.solve_left(-alpha0)
        assert all(x in ZZ and x > 0 for x in n_rest)
        self.marks = (1,) + tuple(int(x) for x in n_rest)
        self.E = E

    @staticmethod
    def power(tau, j):
        p = {i: i for i in tau}
        for _ in range(j):
            p = {i: tau[p[i]] for i in tau}
        return p

    @staticmethod
    def inverse(tau):
        return {v: i for i, v in tau.items()}

    def orbit_iter(self, b):
        out = [b]
        for _ in range(self.k - 1):
            out.append(self.act(out[-1]))
        assert self.act(out[-1]) == b
        return out

    def signs(self):
        """tau-hat(e_beta) = sigma_beta e_beta for the tau-fixed roots beta,
        tau-hat(e_i) = e_tau(i), tau-hat(f_i) = f_tau(i) (formula 4.4.(1);
        the eigenvalue sets of tau and tau^-1 agree), from nested brackets in
        the Chevalley basis."""
        F, n = self.F, self.F.n
        L = LieAlgebra(QQ, cartan_type=[F.X, n])
        Q = F.Q
        pos = set(F.pos)
        sigma = {}
        for b in F.pos:
            if self.act(b) != b:
                continue
            seq, c = [], b
            while sum(c) > 1:
                i = next(i for i in range(1, n + 1)
                         if c[i - 1] > 0
                         and tuple(c[j] - int(j == i - 1)
                                   for j in range(n)) in pos)
                seq.append(i)
                c = tuple(c[j] - int(j == i - 1) for j in range(n))
            seq.append(c.index(1) + 1)
            seq.reverse()                 # first index is the innermost
            key = sum(b[i - 1] * Q.simple_root(i) for i in range(1, n + 1))
            for gen, sign in ((L.e, 1), (L.f, -1)):
                x, y = gen(seq[0]), gen(self.tau[seq[0]])
                for i in seq[1:]:
                    x = L.bracket(gen(i), x)
                    y = L.bracket(gen(self.tau[i]), y)
                cx, cy = x.monomial_coefficients(), y.monomial_coefficients()
                assert list(cx) == [sign * key] and list(cy) == [sign * key]
                s = cy[sign * key] / cx[sign * key]
                assert s in (1, -1)
                sigma[tuple(sign * v for v in b)] = s
            assert sigma[b] == sigma[tuple(-v for v in b)]
        return sigma

    def root_orbits(self):
        seen, out = set(), []
        for b in self.roots:
            if b not in seen:
                o = list(dict.fromkeys(self.orbit_iter(b)))   # distinct
                seen.update(o)
                out.append(o)
        return out

    def lowest_weight(self):
        """alpha_0: the unique lowest weight of ad_{1/k}, the representation
        of g^tau-hat on the eigenspace of tau-hat for exp(2 pi i/k)."""
        weights = []
        for o in self.root_orbits():
            if len(o) == self.k:          # one eigenvector per k-th root of 1
                weights.append(self.restrict[o[0]])
            else:
                assert len(o) == 1
                if self.k == 2 and self.sigma[o[0]] == -1:
                    weights.append(self.restrict[o[0]])
                else:
                    assert self.sigma[o[0]] == 1
        zero = vector(QQ, [0] * self.F.n)
        weights += [zero] * sum(len(o) > 1 for o in self.orbits)
        W = {tuple(w) for w in weights}
        low = [w for w in W if not any(tuple(vector(QQ, w) - a) in W
                                       for a in self.pi0)]
        assert len(low) == 1
        assert sum(tuple(w) == low[0] for w in weights) == 1
        return vector(QQ, low[0])

    def fixed_tau_hat(self):
        """Positive roots (in t_tau^*) of g^tau-hat."""
        out = []
        for o in self.root_orbits():
            if o[0] not in self.F.pos:
                continue
            if len(o) == self.k or self.sigma.get(o[0], 1) == 1:
                out.append(tuple(self.restrict[o[0]]))
        return out

    def theta_fixed(self, s):
        """g^theta for the Kac labels s (vertex 0..l of Psi) of an
        automorphism of order 2: theta = tau-hat exp(2 pi i ad x), x in
        t_tau, alpha_j(x) = s_j/2 (j = 1..l).  On g_beta,
        exp(2 pi i ad x) = (-1)^(sum_i b_i s_orbit(i)); on a k-orbit of root
        lines theta^2 = 1 and theta permutes the lines, so it fixes one line
        of the orbit's span (k = 2); on a fixed line it acts by sigma * eps.
        Returns (dim g^theta, type, dim of the centre)."""
        assert self.k in (1, 2)
        n = self.F.n
        eps = {b: (-1) ** sum(b[i - 1] * s[self.orbit_of[i]]
                              for i in range(1, n + 1)) for b in self.roots}
        positive = []
        for o in self.root_orbits():
            if o[0] not in self.F.pos:
                continue
            if len(o) == 2:
                assert eps[o[0]] == eps[o[1]]
                positive.append(tuple(self.restrict[o[0]]))
            elif self.sigma.get(o[0], 1) * eps[o[0]] == 1:
                positive.append(tuple(self.restrict[o[0]]))
        assert len(set(positive)) == len(positive)   # root spaces 1-dim
        simple = indecomposable(positive)
        vecs = [vector(QQ, b) for b in simple]
        if vecs:
            assert matrix(QQ, vecs).rank() == len(vecs)
            kind = identify(gram_cartan(vecs, self.F.gram))
        else:
            kind = ()
        dim = self.l + 2 * len(positive)
        return dim, (kind, self.l - len(simple))


def kac_classes(A, marks, k):
    """Order-2 Kac diagrams (Problem 4.4.57, m = 2) on an affine matrix up
    to its automorphisms (Theorem 4.4.8): orbits of the label vectors s."""
    n = A.nrows()
    sols = [s for s in product(range(3), repeat=n)
            if k * sum(a * x for a, x in zip(marks, s)) == 2
            and gcd(list(s)) == 1]
    auts = automorphisms(A)
    classes = set()
    for s in sols:
        orbit = frozenset(tuple(s[p.index(i)] for i in range(n))
                          for p in auts)
        classes.add(orbit)
    return classes, sols


def orbit_of(A, s):
    n = A.nrows()
    return frozenset(tuple(s[p.index(i)] for i in range(n))
                     for p in automorphisms(A))


# tau in Sage's numbering
def flip_A(n):
    return {i: n + 1 - i for i in range(1, n + 1)}


def swap_D(n):
    t = {i: i for i in range(1, n + 1)}
    t[n - 1], t[n] = n, n - 1
    return t


FLIP_E6 = {1: 6, 2: 2, 3: 5, 4: 4, 5: 3, 6: 1}
TRIALITY = {1: 3, 2: 2, 3: 4, 4: 1}

# (g, tau) -> Table 6 name and parameter (Problem 4.4.49)
PSI_CASES = ([(("A", n, None), ("A_l^(1)", n)) for n in range(2, 9)]
             + [(("A", 1, None), ("A_1^(1)", 1))]
             + [(("B", n, None), ("B_l^(1)", n)) for n in range(3, 9)]
             + [(("C", n, None), ("C_l^(1)", n)) for n in range(2, 9)]
             + [(("D", n, None), ("D_l^(1)", n)) for n in range(4, 9)]
             + [(("E", 6, None), ("E_6^(1)", 6)),
                (("E", 7, None), ("E_7^(1)", 7)),
                (("E", 8, None), ("E_8^(1)", 8)),
                (("F", 4, None), ("F_4^(1)", 4)),
                (("G", 2, None), ("G_2^(1)", 2))]
             + [(("A", 2 * l, "flip"), ("A_2l^(2)", l)) for l in (2, 3, 4)]
             + [(("A", 2, "flip"), ("A_2^(2)", 1))]
             + [(("A", 2 * l - 1, "flip"), ("A_2l-1^(2)", l))
                for l in (3, 4)]
             + [(("D", l + 1, "swap"), ("D_l+1^(2)", l))
                for l in range(2, 8)]
             + [(("E", 6, "flip"), ("E_6^(2)", 4)),
                (("D", 4, "triality"), ("D_4^(3)", 2))])

_PSI = {}


def psi(X, n, how):
    if (X, n, how) not in _PSI:
        tau = {None: None, "flip": FLIP_E6 if X == "E" else flip_A(n),
               "swap": swap_D(n), "triality": TRIALITY}[how]
        _PSI[(X, n, how)] = Psi(X, n, tau)
    return _PSI[(X, n, how)]


def check_psi():
    """Problems 4.4.46-49: Psi of (g, tau) is the printed diagram."""
    for (X, n, how), (name, l) in PSI_CASES:
        P = psi(X, n, how)
        what = "Psi(%s%d, %s) = %s, l = %d" % (X, n, how, name, l)
        check(P.k == {None: 1, "flip": 2, "swap": 2, "triality": 3}[how]
              and P.l == l, what + ": order of tau, rank of g^tau-hat")
        D = TABLE6[name][0](l)
        A = D.cartan()
        printed = tuple(D.marks[v] for v in D.vertices)
        isos = [p for p in all_isomorphisms(P.cartan, A)]
        check(bool(isos), what + ": same diagram")
        check(all(printed[p[i]] == P.marks[i] for p in isos
                  for i in range(l + 1)), what + ": marks = n_j")
        check(P.marks[0] == 1 and printed[isos[0][0]] == 1,
              what + ": alpha_0 at a vertex of mark 1")
        # Problem 30: r(Pi) is a system of simple roots of g^tau-hat
        pos = P.fixed_tau_hat()
        check(sorted(indecomposable(pos))
              == sorted(tuple(v) for v in P.pi0),
              what + ": Pi_0 = r(Pi) simple for g^tau-hat")
        if how is None:
            check(P.cartan == matrix(ZZ, CartanType([X, n, 1])
                                     .cartan_matrix()),
                  what + ": Sage's affine type, node 0 = lowest root")


def check_sage_twisted_labels():
    """The book's A_2l^(2) is Kac's (Sage's) with reversed numbering: the
    book's vertex j is Sage's node l - j (Kac 8.3, Case 5: eps = l); the
    other twisted rows of Table 7 have the numbering of Sage."""
    for l in RANKS:
        B = k_A2l_2(l).cartan()
        S = matrix(ZZ, CartanType(["A", 2 * l, 2]).cartan_matrix())
        check(all(B[i, j] == S[l - i, l - j] for i in range(l + 1)
                  for j in range(l + 1)), "A_2l^(2): j <-> l - j, l=%d" % l)
        a = CartanType(["A", 2 * l, 2]).a()
        check(a[l] == 1 and a[0] == 2, "Sage A_2l^(2): a_0 = 2, a_l = 1")
    check(k_A22().cartan()
          == matrix(ZZ, [[2, -1], [-4, 2]]), "book A_2^(2)")
    S = matrix(ZZ, CartanType(["A", 2, 2]).cartan_matrix())
    check(S == matrix(ZZ, [[2, -4], [-1, 2]]), "Sage A_2^(2) reversed")
    for l in range(3, 9):
        check(k_A2lm1_2(l).cartan()
              == matrix(ZZ, CartanType(["A", 2 * l - 1, 2]).cartan_matrix()),
              "A_2l-1^(2) numbering = Sage")
    for l in range(2, 9):
        check(k_Dl1_2(l).cartan()
              == matrix(ZZ, CartanType(["D", l + 1, 2]).cartan_matrix()),
              "D_l+1^(2) numbering = Sage")
    check(k_E6_2().cartan()
          == matrix(ZZ, CartanType(["E", 6, 2]).cartan_matrix()),
          "E_6^(2) numbering = Sage")


# ------------------------------------------------- Table 7 (pp. 307-309)
def numbered(bonds, l):
    return Diagram(range(l + 1), bonds)


def k_B(l):
    return numbered([(0, 2, 1, None), (1, 2, 1, None)]
                    + chain(list(range(2, l + 1)), last=(2, l)), l)


def k_C(l):
    return numbered([(0, 1, 2, 1)] + chain(list(range(1, l + 1)),
                                           last=(2, l - 1)), l)


def k_D(l):
    return numbered([(0, 2, 1, None), (1, 2, 1, None)]
                    + chain(list(range(2, l - 1)))
                    + [(l - 2, l - 1, 1, None), (l - 2, l, 1, None)], l)


def k_E6():
    return numbered(chain([1, 2, 3, 4, 5]) + [(3, 6, 1, None),
                                              (6, 0, 1, None)], 6)


def k_E7():
    return numbered(chain([1, 2, 3, 4, 5, 6, 0]) + [(4, 7, 1, None)], 7)


def k_E8():
    return numbered(chain(list(range(8))) + [(5, 8, 1, None)], 8)


def k_F4():
    return numbered([(1, 2, 1, None), (2, 3, 2, 2), (3, 4, 1, None),
                     (4, 0, 1, None)], 4)


def k_G2():
    return numbered([(1, 2, 3, 1), (2, 0, 1, None)], 2)


def k_A(l):
    return numbered(chain(list(range(1, l + 1)))
                    + [(0, 1, 1, None), (0, l, 1, None)], l)


def k_A11():
    return numbered([(0, 1, 4, None)], 1)


def k_A2l_2(l):
    return numbered([(0, 1, 2, 1)] + chain(list(range(1, l + 1)),
                                           last=(2, l)), l)


def k_A22():
    return numbered([(0, 1, 4, 1)], 1)


def k_A2lm1_2(l):
    return numbered([(0, 2, 1, None), (1, 2, 1, None)]
                    + chain(list(range(2, l + 1)), last=(2, l - 1)), l)


def k_Dl1_2(l):
    return numbered([(0, 1, 2, 0)] + chain(list(range(1, l + 1)),
                                           last=(2, l)), l)


def k_E6_2():
    return numbered([(0, 1, 1, None), (1, 2, 1, None), (2, 3, 2, 2),
                     (3, 4, 1, None)], 4)


def one(black):
    return lambda l: [(None, set(black))]


# Real forms and their k (Table 9, pp. 312, 314, 316; Knapp, Lie Groups
# Beyond an Introduction, 2nd ed., Figures 6.2-6.3 and (7.147)), as types of
# k(C): so_m -> B/D, su_m -> A_(m-1), u_m -> A_(m-1) + C, sp_m -> C_m.
def so_(m):
    return [("D", m // 2)] if m % 2 == 0 else [("B", (m - 1) // 2)]


def k_of(rf):
    kind = rf[0]
    if kind == "so":
        return canon(so_(rf[1]) + so_(rf[2]))
    if kind == "su":                        # su_p + u_q
        return canon([("A", rf[1] - 1), ("A", rf[2] - 1)], 1)
    if kind == "sp":
        return canon([("C", rf[1]), ("C", rf[2])])
    if kind in ("spR", "u*H"):              # u_l
        return canon([("A", rf[1] - 1)], 1)
    if kind == "slR":
        return canon(so_(rf[1]))
    if kind == "slH":
        return canon([("C", rf[1])])
    return {"EI": canon([("C", 4)]),
            "EII": canon([("A", 1), ("A", 5)]),
            "EIII": canon([("D", 5)], 1),
            "EIV": canon([("F", 4)]),
            "EV": canon([("A", 7)]),
            "EVI": canon([("A", 1), ("D", 6)]),
            "EVII": canon([("E", 6)], 1),
            "EVIII": canon([("D", 8)]),
            "EIX": canon([("A", 1), ("E", 7)]),
            "FI": canon([("A", 1), ("C", 3)]),
            "FII": canon([("B", 4)]),
            "G": canon([("A", 1), ("A", 1)])}[kind]


def row(page, kind, g, ranks, affine, diagram, blacks, gtype, rf,
        finite, how=None, family=None):
    return dict(page=page, kind=kind, g=g, ranks=ranks, affine=affine,
                diagram=diagram, blacks=blacks, gtype=gtype, rf=rf,
                finite=finite, how=how, family=family)


# The printed rows.  `finite(l)`: the type (X, n) of g; `how`: tau; `family`:
# the Table 1 family of g (inner rows); `blacks(l)`: [(p, black set)].
TABLE7 = [
    row("p. 307", "I", "so_2l+1", range(3, 9), "B_l^(1)", k_B,
        lambda l: [(p, {p}) for p in range(2, l + 1)],
        lambda l, p: canon([("D", p), ("B", l - p)]),
        lambda l, p: ("so", 2 * p, 2 * (l - p) + 1),
        lambda l: ("B", l), family="B"),
    row("p. 307", "I", "sp_2l", range(2, 9), "C_l^(1)", k_C,
        lambda l: [(p, {p}) for p in range(1, l // 2 + 1)],
        lambda l, p: canon([("C", p), ("C", l - p)]),
        lambda l, p: ("sp", p, l - p),
        lambda l: ("C", l), family="C"),
    row("p. 307", "I", "so_2l", range(4, 9), "D_l^(1)", k_D,
        lambda l: [(p, {p}) for p in range(2, l // 2 + 1)],
        lambda l, p: canon([("D", p), ("D", l - p)]),
        lambda l, p: ("so", 2 * p, 2 * (l - p)),
        lambda l: ("D", l), family="D"),
    row("p. 307", "I", "E6", [6], "E_6^(1)", lambda l: k_E6(), one({2}),
        lambda l, p: canon([("A", 1), ("A", 5)]), lambda l, p: ("EII",),
        lambda l: ("E", 6), family="E"),
    row("p. 308", "I", "E7", [7], "E_7^(1)", lambda l: k_E7(), one({7}),
        lambda l, p: canon([("A", 7)]), lambda l, p: ("EV",),
        lambda l: ("E", 7), family="E"),
    row("p. 308", "I", "E7", [7], "E_7^(1)", lambda l: k_E7(), one({2}),
        lambda l, p: canon([("A", 1), ("D", 6)]), lambda l, p: ("EVI",),
        lambda l: ("E", 7), family="E"),
    row("p. 308", "I", "E8", [8], "E_8^(1)", lambda l: k_E8(), one({7}),
        lambda l, p: canon([("D", 8)]), lambda l, p: ("EVIII",),
        lambda l: ("E", 8), family="E"),
    row("p. 308", "I", "E8", [8], "E_8^(1)", lambda l: k_E8(), one({1}),
        lambda l, p: canon([("A", 1), ("E", 7)]), lambda l, p: ("EIX",),
        lambda l: ("E", 8), family="E"),
    row("p. 308", "I", "F4", [4], "F_4^(1)", lambda l: k_F4(), one({4}),
        lambda l, p: canon([("C", 3), ("A", 1)]), lambda l, p: ("FI",),
        lambda l: ("F", 4), family="F"),
    row("p. 308", "I", "F4", [4], "F_4^(1)", lambda l: k_F4(), one({1}),
        lambda l, p: canon([("B", 4)]), lambda l, p: ("FII",),
        lambda l: ("F", 4), family="F"),
    row("p. 308", "I", "G2", [2], "G_2^(1)", lambda l: k_G2(), one({2}),
        lambda l, p: canon([("A", 1), ("A", 1)]), lambda l, p: ("G",),
        lambda l: ("G", 2), family="G"),
    row("p. 308", "II", "sl_l+1", range(2, 9), "A_l^(1)", k_A,
        lambda l: [(p, {0, p}) for p in range(1, (l + 1) // 2 + 1)],
        lambda l, p: canon([("A", p - 1), ("A", l - p)], 1),
        lambda l, p: ("su", p, l + 1 - p),
        lambda l: ("A", l), family="A"),
    # sl_2(C): printed with both vertices white; corrected: both black
    # (see check_sl2 for the refuted printed reading).
    row("p. 308", "II", "sl_2", [1], "A_1^(1)", lambda l: k_A11(),
        one({0, 1}), lambda l, p: canon([], 1), lambda l, p: ("su", 1, 1),
        lambda l: ("A", 1), family="A"),
    row("p. 308", "II", "so_2l+1", range(3, 9), "B_l^(1)", k_B,
        one({0, 1}), lambda l, p: canon([("B", l - 1)], 1),
        lambda l, p: ("so", 2, 2 * l - 1),
        lambda l: ("B", l), family="B"),
    row("p. 308", "II", "sp_2l", range(2, 9), "C_l^(1)", k_C,
        lambda l: [(None, {0, l})], lambda l, p: canon([("A", l - 1)], 1),
        lambda l, p: ("spR", l),
        lambda l: ("C", l), family="C"),
    row("p. 309", "II", "so_2l", range(4, 9), "D_l^(1)", k_D,
        one({0, 1}), lambda l, p: canon([("D", l - 1)], 1),
        lambda l, p: ("so", 2, 2 * l - 2),
        lambda l: ("D", l), family="D"),
    row("p. 309", "II", "so_2l", range(4, 9), "D_l^(1)", k_D,
        lambda l: [(None, {0, l})], lambda l, p: canon([("A", l - 1)], 1),
        lambda l, p: ("u*H", l),
        lambda l: ("D", l), family="D"),
    row("p. 309", "II", "E6", [6], "E_6^(1)", lambda l: k_E6(), one({1, 0}),
        lambda l, p: canon([("D", 5)], 1), lambda l, p: ("EIII",),
        lambda l: ("E", 6), family="E"),
    row("p. 309", "II", "E7", [7], "E_7^(1)", lambda l: k_E7(), one({1, 0}),
        lambda l, p: canon([("E", 6)], 1), lambda l, p: ("EVII",),
        lambda l: ("E", 7), family="E"),
    row("p. 309", "III", "sl_2l+1", range(2, 5), "A_2l^(2)", k_A2l_2,
        one({0}), lambda l, p: canon([("B", l)]),
        lambda l, p: ("slR", 2 * l + 1),
        lambda l: ("A", 2 * l), how="flip"),
    row("p. 309", "III", "sl_3", [1], "A_2^(2)", lambda l: k_A22(),
        one({0}), lambda l, p: canon([("A", 1)]), lambda l, p: ("slR", 3),
        lambda l: ("A", 2), how="flip"),
    row("p. 309", "III", "sl_2l", range(3, 5), "A_2l-1^(2)", k_A2lm1_2,
        lambda l: [(None, {l})], lambda l, p: canon([("D", l)]),
        lambda l, p: ("slR", 2 * l),
        lambda l: ("A", 2 * l - 1), how="flip"),
    row("p. 309", "III", "sl_2l", range(3, 5), "A_2l-1^(2)", k_A2lm1_2,
        one({0}), lambda l, p: canon([("C", l)]),
        lambda l, p: ("slH", l),
        lambda l: ("A", 2 * l - 1), how="flip"),
    row("p. 309", "III", "so_2l+2", range(2, 8), "D_l+1^(2)", k_Dl1_2,
        lambda l: [(p, {p}) for p in range(0, l // 2 + 1)],
        lambda l, p: canon([("B", p), ("B", l - p)]),
        lambda l, p: ("so", 2 * p + 1, 2 * (l - p) + 1),
        lambda l: ("D", l + 1), how="swap"),
    row("p. 309", "III", "E6", [4], "E_6^(2)", lambda l: k_E6_2(), one({4}),
        lambda l, p: canon([("C", 4)]), lambda l, p: ("EI",),
        lambda l: ("E", 6), how="flip"),
    row("p. 309", "III", "E6", [4], "E_6^(2)", lambda l: k_E6_2(), one({0}),
        lambda l, p: canon([("F", 4)]), lambda l, p: ("EIV",),
        lambda l: ("E", 6), how="flip"),
]


def g_key(X, n):
    """Isomorphism class of a simple g: B_2 = C_2, D_3 = A_3."""
    if (X, n) == ("C", 2):
        return ("B", 2)
    if (X, n) == ("D", 3):
        return ("A", 3)
    return (X, n)


def reference(key, outer):
    """The Psi used for the enumeration of the classes of g (part C)."""
    X, n = key
    if not outer:
        return psi(X, n, None)
    return psi(X, n, "flip" if X in ("A", "E") else "swap")


INSTANCES = []          # (key, class, row, l, p, g^theta computed)


def check_table7():
    for r in TABLE7:
        for l in r["ranks"]:
            D = r["diagram"](l)
            A = D.cartan()
            X, n = r["finite"](l)
            key = g_key(X, n)
            outer = r["kind"] == "III"
            k = 2 if outer else 1
            name, l6 = r["affine"], l
            if name in ("E_6^(1)", "E_7^(1)", "E_8^(1)", "F_4^(1)",
                        "G_2^(1)", "E_6^(2)"):
                l6 = A.nrows() - 1
            if name in ("A_1^(1)", "A_2^(2)"):
                l6 = 1
            T6 = TABLE6[name][0](l6).cartan()
            marks = null_marks(A)
            for p, black in r["blacks"](l):
                what = "Table 7 %s %s %s l=%s p=%s" % (
                    r["page"], r["kind"], r["g"], l, p)
                s = tuple(int(j in black) for j in range(l + 1))
                # the column "Type of affine diagram"
                check(isomorphism(A, T6) is not None,
                      what + ": diagram of type " + name)
                # Problem 47: n_0 = 1 at the vertex 0
                check(marks[0] == 1, what + ": n_0 = 1")
                # (5.1.12), Problem 5.1.38: k sum n_j s_j = 2, labels 1/2
                check(k * sum(a * x for a, x in zip(marks, s)) == 2,
                      what + ": k sum n_j s_j = 2")
                nb = [marks[j] for j in black]
                check((r["kind"] == "I" and nb == [2])
                      or (r["kind"] == "II" and nb == [1, 1] and 0 in black)
                      or (r["kind"] == "III" and nb == [1]),
                      what + ": Problem 5.1.38 type " + r["kind"])
                # vertex 0 is alpha_0 of the Psi of (g, tau)
                P = psi(X, n, r["how"])
                isos = [q for q in all_isomorphisms(A, P.cartan)
                        if q[0] == 0]
                check(bool(isos), what + ": vertex 0 is alpha_0")
                # vertices 1..l: Table 1 numbering of g^tau-hat
                sub = A.matrix_from_rows_and_columns(list(range(1, l + 1)),
                                                     list(range(1, l + 1)))
                if outer:
                    tname = identify(gram_cartan(P.pi0, P.F.gram))
                    assert len(tname) == 1
                    fam, rk = tname[0][0], int(tname[0][1:])
                else:
                    fam, rk = r["family"], l
                check(sub == table1(fam, rk).cartan(),
                      what + ": Pi_0 numbered as in Table 1 (g^tau-hat)")
                # Problem 4.4.61: delete the black vertices
                white = [j for j in range(l + 1) if j not in black]
                deleted = (identify(A.matrix_from_rows_and_columns(white,
                                                                   white)),
                           len(black) - 1)
                printed = r["gtype"](l, p)
                check(deleted == printed, what + ": deletion rule = printed")
                # independent g^theta from the eigenvalues of theta
                s_psi = tuple(s[isos[0].index(i)] for i in range(l + 1))
                dim, computed = P.theta_fixed(s_psi)
                check(computed == printed, what + ": computed g^theta "
                      "%s = printed %s" % (computed, printed))
                check(dim == dim_of(printed), what + ": dim g^theta")
                check(rank_of(printed) == l,
                      what + ": rank g^theta = dim t_tau")
                # the refuted reading: Pi_0 = simple roots of g^theta
                if not (outer and black == {0}):
                    refuted(identify(sub) == printed[0] and printed[1] == 0,
                            what + ": Pi_0 simple roots of g^theta")
                else:
                    check(identify(sub) == printed[0],
                          what + ": theta = tau-hat, g^theta = g^tau-hat")
                # type I/II/III as described: inner/outer and the centre
                check(outer == (P.k == 2)
                      and (computed[1] == 0) == (r["kind"] != "II")
                      and computed[1] in (0, 1),
                      what + ": type I/II/III by the description")
                # the real form: k(C) of Table 9 = g^theta, dims
                kk = k_of(r["rf"](l, p))
                check(kk == printed, what + ": k(C) of the real form")
                check(dim_of(kk) == dim, what + ": dim k = dim g^theta")
                ref = reference(key, outer)
                q = isomorphism(A, ref.cartan)
                s_ref = tuple(s[q.index(i)] for i in range(l + 1))
                INSTANCES.append((key, outer, orbit_of(ref.cartan, s_ref),
                                  r, l, p, computed))


def check_printed_misreadings():
    # "F_7^(1)" (p. 308): no such affine type; the F_4 rows are F_4^(1).
    try:
        CartanType(["F", 7, 1])
        exists = True
    except ValueError:
        exists = False
    refuted(exists or "F_7^(1)" in TABLE6, "Table 7 F_4 row: F_7^(1)")
    check(isomorphism(k_F4().cartan(), t6_F4(4).cartan()) is not None
          and k_F4().cartan().nrows() == 5, "F_4 rows on F_4^(1)")


def check_sl2():
    """Table 7, type II, sl_2(C) (p. 308): printed both vertices white."""
    A = k_A11().cartan()
    marks = null_marks(A)
    printed = (0, 0)
    refuted(sum(a * x for a, x in zip(marks, printed)) == 2,
            "sl_2 all white: sum n_j s_j = 0, (4.4.7) fails")
    classes, sols = kac_classes(A, marks, 1)
    check(sols == [(1, 1)], "A_1^(1): the only order-2 labels (1, 1)")
    # theta = Ad diag(i, -i) = exp(2 pi i ad x), alpha_1(x) = 1/2:
    # -1 on g_alpha and g_-alpha, g^theta = the diagonal, one-dimensional
    P = psi("A", 1, None)
    check(P.theta_fixed((1, 1)) == (1, ((), 1)), "sl_2: g^theta = C")


def check_classes():
    """Part C: the rows of Table 7 against all classes of involutions."""
    keys = ([("A", n) for n in range(1, MAX_RANK + 1)]
            + [("B", n) for n in range(2, MAX_RANK + 1)]
            + [("C", n) for n in range(3, MAX_RANK + 1)]
            + [("D", n) for n in range(4, MAX_RANK + 1)]
            + [("E", 6), ("E", 7), ("E", 8), ("F", 4), ("G", 2)])
    for key in keys:
        X, n = key
        types = {}
        for outer in (False, True):
            if outer and not ((X == "A" and n >= 2) or X == "D"
                              or key == ("E", 6)):
                continue
            ref = reference(key, outer)
            k = 2 if outer else 1
            classes, _ = kac_classes(ref.cartan, ref.marks, k)
            rows = [x for x in INSTANCES if x[0] == key and x[1] == outer]
            got = [x[2] for x in rows]
            what = "g = %s%d, %s" % (X, n, "outer" if outer else "inner")
            check(set(got) == classes, what + ": rows = all classes")
            dup = len(got) - len(set(got))
            if key == ("D", 4) and not outer:
                check(dup == 1, what + ": so_8 type II rows one class")
                pair = [x for x in rows if x[3]["kind"] == "II"]
                check(len(pair) == 2 and pair[0][2] == pair[1][2],
                      "so_8: so_2,6 and u*_4(H) one class")
            else:
                check(dup == 0, what + ": each class once")
            for x in rows:
                types.setdefault((outer, x[2]), x[6])
            for c in classes:
                s = sorted(c)[0]
                dim, t = ref.theta_fixed(s)
                check(types.get((outer, c), t) == t,
                      what + ": g^theta of a class")
                types[(outer, c)] = t
            # D_4^(3): no involutions (3 sum n_j s_j >= 3)
        if key == ("D", 4):
            T = psi("D", 4, "triality")
            check(kac_classes(T.cartan, T.marks, 3)[0] == set(),
                  "D_4^(3): no automorphisms of order 2")
        vals = list(types.values())
        check(len(set(vals)) == len(vals),
              "g = %s%d: g^theta determines the class (5.1.39)" % key)


def theorem6(X, n):
    """Theorem 5.1.6: the noncompact real forms (p. 233), normalised."""
    out = set()
    if X == "sl":
        out.add(("slR", n))
        if n % 2 == 0:
            out.add(("slH", n // 2))
        out |= {("su", p, n - p) for p in range(1, n // 2 + 1)}
    if X == "so":
        out |= {("so", p, n - p) for p in range(1, n // 2 + 1)}
        if n % 2 == 0:
            out.add(("u*H", n // 2))
    if X == "sp":
        out.add(("spR", n // 2))
        out |= {("sp", p, n // 2 - p) for p in range(1, n // 4 + 1)}
    return out


def norm_rf(rf):
    if rf[0] in ("so", "su", "sp"):
        return (rf[0],) + tuple(sorted(rf[1:]))
    return rf


def check_theorem6():
    """Real forms of the classical rows of Table 7 = Theorem 5.1.6 minus
    the compact form, per algebra (the printed families and ranks)."""
    groups = {}
    for key, outer, cls, r, l, p, t in INSTANCES:
        g = r["g"]
        size = {"so_2l+1": ("so", 2 * l + 1), "sp_2l": ("sp", 2 * l),
                "so_2l": ("so", 2 * l), "sl_l+1": ("sl", l + 1),
                "sl_2": ("sl", 2), "sl_2l+1": ("sl", 2 * l + 1),
                "sl_3": ("sl", 3), "sl_2l": ("sl", 2 * l),
                "so_2l+2": ("so", 2 * l + 2)}.get(g)
        if size:
            groups.setdefault(size, set()).add(norm_rf(r["rf"](l, p)))
    for (X, n), got in groups.items():
        complete = ((X == "sl" and (n % 2 == 1 or n >= 6 or n == 2))
                    or (X == "so" and n >= 8) or X == "sp")
        if not complete:
            continue          # sl_4 = so_6: outer rows are under so_6
        want = {norm_rf(x) for x in theorem6(X, n)}
        if (X, n) == ("sl", 2):
            # Theorem 6 for n = 2: sl_2(R) = su_1,1; sl_1(H) = su_2 compact
            check(got == {("su", 1, 1)}, "Table 7 sl_2: su_1,1 only")
            continue
        check(got == want, "Table 7 real forms of %s_%d = Theorem 5.1.6"
              % (X, n))


def check_theorem5():
    """Theorem 5.1.5 (p. 233) with explicit matrices, notation of 5.1.2°:
    S_m = [[0, -E], [E, 0]], I_(p, q) = diag(E_p, -E_q)."""
    for m in range(3, 7):
        E = matrix.identity(QQ, m)
        Z = matrix.zero(QQ, m)
        S = matrix.block([[Z, -E], [E, Z]])
        n = 2 * m
        check(S.det() == 1 and S.transpose() * S == matrix.identity(QQ, n)
              and S.transpose() == -S, "S_%d in SO_2m and in so_2m" % m)
        # centraliser of S in so_2m: dim m^2 = dim gl_m, contains S
        basis = []
        for i in range(n):
            for j in range(i + 1, n):
                X = matrix.zero(QQ, n)
                X[i, j], X[j, i] = 1, -1
                basis.append(X)
        M = matrix(QQ, [(S * X - X * S).list() for X in basis])
        fixed = M.left_kernel().dimension()
        check(fixed == m * m, "so_%d: dim g^(Ad S_m) = m^2" % n)
        # T_D = [[0, -D], [D, 0]], D = E_ii: m commuting skew (hence
        # semisimple) elements of so_2m fixed by Ad S_m, linearly
        # independent: Ad S_m fixes a Cartan subalgebra pointwise, so it is
        # inner (Kac, the fact used in the proof of Prop. 8.6 a: an
        # automorphism of finite order is inner iff it fixes a Cartan
        # subalgebra pointwise); S_m = sum T_D is central in the
        # centraliser g^theta of S_m: type II.
        tori = []
        for i in range(m):
            D = matrix.zero(QQ, m)
            D[i, i] = 1
            tori.append(matrix.block([[Z, -D], [D, Z]]))
        check(all(T.transpose() == -T and S * T == T * S for T in tori)
              and all(T * U == U * T for T in tori for U in tori)
              and matrix(QQ, [T.list() for T in tori]).rank() == m
              and sum(tori) == S, "so_%d: Ad S_m fixes a Cartan "
              "subalgebra; S_m central in g^theta" % n)
        rank_lower_bound = matrix(QQ, [T.list() for T in tori]).rank()
        refuted(rank_lower_bound < m,
                "Theorem 5.1.5 2b): Ad S_m outer (type III), n = %d" % n)
    for n in range(6, 13, 2):
        for p in range(1, n // 2 + 1, 2):
            I = matrix.diagonal(QQ, [1] * p + [-1] * (n - p))
            t = canon(so_(p) + so_(n - p))
            check(I.det() == -1 and rank_of(t) < n // 2,
                  "so_%d, I_(%d,%d): det -1, rank g^theta < rank g: outer"
                  % (n, p, n - p))
    # n = 2: 1b) is the identity, 1a) is Ad S_1 (inner)
    R = QQ["a,b,c"]
    a, b, c = R.gens()
    X = matrix(R, [[a, b], [c, -a]])
    S1 = matrix(R, [[0, -1], [1, 0]])
    check(-S1 * X.transpose() * S1.inverse() == X,
          "sl_2: -Ad S_1(X^T) = X")
    check(S1 * X * S1.inverse() == -X.transpose(), "sl_2: -X^T = Ad S_1")


def main():
    check_table1()
    check_table6()
    check_psi()
    check_sage_twisted_labels()
    check_table7()
    check_printed_misreadings()
    check_sl2()
    check_classes()
    check_theorem6()
    check_theorem5()
    print("ok tables-6-7: %d checks" % N_CHECKS)


if __name__ == "__main__":
    main()
