// Chapter 1, § 1. Background. Printed pages 1-19.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/cd.typ": ar, cd

== Background <sec:lie-groups-background>

=== Lie Groups <ss:lie-group-definition>
A group $G$ endowed with a structure of a differentiable manifold over $K$ so
that the maps
$ mu: G times G -> G, quad "where" quad mu: (x, y) |-> x y $
and
#source(17)
$ iota: G -> G, quad "where" quad iota: x |-> x^(-1), $
are differentiable is called a #idx("Lie group")_Lie group_ over $K$. In other
words, the coordinates of the product must be differentiable functions of the
coordinates of factors, and the coordinates of the inverse element must be
differentiable functions of the coordinates of the element itself.

A Lie group over $CC$ is also called a #idx("Lie group", "complex")_complex Lie
group_ and a Lie group over $RR$ is called a #idx(
  "Lie group",
  "real",
)_real Lie group._ Any complex Lie group may be considered as a real Lie group
of doubled dimension.

_Examples_ of Lie groups. #eg <exm:additive-group-of-field> The #idx(
  "Group",
  "additive of the ground field",
)_additive group_ of $K$. It will be denoted by $K$, but it is also denoted in
the literature as $G_a (K)$.

#eg <exm:multiplicative-group-of-field> The #idx(
  "Group",
  "multiplicative of the ground field",
)_multiplicative group_ $K^*$ of $K$ (also denoted in the literature as
$G_m (K)$).

#eg <exm:circle-group> The #idx("circle")_circle_ $TT = {z in CC^*: abs(z) = 1}$
is a real Lie group.

#eg <exm:gln-invertible-matrices> The #idx(
  "Group",
  "linear",
  "general",
)_general linear group_ $GL_n (K)$ of invertible $n times n$ matrices over $K$.
The differentiable structure on $GL_n (K)$ is defined as on the open subset of
the vector space $upright(L)_n (K)$ of all $n times n$ matrices.

#eg <exm:gl-of-vector-space> The group $GL(V)$ of all invertible linear
transformations of an $n$-dimensional vector space $V$ over $K$ may be
considered as a Lie group under the isomorphism $GL(V) -> GL_n (K)$ which to any
linear transformation assigns its matrix in a fixed basis of $V$. The formula
describing how a matrix of a linear transformation changes under the change of
basis implies that the differentiable structure on $GL(V)$ does not depend on
the choice of a basis in $V$.

#eg <exm:affine-transformation-group> The group $GA(S)$ of (invertible) affine
transformations of an $n$-dimensional affine space $S$ over $K$ is also
naturally endowed with a differentiable structure which makes it a Lie group.
Namely, in an affine coordinate system on $S$ the affine transformations are
expressed by formulas of the form $X |-> A X + B$, where $X$ is the column of
coordinates of a point, $A$ an invertible square matrix and $B$ a column vector.
The entries of $A$ and $B$ can serve as (global) coordinates on $GA(S)$. The
differentiable structure on $GA(S)$ defined by them does not depend on the
choice of an affine coordinate system in $S$ since under a change of affine
coordinates in $S$ they are transformed in a differentiable way.

#eg <exm:countable-discrete-group> Any finite or countable group with discrete
topology and the structure of a 0-dimensional differentiable manifold.

The #idx("product", "direct", "of Lie groups")_direct product of Lie groups_ is
the direct product of abstract groups endowed with the differentiable structure
of the direct product of differentiable manifolds.

#problem[The direct product of Lie groups is a Lie
  group.] <pr:direct-product-lie-groups>

The direct product $K^n$ of $n$ copies of the additive group of the field $K$ is
called the #idx("Lie group", "vector")_$n$-dimensional vector Lie group._

=== Lie Subgroups <ss:lie-subgroups>
A subgroup $H$ of a Lie group $G$ is called a #idx("Lie subgroup")_Lie subgroup_
if it is a submanifold of the manifold $G$. By a #idx(
  "submanifold",
  "differentiable",
)_submanifold of codimension $m$_ of a differentiable manifold $X$ we mean a
subset $Y subset X$ such that in an appropriate neighbourhood of any of its
points it may be determined in some local #source(18)coordinates by a system of
equations
$ f_i (x_1, ..., x_n) = 0 wide "for" i = 1, ..., m, $
where $f_1, ..., f_m$ are differentiable functions and
$rk display((partial(f_1, ..., f_m))/(partial(x_1, ..., x_n))) = m$ at this
point.

(Sometimes the terms “submanifold” and “Lie subgroup” respectively are
understood in a wider sense. In our book to this more general interpretation
would correspond the term “virtual Lie subgroup” (cf.
@ss:virtual-lie-subgroups).)

The submanifold $Y$ is uniquely endowed with the structure of an
$(n - m)$-dimensional differentiable manifold compatible with the induced
topology so that the identity embedding $Y arrow.r.hook X$ is a differentiable
map of constant rank $n - m$. If, in the above notation,
$display((D(f_1, ..., f_m))/(D(x_1, ..., x_m))) != 0$ at a given point then the
restrictions of $x_(m+1), ..., x_n$ may serve as local coordinates on $Y$ in a
neighbourhood of this point.

#problem[A Lie subgroup is a Lie group.] <pr:lie-subgroup-is-lie-group>

_Examples._ #eg <exm:vector-subspace-lie-subgroup> Any subspace of a vector
space is a Lie subgroup of the vector Lie group.

#eg <exm:circle-lie-subgroup> The group $TT$ (see Example~@exm:circle-group) is
a Lie subgroup of $CC^*$ considered as a real Lie group.

#eg <exm:discrete-subgroup-lie-subgroup> Any discrete subgroup is a Lie
subgroup.

#eg <exm:diagonal-matrices-subgroup> The group of $n times n$ invertible
diagonal matrices is a Lie subgroup of $GL_n (K)$.

#eg <exm:triangular-matrices-subgroup> The group of $n times n$ invertible
(upper) triangular matrices is a Lie subgroup of $GL_n (K)$.

#problem[Let $H$ be a subgroup of a Lie group $G$. If there is a neighbourhood
  $cal(O)(e)$ of the unit of $G$ such that $H inter cal(O)(e)$ is a submanifold,
  then $H$ is a Lie subgroup.] <pr:lie-subgroup-local-criterion>

A Lie subgroup of $GL(V)$ (in particular, that of $GL_n (K) = GL(K^n)$) is
called a #idx("Lie group", "linear")_linear Lie group._

#problem[The group $SL_n (K)$ of unimodular (i.e. of determinant 1) $n times n$
  matrices is a Lie subgroup of codimension 1 in
  $GL_n (K)$.] <pr:sln-codimension-one>

#problem[The group $upright(O)_n (K)$ of orthogonal $n times n$ matrices is a
  Lie subgroup of dimension $n(n - 1)\/2$ in
  $GL_n (K)$.] <pr:orthogonal-group-dimension>

#problem[The group $upright(U)_n$ of unitary $n times n$ matrices is a real Lie
  subgroup of dimension $n^2$ in $GL_n (CC)$.] <pr:unitary-group-dimension>

#problem[Any Lie subgroup is closed.] <pr:lie-subgroup-is-closed>

