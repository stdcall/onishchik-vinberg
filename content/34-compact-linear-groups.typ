// Chapter 3, § 4. Compact Linear Groups. Printed pages 130-135.
#import "main-defs.typ": *
#import "statements.typ": *

== Compact Linear Groups <sec:compact-linear-groups>

Compact linear groups give an example when the algebraicity follows from a
topological assumption. Namely, any compact linear group acting in a real vector
space is algebraic (and therefore, it is a Lie group). This will constitute one
of the theorems of this section.

=== A Fixed Point Theorem <ss:compact-fixed-point-theorem>
Proofs of all properties of compact linear groups contained in this section are
based on the following theorem.

#theorem[Let $G$ be a compact subgroup of the group $GA(S)$ of affine
  transformations of a real affine space $S$ and let $M subset S$ be a nonempty
  convex $G$-invariant subset. Then $M$ contains a fixed point of
  $G$.] <th:compact-affine-fixed-point>

Before we proceed with the proof of this theorem define the #idx(
  "center of mass",
)_center of mass_ of a nonempty bounded convex subset $M$ of a real affine space
$S$ to be
$ c(M) = mu(M)^(-1) integral_M x mu(d x), $
where $mu$ is the usual measure in $S$ invariant with respect to parallel
translations. The measure $mu$ is defined up to a constant factor but it is
clear from the formula that the ambiguity in the choice of $mu$ does not affect
the results. The integral on #source(146)the right-hand side can be defined
either 1) coordinate-wise or 2) directly, as the limit of integral sums which
are (the factor preceding the integral being taken into account) linear
combinations of points of $S$ with the sum of coefficients being equal to 1, and
therefore make sense. The first definition shows the existence of the integral
and the second one its independence of the choice of a coordinate system.

In the general case let $P$ be the smallest plane in $S$ containing $M$. Then
$M$ has a nonempty interior as a subset of the affine space $P$ and we define
$c(M)$ as above but with $S$ replaced by $P$.

#problem[$c(M) in M$.] <pr:center-of-mass-inside>

Since the center of mass is defined in terms of affine geometry,
$c(g M) = g c(M)$ for any affine transformation $g$ of $S$. In particular, if
$M$ is invariant with respect to an affine transformation then its center of
mass is a fixed point of this transformation.

_Proof of the theorem._ If $M$ is bounded then its center of mass will do as a
fixed point. In general let $M'$ be the convex hull of an orbit of $G$ in $M$.
Clearly, $M'$ is an invariant subset. Since the orbit is compact, its convex
hull is bounded. The point $c(M') in M' subset M$ is the desired fixed
point.#qed-mark

Applying the theorem to $M = S$ we get

#corollary[Any compact group of affine transformations has a fixed point.]

=== Complete Reducibility <ss:complete-reducibility-compact>

#theorem[Let $G$ be a compact group of linear transformations of a real
  (complex) vector space $V$. Then there exists a positive definite quadratic
  (Hermitian) form on $V$ invariant with respect to
  $G$.] <th:compact-invariant-inner-product>

In other words $V$ can be made into a Euclidean (Hermitian) space so that all
transformations of $G$ are orthogonal (unitary).

_Proof_ is obtained by applying Theorem~@th:compact-affine-fixed-point to the
image of $G$ under the natural linear representation of $GL(V)$ in a (real)
space $S$ of all quadratic or Hermitian forms on $V$. For $M$ take the subset of
positive definite forms.#qed-mark

#corollary[Any compact linear group in a real or complex vector space is
  completely reducible.]

Recall that a linear group $G subset GL(V)$ is #idx(
  "Group",
  "linear",
  "irreducible",
)_irreducible_ if $V != 0$ and there are no nontrivial $G$-invariant subspaces
in $V$ and #idx("Group", "linear", "completely reducible")_completely reducible_
if $V$ decomposes into the direct sum of $G$-invariant subspaces so that the
restriction of $G$ onto any of them is irreducible. (Notice a linguistic
inconsistency: any irreducible linear group is completely reducible!)

#problem[A linear group $G subset GL(V)$ is completely reducible if and only if
  for any $G$-invariant subspace of $V$ there exists a $G$-invariant
  complementary subspace.] <pr:complete-reducibility-complements>

#source(147)If $V$ is a Euclidean (Hermitian) space and all transformations from
$G$ are orthogonal (unitary) then for a complementary invariant space we can
take the orthogonal complement which implies the above Corollary.

