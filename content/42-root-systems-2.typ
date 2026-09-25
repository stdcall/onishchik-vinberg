// Chapter 4, § 2. Root Systems, second part: 5°-8°, Exercises and Hints to
// Problems. Printed pages 164-181. The section heading and 1°-4° are in
// 42-root-systems.typ.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/dynkin.typ": bond, dynkin, gap, v

=== Dynkin Diagrams <ss:dynkin-diagrams>
#source(179)Let $Gamma = {gamma_1, ..., gamma_s}$ be a system of nonzero vectors
in a Euclidean space $bold(E)$. A graph may be assigned to $Gamma$ which
clarifies how this system decomposes into indecomposable components in the sense
of @ss:root-system-definitions. Namely, to each vector $gamma_i$ assign a vertex
of the graph and join the vertices corresponding to the vectors $gamma_i$ and
$gamma_j$ if and only if $(gamma_i, gamma_j) != 0$. Clearly, the indecomposable
components of $Gamma$ correspond exactly to the connected components of this
graph. The edges of the graph may be endowed with additional labels which help
us to recover the data on the angles between the vectors $gamma_i$ and the
ratios of their lengths. We will only do this for one special class of vector
systems.

A system of nonzero vectors $Gamma = {gamma_1, ..., gamma_s}$ of a Euclidean
space $bold(E)$ is #idx("Vector system", "admissible")_admissible_ if
$a_(i j) = chevron.l gamma_i|gamma_j chevron.r$ is a nonpositive integer for any
$i != j$. The integer matrix $A(Gamma) = (a_(i j))$, where
$a_(i j) = chevron.l gamma_i|gamma_j chevron.r$, is called the #idx(
  "matrix of a vector system",
)_matrix of $Gamma$._

The condition $a_(i j) <= 0$ means that the angle $theta_(i j)$ between
$gamma_i$ and $gamma_j$ is not acute. Indeed, the numbers $a_(i j)$,
$m_(i j) = a_(i j) a_(j i)$ and $theta_(i j)$ for an admissible system can only
take the values indicated in Problem~@pr:root-angles-and-length-ratios. In
particular, $m_(i j) = 0$, 1, 2, 3 or 4 and $theta_(i j) = pi (1 - 1\/n_(i j))$,
where $n_(i j) = 2, 3, 4, 6$ or $infinity$, respectively.

The #idx("Dynkin diagram")_Dynkin diagram_ of an admissible system is
constructed as follows:

1) a vertex of the diagram corresponds to each vector $gamma_i$;

2) the $i$-th vertex is joined with the $j$-th ($i != j$) by an edge of
multiplicity $m_(i j)$ (in particular, for $m_(i j) = 0$ the vertices are
separated);

3) if $abs(a_(i j)) < abs(a_(j i))$ then the corresponding edge is oriented by
an arrow with the $j$-th vertex as the source and the $i$-th as the target.

A #idx("submatrix", "principal")_principal submatrix_ of a matrix is one located
at the intersection of rows and columns indexed by the same numbers. The
principal submatrices of the matrix $A(Gamma)$ correspond to the subsystems of
$Gamma$ and the subdiagrams of its Dynkin diagram.

Clearly, $A(Gamma)$ is obtained from the Gram matrix of $Gamma$ by multiplying
the columns of the latter by $2\/(gamma_i, gamma_i) > 0$. Therefore
$det A(Gamma) >= 0$ and $det A(Gamma) > 0$ if and only if $Gamma$ is linearly
independent.

#problem[The Dynkin diagram of an admissible system of vectors determines this
  system up to an isomorphism (in the sense of
  @ss:root-system-definitions).] <pr:dynkin-diagram-determines-system>

#problem[If $Gamma = {gamma_1, ..., gamma_s}$ is an admissible system of vectors
  then so is $Gamma^or = {gamma_1^or, ..., gamma_s^or}$, where
  $gamma_i^or = 2 u_(gamma_i) \/ (gamma_i, gamma_i)$, $u_(gamma_i)$ is the
  vector of $bold(E)^*$ corresponding to $gamma_i$ under the natural
  isomorphism. The Dynkin diagram of $Gamma^or$ is obtained from the Dynkin
  diagram of $Gamma$ by reversing the orientation of all oriented
  edges.] <pr:dual-system-reverses-arrows>

An example of an admissible system of vectors is the base of any root system
$Delta$ (see Problem~@pr:simple-roots-obtuse). By
Theorem~@th:weyl-group-simply-transitive the Dynkin diagram of $Pi$ does not
depend on the choice of the base of $Delta$; therefore this diagram might be
called the _Dynkin diagram of $Delta$._
Theorem~@th:root-system-determined-by-base implies that the Dynkin diagram of a
reduced root system determines this system uniquely up to an isomorphism. We
will denote this diagram in the same way as the reduced root system to which it
corresponds. Problems~@pr:dual-base-of-dual-system and
@pr:dual-system-reverses-arrows imply that the passage to the dual root system
reverses the orientation of all (oriented) edges of the Dynkin diagram.

#source(180)If $Delta = Delta_G = Delta_frak(g)$ is a root system of a reductive
algebraic group $G$ or its tangent algebra $frak(g)$ then the Dynkin diagram of
$Delta$ is also called the #idx("Dynkin diagram")_Dynkin diagram of
$G$_ or $frak(g)$. In §~@sec:existence-uniqueness-theorems we will prove that a
semisimple Lie algebra is determined uniquely up to an isomorphism by its Dynkin
diagram. Note also that a semisimple Lie algebra is simple if and only if its
Dynkin diagram is connected and the connected components of a general Dynkin
diagram are in one-to-one correspondence with the simple ideals of the
corresponding semisimple Lie algebra (see
Theorem~@th:simple-iff-base-indecomposable).

_Example_ #eg <exm:low-rank-dynkin-diagrams> The Dynkin diagrams of the root
systems described in Fig.~@fig:rank-one-two-root-systems are of the form

#table(
  columns: (1fr,) * 5,
  align: center + horizon,
  stroke: (x, y) => (
    left: if x > 0 { 0.5pt },
    bottom: if y == 0 { 0.5pt },
  ),
  $A_1, B C_1$, $A_1 + A_1$, $A_2$, $B_2, B C_2$, $G_2$,
  dynkin((a: v(0, 0, label: $alpha$, at: "below")), ()),
  dynkin(
    (
      a: v(0, 0, label: $alpha_1$, at: "below"),
      b: v(1, 0, label: $alpha_2$, at: "below"),
    ),
    (),
  ),
  dynkin(
    (
      a: v(0, 0, label: $alpha_1$, at: "below"),
      b: v(1, 0, label: $alpha_2$, at: "below"),
    ),
    (bond("a", "b", 1),),
  ),
  dynkin(
    (
      a: v(0, 0, label: $alpha_1$, at: "below"),
      b: v(1, 0, label: $alpha_2$, at: "below"),
    ),
    (bond("a", "b", 2, to: "b"),),
  ),
  dynkin(
    (
      a: v(0, 0, label: $alpha_1$, at: "below"),
      b: v(1, 0, label: $alpha_2$, at: "below"),
    ),
    (bond("a", "b", 3, to: "a"),),
  ),
)

_Example_ #eg <exm:classical-dynkin-diagrams> The Dynkin diagrams of the
classical simple Lie algebras (see
Example~@exm:simple-roots-of-classical-algebras[] of
@ss:weyl-chambers-and-simple-roots) are of the following form (here $l$ is the
rank of the Lie algebra, equal to the number of vertices of the diagram; in the
right column the standard notation of the Dynkin diagram is indicated):
$
  #grid(
    columns: 3,
    column-gutter: 2.5em,
    row-gutter: 1.2em,
    align: left + horizon,
    $frak(s l)_(l+1) (CC), l >= 1$,
    dynkin(
      (
        a: v(0, 0, label: $alpha_1$),
        b: v(1, 0, label: $alpha_2$),
        c: v(3, 0, label: $alpha_(l-1)$),
        d: v(4, 0, label: $alpha_l$),
      ),
      (bond("a", "b", 1), gap("b", "c"), bond("c", "d", 1)),
    ),
    $A_l$,

    $frak(s o)_(2l+1) (CC), l >= 2$,
    dynkin(
      (
        a: v(0, 0, label: $alpha_1$),
        b: v(1, 0, label: $alpha_2$),
        c: v(3, 0, label: $alpha_(l-1)$),
        d: v(4, 0, label: $alpha_l$),
      ),
      (bond("a", "b", 1), gap("b", "c"), bond("c", "d", 2, to: "d")),
    ),
    $B_l$,

    $frak(s o)_3 (CC)$,
    dynkin((a: v(0, 0, label: $alpha_1$)), ()),
    $A_1 (= B_1 = C_1)$,

    $frak(s o)_(2l) (CC), l >= 3$,
    dynkin(
      (
        a: v(0, 0, label: $alpha_1$),
        b: v(1, 0, label: $alpha_2$),
        c: v(3, 0, label: $alpha_(l-2)$, at: "north-west"),
        d: v(4, 0.5, label: $alpha_(l-1)$),
        e: v(4, -0.5, label: $alpha_l$, at: "below"),
      ),
      (bond("a", "b"), gap("b", "c"), bond("c", "d"), bond("c", "e")),
    ),
    $D_l$,

    $frak(s p)_(2l) (CC), l >= 2$,
    dynkin(
      (
        a: v(0, 0, label: $alpha_1$),
        b: v(1, 0, label: $alpha_2$),
        c: v(3, 0, label: $alpha_(l-1)$),
        d: v(4, 0, label: $alpha_l$, at: "below"),
      ),
      (bond("a", "b", 1), gap("b", "c"), bond("c", "d", 2, to: "c")),
    ),
    $C_l$,
  )
$

All of the above admissible systems of vectors are linearly independent. Now we
will give examples of linearly dependent admissible systems.

#problem[Let $Gamma = {gamma_1, ..., gamma_s}$ be an indecomposable linearly
  dependent system of nonzero vectors of a Euclidean space with pairwise
  nonacute angles. Then all proper subsystems of $Gamma$ are linearly
  independent. In particular, the rank of $Gamma$ is $s - 1$. Any linear
  relation among $gamma_1$, ..., $gamma_s$ is proportional to one fixed relation
  of the form $sum_(1 <= i <= s) c_i gamma_i = 0$, where $c_i > 0$ for all
  $i$.] <pr:nonacute-system-positive-relation>

Let $Delta$ be a root system. In $Delta$, choose a base $Pi$ and consider the
corresponding partial order (see @ss:weyl-chambers-and-simple-roots). Clearly,
in $Delta$ there are elements maximal with respect to this order, i.e. roots
$delta in Delta$ such that $gamma in Delta$, $gamma >= delta$ implies
$gamma = delta$.

#problem[For any maximal root $delta in Delta$ we have $(delta, alpha) >= 0$ for
  all $alpha in Pi$ and $(delta, beta) > 0$ for some
  $beta in Pi$.] <pr:maximal-root-dominant>

#problem[#source(181)An indecomposable root system $Delta$ contains a unique
  maximal with respect to $Pi$ root $delta$ and
  $delta = sum_(alpha in Pi) n_alpha alpha$, where $n_alpha$ are positive
  integers.] <pr:unique-maximal-root>