=== Homomorphisms, Linear Representations and Actions of Lie Groups
<ss:homomorphisms-representations-actions>
Let $G$ and $H$ be Lie groups. A map $f: G -> H$ is called a #idx(
  "homomorphism of Lie groups",
)_Lie group homomorphism_ if it is both a homomorphism of abstract groups and a
differentiable mapping.

#source(19)A homomorphism $f: G -> H$ is an #idx(
  "isomorphism of Lie groups",
)_isomorphism_ if there exists an inverse homomorphism $f^(-1): H -> G$, i.e. if
$f$ is an isomorphism of abstract groups and at the same time a diffeomorphism
of manifolds (however, see Corollary of
Theorem~@th:epimorphism-quotient-isomorphism).

_Examples._ #eg <exm:exp-additive-to-multiplicative> The exponential map
$x |-> e^x$ is a homomorphism of the additive Lie group $K$ into the
multiplicative Lie group $K^*$.

#eg <exm:determinant-homomorphism> The map $A |-> det A$ is a Lie group
homomorphism of $GL_n (K)$ onto $K^*$.

#eg <exm:inner-automorphism-lie-group> For any $g in G$ the inner automorphism
$ a(g): x |-> g x g^(-1) $
is a Lie group automorphism.

#eg <exm:real-line-onto-circle> The map $x |-> e^(i x)$ is a Lie group
homomorphism of $RR$ onto $TT$.

#eg <exm:affine-linear-part-homomorphism> The map assigning to each affine
transformation of an affine space $S$ its differential (linear part) is a
homomorphism of the Lie group $GA(S)$ (cf.
Example~@exm:affine-transformation-group) into the Lie group $GL(V)$, where $V$
is the vector space associated with $S$.

#eg <exm:countable-group-homomorphism> Any homomorphism of finite or countable
abstract groups is a homomorphism of zero-dimensional Lie groups.

Clearly, the composition of Lie group homomorphisms is also a Lie group
homomorphism.

A Lie group homomorphism of $G$ into $GL(V)$ is called a #idx(
  "representation",
  "linear",
)_linear representation_ of $G$ in the space $V$.

#problem[Let us assign to any matrix $A in GL_n (K)$ the linear transformations
  $Ad(A)$ and $Sq(A)$ in the space $upright(L)_n (K)$ by the formulas:
  $ Ad(A)(X) = A X A^(-1), wide Sq(A)(X) = A X A^t. $
  Prove that $Ad$ and $Sq$ are linear representations of the Lie group
  $GL_n (K)$ in the space
  $upright(L)_n (K)$.] <pr:conjugation-congruence-representations>

Sometimes one considers complex linear representations of real Lie groups or
real linear representations of complex Lie groups. In the first case one assumes
that the group of linear transformations of a complex vector space is considered
as a real Lie group, in the second one that the given complex Lie group is
considered as a real one.

A group homomorphism $alpha$ of a Lie group $G$ into the group $Diff X$ of
diffeomorphisms of a manifold $X$ (which is not a Lie group in any conceivable
sense) is called a #idx("Action of a Lie group")_$G$-action_ on $X$ if the map
$G times X -> X$, where $(g, x) |-> alpha(g) x$, is differentiable.

// The book numbers this second list of examples in 3° again from 1; its
// items are never referred to, so they carry no labels.
_Examples._ #eg-restart For any Lie group $G$ we may define the following three
$G$-actions on $G$ itself:
$
  l(g) x & = g x \
  r(g) x & = x g^(-1) \
  a(g) x & = g x g^(-1)
$

#eg #source(20)The natural $GL_n (K)$-action on the projective space $P(K^n)$ is
a Lie group action.

#eg Any linear representation $T: G -> GL(V)$ of a Lie group $G$ may be
considered as a $G$-action on the space $V$.

#eg Similarly, any homomorphism $f: G -> GA(S)$ may be considered as an action
of the Lie group $G$ on an affine space $S$. Such an action is called #idx(
  "Action",
  "affine",
)_affine._

Clearly, the composition of a homomorphism $f: H -> G$ and an action
$alpha: G -> Diff X$ is the action $alpha compose f: H -> Diff X$.

When it is clear which action we are speaking about we will write $g x$ instead
of $alpha(g) x$.

=== Operations on Linear Representations <ss:operations-on-representations>
Suppose $R$ and $S$ are linear representations of a group $G$ in spaces $V$ and
$U$ respectively. The #idx("sum of representations")_sum_ of $R$ and $S$ is the
linear representation $R + S$ of $G$ in the space $V plus.o U$ defined by the
formula
$ (R + S)(g)(v + u) = R(g) v + S(g) u. $
The #idx("product of representations")_product_ of $R$ and $S$ is the linear
representation $R S$ of $G$ in the space $V times.o U$ defined on simple (i.e.
decomposable) elements by the formula
$ R S(g)(v times.o u) = R(g) v times.o S(g) u. $
The sum and the product of any finite number of representations are defined
similarly.

The #idx("representation", "dual (contragredient)")_dual_ (or the
_contragredient_) of the representation $R$ of a group $G$ in a space $V$ is the
representation $R^*$ of $G$ in the space $V^*$ defined by the formula
$ (R^*(g) f)(v) = f(R(g)^(-1) v). $

#problem[If $R$ and $S$ are linear representations of a Lie group $G$, then
  $R + S$, $R S$ and $R^*$ are also Lie group representations (i.e. they are
  differentiable).] <pr:sum-product-dual-representations>

For any integers $k, l >= 0$ the identity linear representation $Id$ of the Lie
group $GL(V)$ in $V$ generates the linear representation
$T_(k, l) = (Id)^k (Id^*)^l$ of $GL(V)$ in the space
$V times.o dots.c times.o V times.o V^* times.o dots.c times.o
V^*$ ($k$ factors $V$ and $l$ factors $V^*$) of tensors of type $(k, l)$ on $V$.
Let us give convenient formulas for $T_(k, l) (A)$, where $A in GL(V)$, in the
two cases which occur most often: $k = 0$ and $k = 1$.

The tensors of type $(0, l)$ are $l$-linear forms on $V$. For any such form $f$
we have
$ (T_(0, l) (A) f)(v_1, ..., v_l) = f(A^(-1) v_1, ..., A^(-1) v_l). $
<eq:gl-action-on-multilinear-forms>

The tensors of type $(1, l)$ are $l$-linear maps
$F: V underbrace(times dots.c times, l "factors") V -> V$. For any such map $F$
we have
$ (T_(1, l) (A) F)(v_1, ..., v_l) = A F(A^(-1) v_1, ..., A^(-1) v_l). $
<eq:gl-action-on-multilinear-maps>

#problem[#source(21)Prove @eq:gl-action-on-multilinear-forms and
  @eq:gl-action-on-multilinear-maps.] <pr:prove-tensor-action-formulas>

#problem[The representations $Ad$ and $Sq$ considered in
  Problem~@pr:conjugation-congruence-representations are exactly the natural
  linear representations of $GL_n (K)$ in the spaces of tensors of types
  $(1, 1)$ and $(2, 0)$ respectively written in the matrix
  form.] <pr:conjugation-congruence-as-tensors>

If $R$ is a linear representation of a group $G$ in a space $V$ and $U subset V$
is an invariant subspace then the #idx(
  "subrepresentation",
)_subrepresentation_ $R_U: G -> GL(U)$ and the #idx(
  "quotient representation",
)_quotient representation_ $R_(V\/U): G -> GL(V\/U)$ are defined naturally.