=== Separating Orbits with the Help of Invariants
<ss:separating-orbits-by-invariants>
Let $V$ be a (finite-dimensional) vector space over an infinite field $K$. Every
linear operator $A in GL(V)$ determines an automorphism $A^*$ of the polynomial
algebra $K[V]$ acting via the formula
$ (A^* f)(x) = f(A^(-1) x) wide (f in K[V], x in V) $
The map $A |-> A^*$ is a linear representation of $GL(V)$ in $K[V]$. This
representation is infinite-dimensional but is the inductive limit of
finite-dimensional ones: $K[V]$ is the union of the increasing chain of
finite-dimensional $GL(V)$-invariant subspaces $K[V]^((m))$, $m = 0, 1, ...$,
where $K[V]^((m))$ consists of polynomials of degree $<= m$.

Now, let $G subset GL(V)$ be a subgroup. A polynomial $f in K[V]$ is
_$G$-invariant_ if $A^* f = f$ or, equivalently, if
$ f(A x) = f(x) quad "for any" quad A in G, x in V. $
In other words, a polynomial $f$ is $G$-invariant if it is constant on every
orbit of $G$. The invariant polynomials constitute a subalgebra of $K[V]$
denoted by $K[V]^G$.

We say that #idx("orbits separated by invariants")_the orbits of $G$ are
separated by invariants_ if for any $x, y in V$ that belong to different orbits
there exists $f in K[V]^G$ such that $f(x) != f(y)$.

For example, let $G = S_n$, where $n = dim V$, be the symmetric group which acts
in $V$ permuting the vectors of a fixed basis. Then $K[V]^G$ is the algebra of
symmetric polynomials (in the coordinate system corresponding to the basis). As
is known, this algebra is generated by the elementary symmetric polynomials
$sigma_1, ..., sigma_n$. Let us prove that the orbits of $G$ are separated by
the invariants. To each $x in V$ with coordinates $x_1, ..., x_n$ assign the
polynomial
$
  phi_x (t) = (t - x_1) ... (t - x_n)
  = t^n - sigma_1 (x) t^(n-1) + dots.c + (-1)^n sigma_n (x)
$
in a variable $t$ with roots $x_1, ..., x_n$. If $x$ and $y$ belong to different
orbits of $G$, i.e. the coordinates of one of them cannot be obtained from the
coordinates of another by permutation then $phi_x != phi_y$ and therefore
$sigma_k (x) != sigma_k (y)$ for some $k$.

It is possible to show that the orbits of any finite linear group are separated
by the invariants. On the contrary, for infinite groups this is seldom so. For
instance consider a classical situation. Let $V = upright(L)_n (K)$ be the space
of matrices over an algebraically closed field $K$ and let $G subset GL(V)$ be
the group of transformations $X |-> A X A^(-1)$ ($X in upright(L)_n (K)$,
$A in GL_n (K)$). Then the orbits of $G$ are the classes of similar matrices and
$K[V]^G$, as it is not difficult to show, is generated by the coefficients of
the characteristic polynomial (which are polynomials in the matrix elements).
Therefore the matrices with the same characteristic polynomials but different
Jordan forms are not separated by the invariants although they belong to
different orbits.

#theorem[#source(148)The orbits of a compact linear group acting in a real
  vector space are separated by the
  invariants.] <th:compact-orbits-separated-invariants>

#proof[Let $O_1$ and $O_2$ be different orbits of a compact linear group $G$
  acting in a real vector space $V$. Since $O_1$ and $O_2$ are nonintersecting
  compact subsets, there exists a continuous function $phi$ on $V$ equal 1 on
  $O_1$ and $-1$ on $O_2$. Furthermore, by Weierstrass's theorem there exists
  $f in RR[V]$ such that
  $ abs(f(x) - phi(x)) < 1 quad "for" quad x in O_1 union O_2 $
  and therefore
  $
    f(x) > 0 quad "for" quad x in O_1 quad "and" quad
    f(x) < 0 quad "for" quad x in O_2
  $ <eq:polynomial-separates-orbits>
  Let $m$ be the degree of this polynomial.

  In $S = RR[V]^((m))$, consider the subset $M$ consisting of all polynomials
  satisfying @eq:polynomial-separates-orbits. Clearly, $M$ is convex and
  invariant with respect to the natural linear representation of $G$ in $S$. By
  Theorem~@th:compact-affine-fixed-point there exists a $G$-invariant polynomial
  in $M$. It is clear from @eq:polynomial-separates-orbits that the values of
  this polynomial at the points of $O_1$ are different from the values at the
  points of $O_2$.]

_Example._ Let $V$ be the space of symmetric real matrices of order $n$. To each
orthogonal $n times n$ matrix $A$ assign a linear transformation $R(A)$ of $V$
by the formula
$ R(A) X = A X A^(-1) wide (X in V). $
Then we get a linear representation $R: upright(O)_n -> GL(V)$. Let
$G = R(upright(O)_n)$. This is a compact linear group acting on the space $V$.
As it is known from the linear algebra, each orbit of this group contains a
diagonal matrix. Therefore the orbit which contains the symmetric matrix $X$ is
determined by the characteristic polynomial of this matrix. Since the
coefficients of a characteristic polynomial are $G$-invariant polynomials in the
elements of $X$, the orbits of $G$ are separated by the invariants as it should
be according to the theorem.#qed-mark