Let $Delta$ be an indecomposable root system. Problem~@pr:unique-maximal-root
implies that the unique maximal root $delta in Delta$ is the largest element of
this system. The root $delta$ is called the #idx("root", "highest")_highest
root_ and $alpha_0 = -delta$ the #idx("root", "lowest")_lowest root_ of $Delta$.
If $Pi = {alpha_1, ..., alpha_l}$, then
$tilde(Pi) = {alpha_0, alpha_1, ..., alpha_l}$ is called the _extended system of
simple roots_ (#idx("Base", "extended")_extended base_) of $Delta$.
Problem~@pr:maximal-root-dominant implies that $tilde(Pi)$ is an indecomposable
linearly dependent admissible system of vectors. The Dynkin diagram of
$tilde(Pi)$ is called the #idx(
  "Dynkin diagram",
  "extended",
)_extended Dynkin diagram_ of $Delta$.

When $Delta$ is a root system of a simple noncommutative algebraic group $G$ (or
Lie algebra $frak(g)$) one speaks about the _extended system of simple roots and
the extended Dynkin diagram of $G$_ (or $frak(g)$).

#example[Extended Dynkin diagrams of simple classical Lie algebras are of the
  following form (each diagram contains $l + 1$ vertices; in the right column
  the standard notation for each diagram is given):
  $
    #grid(
      columns: 3,
      column-gutter: 2.5em,
      row-gutter: 1.2em,
      align: left + horizon,
      $frak(s l)_(l+1) (CC), l >= 2$,
      dynkin(
        (
          a: v(0, 0),
          b: v(1, 0),
          c: v(3, 0),
          d: v(4, 0),
          o: v(2, 1, label: $alpha_0$),
        ),
        (
          bond("a", "b", 1),
          gap("b", "c"),
          bond("c", "d", 1),
          bond("o", "a", 1),
          bond("o", "d", 1),
        ),
      ),
      $A_l^((1))$,

      $frak(s l)_2 (CC)$,
      dynkin(
        (a: v(0, 0, label: $alpha_0$, at: "left"), b: v(1, 0)),
        (bond("a", "b", 4),),
      ),
      $A_1^((1))$,

      $frak(s o)_(2l+1) (CC), l >= 3$,
      dynkin(
        (
          o: v(0, 0.5, label: $alpha_0$, at: "left"),
          a: v(0, -0.5),
          b: v(1, 0),
          c: v(2, 0),
          d: v(4, 0),
          e: v(5, 0),
        ),
        (
          bond("o", "b", 1),
          bond("a", "b", 1),
          bond("b", "c", 1),
          gap("c", "d"),
          bond("d", "e", 2, to: "e"),
        ),
      ),
      $B_l^((1))$,

      $frak(s o)_(2l) (CC), l >= 4$,
      dynkin(
        (
          o: v(0, 0.5, label: $alpha_0$, at: "left"),
          a: v(0, -0.5),
          b: v(1, 0),
          c: v(2, 0),
          d: v(4, 0),
          e: v(5, 0.5),
          f: v(5, -0.5),
        ),
        (
          bond("o", "b", 1),
          bond("a", "b", 1),
          bond("b", "c", 1),
          gap("c", "d"),
          bond("d", "e", 1),
          bond("d", "f", 1),
        ),
      ),
      $D_l^((1))$,

      $frak(s p)_(2l) (CC), l >= 2$,
      dynkin(
        (
          o: v(0, 0, label: $alpha_0$, at: "left"),
          a: v(1, 0),
          b: v(3, 0),
          c: v(4, 0),
          d: v(5, 0),
        ),
        (
          bond("o", "a", 2, to: "a"),
          gap("a", "b"),
          bond("b", "c", 1),
          bond("c", "d", 2, to: "c"),
        ),
      ),
      $C_l^((1))$,
    )
  $

  The extended Dynkin diagram for $G_2$ is of the form
  #grid(
    columns: (1fr, auto, 1fr),
    align: (center, center + horizon, right + horizon),
    [],
    dynkin(
      (
        a: v(0, 0),
        b: v(1, 0),
        o: v(2, 0, label: $alpha_0$, at: "right"),
      ),
      (bond("a", "b", 3, to: "a"), bond("b", "o", 1)),
    ),
    $G_2^((1)).$,
  )] <exm:extended-dynkin-diagrams-classical>

#example[Reversing orientation of multiple edges in the diagrams $B_l^((1))$,
  $C_l^((1))$, $G_2^((1))$ (i.e. passing to the dual root system,
  Problem~@pr:dual-system-reverses-arrows) we get the following connected Dynkin
  diagrams (the first two have $l + 1$ vertices):
  $
    #grid(
      columns: 2,
      column-gutter: 2.5em,
      row-gutter: 1.2em,
      align: left + horizon,
      $A_(2l-1)^((2)), l >= 3$,
      dynkin(
        (
          o: v(0, 0.5),
          a: v(0, -0.5),
          b: v(1, 0),
          c: v(2, 0),
          d: v(4, 0),
          e: v(5, 0),
        ),
        (
          bond("o", "b", 1),
          bond("a", "b", 1),
          bond("b", "c", 1),
          gap("c", "d"),
          bond("d", "e", 2, to: "d"),
        ),
      ),

      $D_(l+1)^((2)), l >= 2$,
      dynkin(
        (
          a: v(0, 0),
          b: v(1, 0),
          c: v(2, 0),
          d: v(4, 0),
          e: v(5, 0),
          f: v(6, 0),
        ),
        (
          bond("a", "b", 2, to: "a"),
          bond("b", "c", 1),
          gap("c", "d"),
          bond("d", "e", 1),
          bond("e", "f", 2, to: "f"),
        ),
      ),

      $D_4^((3))$,
      dynkin(
        (a: v(0, 0), b: v(1, 0), c: v(2, 0)),
        (bond("a", "b", 1), bond("b", "c", 3, to: "b")),
      ),
    )
  $
  #source(182)It is easy to verify that these diagrams also correspond to
  admissible systems of vectors obtained from the bases $Pi$ of root systems
  $Delta$ of types $C_l$, $B_l$, $G_2$ by adjoining the roots
  $-(epsilon_1 + epsilon_2)$, $-epsilon_1$, $-(2 alpha_1 + alpha_2)$
  respectively (in notation of
  Examples~@exm:simple-roots-of-classical-algebras[] and
  @exm:bases-of-rank-two-systems[] of @ss:weyl-chambers-and-simple-roots). The
  adjoined root is the smallest of the roots of the minimal length in $Delta$.
  The left-end vertex of the Dynkin diagram corresponds to it (for
  $A_(2l-1)^((2))$ any of the two left-end
  vertices).] <exm:dual-extended-dynkin-diagrams>

#example[Adjoining the vector $-2 epsilon_1$ to the base of the root system of
  type $B_l$ we also get a linearly dependent admissible system of vectors. Its
  Dynkin diagram is of the form
  $
    #grid(
      columns: 2,
      column-gutter: 2.5em,
      align: left + horizon,
      $A_(2l)^((2)), l >= 2$,
      dynkin(
        (
          a: v(0, 0),
          b: v(1, 0),
          c: v(2, 0),
          d: v(4, 0),
          e: v(5, 0),
          f: v(6, 0),
        ),
        (
          bond("a", "b", 2, to: "b"),
          bond("b", "c", 1),
          gap("c", "d"),
          bond("d", "e", 1),
          bond("e", "f", 2, to: "f"),
        ),
      ),
    )
  $
  and the adjoined vector corresponds to the left-end vertex of the
  diagram.] <exm:affine-diagram-a2l-twisted>

=== Cartan Matrices <ss:cartan-matrices>
Here we will find out which matrices might serve as matrices of admissible
systems of vectors. Clearly, the matrix $A(Gamma) = (a_(i j))$ of an admissible
system of vectors $Gamma = {gamma_1, ..., gamma_s}$ has the following
properties:

1) $a_(i i) = 2$ ($i = 1, ..., s$);

2) if $i != j$ then $a_(i j) <= 0$ and if $a_(i j) = 0$ then $a_(j i) = 0$;

3) $a_(i j) in ZZ$ and $m_(i j) = a_(i j) a_(j i) = 0, 1, 2, 3$ or 4.

Together with $A(Gamma)$ we will also consider the matrix
$G(Gamma) = (g_(i j))$, where $g_(i j) = cos theta_(i j)$ and $theta_(i j)$ is
the angle between $gamma_i$ and $gamma_j$. This is the Gram matrix of the
normalized system of vectors $gamma_1 \/ abs(gamma_1)$, ...,
$gamma_s \/ abs(gamma_s)$.

#problem[The elements of $G(Gamma)$ are of the form
  $
    g_(i i) = 1 thin (i = 1, ..., s), wide
    g_(i j) = -1/2 sqrt(m_(i j)) thin (i != j).
  $ <eq:normalized-gram-matrix-entries>] <pr:normalized-gram-matrix>

Therefore we have one more property of $A(Gamma)$:

4) a symmetric matrix $(g_(i j))$ whose elements are defined by
formulas~@eq:normalized-gram-matrix-entries is positive semi-definite, i.e.
determines a positive semi-definite quadratic form.

A square matrix $A = (a_(i j))$ is #idx("matrix", "admissible")_admissible_ if
it satisfies 1)--4). An admissible matrix is called a #idx(
  "Cartan matrix",
)_Cartan matrix_ if the corresponding matrix $(g_(i j)) = G(A)$ is positive
definite (which is equivalent to its invertibility) and an #idx(
  "Cartan matrix",
  "affine",
)_affine Cartan matrix_ if $G(A)$ is singular.

The above makes it clear that the matrix $A(Gamma)$ of a linearly independent
admissible system of vectors $Gamma$ is a Cartan matrix and the matrix of a
linearly dependent admissible system of vectors is an affine Cartan matrix. In
particular, the Cartan matrix $A(Pi)$, where $Pi$ is a base of $Delta$,
corresponds to any root system $Delta$, and if $Delta$ is indecomposable the
affine Cartan matrix $A(tilde(Pi))$ corresponds to it.

Notice that to any admissible matrix $A = (a_(i j))$ we may assign the Dynkin
diagram which uniquely determines the matrix up to the same permutation of rows
and columns. In this correspondence the vertices of the diagram correspond to
the columns of $A$ and the edges are constructed by the rules 2), 3) given in
@ss:dynkin-diagrams.

#source(183)Clearly, if $A$ is an admissible matrix then so is $A^T$ and
$G(A) = G(A^T)$ while the Dynkin diagram for $A^T$ is obtained from the Dynkin
diagram for $A$ by reversion of the orientation of the edges. If $A = A(Gamma)$,
where $Gamma$ is an admissible system of vectors, then $A^T = A(Gamma^or)$ (see
Problem~@pr:dual-system-reverses-arrows). A principal submatrix of an admissible
matrix $A$ is obviously admissible; a subdiagram of the Dynkin diagram of $A$
corresponds to it.

We say that the matrix $A$ is #idx(
  "matrix",
  "admissible",
  "decomposable",
)_decomposable into the direct sum_ of $A_1$ and $A_2$ if there exists a
permutation of rows and the same permutation of columns that reduces $A$ to the
form $mat(A_1, 0; 0, A_2)$; and $A$ is #idx(
  "matrix",
  "admissible",
  "indecomposable",
)_indecomposable_ otherwise. Clearly, any matrix uniquely presents as the direct
sum of indecomposable matrices (we assume that the matrices are considered up to
the same permutation of rows and columns). A splitting of the Dynkin diagram
into the union of its connected components corresponds to this decomposition, if
the matrix is admissible.