Evidently, any subrepresentation and any quotient representation of a linear
representation of a Lie group are its linear representations (as of a Lie
group).

A special role in group theory is played by one-dimensional representations
which are nothing but homomorphisms of a given group $G$ into the multiplicative
subgroup of the ground field. They are called #idx(
  "character of a Lie group",
)_characters_#footnote[In the representation theory the term “character” is more
  often understood in a wider sense as a trace of any (not necessarily
  one-dimensional) linear representation. However, we will not consider
  characters in this wider sense and the term “character” will always be
  understood as above.] of the group $G$. Characters form a group with respect
to the multiplication of representations; the inversion in this group is the
passage to the dual representation.

In the context of the Lie group theory characters are supposed to be
differentiable. In this book we will only consider complex characters of (real
and complex) Lie groups. The group of complex characters of a Lie group $G$ will
be denoted by $cal(X)(G)$.

The additive notation is traditionally used in the group of characters:
$
  (chi_1 + chi_2)(g) = chi_1 (g) chi_2 (g), wide
  (chi_1, chi_2 in cal(X)(G), g in G).
$

=== Orbits and Stabilizers <ss:orbits-and-stabilizers>
Suppose $alpha$ is an action of a Lie group $G$ on a manifold $X$ and let
$x in X$ be a point. Consider the map
$ alpha_x: G -> X, quad "where" quad alpha_x: g |-> alpha(g) x. $
Its image is the orbit $alpha(G) x$ of the point $x$ and the inverse image of
$x$ is nothing but its stabilizer
$ G_x = {g in G: alpha(g) x = x}. $
The inverse images of the other points of the orbit are left cosets of $G$ with
respect to $G_x$.

#problem[Prove that $alpha_x$ is differentiable and its rank is
  constant.] <pr:orbit-map-constant-rank>

Recall that a differentiable map $f: X -> Y$ of constant rank is linearizable in
a neighbourhood of any point of $X$. This implies that

(1) the inverse image of any point $y = f(x)$ is a submanifold of codimension
$k = rk f$ in $X$ and $T_x (f^(-1) (y)) = Ker d_x f$;

(2) #source(22)for any point $x in X$ the image of any sufficiently small
neighbourhood $cal(O)(x)$ is a $k$-dimensional submanifold in $Y$, and
$T_(f(x)) (f(cal(O)(x))) = Im d_x f$.

Besides,

(3) if $f(X)$ is a submanifold in $Y$ then $dim f(X) = k$.

Indeed, if we had had $dim f(X) > k$, then by (2) the manifold $f(X)$ would have
been covered by a countable set of submanifolds of a smaller dimension, but this
is impossible.

The listed properties of constant rank maps and
Problem~@pr:orbit-map-constant-rank immediately imply

#theorem[Suppose $alpha$ is an action of a Lie group $G$ on a differentiable
  manifold $X$. For any $x in X$ the map $alpha_x$ is of constant rank. Let
  $rk alpha_x = k$, then

  1) the stabilizer $G_x$ is a Lie subgroup of codimension $k$ in $G$ and
  $T_e (G_x) = Ker d_e alpha_x$;

  2) for any sufficiently small neighbourhood $cal(O)(e)$ of the unit of $G$ the
  subset $alpha(cal(O)(e)) x$ is a submanifold of dimension $k$ in $X$ and
  $T_x (alpha(cal(O)(e)) x) = Im d_e alpha_x$;

  3) if the orbit $alpha(G) x$ is a submanifold in $X$, then
  $dim alpha(G) x = k$.] <th:stabilizer-is-lie-subgroup>

Note that an orbit is not always a submanifold. (A counterexample will be given
in the following subsection.)

Therefore the following statement is of interest to us:

#problem[Any orbit of a compact Lie group action is a closed
  submanifold.] <pr:compact-orbit-closed-submanifold>

The most important examples of compact Lie groups (besides finite ones) are the
#idx("Torus")$n$-dimensional torus $TT^n$ (the direct product of $n$ copies of
$TT$), the orthogonal group $upright(O)_n (= upright(O)_n (RR))$ and the unitary
group $upright(U)_n$. To prove the compactness of $upright(O)_n$ note that it is
distinguished in the space $upright(L)_n (RR)$ of all real matrices by algebraic
equations $sum_k a_(i k) a_(j k) = delta_(i j)$, hence is closed in
$upright(L)_n (RR)$. These equations imply $abs(a_(i j)) <= 1$ which means that
$upright(O)_n$ is bounded in $upright(L)_n (RR)$. The compactness of
$upright(U)_n$ is proved similarly. We will continue the discussion of
properties of compact Lie groups and their orbits in
§~@sec:compact-linear-groups.

Statement 1) of the theorem may be used to prove the fact that a given subgroup
$H$ of a Lie group $G$ is a Lie subgroup. For this it suffices to realize $H$ as
the stabilizer of a point for some action of the Lie group $G$. Most (if not
all) interesting Lie subgroups arise in this way. If the orbit of a given point
under this action is a submanifold of a known dimension, then the dimension of
$H$ may be computed using statement 3).

We can apply this to the representation of the Lie group $GL(V)$ in the space of
tensors (see @ss:operations-on-representations) to find that the group of
invertible linear transformations preserving a tensor is a linear Lie group.

_Examples._ #eg <exm:orthogonal-group-of-form> Consider the representation of
$GL(V)$ in the space $upright(B)_+ (V)$ of symmetric bilinear forms (i.e.
symmetric tensors of type $(0, 2)$). The group $upright(O)(V, f)$ of invertible
linear transformations preserving a symmetric bilinear form $f$ is a linear Lie
group. If $f$ is nondegenerate, then its orbit is open in $upright(B)_+ (V)$,
hence
#source(23)
$
  dim upright(O)(V, f) = dim GL(V) - dim upright(B)_+ (V)
  = n^2 - (n(n + 1))/2 = (n(n - 1))/2,
$
where $n = dim V$.

#eg <exm:symplectic-group-of-form> Similarly, consider the representation of
$GL(V)$ in the space $upright(B)_- (V)$ of skew-symmetric bilinear forms. The
group $Sp(V, f)$ of invertible linear transformations preserving a
skew-symmetric bilinear form $f$ is a linear Lie group. If $f$ is nondegenerate,
then
$ dim Sp(V, f) = dim GL(V) - dim upright(B)_- (V) = n(n + 1)\/2 $

#eg <exm:algebra-automorphism-group> Consider the representation of $GL(V)$ in
the space of algebras on $V$ (i.e. tensors of the type $(1, 2)$). We find that
the group of automorphisms of any algebra is a linear Lie group.

=== The Image and the Kernel of a Homomorphism
<ss:image-and-kernel-of-homomorphism>
Suppose $f: G -> H$ is a Lie group homomorphism. Consider the action $alpha$ of
$G$ on the manifold $H$ defined by the formula
$ alpha(g) h = f(g) h, $
where the right-hand side is the product of elements of $H$. In other words,
$alpha$ is the composition of $f$ and the action $l$ of $H$ on itself by left
translations.