=== Algebraicity <ss:compact-groups-algebraicity>

#theorem[The orbits of a compact linear group $G$ acting on a real vector space
  $V$ are algebraic varieties in $V$.] <th:compact-orbits-algebraic>

#proof[Let $O$ be an orbit and $I$ an ideal of $RR[V]^G$ consisting of
  invariants which vanish on $O$. By
  Theorem~@th:compact-orbits-separated-invariants for any orbit $O' != O$ there
  exists an invariant which takes different values on $O$ and $O'$. Adding to it
  an appropriate constant we can get a polynomial $f in I$ which does not vanish
  at any point of $O'$. Thus, the set of zeros of $I$ coincides with $O$
  implying that $O$ is an algebraic variety in $V$.]

#theorem[Any compact linear group acting on a real vector space is algebraic
  (and therefore is a linear Lie group).] <th:compact-linear-group-algebraic>

#proof[#source(149)Let $G subset GL(V)$ be a compact linear group. Consider a
  linear representation $R$ of $G$ in the space $upright(L)(V)$ defined by the
  formula
  $ R(A) X = A X quad (A in GL(V), X in upright(L)(V)). $
  The group $G$, as a subset of $upright(L)(V)$, is an orbit of $R(G)$ (namely
  $G = R(G) E$). By Theorem~@th:compact-orbits-algebraic this implies that $G$
  is algebraic.]

Notice that a similar theorem fails over $CC$. More precisely, the following
statement holds.

#problem[Any compact complex algebraic group is
  finite.] <pr:compact-complex-algebraic-finite>

However, Theorem~@th:compact-linear-group-algebraic implies that any compact
linear group acting on a complex vector space $V$ is an algebraic subgroup of
the group of invertible linear transformations of $V$ considered as a real
vector space and therefore a real algebraic subgroup of $GL(V)$.

In Chapter~@ch:real-semisimple-groups we will obtain a classification of
connected compact linear groups and prove that any compact Lie group admits a
faithful linear representation.

#exercises[
  #exercise[Let $G$ be an irreducible compact linear group acting on a real
    (complex) vector space $V$. Then a $G$-invariant positive definite quadratic
    (Hermitian) form on $V$ is unique up to a positive
    factor.] <exc:irreducible-invariant-form-unique>

  #exercise[A linear operator in a vector space over an algebraically closed
    field is semisimple if and only if the cyclic linear group it generates is
    completely reducible.] <exc:semisimple-iff-completely-reducible>

  #exercise[The orbits of any finite linear group (over an arbitrary field) are
    separated by the invariants.] <exc:finite-group-orbits-separated>

  #exercise[Let $V = upright(L)_n (K)$ be the space of matrices over an
    algebraically closed field $K$ and let $G subset GL(V)$ be the group
    consisting of transformations
    $ X |-> A X A^(-1) quad (X in upright(L)_n (K), A in GL_n (K)). $
    Then $K[V]^G$ is generated by the coefficients of the characteristic
    polynomial. (Hint: consider the restrictions of invariants onto the subspace
    of diagonal matrices.)] <exc:matrix-conjugation-invariants>

  #exercise[In the notations of Exercise~@exc:matrix-conjugation-invariants the
    orbit of $X in upright(L)_n (K)$ is closed in $upright(L)_n (K)$ if and only
    if $X$ is similar to a diagonal
    matrix.] <exc:closed-orbit-iff-diagonalizable>
]

#hints[
  #hint[@pr:center-of-mass-inside][We can assume that $M$ has a nonempty
    interior. In this case suppose $c(M) in.not M$. Then there exists an affine
    function $l$ on $S$ positive at all interior points of $M$ and vanishing at
    $c(M)$. But this is impossible since the definition of the center of mass
    implies that
    $ l(c(M)) = mu(M)^(-1) integral_M l(x) mu(d x) > 0. $]

  #hint[@pr:complete-reducibility-complements][#source(150)Let
    $V = V_1 plus.o dots.c plus.o V_m$ be the decomposition of $V$ into the
    direct sum of invariant subspaces on each of which $G$ acts irreducibly and
    let $U subset V$ be an invariant subspace. Then as an invariant subspace
    complementary to $U$ we can always take the sum of a certain number of
    subspaces $V_1, ..., V_m$.]

  #hint[@pr:compact-complex-algebraic-finite][More generally, an irreducible
    complex affine variety of positive dimension cannot be compact: see
    @ss:quasiprojective-varieties.]
]