Now we will prove that any admissible matrix is a matrix of an admissible system
of vectors.

#problem[Any positive semi-definite symmetric matrix $G$ of order $l$ is the
  Gram matrix of a system of $l$ vectors of a Euclidean space. The rank of this
  system of vectors equals $rk G$.] <pr:semidefinite-matrix-is-gram>

#problem[Let the Dynkin diagram of an admissible matrix $A$ not contain cycles
  and let $u_1$, ..., $u_l$ be a system of vectors of a Euclidean space
  $bold(E)$ whose Gram matrix is $G(A)$. Then there exist $p_i > 0$
  ($i = 1, ..., l$) such that $A$ is the matrix of the system
  $gamma_1 = p_1 u_1, ..., gamma_l = p_l u_l$ and $(gamma_i, gamma_j) in QQ$ for
  all $i, j$.] <pr:acyclic-admissible-matrix-realized>

Before we consider the case when the Dynkin diagram contains a cycle, let us
make the following remark. If $B$ is a principal submatrix of $A$, then $G(B)$
is a principal submatrix of $G(A)$. Therefore if $A$ is a Cartan matrix then so
is $B$. Furthermore, if $A$ is an indecomposable affine Cartan matrix then
applying Problem~@pr:nonacute-system-positive-relation to the system of vectors
whose Gram matrix is $G(A)$ we see that any proper principal submatrix of $A$ is
a Cartan matrix.

#problem[If the Dynkin diagram of an indecomposable admissible matrix $A$
  contains a cycle then $A = A(tilde(Pi))$, where $tilde(Pi)$ is the extended
  system of simple roots of $frak(s l)_(l+1) (CC)$, $l >= 2$, and the Dynkin
  diagram is of the type $A_l^((1))$ (see
  Example~@exm:extended-dynkin-diagrams-classical[] of
  @ss:dynkin-diagrams).] <pr:cyclic-diagram-is-affine-a>

Problems~@pr:acyclic-admissible-matrix-realized and
@pr:cyclic-diagram-is-affine-a immediately imply

#theorem[Any admissible matrix $A$ is the matrix of an admissible system of
  vectors $Gamma = {gamma_1, ..., gamma_l}$ of a Euclidean space such that
  $(gamma_i, gamma_j) in QQ$ for all $i, j$.] <th:admissible-matrix-realized>

#corollary[If $A$ is an admissible matrix of order $l$ then $det A >= 0$ and $A$
  is a Cartan matrix if and only if $det A > 0$.]

Notice also the following fact.

#problem[If the Dynkin diagram of an indecomposable admissible matrix $A$
  contains an edge of multiplicity 4 then $A$ is an affine $2 times 2$ Cartan
  matrix.] <pr:quadruple-edge-affine-rank-1>

=== Classification <ss:classification-root-systems>
#source(184)In this section we will classify (up to an isomorphism) all
admissible systems of vectors. With Theorem~@th:root-system-determined-by-base
this implies the classification of root systems.

As follows from Theorem~@th:admissible-matrix-realized the classification of
admissible systems of vectors is equivalent to the classification of admissible
matrices or of Dynkin diagrams corresponding to these matrices. It suffices to
list all the indecomposable admissible systems, i.e. connected Dynkin diagrams.
For brevity we will call the Dynkin diagram of a Cartan matrix a #idx(
  "Dynkin diagram",
)_Dynkin diagram_ and the Dynkin diagram of an affine Cartan matrix an #idx(
  "Dynkin diagram",
  "affine",
)_affine Dynkin diagram._ The #idx("rank of a Dynkin diagram")_rank_ of a
diagram is the rank of the corresponding admissible system of vectors (or the
admissible matrix). For a Dynkin diagram the rank equals the number of its
vertices and for a connected affine Dynkin diagram it equals the number of its
vertices minus 1 (see Problem~@pr:nonacute-system-positive-relation).

Each connected Dynkin diagram is denoted by a symbol of the form $L_l$, where
$L$ is a Latin capital and $l$ is the rank of the diagram. This notation will be
introduced during the classification. We already know the following connected
Dynkin diagrams: $A_l$ ($l >= 1$), $B_l$ ($l >= 1$), $C_l$ ($l >= 1$), $D_l$
($l >= 3$), $G_2$ (see @ss:dynkin-diagrams,
Examples~@exm:low-rank-dynkin-diagrams[], @exm:classical-dynkin-diagrams[]). The
Dynkin diagrams of the first four series are called #idx(
  "Dynkin diagram",
  "classical",
)_classical_; they correspond to the classical complex Lie groups
$SL_(l+1) (CC)$, $SO_(2l+1) (CC)$, $Sp_(2l) (CC)$, $SO_(2l) (CC)$ respectively.

$G_2$ is the first example of a nonclassical Dynkin diagram. Note that
$A_1 = B_1 = C_1$, $B_2 = C_2$, $A_3 = D_3$.

Each of the listed above Dynkin diagrams $L_l$ can be extended to a connected
affine Dynkin diagram $L_l^((1))$ of rank $l$ by adjoining one vertex (see
@ss:dynkin-diagrams, Example~@exm:extended-dynkin-diagrams-classical[]). Other
connected affine Dynkin diagrams are listed in
Examples~@exm:dual-extended-dynkin-diagrams[], @exm:affine-diagram-a2l-twisted[]
of @ss:dynkin-diagrams. Notice that the connected affine Dynkin diagrams are
denoted by the symbols $L_l^((k))$, where $k = 1, 2, 3$ and $l$ coincides with
the rank of the system if $k = 1$ but does not coincide with the rank for
$k > 1$. The meaning of this notation will be explained in
§~@sec:semisimple-algebra-automorphisms.

Notice the following properties of Dynkin diagrams which are consequences of
Problems~@pr:cyclic-diagram-is-affine-a, @pr:quadruple-edge-affine-rank-1 and
Remarks in @ss:cartan-matrices:

(D1) Any subdiagram of a Dynkin diagram is a Dynkin diagram.

(D2) A diagram obtained from a Dynkin diagram (or an affine Dynkin diagram) by
reversing orientation of all its edges is a Dynkin diagram (affine Dynkin
diagram).

(D3) The multiplicity of an edge of a Dynkin diagram equals 1, 2 or 3.

(D4) A Dynkin diagram does not contain cycles.

(D5) An affine Dynkin diagram is not a Dynkin diagram and vice versa.

(D6) Any proper subdiagram of a connected affine Dynkin diagram is a Dynkin
diagram.

(D7) The multiplicity of an edge of a connected affine Dynkin diagram of rank
$> 1$ equals 1, 2 or 3.

(D8) The diagrams $A_l^((1))$ ($l >= 2$) are the only affine Dynkin diagrams
with cycles.

#problem[The only connected Dynkin diagrams of rank 1 and 2 are $A_1$, $A_2$,
  $B_2$, $G_2$. #source(185)The only connected affine Dynkin diagrams of rank 1
  are the following ones:
  $
    #grid(
      columns: 4,
      column-gutter: (1.5em, 4em, 1.5em),
      align: horizon,
      $A_1^((1)):$,
      dynkin((a: v(0, 0), b: v(1, 0)), (bond("a", "b", 4),)),
      $A_2^((2)):$,
      dynkin((a: v(0, 0), b: v(1, 0)), (bond("a", "b", 4, to: "b"),)),
    )
  $] <pr:dynkin-diagrams-rank-one-two>

The following proposition describes all the three-vertex diagrams we are
interested in:

#proposition[Any connected Dynkin diagram of rank 3 is one of the diagrams
  $A_3$, $B_3$ or $C_3$. Any connected affine Dynkin diagram of rank 2 is one of
  the diagrams $A_2^((1))$, $C_2^((1))$, $D_3^((2))$, $A_4^((2))$, $G_2^((1))$,
  $D_4^((3))$.] <prop:dynkin-diagrams-rank-three>

#proof[By Problem~@pr:semidefinite-matrix-is-gram a linearly independent system
  of vectors $u_1$, $u_2$, $u_3$ in the three-dimensional Euclidean space $E^3$
  whose Gram matrix is $G(A)$ corresponds to a Dynkin diagram of rank 3 (or to a
  $3 times 3$ Cartan matrix $A$). The angles between these vectors are
  $theta_(i j) = pi - pi\/n_(i j)$, where the values of $n_12$, $n_13$, $n_23$
  can be only 2, 3, 4, 6. The planes orthogonal to $u_i$ cut out a trihedron
  whose dihedral angles are $pi\/n_12$, $pi\/n_13$, $pi\/n_23$. Notice that the
  dihedral angles of a trihedron are the angles of a spherical triangle and the
  latter exists only if the sum of its angles is greater than $pi$. Therefore
  $1\/n_12 + 1\/n_13 + 1\/n_23 > 1$. Only the following two sets of $n_(i j)$'s
  satisfy this inequality (under the assumption of indecomposability):
  ${2, 3, 3}$ and ${2, 3, 4}$. The corresponding sets of $m_(i j)$'s are
  ${0, 1, 1}$ and ${0, 1, 2}$. The Cartan matrices with such numbers $m_(i j)$
  correspond to the root systems $A_3$, $B_3$, $C_3$.

  Similarly, a connected affine Dynkin diagram of rank 2 determines a rank 2
  system of vectors $u_1$, $u_2$, $u_3$ in $bold(E)^3$. The sum of the angles
  $theta_(i j) = pi - pi\/n_(i j)$ between $u_1$, $u_2$, $u_3$ is $2 pi$
  implying $1\/n_12 + 1\/n_13 + 1\/n_23 = 1$. Only the following sets of
  $n_(i j)$'s satisfy this equation: ${3, 3, 3}$, ${2, 4, 4}$, ${2, 3, 6}$. The
  corresponding sets of $m_(i j)$'s are ${1, 1, 1}$, ${0, 2, 2}$, ${0, 1, 3}$.
  All affine Dynkin diagrams with such $m_(i j)$'s are listed in the statement
  of Proposition.]

Proposition~@prop:dynkin-diagrams-rank-three and (D1), (D3), (D6) imply

#corollary[A connected (affine) Dynkin diagram of rank $>= 3$ contains only the
  edges of multiplicity 1 and 2.]

#problem[The sum of multiplicities of the edges that originate at a vertex of a
  connected Dynkin diagram of rank $>= 3$ does not exceed 3. The same applies
  for the connected affine Dynkin diagrams of rank $>= 3$ if we exclude the
  diagrams $B_3^((1))$, $A_5^((2))$,
  $D_4^((1))$.] <pr:vertex-degree-at-most-three>

A vertex of a diagram connected with more than two vertices is called a #idx(
  "branch vertex",
)_branch vertex_ and a vertex connected with exactly three vertices by edges of
multiplicity 1 a #idx("branch vertex", "simple")_simple branch vertex._ It
follows from Problem~@pr:vertex-degree-at-most-three that a branch vertex of a
Dynkin diagram is always simple. The same applies to the connected affine Dynkin
diagrams except $D_4^((1))$, $B_3^((1))$, $A_5^((2))$.