Let $e$ be the unit of $H$. Then $alpha_e = f$ and $alpha(G) e = f(G)$; the
stabilizer of $e$ with respect to $alpha$ coincides with $Ker f$.
Theorem~@th:stabilizer-is-lie-subgroup being applied to the action $alpha$ and
the point $e in H$ yields the following theorem.

#theorem[Suppose $f: G -> H$ is a Lie group homomorphism. Then $f$ is a mapping
  of constant rank. Let $rk f = k$. Then

  1) $Ker f$ is a Lie subgroup of codimension $k$ in $G$ and
  $T_e (Ker f) = Ker d_e f$;

  2) for any sufficiently small neighbourhood $cal(O)(e)$ of the unit of $G$ the
  subset $f(cal(O)(e))$ is a submanifold of dimension $k$ in $H$ and
  $T_e (f(cal(O)(e))) = Im d_e f$;

  3) if $f(G)$ is a Lie subgroup in $H$, then
  $dim f(G) = k$.] <th:kernel-is-lie-subgroup>

_Example._ Consider the homomorphism $det: GL_n (K) -> K^*$. Its kernel is the
group $SL_n (K)$ of unimodular matrices. Since $det(GL_n (K)) = K^*$, we have
$rk det = 1$. Hence $SL_n (K)$ is a Lie subgroup of codimension 1 in $GL_n (K)$.

Clearly, if $f(G)$ is a submanifold then $f(G)$ is a Lie subgroup in $H$. The
following example shows that $f(G)$ is not always a submanifold.

#problem[Let $f: RR -> TT^n$ be a Lie group homomorphism defined by the formula
  $
    f(x) = (e^(i a_1 x), ..., e^(i a_n x)), quad "where" quad
    a_1, ..., a_n in RR.
  $
  Its image $f(RR)$ is a Lie subgroup in $TT^n$ if and only if $a_1, ..., a_n$
  are commensurable (i.e. their ratios are
  rational).] <pr:torus-winding-commensurable>

#source(24)For $n = 2$ and incommensurable $a_1$, $a_2$ the subgroup $f(RR)$ is
a dense winding of a (two-dimensional) torus.

It can be shown that, for any $n$, if $a_1, ..., a_n$ are not related by any
nontrivial linear relation with rational coefficients the subgroup $f(RR)$ is
dense in $TT^n$.

Problem~@pr:compact-orbit-closed-submanifold implies that the image of a compact
Lie group under a homomorphism is always a Lie subgroup.

=== Coset Manifolds and Quotient Groups <ss:coset-manifolds-quotient-groups>
On the coset space of a Lie group with respect to a Lie subgroup, a
differentiable structure can be naturally defined. To formulate the
corresponding theorem we need several definitions.

Let $X$ and $Y$ be differentiable manifolds and $p: X -> Y$ a differentiable
surjective map. For any function $f$ defined on a subset $U subset Y$ we
determine the function $p^* f$ on $p^(-1) (U)$ by the formula
$ (p^* f)(x) = f(p(x)). $

The map $p$ is called a #idx(
  "quotient map of differentiable manifolds",
)_quotient map_ if

1) a subset $U subset Y$ is open if and only if $p^(-1) (U)$ is open in $X$;

2) a function $f$, defined on an open subset $U subset Y$, is differentiable if
and only if so is $p^* f$.

A map $p$ is called a #idx("bundle", "trivial")_trivial bundle with the fibre
$Z$_ (where $Z$ is also a differentiable manifold), if there is a diffeomorphism
$ nu: Y times Z -> X $
satisfying
$ p(nu(y, z)) = y. $

A map $p$ is called a #idx("bundle", "locally trivial")_locally trivial bundle
with the fibre $Z$_ if $Y$ can be covered by open subsets such that $p$ is a
trivial bundle with the fibre isomorphic to $Z$ over each of these subsets.

#problem[Any locally trivial bundle is a quotient
  map.] <pr:locally-trivial-bundle-quotient-map>

#problem[If a quotient map $p$ enters the commutative triangle
  $
    #cd(
      (X: (0, 0, $X$), Y: (0, 2, $Y$), Z: (1, 1, $Z$)),
      (
        ar("X", "Y", label: $p$),
        ar("X", "Z", label: $q$, side: "right"),
        ar("Y", "Z", label: $phi$),
      ),
      column: 14mm,
      row: 15mm,
    )
  $
  where $Z$ is a differentiable manifold and $q$ is a differentiable map, then
  $phi$ is differentiable. If in the above triangle the map $q$ also is a
  quotient map and $phi$ is bijective, then $phi$ is a
  diffeomorphism.] <pr:quotient-map-universal-property>

#source(25)The second assertion of Problem~@pr:quotient-map-universal-property
may be interpreted as follows: given a map $p$ of a differentiable manifold $X$
onto a set $Y$ there exists on $Y$ no more than one differentiable structure
such that $p$ is a factorization with respect to this structure.

#theorem[Let $G$ be a Lie group and $H$ its Lie subgroup. There is a unique
  differentiable structure on the space $G\/H$ of left cosets such that the
  canonical map
  $ p: G -> G\/H, quad "where" quad p: g |-> g H, $
  is a quotient map. With respect to this structure

  1) $p$ is a locally trivial bundle;

  2) the natural $G$-action on $G\/H$ (by left translations) is differentiable;

  3) if $H$ is a normal subgroup then the quotient group $G\/H$ is a Lie
  group.] <th:coset-manifold-structure>