The branch vertices and multiple edges of a diagram will be called its
_singularities._

#problem[#source(186)A connected Dynkin diagram may possess no more than one
  singularity. The only connected affine Dynkin diagrams with at least two
  singularities are the diagrams $B_l^((1))$ ($l >= 3$), $C_l^((1))$ ($l >= 2$),
  $D_l^((1))$ ($l >= 5$), $D_(l+1)^((2))$ ($l >= 2$), $A_(2l)^((2))$ ($l >= 2$),
  $A_(2l-1)^((2))$ ($l >= 3$).] <pr:at-most-one-singularity>

It easily follows from (D4) that the connected Dynkin diagrams without
singularities are the diagrams $A_l$, $l >= 1$. Similarly, properties (D8) and
(D5) imply that the connected affine Dynkin diagrams without singularities are
the diagrams $A_l^((1))$, $l >= 2$. By Problem~@pr:at-most-one-singularity it
only remains to list the diagrams containing exactly one singularity. We may
assume that the rank of the diagram is $>= 3$ and the singularity is either a
simple branch vertex or an edge of multiplicity 2 (see Corollary of
Proposition~@prop:dynkin-diagrams-rank-three).

A connected Dynkin diagram of rank $>= 3$ with a singularity different from
$B_l$, $C_l$, $D_l$ should contain a subdiagram of the form
$
  #grid(
    columns: 3,
    column-gutter: 4em,
    align: horizon,
    dynkin(
      (a: v(0, 0), b: v(1, 0), c: v(2, 0), d: v(3, 0), e: v(4, 0), f: v(2, -1)),
      (
        bond("a", "b", 1),
        bond("b", "c", 1),
        bond("c", "d", 1),
        bond("d", "e", 1),
        bond("c", "f", 1),
      ),
    ),
    "or",
    dynkin((a: v(0, 0), b: v(1, 0), c: v(2, 0), d: v(3, 0)), (
      bond("a", "b", 1),
      bond("b", "c", 2, to: "b"),
      bond("c", "d", 1),
    )),
  )
$
The same applies to any connected affine Dynkin diagram of rank $>= 3$ with
exactly one singularity which is either a simple branch vertex or a double edge.
Consider the following diagrams with $l$ vertices which for the indicated values
of $l$ are not classical Dynkin diagrams:
$
  #grid(
    columns: 2,
    column-gutter: 3em,
    row-gutter: 1.2em,
    align: left + horizon,
    $E_l, l >= 6:$,
    dynkin(
      (
        a: v(0, 0),
        b: v(1, 0),
        c: v(2, 0),
        d: v(3, 0),
        e: v(5, 0),
        f: v(6, 0),
        p: v(2, -1),
      ),
      (
        bond("a", "b", 1),
        bond("b", "c", 1),
        bond("c", "d", 1),
        gap("d", "e"),
        bond("e", "f", 1),
        bond("c", "p", 1),
      ),
    ),

    $F_l, l >= 4:$,
    dynkin(
      (a: v(0, 0), b: v(1, 0), c: v(2, 0), d: v(3, 0), e: v(5, 0), f: v(6, 0)),
      (
        bond("a", "b", 1),
        bond("b", "c", 2, to: "b"),
        bond("c", "d", 1),
        gap("d", "e"),
        bond("e", "f", 1),
      ),
    ),

    $F_l^or, l >= 4:$,
    dynkin(
      (a: v(0, 0), b: v(1, 0), c: v(2, 0), d: v(3, 0), e: v(5, 0), f: v(6, 0)),
      (
        bond("a", "b", 1),
        bond("b", "c", 2, to: "c"),
        bond("c", "d", 1),
        gap("d", "e"),
        bond("e", "f", 1),
      ),
    ),
  )
$
Denote by $delta(L)$ the determinant of the admissible matrix with Dynkin
diagram $L$.

#problem[$delta(E_l) = 9 - l$, $delta(F_l) = delta(F_l^or) = 5 - l$. The diagram
  $E_l$ is a Dynkin diagram for $l = 6, 7, 8$, $F_l$ and $F_l^or$ are Dynkin
  diagrams for $l = 4$ and $F_4 = F_4^or$. The diagrams $E_9 = E_8^((1))$,
  $F_5 = F_4^((1))$, $F_5^or = E_6^((2))$, are connected affine Dynkin
  diagrams.] <pr:determinants-e-f-diagrams>

#problem[The diagrams $E_6$ and $E_7$ are subdiagrams of the following connected
  affine Dynkin diagrams
  $
    #grid(
      columns: 2,
      column-gutter: 3em,
      row-gutter: 1.5em,
      align: (left + top, left + top),
      $E_6^((1)):$,
      dynkin(
        (
          a: v(0, 0),
          b: v(1, 0),
          c: v(2, 0),
          d: v(3, 0),
          e: v(4, 0),
          f: v(2, -1),
          g: v(2, -2),
        ),
        (
          bond("a", "b", 1),
          bond("b", "c", 1),
          bond("c", "d", 1),
          bond("d", "e", 1),
          bond("c", "f", 1),
          bond("f", "g", 1),
        ),
      ),

      $E_7^((1)):$,
      dynkin(
        (
          a: v(0, 0),
          b: v(1, 0),
          c: v(2, 0),
          d: v(3, 0),
          e: v(4, 0),
          f: v(5, 0),
          g: v(6, 0),
          p: v(3, -1),
        ),
        (
          bond("a", "b", 1),
          bond("b", "c", 1),
          bond("c", "d", 1),
          bond("d", "e", 1),
          bond("e", "f", 1),
          bond("f", "g", 1),
          bond("d", "p", 1),
        ),
      ),
    )
  $] <pr:affine-diagrams-e6-e7>

#problem[#source(187)Any nonclassical connected Dynkin diagram of rank $>= 3$ is
  one of the diagrams $E_6$, $E_7$, $E_8$, $F_4$. Any connected affine Dynkin
  diagram with one singularity which is a simple branch vertex or a double edge
  is one of the diagrams $E_6^((1))$, $E_7^((1))$, $E_8^((1))$, $F_4^((1))$,
  $E_6^((2))$.] <pr:nonclassical-diagrams-are-e-f>

Let us summarize the obtained results.

#theorem[The connected Dynkin diagrams are exhausted by the diagrams $A_l$
  ($l >= 1$), $B_l$ ($l >= 1$), $C_l$ ($l >= 1$), $D_l$ ($l >= 3$), $E_l$
  ($l = 6, 7, 8$), $F_4$, $G_2$ (see Table~@tab:weights-and-roots). The
  connected affine Dynkin diagrams are exhausted by the diagrams $L_l^((1))$
  where $L_l$ is a connected Dynkin diagram of rank $l$ and the diagrams
  $A_(2l-1)^((2))$ ($l >= 3$), $A_(2l)^((2))$ ($l >= 1$), $D_(l+1)^((2))$
  ($l >= 2$), $E_6^((2))$, $D_4^((3))$ (see
  Table~@tab:affine-dynkin-diagrams).] <th:classification-dynkin-diagrams>

The Dynkin diagrams $E_6$, $E_7$, $E_8$, $F_4$ and $G_2$ are called #idx(
  "Dynkin diagram",
  "exceptional",
)_exceptional._ We have not decided yet if the first 4 of them are the Dynkin
diagrams of some reduced root systems. One can show that this is actually so
e.g. by explicitly constructing the corresponding root systems (in
§~@sec:existence-uniqueness-theorems we give another proof making use of Lie
algebras).

#problem[The systems of vectors of the types $E_6$, $E_7$, $E_8$, $F_4$ given in
  Table~@tab:weights-and-roots are the reduced root systems with the Dynkin
  diagrams $E_6$, $E_7$, $E_8$, $F_4$, respectively. Their extended Dynkin
  diagrams coincide with the diagrams $E_6^((1))$, $E_7^((1))$, $E_8^((1))$,
  $F_4^((1))$.] <pr:exceptional-root-systems-exist>

As a result of the classification of reduced root systems we get the following
theorem.

#theorem[The indecomposable reduced root systems are exhausted up to an
  isomorphism by the systems of the types $A_l$ ($l >= 1$), $B_l$ ($l >= 2$),
  $C_l$ ($l >= 3$), $D_l$ ($l >= 4$), $E_6$, $E_7$, $E_8$, $F_4$, $G_2$ of
  Table~@tab:weights-and-roots.] <th:classification-reduced-root-systems>

Now list the nonreduced indecomposable root systems.

#problem[If $Delta$ is an arbitrary root system then
  $Delta_0 = {alpha in Delta: 1/2 alpha in.not Delta}$ is a reduced root system,
  indecomposable if and only if so is $Delta$. The root systems $Delta$ and
  $Delta_0$ have the same Weyl chambers, the same bases and the same Weyl
  groups.] <pr:indivisible-roots-reduced-system>

#problem[If $Delta$ is a nonreduced indecomposable root system then $Delta_0$ is
  of type $B_l$.] <pr:nonreduced-indivisible-type-b>

#problem[Prove the following theorem:] <pr:prove-nonreduced-systems-bc>

#theorem[The only indecomposable nonreduced root system of rank $l$ is the root
  system of type $B C_l$ ($l >= 1$), the union of the systems $B_l$ and $C_l$
  (see Table~@tab:weights-and-roots).] <th:nonreduced-root-systems-bc>

=== Root and Weight Lattices <ss:root-and-weight-lattices>
Let $V$ be a finite-dimensional vector space over $RR$. As we know (see
Problem~@pr:discrete-subgroups-real-vector-space), any discrete subgroup of the
vector group $V$ is a free abelian subgroup whose basis is a linearly
independent system of vectors. Such subgroups of $V$ will be called #idx(
  "lattice",
)_lattices._

Let $Gamma$ be a lattice in $V$ such that $V = chevron.l Gamma chevron.r$. Then
the subgroup of $V^*$
$ Gamma^* = {lambda in V^*: lambda(x) in ZZ "for all" x in Gamma} $
#source(188)is also a lattice and generates $V^*$. Indeed, let $e_1$, ..., $e_n$
be a basis of $Gamma$; by the definition this basis is a basis of $V$. In $V^*$,
consider the dual basis $e_1^*, ..., e_n^*$ given by the formulas
$e_i^* (e_j) = delta_(i j)$. Then, clearly, $e_1^*, ..., e_n^*$ is a basis of
$Gamma^*$. The lattice $Gamma^*$ is naturally identified with the group
$Hom(Gamma, ZZ)$; it is called the #idx("lattice", "dual")_dual lattice_ of
$Gamma$. If we naturally identify $V$ with $(V^*)^*$, then $Gamma$ is identified
with $(Gamma^*)^*$.

Let $Gamma subset tilde(Gamma)$ be two lattices in $V$. Then
$tilde(Gamma)\/Gamma$ is a finitely generated abelian group which can be
described as follows. Consider a basis $gamma_1, ..., gamma_l$ of $Gamma$ and a
basis $tilde(gamma)_1$, ..., $tilde(gamma)_m$ of $tilde(Gamma)$. Then
$
  gamma_i = sum_(1 <= j <= m) c_(j i) tilde(gamma)_j wide (i = 1, ..., l),
$
where $C = (c_(i j))$ is a matrix with integer entries. It is known (see
[@bib:Bourbaki1968]) that
$
  tilde(Gamma)\/Gamma tilde.eq plus.o.big_(1 <= i <= s) ZZ_(m_i)
  plus.o ZZ^(m-l),
$
where $m_1|m_2|...|m_s$ are the invariant factors of $C$ different from 0 and 1.
In particular, if $l = m$ then $tilde(Gamma)\/Gamma$ is finite and
$ abs(tilde(Gamma)\/Gamma) = abs(det C). $

#problem[If $Gamma subset tilde(Gamma)$ are lattices in
  $V = chevron.l Gamma chevron.r = chevron.l tilde(Gamma) chevron.r$ then
  $tilde(Gamma)^* subset Gamma^*$ and
  $tilde(Gamma)\/Gamma tilde.eq Gamma^* \/ tilde(Gamma)^*$.]
<pr:dual-lattice-quotients>

Let $Delta$ be a root system in a Euclidean space $bold(E)$. Denote by $Q$ the
additive subgroup of $bold(E)$ generated by $Delta$. If $Pi$ is an arbitrary
base of $Delta$ then $Pi$ is a basis of the abelian group $Q$. Therefore $Q$ is
the lattice with basis $Pi$. It is called the #idx("lattice", "root")#idx(
  "root lattice",
)_root lattice._

Further, let $bold(E) = chevron.l Delta chevron.r$ and set
$
  P = {gamma in E: chevron.l gamma|alpha chevron.r in ZZ wide "for all"
    quad alpha in Delta}.
$
Let $Pi = {alpha_1, ..., alpha_l}$. Determine $pi_i in P$ by the formula
$ chevron.l pi_i|alpha_j chevron.r = delta_(i j). $
Clearly, $P$ is a lattice with basis $pi_1$, ..., $pi_l$; this lattice is called
the #idx("lattice", "weight")#idx("weight lattice")_weight lattice_ and its
elements are called #idx("weight")_weights._ The weights $pi_1$, ..., $pi_l$ are
called #idx("weight", "fundamental")_fundamental weights_ (with respect to
$Pi$). Simple roots are expressed in terms of fundamental weights by formula
$
  alpha_i = sum_(1 <= j <= l) a_(i j) pi_j,
$ <eq:simple-roots-via-fundamental-weights>
where $A = (a_(i j))$ is the Cartan matrix of $Delta$.

#problem[The lattices $Q$ and $P$ are invariant with respect to the Weyl group
  $W^or$.] <pr:root-weight-lattices-weyl-invariant>

#source(189)The definition of a root system implies that $Q subset P$. The group
$pi(Delta) = P\/Q$ is called the #idx(
  "Group",
  "fundamental (of a root system)",
)_fundamental group_ of $Delta$.

#problem[The fundamental group $pi(Delta)$ is isomorphic to
  $plus.o.big_(1 <= i <= s) ZZ_(m_i)$, where $m_i$ are the invariant factors of
  the Cartan matrix $A$ of $Delta$ different from 1. In particular,
  $ abs(pi(Delta)) = det A. $] <pr:fundamental-group-cartan-determinant>

In Table~@tab:centers-outer-automorphisms are listed the fundamental groups
$pi(Delta)$ of all indecomposable reduced root systems $Delta$ calculated with
the help of Problem~@pr:fundamental-group-cartan-determinant. Notice that
$pi(Delta)$ is a cyclic group in all cases except when $Delta$ is of the type
$D_(2s)$, $s >= 2$.

Consider also the dual root system $Delta^or subset bold(F) = bold(E)^*$. The
root and weight lattices $Q^or subset P^or$ in the space $bold(F)$ correspond to
it. By Problem~@pr:root-weight-lattices-weyl-invariant they are invariant with
respect to the Weyl group $W = (W^or)^or$.

#problem[$Q^or = P^*$, $P^or = Q^*$,
  $pi(Delta^or) tilde.eq pi(Delta)$.] <pr:dual-root-weight-lattices>

By Problem~@pr:root-system-of-reductive-algebra our constructions are applicable
in the case when $Delta = Delta_G$ is a root system of a semisimple algebraic
group $G$ with respect to a maximal torus $T$. As we have seen in
@ss:weight-and-root-decompositions[°], the group $cal(X)(T)$ is identified with
a lattice in the space $bold(E) = frak(t)(RR)^*$. Its dual lattice
$cal(X)(T)^* subset frak(t)(RR)$ coincides with $frak(t)(ZZ)$.

#problem[$Q subset cal(X)(T) subset P$ and
  $Q^or subset frak(t)(ZZ) subset P^or$.] <pr:character-lattice-between-q-p>

Notice that the lattices $P$, $Q$, $P^or$, $Q^or$ are determined by the root
system $Delta_G = Delta_frak(g)$ which, as we have seen above, does not depend
on the choice of an algebraic group $G$ with tangent algebra $frak(g)$. At the
same time, $cal(X)(T)$ and $frak(t)(ZZ)$ depend, in general, not only on
$frak(g)$ but also on the global structure of $G$. In
§~@sec:existence-uniqueness-theorems we will show that a connected semisimple
algebraic group $G$ is determined up to an isomorphism by the root system
$Delta_G$ and any of the lattices $cal(X)(T)$, $frak(t)(ZZ)$.

If $rho$ is a linear representation of a semisimple Lie algebra $frak(g)$ then
$Phi_rho subset P$ (see Problem~@pr:weights-integral-on-coroots), i.e. any
weight of $rho$ is a weight in the above sense.