#proof[In $G\/H$, introduce a topology assuming a subset $U subset G\/H$ open if
  and only if $p^(-1) (U)$ is open in $G$.

  #problem[$p$ is continuous and open.] <pr:coset-projection-open>

  #problem[$G\/H$ is a Hausdorff space.] <pr:coset-space-hausdorff>

  The key point in the proof of Theorem~@th:coset-manifold-structure is the
  following

  #problem[There is a submanifold $S subset G$ containing the unit $e$ and such
    that the map
    $ nu: S times H -> G, quad "where" quad nu: (s, h) |-> s h, $
    is a diffeomorphism of the direct product $S times H$ onto an open subset of
    $G$.] <pr:slice-transversal-to-subgroup>

  Under $p$ the submanifold $S$ is bijectively mapped onto a neighbourhood $U$
  of the point $p(e) = H$ in the space $G\/H$. Let us transport the
  differentiable structure from $S$ to $U$ by means of $p$. Then $p$ is a
  trivial bundle on $U$.

  Further, for any $g in G$ transport the differentiable structure from $U$ to
  $g U$ by means of the left translation by $g$. Since $p$ commutes with the
  left translations, and by the definition of the differentiable structure on
  $g U$ the map $p$ defines a trivial bundle structure on $g U$. In particular,
  it is a quotient map over $g U$
  (Problem~@pr:locally-trivial-bundle-quotient-map). This implies that for any
  $g_1, g_2 in G$ the differentiable structures defined on $g_1 U$ and $g_2 U$
  coincide on $g_1 U inter g_2 U$ (Problem~@pr:quotient-map-universal-property).
  Thus, our definition of the differentiable structure on $G\/H$ implies that
  $p$ is a locally trivial bundle with respect to this structure.

  To prove statements 2) and 3) of the theorem we need

  #problem[Let $p_i: X_i -> Y_i$ be a locally trivial bundle with the fibre
    $Z_i$ for $i = 1, 2$. Then
    $
      p_1 times p_2: X_1 times X_2 -> Y_1 times Y_2, quad "where" quad
      p_1 times p_2: (x_1, x_2) |-> (p_1 (x_1), p_2 (x_2)),
    $
    is a locally trivial bundle with the fibre
    $Z_1 times Z_2$.] <pr:product-of-locally-trivial-bundles>

  #source(26)The natural $G$-action on $G\/H$ is defined by the map
  $
    lambda: G times G\/H -> G\/H, quad "where" quad
    lambda: (g', g H) |-> g' g H,
  $
  which enters the commutative diagram
  $
    #cd(
      (
        A: (0, 0, $G times G$),
        B: (0, 1, $G$),
        C: (1, 0, $G times G\/H$),
        D: (1, 1, $G\/H$),
      ),
      (
        ar("A", "B", label: $mu$),
        ar("A", "C", label: $id times p$, side: "right"),
        ar("A", "D", label: $q$, side: "right"),
        ar("B", "D", label: $p$),
        ar("C", "D", label: $lambda$),
      ),
      column: 32mm,
      row: 24mm,
    )
  $
  where $mu$ is the multiplication in $G$. The map $id times p$ is a locally
  trivial bundle, hence a quotient map. Applying
  Problem~@pr:quotient-map-universal-property to the commutative triangle made
  of $id times p$, $q = p compose mu$ and $lambda$ we see that $lambda$ is a
  differentiable mapping.

  Similarly, from the commutative diagram
  $
    #cd(
      (
        A: (0, 0, $G times G$),
        B: (0, 1, $G$),
        C: (1, 0, $G\/H times G\/H$),
        D: (1, 1, $G\/H$),
      ),
      (
        ar("A", "B", label: $mu$),
        ar("A", "C", label: $p times p$, side: "right"),
        ar("A", "D"),
        ar("B", "D", label: $p$),
        ar("C", "D", label: $mu_H$),
      ),
      column: 32mm,
      row: 24mm,
    )
  $
  we deduce the differentiability of the multiplication $mu_H$ in the quotient
  group $G\/H$ when $H$ is a normal subgroup.]

In conclusion, note that the tangent map
$ d_e p: T_e (G) -> T_(p(e)) (G\/H) $
is onto and its kernel is $T_e (H)$. (This follows for instance, from heading 1)
of the theorem). Therefore $T_(p(e)) (G\/H)$ is naturally identified with
$T_e (G)\/T_e (H)$.

#problem[Let a Lie group $G$ act on a differentiable manifold $X$ and let
  $N subset G$ be a normal Lie subgroup contained in the kernel of this action.
  Then the induced action of the Lie group $G\/N$ on $X$ is
  differentiable.] <pr:induced-quotient-group-action>

Running ahead, note that the kernel itself is a (normal) Lie subgroup of $G$.
This follows from Theorem~@th:intersection-of-lie-subgroups since the kernel is
the intersection of all stabilizers.

#problem[Let $H$ be a Lie subgroup of $G$ and $N$ a normal Lie subgroup
  contained in $H$. Then $H\/N$ is a Lie subgroup of
  $G\/N$.] <pr:lie-subgroup-mod-normal-subgroup>

=== Theorems on Transitive Actions and Epimorphisms
<ss:transitive-actions-epimorphisms>
An action $alpha$ of a group $G$ on a set $X$ is called #idx(
  "Action",
  "transitive",
)_transitive_ if for any $x, x' in X$ there is a $g in G$ such that
$alpha(g) x = x'$. In this case the map $alpha_x$ is onto and we have the
commutative triangle
#source(27)
$
  #cd(
    (G: (0, 0, $G$), X: (1, 1, $X$), Q: (2, 0, $G\/G_x$)),
    (
      ar("G", "X", label: $alpha_x$),
      ar("G", "Q", label: $p$, side: "right"),
      ar("Q", "X", label: $beta_x$, side: "right"),
    ),
    column: 24mm,
    row: 10mm,
  )
$ <eq:orbit-map-factorization>
where $beta_x$ is a bijection commuting with the $G$-action.

#theorem[Let $G$ be a Lie group and $alpha$ its transitive action on a
  differentiable manifold $X$. For any $x in X$ the map
  $ beta_x: G\/G_x -> X, quad "where" quad beta_x: g G_x |-> alpha(g) x, $
  is a diffeomorphism commuting with the
  $G$-action.] <th:transitive-action-coset-space>

#proof[Since $p$ is a quotient map, the commutativity of
  @eq:orbit-map-factorization implies that $beta_x$ is a differentiable map
  (Problem~@pr:quotient-map-universal-property). By
  Theorem~@th:stabilizer-is-lie-subgroup
  $ rk alpha_x = dim X = dim G\/G_x $
  so the tangent map $d alpha_x$ is onto (at each point). Hence, the map
  $d beta_x$ is an isomorphism of tangent spaces. Therefore $beta_x$ is a
  diffeomorphism.]

Now, let $f: G -> H$ be an epimorphism of Lie groups. Then the $G$-action
$alpha$ on $H$ defined in @ss:image-and-kernel-of-homomorphism is transitive.
Applying Theorem~@th:transitive-action-coset-space to this action we obtain the
following theorem.

#theorem[Let $f: G -> H$ be a Lie group epimorphism. The map
  $ f: G\/Ker f -> H, wide g Ker f |-> f(g) $
  is a Lie group isomorphism.] <th:epimorphism-quotient-isomorphism>

#corollary[A bijective Lie group homomorphism is an isomorphism.]

=== Homogeneous Spaces <ss:homogeneous-spaces>
A differentiable manifold $X$ with a transitive action of a Lie group $G$ on it
is called a #idx("space", "homogeneous")_homogeneous space of $G$._ By
Theorem~@th:transitive-action-coset-space any homogeneous space of $G$ is
isomorphic to $G\/H$, where $H subset G$ is a Lie subgroup, with the canonical
$G$-action. Homogeneous spaces are the most important and interesting objects of
geometry.

In geometry significant is not the $G$ itself but its image in $Diff X$.
Therefore in the study of homogeneous spaces from this point of view we may
confine ourselves to effective actions (see
Problem~@pr:induced-quotient-group-action).

The linear group $d_x G_x quad (x in X)$ is called the #idx(
  "isotropy group",
)_isotropy group_ of the homogeneous space $X$ (at $x$).

_Examples._ #eg <exm:constant-curvature-spaces> The spaces of constant
curvature---the Euclidean space $E^n$, the sphere $S^n$ ($n >= 2$) and the
Lobachevsky space $L^n$ ($n >= 2$)---may be considered as #source(
  28,
)homogeneous spaces of their groups of motions which are in a natural sense
(real) Lie groups and act in a differentiable way.