#exercises[
  Let $bold(E)$ be a finite dimensional Euclidean space, $upright(O)(bold(E))$
  the group of all its orthogonal transformations and $I(bold(E))$ the group of
  its isometries. If $Omega subset bold(E)$ is a finite system of nonzero
  vectors then $Aut Omega$ denotes the group of all automorphisms of $Omega$ in
  the sense of @ss:root-system-definitions. In
  Exercises~@exc:invariant-scalar-product-root-system–@exc:minus-identity-weyl-classification
  we assume that $Delta$ is a root system in $bold(E)$ and $Pi$ a fixed base of
  $Delta$. We denote the Weyl group of $Delta$ by $W$ and the Weyl group of the
  dual root system by $W^or$; the root and weight lattices are denoted by $Q$
  and $P$, respectively.

  #exercise[If $Omega$ is indecomposable then
    $Aut Omega subset upright(O)(chevron.l Omega chevron.r)$.]
  <exc:indecomposable-automorphisms-orthogonal>

  #exercise[If $Omega$ is admissible then $Aut Omega$ is isomorphic to the group
    of automorphisms of the Dynkin diagram of
    $Omega$.] <exc:admissible-system-diagram-automorphisms>

  #exercise[The scalar product in $bold(E)$ may be redefined so that in the new
    Euclidean space $tilde(bold(E))$, the system $Delta$ would become a root
    system and $Aut Delta subset upright(O)(chevron.l Delta chevron.r)$.]
  <exc:invariant-scalar-product-root-system>

  #exercise[If $alpha in Pi$ then $r_alpha$ maps
    $Delta^+ without {alpha, 2 alpha}$ into
    itself.] <exc:simple-reflection-permutes-positive>

  #exercise[Let $Delta$ be reduced and $rho = 1/2 sum_(alpha in Delta^+) alpha$.
    Then $r_beta (rho) = rho - beta$ and $chevron.l rho|beta chevron.r = 1$ for
    #source(190)all $beta in Pi$, hence $rho$ coincides with the sum
    $pi_1 + dots.c + pi_l$ of all fundamental
    weights.] <exc:half-sum-positive-roots>

  #exercise[Let $Delta$ be reduced, $w in W^or$ and $t = l(w)$ (cf.
    Problem~@pr:reduced-word-separating-hyperplanes). Then $t$ coincides with
    the number of the $alpha in Delta^+$ such that
    $w(alpha) < 0$.] <exc:length-counts-inverted-roots>

  #exercise[A root system $Delta$ is indecomposable if and only if $W$ acts
    irreducibly on
    $chevron.l Delta^or chevron.r$.] <exc:indecomposable-iff-weyl-irreducible>

  #exercise[An indecomposable reduced root system contains roots of only one or
    two different lengths and the Weyl group acts transitively on the set of all
    roots of the same length.] <exc:two-root-lengths-weyl-transitive>

  #exercise[Roots of the maximal and minimal length of an indecomposable reduced
    root system $Delta$ form two root systems $Delta_max$ and $Delta_min$ of the
    same rank as $Delta$. If $Delta$ contains roots of two different lengths
    then $Delta_max$ and $Delta_min$ are determined by the following table:

    #table(
      columns: (auto, 1fr, 1fr, auto, auto),
      align: center + horizon,
      stroke: 0.5pt,
      $Delta$, $B_l, l >= 2$, $C_l, l >= 2$, $F_4$, $G_2$,
      $Delta_max$, $D_l$, [$A_1 + dots.c + A_1$ ($l$ summands)], $D_4$, $A_2$,
      $Delta_min$, [$A_1 + dots.c + A_1$ ($l$ summands)], $D_l$, $D_4$, $A_2$,
    )

    (we denote $D_2 = A_1 + A_1$).] <exc:long-short-root-subsystems>

  #exercise[Under the conditions of Exercise~@exc:long-short-root-subsystems the
    highest root of $Delta$ belongs to $Delta_max$. In $Delta_min$ there exists
    a unique maximal element (the #idx(
      "root",
      "highest",
      "short",
    )_highest short root_).] <exc:highest-short-root>

  #exercise[The indecomposable components $(Delta^or)_i$ of the root system dual
    to $Delta$ are $(Delta_i)^or$, where the $Delta_i$ are the indecomposable
    components of $Delta$. If $Delta$ is an indecomposable root system different
    from $B_n$ and $C_n$, $n >= 3$, then $Delta^or tilde.eq Delta$. Moreover,
    $B_n^or tilde.eq C_n$.] <exc:dual-root-system-types>

  #exercise[Under the conditions of Exercise~@exc:long-short-root-subsystems
    $(Delta_max)^or = (Delta^or)_min$ and $(Delta_min)^or = (Delta^or)_max$. If
    $alpha_0$ is the highest root (with respect to $Pi$) then $alpha_0^or$ is
    the highest short root (with respect to $Pi^or$) and vice
    versa.] <exc:coroot-of-highest-root>

  #exercise[The group $W$ does not contain reflections with respect to
    hyperplanes different from $P_alpha$,
    $alpha in Delta$.] <exc:reflections-in-weyl-group>

  #exercise[If $w in W^or$ preserves $gamma in E$ then $w$ can be presented as a
    product of reflections $r_alpha$ ($alpha in Delta$) each preserving
    $gamma$.] <exc:stabilizer-generated-by-reflections>

  #exercise[$Aut Delta = W^or times.r Aut Pi$.]
  <exc:root-system-automorphisms-semidirect>

  #exercise[If $Aut Pi$ is trivial then $-e in W$. (Hint: make use of the
    opposite Weyl chamber.)] <exc:no-diagram-symmetry-minus-identity>

  #exercise[Calculate the Weyl groups $W$ of $frak(g) = frak(s o)_n (CC)$
    ($n >= 3$), $frak(s p)_(2n) (CC)$ ($n >= 1$) and compare the results with
    Table~@tab:exponents. Prove that $-e in W$ if $frak(g) = frak(s l)_2 (CC)$,
    $frak(s o)_(2n+1) (CC)$ ($n >= 1$), $frak(s o)_(4n) (CC)$ ($n >= 1$) and
    $-e in.not W$ if $frak(g) = frak(s l)_n (CC)$ ($n >= 3$) and
    $frak(g) = frak(s o)_(4n+2) (CC)$
    ($n >= 1$).] <exc:classical-weyl-groups-minus-identity>

  #exercise[Each automorphism $a in Aut Delta$ transforms the lattices $Q$ and
    $P$ into themselves and therefore induces an automorphism $tilde(a)$ of the
    group $pi(Delta)$. If $a in W^or$ then $tilde(a) = e$. This implies that if
    $-e in W$ then the order of any element of $pi(Delta)$ is
    $<= 2$.] <exc:action-on-fundamental-group>

  #exercise[#source(191)Let $Delta$ be an indecomposable reduced root system.
    Then $-e in.not W$ if $Delta$ is of the type $A_n$ ($n >= 2$), $D_(2n+1)$
    ($n >= 1$), $E_6$ and $-e in W$
    otherwise.] <exc:minus-identity-weyl-classification>

  An algebraic subgroup $P$ of a connected algebraic group $G$ is #idx(
    "subgroup",
    "parabolic",
  )_parabolic_ if $G\/P$ is a projective algebraic variety. The corresponding
  subalgebra $frak(p)$ of the tangent algebra $frak(g)$ of $G$ is also called
  #idx("subalgebra", "parabolic")_parabolic._

  #exercise[A subgroup $P subset G$ is parabolic if and only if $P$ contains a
    Borel subgroup of $G$. A parabolic subalgebra of a semisimple Lie algebra is
    regular.] <exc:parabolic-contains-borel>

  Let $G$ be a connected reductive complex algebraic group, $T$ a torus in $G$
  and $x_0 in frak(t)(RR)$. Consider the root decomposition of $frak(g)$ with
  respect to $T$ and let $H$, $N^+$, $P^+$ be the connected algebraic subgroups
  of $G$ corresponding to the algebraic subalgebras
  $frak(h) = plus.o.big_(alpha(x_0) = 0) frak(g)_alpha$,
  $frak(n)^+ = plus.o.big_(alpha(x_0) > 0) frak(g)_alpha$ and
  $frak(p)^+ = frak(h) plus.o frak(n)^+$.

  #exercise[$P^+$ is a parabolic subgroup of
    $G$.] <exc:parabolic-from-toral-element>

  #exercise[$P^+$ coincides with its normalizer; the coset space $G\/P^+$ is
    simply connected.] <exc:parabolic-self-normalizing>

  #exercise[$P^+$ is the semidirect product of the reductive subgroup $H$ and
    the unipotent normal subgroup $N^+$.] <exc:levi-decomposition-parabolic>

  #exercise[If $alpha(x_0) != 0$ for all $alpha in Delta(T)$ then
    $H = N(T) inter P^+$ and $H$ coincides with the centralizer of
    $T$.] <exc:regular-element-levi-centralizer>

  Let $T$ be a maximal torus in a connected reductive algebraic group $G$,
  $Delta_G$ the corresponding root system and $Pi subset Delta_G$ a base. Let
  $M subset Pi$ be a set of simple roots. Denote by $Delta^+ (M)$ the set
  consisting of all positive roots and the negative roots which are linearly
  expressed in terms of simple roots from $M$.

  #exercise[The subset $Delta^+ (M) subset Delta_G$ is
    closed.] <exc:parabolic-root-subset-closed>

  Set $frak(p)^((M)) = frak(g)(Delta^+ (M), frak(t))$ (see
  Exercise~@exc:closed-subset-regular-subalgebra).

  #exercise[The connected algebraic subgroup $P^((M))$ of $G$ corresponding to
    $frak(p)^((M)) subset frak(g)$ is parabolic; any parabolic subgroup is
    conjugate to a unique subgroup of this
    form.] <exc:standard-parabolic-subgroups>

  #exercise[Any parabolic subgroup of $G$ can be obtained by the method
    described just before the Exercise~@exc:parabolic-from-toral-element, where
    for $T$ one can take a maximal
    torus.] <exc:all-parabolics-from-toral-elements>

  #exercise[Let $frak(g)$ be a semisimple complex Lie algebra. Select basis
    elements $e_alpha in frak(g)_alpha$ ($alpha in Delta_frak(g)$) as in
    @ss:three-dimensional-subalgebras[°]. Set
    $h = sum_(alpha in Delta^+) h_alpha$. Then
    $h = sum_(beta in Pi) r_beta h_beta$, where $r_beta$ are positive integers.
    If
    $
      e_+ = sum_(beta in Pi) sqrt(r_beta) e_beta, wide
      e_- = sum_(beta in Pi) sqrt(r_beta) e_(-beta),
    $
    then $chevron.l h, e_+, e_- chevron.r$ is a simple three-dimensional
    subalgebra of $frak(g)$ (called the #idx(
      "subalgebra",
      "principal three-dimensional",
    )_principal three-dimensional
    subalgebra_).] <exc:principal-three-dimensional-subalgebra>

  A subsystem $Gamma$ of a root system $Delta$ is called #idx(
    "subsystem",
    "symmetric",
  )_symmetric_ if $-alpha in Gamma$ for any $alpha in Gamma$. As in
  §~@sec:semisimple-preliminaries $Gamma$ is called #idx(
    "subsystem",
    "closed",
  )_closed_ if $alpha, beta in Gamma$, $alpha + beta in Delta$ imply
  $alpha + beta in Gamma$. Exercises~@exc:closed-subset-regular-subalgebra,
  @exc:regular-subalgebra-normal-form, @exc:regular-subalgebra-reductive,
  @exc:regular-subalgebras-conjugacy determine a one-to-one correspondence
  between the classes of conjugate semisimple regular subalgebras of a
  semisimple Lie algebra $frak(g)$ and the closed symmetric subsystems of
  $Delta_frak(g)$ considered up to the action of the Weyl group.

  In Exercises~@exc:pi-system-admissible–@exc:closed-subsystems-componentwise
  $Delta$ denotes a reduced root system. A subsystem $Gamma subset Delta$ is
  called a #idx("π-system")_$pi$-system_ if $alpha - beta in.not Delta$ for any
  $alpha, beta in Gamma$. For any subsystem $M subset Delta$ denote by $[M]$ the
  set of all roots $Delta$ which are linear combinations of the roots of $M$
  with integer coefficients. Let $l$ be the rank of $Delta$, $W$ its Weyl group.

  #exercise[#source(192)Any $pi$-system is an admissible system of
    vectors.] <exc:pi-system-admissible>

  #exercise[Any symmetric closed subsystem $M subset Delta$ is a root system.
    Any base $Gamma subset M$ is a $pi$-system and $M = [Gamma]$. Conversely, if
    $Gamma subset Delta$ is a linearly independent $pi$-system then
    $M = [Gamma]$ is a symmetric closed subsystem and $Gamma$ is a base of
    $M$.] <exc:closed-subsystem-base-pi-system>

  #exercise[Linearly independent $pi$-systems $Gamma_1, Gamma_2 subset Delta$
    can be transformed into each other by an element of $W^or$ if and only if so
    can $[Gamma_1]$ and $[Gamma_2]$.] <exc:pi-systems-conjugacy>

  #exercise[Let $Gamma subset Delta$ be a linearly independent $pi$-system. Then
    the system $tilde(Gamma)$ obtained from $Gamma$ by adjoining the
    corresponding lowest roots to some of its indecomposable components is also
    a $pi$-system.] <exc:adjoin-lowest-roots-pi-system>

  #exercise[Any indecomposable $pi$-system is isomorphic either to a base or to
    an extended base of a root system.] <exc:indecomposable-pi-system-types>

  #exercise[If $Gamma subset Delta$ is indecomposable and admissible then
    $Gamma$ is a $pi$-system.] <exc:admissible-subsystem-is-pi-system>

  #exercise[Any linearly independent $pi$-system in $Delta$ is contained in a
    linearly independent $pi$-system consisting of $l$
    elements.] <exc:pi-system-extends-full-rank>

  Let $Gamma subset Delta$ be a linearly independent $pi$-system and
  $tilde(Gamma)$ a $pi$-system obtained by adjoining to an indecomposable
  component $Gamma_1$ of $Gamma$ the corresponding lowest root $alpha_0$. Set
  $Gamma' = tilde(Gamma) without {alpha}$, where $alpha in Gamma_1$. One says
  that the $pi$-system $Gamma'$ is obtained from $Gamma$ by an #idx(
    "transformation",
    "elementary",
  )_elementary transformation._

  #exercise[We have $[Gamma'] subset [Gamma]$ and these systems coincide if and
    only if $alpha$ occurs in the expression for $-alpha_0$ with
    coefficient 1.] <exc:elementary-transformation-inclusion>

  #exercise[Any linearly independent $pi$-system in $Delta$ consisting of $l$
    elements can be obtained from a base $Pi subset Delta$ by a sequence of
    elementary transformations.] <exc:pi-systems-from-base-elementary>

  #exercise[If $Delta = Delta_1 union dots.c union Delta_r$ is a decomposition
    of $Delta$ into indecomposable components then a subsystem $M subset Delta$
    is symmetric and closed if and only if $M inter Delta_i$ is a symmetric
    closed subsystem of $Delta_i$ for any
    $i = 1, ..., r$.] <exc:closed-subsystems-componentwise>

  In
  Exercises~@exc:unit-highest-root-coefficient–@exc:maximal-corank-one-subsystem
  we assume that $Delta$ is indecomposable, $Pi = {alpha_1, ..., alpha_l}$ its
  base, $alpha_0$ the lowest root, $-alpha_0 = sum_(1 <= i <= l) n_i alpha_i$,
  $tilde(Pi) = {alpha_0, alpha_1, ..., alpha_l}$.

  #exercise[We have $n_i = 1 <=> tilde(Pi) without {alpha_i}$ is a base of
    $Delta <=>$ there exists $w in W^or$ such that $w(tilde(Pi)) = tilde(Pi)$
    and $w(alpha_0) = alpha_i$.] <exc:unit-highest-root-coefficient>

  #exercise[Any maximal symmetric closed subsystem of $Delta$ is of rank $l$ or
    $l - 1$.] <exc:maximal-closed-subsystem-rank>

  #exercise[Let $Gamma subset Delta$ be a linearly independent $pi$-system
    consisting of $l$ elements. If $[Gamma]$ is a maximal closed symmetric
    subsystem of $Delta$ then $Gamma$ is obtained from a base $Pi subset Delta$
    by applying one elementary
    transformation.] <exc:maximal-subsystem-one-transformation>

  #exercise[Let $Gamma = tilde(Pi) without {alpha_i}$, where $i > 0$. A
    symmetric closed system $[Gamma]$ is maximal if and only if $n_i$ is prime.
    (Hint: see [@bib:Goto1978], §~8.3.)] <exc:borel-de-siebenthal-prime>

  #exercise[Let $Gamma subset Delta$ be a linearly independent $pi$-system of
    $l - 1$ elements. A symmetric closed subsystem $[Gamma]$ is maximal if and
    only if $Gamma = Pi without {alpha_i}$, where $Pi$ is a base of $Delta$ and
    $n_i = 1$.] <exc:maximal-corank-one-subsystem>
]