The group of motions of the Euclidean space is a Lie subgroup of the group of
affine transformations (cf. Example in @ss:inverse-image-of-lie-subgroup). Its
construction is described in Example~@exm:translations-semidirect-splitting. The
sphere $S^n$ is naturally embedded in $RR^(n+1)$ so that its motions are induced
by orthogonal transformations of $RR^(n+1)$. This establishes an isomorphism of
the group of motions of $S^n$ with the Lie group $upright(O)_(n+1)$. Similarly,
$L^n$ is embedded in $RR^(n+1)$ as a connected component of the two-sheeted
hyperboloid $x_0^2 - x_1^2 - dots.c - x_n^2 = 1$, so that its motions are
induced by the pseudoorthogonal (preserving the quadratic form
$x_0^2 - x_1^2 - dots.c - x_n^2$) transformations of $RR^(n+1)$ mapping each
connected component of this hyperboloid onto itself. This establishes an
isomorphism of the group of motions of $L^n$ with the subgroup of index 2 of the
Lie group $upright(O)_(1, n)$ of all pseudoorthogonal transformations (cf.
Problem~@pr:so-kl-two-components).

In these three cases the stabilizer of a point is isomorphic to $upright(O)_n$.
More precisely it is isomorphic (via the differential) to the isotropy group
which coincides with the full orthogonal group of the tangent space.

The spaces of constant curvature may be characterized as simply connected
homogeneous spaces of real Lie groups satisfying one of the following equivalent
conditions (see e.g. [@bib:Wolf1972]):

a) there exists an invariant Riemannian metric of constant sectional curvature;

b) the isotropy group coincides with the full orthogonal group of the tangent
space (with respect to some Euclidean metric).

#eg <exm:grassmann-variety-homogeneous> The #idx(
  "Grassmann variety",
)_Grassmann variety_ $Gr_(n, p) (K)$ of all $p$-dimensional subspaces of $K^n$
is a homogeneous space of $GL_n (K)$. The stabilizer of the subspace determined
by $x_(p+1) = dots.c = x_n = 0$ consists of matrices of the form
$
  mat(A, C; O, B), quad "where" quad A in GL_p (K), quad
  B in GL_(n-p) (K),
$
and its codimension in $GL_n (K)$ is $p(n - p)$. Therefore
$dim Gr_(n, p) (K) = p(n - p)$.

#eg <exm:positive-definite-matrices> The manifold of positive definite symmetric
real $n times n$ matrices is a homogeneous space of $GL_n (RR)$ with respect to
the action $Sq$ defined in Problem~@pr:conjugation-congruence-representations
(cf. Example~@exm:orthogonal-group-of-form). Since the stabilizer of the unit
matrix under this action coincides with the orthogonal group $upright(O)_n$,
this homogeneous space is isomorphic to $GL_n (RR)\/upright(O)_n$.

#eg <exm:group-as-homogeneous-space> The group manifold of a Lie group $G$ may
be considered as a homogeneous space of the Lie group $G times G$ with respect
to the action $beta$ defined by the formula
$ beta(g_1, g_2) x = g_1 x g_2^(-1) quad (g_1, g_2, x in G) $
The stabilizer of $e in G$ is the diagonal of $G times G$ (isomorphic to $G$)
and the isotropy group coincides with the adjoint group $Ad G$ (see
@ss:adjoint-representation-jacobi).

=== Inverse Image of a Lie Subgroup with Respect to a Homomorphism
<ss:inverse-image-of-lie-subgroup>

#theorem[#source(29)Suppose $f: G -> H$ is a Lie group homomorphism and $H_1$ is
  a Lie subgroup in $H$. Then $G_1 = f^(-1) (H_1)$ is a Lie subgroup in $G$ and
  $ T_e (G_1) = (d_e f)^(-1) (T_e (H_1)). $] <th:preimage-of-lie-subgroup>

#proof[Consider the composition $alpha = beta compose f$ of the natural
  $H$-action $beta$ on $H\/H_1$ and the homomorphism $f$:
  $ alpha = beta compose f: G -> Diff H\/H_1. $
  The subgroup $G_1 = f^(-1) (H_1)$ is the stabilizer of the point
  $p(e) in H\/H_1$, where $p$ is the canonical projection of $H$ onto $H\/H_1$.
  By Theorem~@th:stabilizer-is-lie-subgroup $G_1$ is a Lie subgroup and
  $ T_e (G_1) = Ker d_e alpha_(p(e)). $
  Clearly, $alpha_(p(e)) = p compose f$. Hence,
  $ d_e alpha_(p(e)) = d_e p compose d_e f. $
  Since $Ker d_e p = T_e (H_1)$, we have
  $ Ker d_e alpha_(p(e)) = (d_e f)^(-1) (T_e (H_1)). $
  The theorem is proved.]

_Example._ Let $S$ be a Euclidean affine space, $V$ the associated Euclidean
vector space and $d: GA(S) -> GL(V)$ the homomorphism assigning to each affine
transformation its differential, cf.
Example~@exm:affine-linear-part-homomorphism. Then $d^(-1) (upright(O)(V))$ is
the group of motions of $S$. Theorem~@th:preimage-of-lie-subgroup enables us to
deduce that the group of motions of a Euclidean space is a Lie subgroup in the
Lie group of all affine transformations.

Let us show several applications of Theorem~@th:preimage-of-lie-subgroup which
will be used in what follows.

#problem[Let $H_1$ and $H_2$ be Lie subgroups of $G$. Then $H_1 inter H_2$ is
  also a Lie subgroup and $T_e (H_1 inter H_2) = T_e (H_1) inter T_e (H_2)$.]
<pr:intersection-of-two-lie-subgroups>

Observe that the intersection of submanifolds is not, in general, a submanifold.
For example, in $CC^3$, the intersection of the nonsingular surface
$z = x^2 + y^3$ with the plane $z = 0$ is a singular curve (cuspidal cubic
curve) which is not a submanifold.

The statement of Problem~@pr:intersection-of-two-lie-subgroups can be easily
extended to any finite number of subgroups. It is also valid for an infinite
number of subgroups (see Theorem~@th:intersection-of-lie-subgroups).

#source(30)In the following two problems Theorem~@th:preimage-of-lie-subgroup is
applied to a linear representation. Since $GL(V)$ is an open subset in the space
$upright(L)(V)$ the tangent space to $GL(V)$ (at any point) is naturally
identified with $upright(L)(V)$.

#problem[Let $R: G -> GL(V)$ be a linear representation of a Lie group $G$ and
  $U subset V$ a subspace. Then
  $ G(U) = {g in G: R(g) U subset U} $
  is a Lie subgroup in $G$ and
  $
    T_e (G(U)) = {xi in T_e (G): (d_e R)(xi) U subset U}.
  $] <pr:stabilizer-of-subspace>

#problem[Under the conditions of Problem~@pr:stabilizer-of-subspace let $W$ be a
  subspace of $U$. Then
  $ G(U, W) = {g in G: (R(g) - E) U subset W} $
  is a Lie subgroup in $G$ and
  $
    T_e (G(U, W)) = {xi in T_e (G): (d_e R)(xi) U subset W}.
  $] <pr:trivial-on-subquotient-subgroup>

=== Semidirect Product <ss:semidirect-product-lie-groups>
In many cases it is convenient to describe the structure of Lie groups in terms
of semidirect products.

Recall that the #idx("product", "semidirect", "of Lie groups")_semidirect
product_ of abstract groups $G_1$ and $G_2$ is the direct product of sets $G_1$
and $G_2$ endowed with the group structure via
$
  (g_1, g_2)(h_1, h_2) = (g_1 dot b(g_2) h_1, g_2 h_2),
$ <eq:semidirect-product-multiplication>
where $b$ is a homomorphism of $G_2$ into the group $Aut G_1$ of automorphisms
of the group $G_1$. We will denote the semidirect product by $G_1 times.r G_2$
or more precisely, by $G_1 times.r_b G_2$. The elements of the form $(g_1, e)$
(resp. $(e, g_2)$) form a subgroup in $G_1 times.r_b G_2$ isomorphic to $G_1$
(resp. $G_2$). This subgroup is usually identified with $G_1$ (resp. $G_2$). The
subgroup $G_1$ is normal and
$
  g_2 g_1 g_2^(-1) = b(g_2) g_1 wide (g_1 in G_1, g_2 in G_2).
$ <eq:semidirect-conjugation-action>

The subgroup $G_2$ is normal if and only if $b$ is trivial i.e. $b(G_2) = e$; in
this case the semidirect product coincides with the direct product
$G_1 times G_2$.

One says that a group $G$ _splits into a semidirect product of subgroups
$G_1$_ and $G_2$ if

1) $G_1$ is normal;

2) $G_1 G_2 = G$;

3) $G_1 inter G_2 = {e}$.

In this case we have the isomorphism
$
  G_1 times.r G_2 tilde.equiv G, wide (g_1, g_2) |-> g_1 g_2,
$ <eq:semidirect-splitting-isomorphism>
#source(31)where $b: G_2 -> Aut G_1$ is the homomorphism defined by
@eq:semidirect-conjugation-action and we will write $G = G_1 times.r G_2$ or
$G = G_2 times.l G_1$.

A #idx("product", "semidirect", "of Lie groups")_semidirect product of Lie
groups_ $G_1$ and $G_2$ is defined as a semidirect product of abstract groups
endowed with a differentiable structure as the direct product of differentiable
manifolds. It is additionally required that $b$ define differentiable
$G_2$-action on $G_1$, i.e. that the map
$
  G_1 times G_2 -> G_1, wide (g_1, g_2) |-> b(g_2) g_1
$ <eq:semidirect-action-map>
be differentiable. (In particular, the automorphism $b(g_2)$ of $G_1$ must be
differentiable for any $g_2 in G_2$). This ensures the differentiability of
group operations in the semidirect product.

One says that a _Lie group $G$ splits into a semidirect product of Lie
subgroups_ $G_1$ and $G_2$ if it splits into their semidirect product as an
abstract group. In this case the action $b$ of $G_2$ on $G_1$ defined by
@eq:semidirect-conjugation-action is differentiable and the abstract
isomorphism~@eq:semidirect-splitting-isomorphism due to the corollary of
Theorem~@th:epimorphism-quotient-isomorphism is a Lie group isomorphism.

_Examples._ #eg <exm:representation-semidirect-product> Let $R: G -> GL(V)$ be a
linear representation of a Lie group $G$. Then we may form a semidirect product
$V times.r_R G$ where $V$ is considered as a vector Lie group.

#eg <exm:affine-group-semidirect> Let $Id$ be the identity linear representation
of $GL(V)$ in $V$. Then there is an isomorphism
$ V times.r_Id GL(V) tilde.equiv GA(V) $
assigning to each $v in V$ a parallel translation
$ t_v: x |-> x + v, wide (x in V). $

#eg <exm:translations-semidirect-splitting> Every Lie subgroup $G subset GA(V)$
containing all parallel translations splits into the semidirect product of the
group of parallel translations and some linear Lie group
$ H = d G subset GL(V). $
In particular, the group of motions of the Euclidean space $E^n$ splits into the
semidirect product of the group of parallel translations and the orthogonal
group $upright(O)_n$.

#eg <exm:triangular-group-splitting> The Lie group of invertible triangular
matrices splits into the semidirect product of the normal Lie subgroup of
unitriangular matrices (triangular with the units on the diagonal) and the Lie
subgroup of invertible diagonal matrices.

#exercises[
  #exercise[If a group is endowed with the structure of a differentiable
    manifold such that the multiplication is differentiable, then the inversion
    is also differentiable.] <exc:differentiable-inversion-automatic>

  #exercise[#source(32)Consider the group $GL_n (HH)$ of invertible $n times n$
    matrices over $HH$ as an open subset of the real vector space of all
    quaternionic $n times n$ matrices. Show that $GL_n (HH)$ thus endowed with a
    differentiable manifold structure is a real Lie group of dimension
    $4 n^2$.] <exc:quaternionic-general-linear-group>

  #exercise[The group $Sp_n$ of unitary quaternionic matrices is a Lie subgroup
    of dimension $2 n^2 + n$ in $GL_n (HH)$.] <exc:quaternionic-unitary-group>

  #exercise[Find all the Lie subgroups of the additive Lie group
    $K$.] <exc:subgroups-of-additive-group>

  #exercise[Any homomorphism $f$ of the additive Lie group $K$ into $GL_n (K)$
    is of the form $f(t) = exp(t X)$, where
    $X in upright(L)_n (K)$.] <exc:one-parameter-matrix-subgroups>

  #exercise[The centralizer $Z(g)$ of any element $g$ of a Lie group $G$ is a
    Lie subgroup.] <exc:centralizer-of-element>

  #exercise[The dimension of the centralizer of any element of $GL_n (K)$ is not
    less than $n$.] <exc:centralizer-dimension-in-gln>

  #exercise[The Lie group $Sp_n$ (see Exercise~@exc:quaternionic-unitary-group)
    is compact.] <exc:quaternionic-unitary-compact>

  #exercise[The action of $GL_n (K)$ on $Gr_(n, p) (K)$ is
    differentiable.] <exc:grassmannian-action-differentiable>

  #exercise[Let $W subset U$ be subspaces of a vector space $V$ over $K$. Let
    $H$ be a Lie subgroup of $GL(U\/W)$. Then the set of invertible linear
    transformations of $V$ preserving $U$ and $W$ and inducing on $U\/W$
    transformations from the group $H$ is a Lie subgroup in
    $GL(V)$.] <exc:subquotient-induced-subgroup>

  #exercise[The Lie group $GL_n (K)$ splits into the semidirect product of
    $SL_n (K)$ and a one-dimensional Lie
    subgroup.] <exc:gln-as-semidirect-product>
]