#hints[
  #hint[@pr:proportional-roots-in-root-system][Similar to
    Problem~@pr:proportional-roots-in-lie-algebra.]

  #hint[@pr:indecomposable-iff-simple-algebra][Make use of
    Problems~@pr:roots-of-direct-sum-algebra,
    @pr:orthogonal-roots-split-algebra.]

  #hint[@pr:root-sum-difference-criterion][#source(193)Let $(alpha, beta) > 0$.
    By Problem~@pr:root-angles-and-length-ratios we may assume that
    $chevron.l alpha|beta chevron.r = 1$ which, thanks to
    Problem~@pr:root-reflection-formula, implies
    $alpha - beta = r_beta (alpha) in Delta$.]

  #hint[@pr:alpha-string-in-root-system][Let $p$, $q$ be the maximal nonnegative
    integers such that $beta - p alpha, beta + q alpha in Delta$.
    Problem~@pr:root-sum-difference-criterion implies that the $alpha$-string
    through $beta$ has no gaps (i.e. $beta + k alpha in Delta$ for all $k$,
    $-p <= k <= q$). Since the $alpha$-string is invariant with respect to
    $r_alpha$ (and therefore $r_alpha (beta + q alpha) = beta - p alpha$), then
    $p - q = chevron.l beta|alpha chevron.r$.]

  #hint[@pr:dual-root-system][Make use of formula~@eq:coroot-cartan-integers. In
    particular, prove that
    $
      (r_alpha (beta))^or = r_(alpha^or) (beta^or) wide
      (alpha, beta in Delta).
    $]

  #hint[@pr:simple-roots-obtuse][Consider the cases $alpha - beta in Delta^+$
    and $alpha - beta in Delta^-$ and apply
    Problem~@pr:root-sum-difference-criterion.]

  #hint[@pr:nonacute-vectors-independent][Set
    $v = a_1 v_(i_1) + dots.c + a_k v_(i_k)
    = b_1 v_(j_1) + dots.c + b_l v_(j_l)$. Considering $(v, v)$ we derive from
    $(v_(i_p), v_(j_q)) <= 0$ that $v = 0$ and $(v_(i_p), v_(j_q)) = 0$ for all
    $p$, $q$. Let $u$ be a vector such that $(u, v_i) > 0$ ($i = 1, ..., s$).
    Then $(u, v) = 0$ implies $a_p = b_q = 0$ for all $p$, $q$.]

  #hint[@pr:chamber-from-simple-roots][Let
    $C_1 = {x in F: alpha(x) > 0 "for all" alpha in Pi(C)}$. Clearly,
    $C subset C_1$. But $C_1 subset F_"reg"$ and $C_1$ is convex and therefore
    connected, hence $C = C_1$.]

  #hint[@pr:base-determines-chamber][By
    Problem~@pr:independent-functionals-positive-point $C$ is a nonempty
    connected subset of $F_"reg"$. Therefore $C subset C_1$, where $C_1$ is a
    Weyl chamber. Clearly, the set $Delta^+$ of positive (with respect to $Pi$)
    roots coincides with the set of $C_1$-positive roots implying
    $Pi subset Pi(C_1)$. Therefore $Pi = Pi(C_1)$ and by
    Problem~@pr:chamber-from-simple-roots $C = C_1$.]

  #hint[@pr:walls-of-weyl-chamber][Let $x in F$ be such that $alpha(x) >= 0$ for
    all $alpha in Pi(C)$. If we fix $x_0 in C$ then
    Problem~@pr:chamber-from-simple-roots implies that $x + (x_0 \/ n) in C$ for
    all $n = 1, 2, ...$. Therefore $x in overline(C)$. Applying
    Problem~@pr:independent-functionals-positive-point to the restrictions of
    linear forms of $Pi(C) without {alpha}$ onto the hyperplane $P_alpha$ for
    some $alpha in Pi(C)$, we see that $P_alpha inter overline(C)$ contains a
    nonempty open set, i.e. $P_alpha$ is a wall of $C$. Conversely, if $P$ is a
    wall then $P$ contains an open ball $U$ such that
    $U subset overline(C) without C
    subset union.big_(alpha in Pi(C)) P_alpha$. We see that
    $P subset union.big_(alpha in Pi(C)) P_alpha$. Therefore $P$ coincides with
    one of the hyperplanes $P_alpha$.]

  #hint[@pr:root-simple-for-some-chamber][Within the open set
    $F without union.big_(beta in Delta, beta != c alpha) P_beta$ choose a ball
    $U$ such that $U inter P_alpha != emptyset$. The component
    $U_1 = {x in U: alpha(x) > 0}$ of $U without P_alpha$ is contained in a Weyl
    chamber $C$ for which $P_alpha$ is a wall. By
    Problem~@pr:walls-of-weyl-chamber $alpha = c beta$, where $beta in Pi(C)$
    and $c > 0$. Next apply Problem~@pr:proportional-roots-in-root-system.]

  #hint[@pr:positive-root-minus-simple-root][If $(alpha, beta) <= 0$ for all
    $beta in Pi$, we get a contradiction with
    Problem~@pr:nonacute-vectors-independent. Next apply
    Problem~@pr:root-sum-difference-criterion. Since all the coefficients of the
    expression of $alpha - beta$ in terms of simple roots should be of the same
    sign, then $alpha - beta > 0$.]

  #hint[@pr:indecomposable-iff-base-indecomposable][Let $Pi subset Delta$ be a
    base. If $Delta = Delta_1 union Delta_2$, where $Delta_1 != emptyset$,
    $Delta_2 != emptyset$, and $(alpha, beta) = 0$ for all $alpha in Delta_1$,
    $beta in Delta_2$ then $Pi = (Pi inter Delta_1) union (Pi inter Delta_2)$.
    We have $Pi inter Delta_1 != emptyset$ and $Pi inter Delta_2 != emptyset$
    since $Pi$ is a basis of $chevron.l Delta chevron.r$. Conversely, let
    $Pi = Pi_1 union Pi_2$, where $Pi_1 != emptyset$, $Pi_2 != emptyset$ and
    $(alpha, beta) = 0$ for all $alpha in Pi_1$, $beta in Pi_2$. Denote by
    $Delta_i$ the set of roots of $Delta$ linearly expressible in terms of
    $Pi_i$ ($i = 1, 2$). Let us show that $Delta = Delta_1 union Delta_2$. If
    this is not so, Problem~@pr:positive-root-chain-of-simple implies that there
    exist $alpha in Delta_1 inter Delta^+$ and $beta in Pi_2$ (or
    $alpha in Delta_2 inter Delta^+$ and $beta in Pi_1$) such that
    $gamma = alpha + beta in Delta$. Since $alpha - beta in.not Delta$, then
    $(alpha, beta) < 0$ by Problem~@pr:alpha-string-in-root-system.
    Contradiction.]

  #hint[@pr:base-from-ordered-space][To prove the linear independence of $Pi$
    first show that the statement of Problem~@pr:simple-roots-obtuse holds for
    $Pi$ and then apply Problem~@pr:nonacute-vectors-independent.]

  #hint[@pr:dual-base-of-dual-system][#source(194)Make use of
    Problem~@pr:walls-of-weyl-chamber.]

  #hint[@pr:standard-borel-algebra-solvable][By
    Problem~@pr:root-spaces-orthogonality $(frak(n)^+, frak(n)^+) = 0$ hence
    $frak(n)^+$ is a solvable Lie algebra. Since
    $frak(b)^+ \/ frak(n)^+ tilde.eq frak(t)$, then $frak(b)^+$ is also
    solvable. Clearly, $frak(n)^+ = [frak(b)^+, frak(b)^+]$ implying the
    unipotence of $frak(n)^+$.]

  #hint[@pr:standard-borel-is-borel-subalgebra][Since
    $frak(b)^+ supset frak(t)$, then any subalgebra $frak(h) subset frak(g)$
    containing $frak(b)^+$ is of the form
    $frak(h) = frak(b)^+ plus.o plus.o.big_(alpha in Delta_frak(g)^+)
    tilde(frak(g))_(-alpha)$, where $tilde(frak(g))_(-alpha)$ is a subspace of
    $frak(g)_(-alpha)$. The existence of simple three-dimensional subalgebras
    constructed in @ss:three-dimensional-subalgebras[°] implies that $frak(h)$
    cannot be solvable except for $frak(h) = frak(b)^+$. To prove the second
    statement of the problem, it suffices to notice that if
    $tilde(frak(g))_(-alpha) != 0$ then
    $[tilde(frak(g))_(-alpha), frak(t)] = frak(g)_(-alpha) subset.not
    frak(b)^+$.]

  #hint[@pr:borel-semidirect-decomposition][
    Problem~@pr:standard-borel-algebra-solvable implies that
    $T N^+ = T times.l N^+$ is an algebraic subgroup of $B^+$. This subgroup
    coincides with $B^+$ since $frak(b)^+$ is its tangent algebra.]

  #hint[@pr:chamber-to-borel-injective][If $B_1$, $B_2$ are the Borel subgroups
    corresponding to the Weyl chambers $C_1$, $C_2$ then $B_1 = B_2$ implies
    that the unipotent radicals of these subgroups coincide. Making use of
    Problem~@pr:borel-semidirect-decomposition we deduce that the sets of
    $C_1$-positive and $C_2$-positive roots coincide. Now apply
    Problem~@pr:chamber-from-simple-roots.]

  #hint[@pr:normalizer-conjugates-borel-subgroups][By
    Theorem~@th:borel-conjugate-quotient-projective there exists $g in G$ such
    that $g B g^(-1) = B^+$. Then $g T g^(-1) subset B^+$ and by
    Problem~@pr:solvable-maximal-tori-conjugate there exists $b in B^+$ such
    that $b(g T g^(-1)) b^(-1) = T$. Set $a = b g$.]

  #hint[@pr:big-cell-open-orbit][The algebraic group $N^- inter G_p = H$ is
    unipotent and therefore irreducible
    (Corollary~@cor:unipotent-group-irreducible of
    Theorem~@th:unipotent-closure-additive-group). On the other hand, its
    tangent algebra is $frak(n)^- inter frak(b)^+ = 0$. Therefore, $H = {e}$. By
    Problem~@pr:coset-variety-universal-property $alpha_p: N^- -> N^- (p)$ is an
    isomorphism. Since $frak(g) = frak(b)^+ plus.o frak(n)^-$, then
    $dim D = dim N^- = dim N^- (p)$ and the orbit $N^- (p)$ is open in $D$.]

  #hint[@pr:prove-borel-self-normalizing][Consider the manifold $G\/N(B)$
    endowed with a quasiprojective algebraic variety structure such that the
    canonical $G$-action on it is algebraic. By
    Problem~@pr:standard-borel-is-borel-subalgebra $N(B)^0 = B$. Therefore, it
    suffices to prove that $G\/N(B)$ is simply connected which one does as in
    the proof of Theorem~@th:flag-variety-simply-connected.]

  #hint[@pr:torus-normalizer-in-borel][By
    Problem~@pr:solvable-torus-normalizer-centralizer the subgroup $N_B (T)$ is
    irreducible and it is contained in the centralizer of $T$. Now, apply
    Problem~@pr:zero-root-space-is-torus.]

  #hint[@pr:prove-maximal-torus-equals-centralizer][First prove that the
    centralizer of $T$ is contained in $N(B^+)$.]

  #hint[@pr:weyl-group-finite][The elements of $W^or$ are expressed by matrices
    with integer entries in the basis consisting of simple roots.]

  #hint[@pr:chambers-joined-by-gallery][First prove that the set obtained by
    deleting from $F$ the union of all the pairwise intersections of the
    hyperplanes $P_alpha$ ($alpha in Delta$) is connected.]

  #hint[@pr:simple-reflections-transitive][Let $C$ and $C'$ be two Weyl chambers
    and $C = C_0$, $C_1$, ..., $C_r = C'$ the sequence of Weyl chambers
    constructed in Problem~@pr:chambers-joined-by-gallery. We may assume that
    $Pi = Pi(C)$. By induction in $r$ prove the existence of $w in W'$ such that
    $C' = w(C)$. Let there exist $w_0 in W'$ such that $w_0 (C) = C_(r-1)$. Let
    $P_alpha$, where $alpha in Delta$ and $1/2 alpha in.not Delta$, be the
    common wall of $C_(r-1)$ and $C_r = C'$. Then
    $w_0^(-1) (P_alpha) = P_(alpha_0)$, where $alpha_0 in Pi$. Furthermore,
    $r_alpha = w_0 r_(alpha_0) w_0^(-1) in W'$ and $(r_alpha w_0) C = C'$.]

  #hint[@pr:simple-reflections-generate-weyl][It suffices to prove that
    $r_alpha in W'$ for any $alpha in Delta$. For this make use of
    Problems~@pr:root-simple-for-some-chamber and
    @pr:simple-reflections-transitive.]

  #hint[@pr:prove-base-determines-root-system][We may assume that
    $bold(E) = chevron.l Delta chevron.r$,
    $bold(E)' = chevron.l Delta' chevron.r$. Problem~@pr:root-reflection-formula
    implies that $r_(phi(alpha)) = phi r_alpha phi^(-1)$ for any $alpha in Pi$.
    Applying Theorem~@th:weyl-group-simply-transitive we see that the map
    $w |-> phi w phi^(-1)$ is an injective homomorphism of the Weyl groups
    $W^or -> W'^or$ corresponding #source(
      195,
    )to $Delta$ and $Delta'$. By the same
    Theorem~@th:weyl-group-simply-transitive any $alpha in Delta$ presents in
    the form $alpha = w(gamma)$, where $w in W^or$, $gamma in Pi$. Hence
    $phi(alpha) = (phi w phi^(-1))(phi(gamma)) in Delta'$. Making use of
    Problem~@pr:root-reflection-formula again, it is easy to show that
    $chevron.l phi(alpha)|phi(beta) chevron.r
    = chevron.l alpha|beta chevron.r$
    for all $alpha, beta in Delta$. When $Delta'$ is a reduced root system and
    $Pi' = phi(Pi)$ is its base, apply the above to $phi^(-1)$.]

  #hint[@pr:normalizer-action-kernel-torus][Make use of
    Theorem~@th:maximal-torus-equals-centralizer.]

  #hint[@pr:normalizer-image-is-weyl-group][Let $n in N(T)$ and let the
    corresponding transformation $w$ map the Weyl chamber $C$ into itself. Then
    $n B n^(-1) = B$, where $B$ is the Borel subgroup corresponding to $C$.
    Applying Theorem~@th:borel-self-normalizing and
    Problem~@pr:torus-normalizer-in-borel we see that $n in T$ and $w = e$. Thus
    $W''$ acts simply transitively on the Weyl chambers. Since any transitive
    subgroup of a simply transitive group coincides with the latter, we have
    $W = W''$.]

  #hint[@pr:dynkin-diagram-determines-system][If Dynkin diagrams of the systems
    $Gamma = {gamma_1, ..., gamma_s}$ and $Gamma' = {gamma'_1, ..., gamma'_s}$
    are isomorphic then there exists a bijection $phi: Gamma -> Gamma'$ such
    that $phi(gamma_i) = gamma'_i$, $a_(i j) = a'_(i j)$ ($i, j = 1, ..., s$),
    where $a_(i j) = chevron.l gamma_i|gamma_j chevron.r$,
    $a'_(i j) = chevron.l gamma'_i|gamma'_j chevron.r$. We may assume that
    $gamma_1$, ..., $gamma_r$ is a maximal linearly independent subsystem of
    $Gamma$. Considering the principal minors of $A(Gamma)$ and $A(Gamma')$ it
    is easy to see that $gamma'_1, ..., gamma'_r$ is a maximal linearly
    independent subsystem of $Gamma'$.

    Therefore there exists a linear isomorphism
    $f: chevron.l Gamma chevron.r -> chevron.l Gamma' chevron.r$ such that
    $f(gamma_i) = phi(gamma_i)$ for $i = 1, ..., r$. We then prove that this
    holds for $i = r + 1, ..., s$, too. For this it suffices to verify that for
    any $k$ such that $r + 1 <= k <= s$ the coefficients $c_i$ in the expression
    $gamma_k = sum_(1 <= i <= r) c_i gamma_i$ are completely determined by the
    principal submatrix of $A(Gamma)$ corresponding to the subsystem $gamma_1$,
    ..., $gamma_r$, $gamma_k$. But these coefficients constitute the unique
    solution of the system
    $sum_(1 <= i <= r) chevron.l gamma_i|gamma_j chevron.r c_i
    = chevron.l gamma_k|gamma_j chevron.r$
    ($j = 1, ..., r$).]

  #hint[@pr:dual-system-reverses-arrows][Make use of
    @eq:coroot-cartan-integers.]

  #hint[@pr:nonacute-system-positive-relation][Make use of
    Problem~@pr:nonacute-vectors-independent.]

  #hint[@pr:maximal-root-dominant][Make use of
    Problems~@pr:root-sum-difference-criterion, @pr:alpha-string-in-root-system
    and @pr:positive-root-minus-simple-root.]

  #hint[@pr:unique-maximal-root][The inequalities $n_alpha > 0$ follow from
    Problem~@pr:nonacute-system-positive-relation applied to the system
    $Pi union {-delta}$. If $delta'$ is another maximal root then it follows
    from Problem~@pr:maximal-root-dominant that $(delta', delta) > 0$. If
    $delta != delta'$ then with the help of
    Problem~@pr:root-sum-difference-criterion we get a contradiction.]

  #hint[@pr:semidefinite-matrix-is-gram][Let $b$ be a bilinear form in $RR^l$
    with matrix $G$ in the standard basis $e_1, ..., e_l$. Consider the images
    of the vectors $e_1$, ..., $e_l$ in the space $E = RR^l \/ N$ where $N$ is
    the kernel of $b$.]

  #hint[@pr:acyclic-admissible-matrix-realized][It suffices to consider the case
    when $A$ is indecomposable. For any $i = 2, ..., l$ there exists a unique
    sequence of numbers $1 = i_0, i_1, ..., i_k = i$ such that
    $a_(i_p i_(p+1)) != 0$ for $p = 0, 1, ..., k - 1$. Set
    $
      p_i = sqrt(
        (a_(i_1 1) a_(i_2 i_1) dots a_(i i_(k-1)))
        / (a_(1 i_1) a_(i_1 i_2) dots a_(i_(k-1) i))
      ) wide (i >= 2), wide
      p_1 = 1
    $
    and note that $p_i^2 \/ p_j^2 = a_(i j) \/ a_(j i)$ for any $i, j$. Since
    $p_i^2 in QQ$, then $(gamma_i, gamma_j) in QQ$ for all $i, j$.]

  #hint[@pr:cyclic-diagram-is-affine-a][If the Dynkin diagram is a cycle then
    #source(196)
    $
      A = mat(
        2, a_12, dots, 0, a_(1 l);
        a_21, 2, dots, 0, 0;
        dots, dots, dots, dots, dots;
        0, 0, , 2, a_(l-1, l);
        a_(l 1), 0, dots, a_(l, l-1), 2;
      )
    $
    and $m_12$, $m_23$, ..., $m_(l-1, l)$, $m_(l 1)$ are positive integers.
    Since the sum of all elements of a positive semi-definite matrix is
    nonnegative, we get from @eq:normalized-gram-matrix-entries
    $l - (sqrt(m_12) + dots.c + sqrt(m_(l-1, l)) + sqrt(m_(l 1))) >= 0$. It
    follows that $m_12 = dots.c = m_(l-1, l) = m_(l 1) = 1$. In general case
    make use of the fact that any principal submatrix of $A$ is a Cartan
    matrix.]

  #hint[@pr:vertex-degree-at-most-three][Notice that otherwise there can be
    found a subdiagram of one of the types listed in the statement. Next, make
    use of Proposition~@prop:dynkin-diagrams-rank-three and properties (D1),
    (D5), (D6).]

  #hint[@pr:at-most-one-singularity][Notice that any diagram with two or more
    singularities contains one of the subdiagrams listed in the problem.]

  #hint[@pr:determinants-e-f-diagrams][Make use of Corollary of
    Theorem~@th:admissible-matrix-realized and the recurrent formula
    $delta(L_l) = 2 delta(L_(l-1)) - delta(L_(l-2))$, where $L_l = E_l$, $F_l$
    or $F_l^or$.]

  #hint[@pr:affine-diagrams-e6-e7][Prove that the corresponding matrices are not
    invertible.]

  #hint[@pr:nonclassical-diagrams-are-e-f][Make use of
    Problems~@pr:determinants-e-f-diagrams, @pr:affine-diagrams-e6-e7 and
    properties (D1), (D5), (D6).]

  #hint[@pr:indivisible-roots-reduced-system][The system $Delta_0$ is reduced
    thanks to Problem~@pr:proportional-roots-in-root-system.]

  #hint[@pr:nonreduced-indivisible-type-b][In $Delta_0$, select a base $Pi$.
    Theorem~@th:weyl-group-simply-transitive implies the existence of
    $alpha in Pi$ such that $2 alpha in Delta$. If $beta in Pi$, $beta != alpha$
    and $(alpha, beta) != 0$ then
    $chevron.l beta|alpha chevron.r = 2 chevron.l beta|2 alpha chevron.r = -2$
    so that $abs(beta)^2 = 2 abs(alpha)^2$.
    Theorem~@th:classification-reduced-root-systems implies that the type of
    $Delta_0$ is $B_l$.]

  #hint[@pr:prove-nonreduced-systems-bc][Make use of
    Problem~@pr:nonreduced-indivisible-type-b and prove that
    $Delta without Delta_0$ is the set of all doubled short roots from
    $Delta_0$.]

  #hint[@pr:dual-lattice-quotients][Notice that the invariant factors of a
    matrix with integer entries are preserved under transposition.]

  #hint[@pr:fundamental-group-cartan-determinant][Follows from
    @eq:simple-roots-via-fundamental-weights.]

  #hint[@pr:dual-root-weight-lattices][First prove that $P = (Q^or)^*$. The fact
    that fundamental groups are isomorphic follows from
    Problem~@pr:dual-lattice-quotients.]

  #hint[@pr:character-lattice-between-q-p][Make use of
    Problems~@pr:coroot-in-integral-lattice and @pr:dual-root-weight-lattices.]
]