#hints[
  #hint[@pr:lie-subgroup-local-criterion][Note that the left translation by any
    element of $H$ is an $H$-preserving diffeomorphism of the manifold $G$.]

  #hint[@pr:lie-subgroup-is-closed][As any submanifold, the Lie subgroup $H$ is
    open in its closure $overline(H)$. If $g in overline(H)$, then $g H$ is also
    open in $overline(H)$, hence intersects with $H$, and therefore $g in H$.]

  #hint[@pr:sum-product-dual-representations][Compute the matrix elements of the
    representations $R + S$, $R S$ and $R^*$ in convenient bases. For example,
    if ${e_i}$ is a basis of the space $V$ and ${f_j}$ is a basis of $U$ then
    ${e_i times.o f_j}$ is a basis of $V times.o U$. The matrix elements of the
    representation $R S$ in this basis are products of matrix elements of the
    representations $R$ and $S$.]

  #hint[@pr:prove-tensor-action-formulas][It suffices to prove these formulas
    for simple tensors $f$ and $F$, respectively.]

  #hint[@pr:conjugation-congruence-as-tensors][It suffices to look at the action
    of $Ad(A)$ and $Sq(A)$ on simple tensors (corresponding to matrices of rank
    1).]

  #hint[@pr:orbit-map-constant-rank][Use the commutative diagram
    $
      #cd(
        (A: (0, 0, $G$), B: (0, 1, $X$), C: (1, 0, $G$), D: (1, 1, $X$)),
        (
          ar("A", "B", label: $alpha_x$),
          ar("A", "C", label: $l(g)$, side: "right"),
          ar("B", "D", label: $alpha(g)$),
          ar("C", "D", label: $alpha_x$),
        ),
        column: 26mm,
        row: 22mm,
      )
    $]

  #hint[@pr:compact-orbit-closed-submanifold][It suffices to show that the orbit
    $alpha(G) x$ is a submanifold in a neighbourhood of $x$. Let $cal(O)(e)$ be
    a neighbourhood of the unit of $G$ such that $U = alpha(cal(O)(e)) x$ is
    #source(33)a submanifold in $X$. The orbit $alpha(G) x$ is the union of the
    two nonintersecting subsets: $U$ and $alpha(C) x$, where
    $C = G without cal(O)(e) G_x$. Since
    $cal(O)(e) G_x = union.big_(g in G_x) cal(O)(e) g$ is open in $G$, its
    complement, $C$, is closed and therefore compact; but then
    $alpha(C) x = alpha_x (C)$ is compact, hence closed in $X$. Thus the
    intersection of $alpha(G) x$ with the open subset $X without alpha(C) x$ of
    $X$ containing $x$ is a submanifold.]

  #hint[@pr:torus-winding-commensurable][Suppose $a_n != 0$. The intersection of
    the subgroup $f(RR)$ with the subgroup
    $ TT^(n-1) = {(z_1, ..., z_n) in TT^n: z_n = 1} $
    is a cyclic group with generator
    $ t = (e^(2 pi i (a_1\/a_n)), ..., e^(2 pi i (a_(n-1)\/a_n)), 1). $
    If at least one of $a_1\/a_n, ..., a_(n-1)\/a_n$ is irrational, then $t$ is
    an element of infinite order, and $f(RR) inter TT^(n-1)$ is not closed in
    $TT^(n-1)$. But then $f(RR)$ is not closed in $TT^n$, hence is not a Lie
    subgroup (see Problem~@pr:lie-subgroup-is-closed).

    Conversely, suppose $a_1, ..., a_n$ are commensurable. Let us assume that
    not all of them are zero. Then $Ker f = b ZZ$, where $b > 0$. Let $U$ be a
    neighbourhood of the origin of $RR$ such that $f(U)$ is a submanifold in
    $TT^n$. The complement of the open submanifold $U + b ZZ$ in $RR$ will be
    denoted by $C$. Since $f(C) = f(C inter [0, b])$ and since $C inter [0, b]$
    is compact, $f(C)$ is closed in $TT^n$. The complement of $f(C)$ is open and
    contains the unit of $TT^n$; the intersection of $f(RR)$ with this open set
    coincides with $f(U)$. Hence, $f(RR)$ is a Lie subgroup (see
    Problem~@pr:lie-subgroup-local-criterion).]

  #hint[@pr:coset-space-hausdorff][Let $g_1 H$ and $g_2 H$ be different cosets.
    Then $g_1^(-1) g_2 in.not H$. Since the group operations are continuous and
    $H$ is closed (Problem~@pr:lie-subgroup-is-closed), there are neighbourhoods
    $cal(O)(g_1)$ and $cal(O)(g_2)$ of $g_1$ and $g_2$, respectively, such that
    $cal(O)(g_1)^(-1) cal(O)(g_2) inter H = emptyset$. Then
    $cal(O)(g_1) H inter cal(O)(g_2) H = emptyset$. Hence $p(cal(O)(g_1))$ and
    $p(cal(O)(g_2))$ are nonintersecting neighbourhoods of the cosets $g_1 H$
    and $g_2 H$ in the space $G\/H$.]

  #hint[@pr:slice-transversal-to-subgroup][Let $S_1$ be a submanifold
    transversal to $H$ at the point $e$, i.e. such that
    $ T_e (G) = T_e (H) plus.o T_e (S_1). $
    Since
    $ d_((e, e)) nu(d s, d h) = d s + d h, $
    then $d_((e, e)) nu$ is an isomorphism of the tangent spaces. Hence, there
    exist neighbourhoods $S_2$ and $cal(O)_H (e)$ of the point $e$ in the
    manifolds $S_1$ and $H$, respectively, such that $nu$ diffeomorphically maps
    $S_2 times cal(O)_H (e)$ onto an open subset of $G$. Since
    $nu(s, h h') = nu(s, h) h'$, the mapping $nu$ is a local diffeomorphism
    everywhere on $S_2 times cal(O)_H (e)$. Let $S$ be a neighbourhood of $e$ in
    $S_2$ such that $S^(-1) S inter H subset cal(O)_H (e)$. Then $nu$ is locally
    diffeomorphic and injective on $S times H$, thus $S$ is the desired
    submanifold.]

  #hint[@pr:induced-quotient-group-action][#source(34)Consider the commutative
    diagram
    $
      #cd(
        (A: (0, 0, $G times X$), B: (0, 1, $X$), C: (1, 0, $G\/N times X$)),
        (
          ar("A", "B"),
          ar("A", "C", label: $p times id$, side: "right"),
          ar("C", "B"),
        ),
        column: 30mm,
        row: 22mm,
      )
    $
    where the horizontal arrow is the map defined by the given $G$-action on $X$
    and use the fact that $p times id$ is a quotient map.]

  #hint[@pr:lie-subgroup-mod-normal-subgroup][Apply
    Problem~@pr:induced-quotient-group-action to the canonical $G$-action on
    $G\/H$.]

  #hint[@pr:intersection-of-two-lie-subgroups][Apply
    Theorem~@th:preimage-of-lie-subgroup to the identity embedding
    $H_1 arrow.r.hook G$ and the subgroup $H_2 subset G$.]

  #hint[@pr:stabilizer-of-subspace][Apply Theorem~@th:preimage-of-lie-subgroup
    to the homomorphism $R$ and the subgroup
    $ GL(V; U) = {A in GL(V): A U subset U} subset GL(V). $
    It is easy to see that $GL(V; U)$ is an open subset in the space
    $ upright(L)(V; U) = {X in upright(L)(V): X U subset U}. $
    Hence, $GL(V; U)$ is a linear Lie group and
    $ T_E (GL(V; U)) = upright(L)(V; U). $]

  #hint[@pr:trivial-on-subquotient-subgroup][Apply
    Theorem~@th:preimage-of-lie-subgroup to the homomorphism $R$ and the
    subgroup
    $ GL(V; U, W) = {A in GL(V): (A - E) U subset W} subset GL(V). $
    It is easy to see that $GL(V; U, W)$ is an open subset in the plane
    $E + upright(L)(V; U, W)$, where
    $ upright(L)(V; U, W) = {X in upright(L)(V): X U subset W}. $
    Hence, $GL(V; U, W)$ is a linear Lie group and
    $ T_E (GL(V; U, W)) = upright(L)(V; U, W). $]
]
