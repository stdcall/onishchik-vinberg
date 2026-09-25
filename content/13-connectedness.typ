// Chapter 1, § 3. Connectedness and Simple Connectedness. Printed pages
// 42-50; pages 42 and 50 are shared with § 2 and § 4.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/cd.typ": ar, cd

== Connectedness and Simple Connectedness
<sec:connectedness-simple-connectedness>

As shown in §~@sec:lie-group-tangent-algebra
(Theorems~@th:homomorphism-determined-by-differential and
@th:homomorphism-existence-simply-connected) connectedness and simple
connectedness play an important role even at the first stages of the Lie group
theory. That is why we have devoted to them a separate section.

The definition of the fundamental group and the proof of topological theorems
used in this section (the existence of the simply connected covering, the
exactness of the homotopy sequence of a locally trivial bundle, etc.) can be
found e.g. in #source(58)\[@bib:Rokhlin1984\]. One should have in mind that
these theorems hold and are naturally proved for more general topological spaces
and their maps rather than differentiable manifolds and differentiable maps we
deal with in this book.

=== Connectedness <ss:connectedness-lie-groups>
A topological space is called _connected_ if it is not a union of two
non-intersecting non-empty open subsets and #idx(
  "pathwise connected",
)_pathwise connected_ if any two of its points can be joined by a continuous
path. For a differentiable manifold these notions coincide. Moreover, any two
points of a connected differentiable manifold can be joined by a
_differentiable_ path. Connected components of a differentiable manifold are
both open and closed. The assumption of existence of a countable base implies
that a differentiable manifold has a finite or countable number of connected
components.

Denote by $G^0$ the connected component of a Lie group $G$, which contains $e$.

#theorem[$G^0$ is a normal Lie subgroup of $G$. Other connected components of
  $G$ are cosets with respect to $G^0$. The quotient group $G\/G^0$ is
  discrete.] <th:identity-component-normal>

#problem[Prove
  Theorem~@th:identity-component-normal.] <pr:prove-identity-component-normal>

#problem[Any open Lie subgroup of $G$ is closed and contains
  $G^0$.] <pr:open-subgroup-closed>

#problem[A connected Lie group is generated (as an abstract group) by any
  neighbourhood of the unit.] <pr:unit-neighbourhood-generates-group>

#problem[Any closed subgroup of a finite index of a Lie group is
  open.] <pr:finite-index-closed-subgroup-open>

#theorem[Let $G$ be a Lie group and $alpha$ its transitive action on a connected
  differentiable manifold $X$. Then

  1) the Lie group $G^0$ also acts transitively on $X$;

  2) $G\/G^0 tilde.equiv G_x\/G_x inter G^0$ for any point $x in X$;

  3) if the stabilizer $G_x$ is connected for some $x in X$ then so is
  $G$.] <th:transitive-action-connectedness>

#problem[Prove Theorem~@th:transitive-action-connectedness.]
<pr:prove-transitive-action-connectedness>

Theorem~@th:transitive-action-connectedness enables us to answer the question
whether the classical linear Lie groups are connected.

#problem[$SL_n (K)$ is connected.] <pr:special-linear-connected>

#problem[$upright(O)_n (K)$ has two connected components. One that contains the
  unit is the subgroup $SO_n (K)$ of unimodular orthogonal
  matrices.] <pr:orthogonal-two-components>

An $n times n$ matrix ($n$ being even) is called #idx(
  "matrix",
  "symplectic",
)_symplectic_ if the corresponding linear transformation of $K^n$ preserves the
skew-symmetric bilinear form with the matrix $mat(0, E; -E, 0)$. The group of
symplectic matrices is denoted by $Sp_n (K)$. This is a Lie group of dimension
$n(n + 1)\/2$ (see @ss:orbits-and-stabilizers[°],
Example~@exm:symplectic-group-of-form[]).

#problem[$Sp_n (K)$ is connected.] <pr:symplectic-connected>

Consider a more complicated example. Let $k, l > 0$ and $k + l = n$. A real
matrix of order $n$ is called #idx(
  "matrix",
  "pseudoorthogonal",
)_pseudoorthogonal of signature $(k, l)$_ if the corresponding linear
transformation preserves the quadratic form
#source(59)
$ q(x) = x_1^2 + dots.c + x_k^2 - x_(k+1)^2 - dots.c - x_n^2. $
The group of pseudoorthogonal matrices of signature $(k, l)$ is denoted by
$upright(O)_(k, l)$. It is a Lie group of dimension $n(n - 1)\/2$ (see
Example~@exm:orthogonal-group-of-form). Clearly
$upright(O)_(k, l) tilde.equiv upright(O)_(l, k)$. As in the case of usual
orthogonal matrices, the subgroup $SO_(k, l)$ of unimodular pseudoorthogonal
matrices is an open subgroup of index 2 in $upright(O)_(k, l)$. But, as we will
see, it is not connected.

#problem[The upper left minor $d_k (A)$ of order $k$ of any pseudoorthogonal
  matrix $A in upright(O)_(k, l)$ is
  nonzero.] <pr:pseudoorthogonal-leading-minor-nonzero>

$SO_(k, l)$ contains matrices with both positive and negative values of $d_k$.
Such matrices are easy to find even among diagonal matrices. Since the subsets
that are distinguished by inequalities $d_k > 0$ and $d_k < 0$ are open, the
group $SO_(k, l)$ is not connected.

#problem[$SO_(k, l)$ has two connected components. The connected component
  containing the unit is distinguished by $d_k > 0$.] <pr:so-kl-two-components>

=== Covering Homomorphisms <ss:covering-homomorphisms>
The principal technique of Lie group theory consists in replacing the study of
Lie groups by the study of their tangent algebras. The applicability of this
method depends on the extent to which a Lie group can be recovered from its
tangent algebra. Such a recovery is possible and unique for simply connected Lie
groups (Corollary of Theorem~@th:homomorphism-existence-simply-connected), and
connected Lie groups are determined up to covering homomorphisms.

Recall that a #idx("covering")_covering_ is a locally trivial bundle with a
discrete fibre.

#problem[Let $f$ be a homomorphism of a connected Lie group $G$ onto a Lie group
  $H$. The following conditions are equivalent:

  1) $f$ is a diffeomorphism of a neighbourhood of the unit of $G$ onto a
  neighbourhood of the unit of $H$;

  2) the kernel of $f$ is discrete;

  3) $f$ is a covering;

  4) $d f$ is a tangent algebra
  isomorphism.] <pr:covering-homomorphism-criteria>

Homomorphisms satisfying conditions of
Problem~@pr:covering-homomorphism-criteria will be called #idx(
  "homomorphism",
  "covering",
)_covering homomorphisms._

_Examples._ #eg <exm:line-covers-circle> The homomorphism
$ f: RR -> TT, quad "where" quad f: x |-> e^(i x), $
is covering since its kernel, i.e. $2 pi ZZ$, is discrete.

#eg <exm:sl2-covers-so3> Consider the adjoint representation $Ad$ of the Lie
group $SL_2 (CC)$. The transformations
$ Ad A: X |-> A X A^(-1) wide (A in SL_2 (CC), X in frak(s l)_2 (CC)) $
preserve the function $det$ which is a nondegenerate quadratic form on
$frak(s l)_2 (CC)$ and #source(60)$Ad SL_2 (CC) subset upright(O)(frak(s l)_2
  (CC), det) tilde.eq upright(O)_3 (CC)$. The kernel of $Ad$ is the center of
$SL_2 (CC)$ which consists of $E$ and $-E$.

Since $dim SL_2 (CC) = dim upright(O)_3 (CC) = 3$ and $SL_2 (CC)$ is connected,
$Ad SL_2 (CC)$ coincides with the connected component of
$upright(O)(frak(s l)_2 (CC), det)$, i.e. with the subgroup
$SO(frak(s l)_2 (CC), det) tilde.equiv SO_3 (CC)$. Thus, there is a covering
homomorphism $SL_2 (CC) -> SO_3 (CC)$ whose kernel consists of $E$ and $-E$.

#problem[Any discrete normal subgroup of a connected Lie group $G$ is contained
  in the center of $G$.] <pr:discrete-normal-subgroup-central>

Thus, for a given connected Lie group $G$ the description of covering
homomorphisms $G -> H$ boils down to the description of discrete central
subgroups of $G$.

=== Simply Connected Covering Lie Groups <ss:simply-connected-covering-groups>
A connected differentiable manifold is called _simply connected_ if any closed
path in it is homotopic to a trivial one. It is known [@bib:Rokhlin1984] that
any connected differentiable manifold can be covered by a simply connected
manifold. For the sake of brevity we call it the simply connected covering.

The following functorial property holds.

(_F_) Let $X$ and $Y$ be connected manifolds, $f: X -> Y$ a differentiable map.
Let $p: tilde(X) -> X$ and $q: tilde(Y) -> Y$ be the simply connected coverings.
Then for any points $tilde(x)_0 in tilde(X)$ and $tilde(y)_0 in tilde(Y)$ such
that $f(p(tilde(x)_0)) = q(tilde(y)_0)$ there exists a unique differentiable map
$tilde(f): tilde(X) -> tilde(Y)$ such that the diagram
$
  #cd(
    (
      A: (0, 0, $tilde(X)$),
      B: (0, 1, $tilde(Y)$),
      C: (1, 0, $X$),
      D: (1, 1, $Y$),
    ),
    (
      ar("A", "B", label: $tilde(f)$),
      ar("A", "C", label: $p$),
      ar("B", "D", label: $q$),
      ar("C", "D", label: $f$),
    ),
    column: 26mm,
    row: 24mm,
  )
$ <eq:covering-lifting-property>
commutes and $tilde(f)(tilde(x)_0) = tilde(y)_0$. In this case we say that
$tilde(f)$ _covers_ $f$.

Let $p: tilde(X) -> X$ be the simply connected covering. The diffeomorphisms of
$tilde(X)$ covering the identity diffeomorphism of $X$ form the group $Gamma(p)$
called the #idx("Group of the covering")_group of the covering $p$._ By
@eq:covering-lifting-property, for any $tilde(x)_1, tilde(x)_2 in tilde(X)$ such
that $p(tilde(x)_1) = p(tilde(x)_2)$ there exists a unique element of $Gamma(p)$
which transforms $tilde(x)_1$ into $tilde(x)_2$.

The group $Gamma(p)$ is isomorphic to the fundamental group $pi_1 (X)$ of $X$;
the isomorphism is obtained as follows. Choose a point $tilde(x)_0$ in
$tilde(X)$ and let $x_0 = p(tilde(x)_0)$. Then to any element $gamma$ of
$Gamma(p)$ we assign the class of closed paths in $X$ with the origin in $x_0$
which are images under $p$ of those paths in $tilde(X)$ which join $tilde(x)_0$
with $gamma(tilde(x)_0)$.

#theorem[Any connected Lie group $G$ is isomorphic to the quotient group
  $tilde(G)\/N$, where $tilde(G)$ is a simply connected Lie group, and $N$ is
  its discrete central subgroup. The pair $(tilde(G), N)$ is defined by these
  conditions uniquely up to an isomorphism, i.e. if $(tilde(G)_1, N_1)$ and
  $(tilde(G)_2, N_2)$ are two such pairs, then there is a Lie group isomorphism
  $tilde(G)_1 -> tilde(G)_2$ that transforms $N_1$ into
  $N_2$.] <th:universal-covering-group>

#source(61)The canonical homomorphism $tilde(G) -> tilde(G)\/N$ is covering and
therefore the group $tilde(G)$ is called the #idx(
  "Lie group",
  "simply connected covering",
)_simply connected covering Lie group_ of $G$.

#proof[Let $p: tilde(G) -> G$ be a simply connected covering of the group
  manifold $G$ and $tilde(e) in tilde(G)$ a pullback of the unit $e$ of $G$. The
  mapping $p times p: tilde(G) times tilde(G) -> G times G$ is the simply
  connected covering of the manifold $G times G$. Define the multiplication
  $tilde(mu): tilde(G) times tilde(G) -> tilde(G)$ to be the covering map for
  the multiplication $mu$ in $G$ which transforms $(tilde(e), tilde(e))$ into
  $tilde(e)$. Define the inversion $tilde(iota): tilde(G) -> tilde(G)$ to be the
  covering map of the inversion $iota$ in $G$ which transforms $tilde(e)$ into
  itself.

  #problem[The multiplication $tilde(mu)$ and the inversion $tilde(iota)$
    satisfy group axioms for $tilde(G)$ with $tilde(e)$ as the
    unit.] <pr:covering-group-axioms>

  Thus, we have turned the manifold $tilde(G)$ into a Lie group. The definition
  of multiplication in $tilde(G)$ implies that $p$ is a homomorphism. Its kernel
  $N$ is a discrete central subgroup
  (Problems~@pr:covering-homomorphism-criteria and
  @pr:discrete-normal-subgroup-central) and $G tilde.equiv tilde(G)\/N$
  (Theorem~@th:epimorphism-quotient-isomorphism).

  Now, let $tilde(G)_1$ and $tilde(G)_2$ be simply connected Lie groups, $N_1$
  and $N_2$ their discrete central subgroups and
  $f: tilde(G)_1\/N_1 -> tilde(G)_2\/N_2$ a Lie group isomorphism. The canonical
  homomorphisms $p_1: tilde(G)_1 -> tilde(G)_1\/N_1$ and
  $p_2: tilde(G)_2 -> tilde(G)_2\/N_2$ are covering. By
  @eq:covering-lifting-property there is a diffeomorphism
  $tilde(f): tilde(G)_1 -> tilde(G)_2$ that covers $f$ and transforms the unit
  $tilde(e)_1$ of $tilde(G)_1$ into the unit $tilde(e)_2$ of $tilde(G)_2$. Since
  the diagram
  $
    #cd(
      (
        A: (0, 0, $tilde(G)_1$),
        B: (0, 1, $tilde(G)_2$),
        C: (1, 0, $tilde(G)_1\/N_1$),
        D: (1, 1, $tilde(G)_2\/N_2$),
      ),
      (
        ar("A", "B", label: $tilde(f)$),
        ar("A", "C", label: $p_1$, side: "right"),
        ar("B", "D", label: $p_2$),
        ar("C", "D", label: $f$),
      ),
      column: 32mm,
      row: 24mm,
    )
  $
  commutes, $tilde(f)(N_1) = N_2$.

  #problem[The map $tilde(f)$ is a group
    isomorphism.] <pr:covering-lift-group-isomorphism>

  The theorem is proved.]

#problem[Under the assumptions of the theorem,
  $N tilde.equiv pi_1 (G)$.] <pr:covering-kernel-fundamental-group>

In particular, this implies that the fundamental group $pi_1 (G)$ of any
connected Lie group $G$ is abelian.

Theorem~@th:universal-covering-group and corollaries of
Theorem~@th:homomorphism-existence-simply-connected imply that the connected Lie
groups whose tangent algebras are isomorphic to a given Lie algebra, if they
exist, are described as follows: among them there exists a simply connected one,
unique up to an isomorphism and the other ones are obtained from it taking
quotients modulo different discrete central subgroups. In
Chapter~@ch:levi-decomposition we will show that for any finite-dimensional Lie
algebra $frak(g)$ there exists a Lie group whose tangent algebra is isomorphic
to $frak(g)$.

Theorem~@th:universal-covering-group may be viewed as a generalization of the
description of connected commutative Lie groups obtained in @ss:exponential-map.

=== Exact Homotopy Sequence <ss:exact-homotopy-sequence>
In order to calculate fundamental groups of Lie groups it is convenient to use a
part of the exact homotopy sequence of a locally trivial bundle.

#source(62)Let $X$ and $Y$ be connected differentiable manifolds, $p: X -> Y$ a
locally trivial bundle with fibre $Z$. Let $i: Z -> X$ be a diffeomorphism of
$Z$ with $p^(-1) (y_0)$, the inverse image of a distinguished point $y_0$ of
$Y$. Fix points $x_0$ and $z_0$ in $X$ and $Z$ respectively so that
$i(z_0) = x_0$ and therefore $p(x_0) = y_0$. Then the canonical homomorphisms
$
  p_*: pi_1 (X, x_0) -> pi_1 (Y, y_0) \
  i_*: pi_1 (Z, z_0) -> pi_1 (X, x_0)
$
are defined. Let $pi_0 (Z)$ be the set of connected components of $Z$. For any
closed path $beta$ in $Y$ beginning at $y_0$ there is a path $alpha$ on $X$
beginning at $x_0$ such that $p(alpha) = beta$. A connected component of $Z$
whose image contains the end of the path $alpha$ depends only on the homotopy
class of $beta$. Therefore the map
$ partial: pi_1 (Y, y_0) -> pi_0 (Z) $
is well-defined.

The part of the exact homotopy sequence we need is of the form
$
  pi_1 (Z) stretch(-->)^(i_*) pi_1 (X) stretch(-->)^(p_*) pi_1 (Y)
  stretch(-->)^partial pi_0 (Z) --> 0
$
Here, the exactness means the following:

1) $Ker p_* = Im i_*$;

2) the fibres of $partial$ are the cosets of $pi_1 (Y)$ with respect to
$Im p_*$;

3) $partial$ is surjective.

Also, if $pi_2 (Y) = 0$, i.e. any continuous map of a two-dimensional sphere
into $Y$ is homotopic to a trivial one, then $i_*$ is injective.

Let us apply the above to the locally trivial bundle $p: G -> G\/H$, where $G$
is a connected Lie group, $H$ its Lie subgroup. Take the unit $e$ of $G$ to be
the distinguished point of $G$ and let $p(e) = H$ be the distinguished point of
$G\/H$. Define $i$ to be the identity embedding of $H$ into $G$.

In this case $pi_0 (Z)$ is the group $H\/H^0$. Denote by $iota$ the inversion in
this group.

#problem[The map $iota compose partial: pi_1 (G\/H) -> H\/H^0$ is a
  homomorphism.] <pr:boundary-map-homomorphism>

Thus, the following theorem holds.

#theorem[Let $G$ be a connected Lie group, $p: G -> G\/H$ the canonical map,
  $i: H -> G$ the identity embedding. Then the sequence of groups and
  homomorphisms
  $
    pi_1 (H) stretch(-->)^(i_*) pi_1 (G) stretch(-->)^(p_*) pi_1 (G\/H)
    stretch(-->)^(iota dot.op partial) H\/H^0 --> 0
  $
  is exact. Moreover, if $pi_2 (G\/H) = 0$, then $i_*$ is
  injective.] <th:homotopy-sequence-homogeneous-space>

#corollary[If $pi_1 (G\/H) = pi_2 (G\/H) = 0$, then
  $pi_1 (G) tilde.equiv pi_1 (H)$.] <cor:pi1-equals-pi1-subgroup>

#corollary[If $G$ is simply connected, then
  $pi_1 (G\/H) tilde.equiv H\/H^0$.] <cor:pi1-homogeneous-space-components>

Now we will apply Corollary~@cor:pi1-equals-pi1-subgroup in order to calculate
the fundamental groups of classical complex Lie groups.

#problem[#source(63)$SL_n (CC)$ and $Sp_(2n) (CC)$ are simply
  connected.] <pr:complex-sl-sp-simply-connected>

Since $SO_3 (CC) tilde.equiv SL_2 (CC)\/{E, -E}$ (see
Example~@exm:sl2-covers-so3) and $SL_2 (CC)$ is simply connected, we have
$pi_1 (SO_3 (CC)) tilde.equiv ZZ_2$.

#problem[$pi_1 (SO_n (CC)) tilde.equiv ZZ_2$ for
  $n >= 3$.] <pr:complex-so-fundamental-group>

#exercises[
  #exercise[A Lie subgroup $H$ of a Lie group $G$ contains $G^0$ if and only if
    the manifold $G\/H$ is discrete.] <exc:subgroup-contains-identity-component>

  #exercise[If in the definition of a Lie group we omit the assumption that the
    group manifold possesses a countable base then any connected Lie group still
    possesses a countable base.] <exc:connected-group-countable-base>

  #exercise[$GL_n (CC)$ is connected and $GL_n (RR)$ has two connected
    components.] <exc:general-linear-components>

  #exercise[$upright(U)_n$ and $SU_n = {A in upright(U)_n: det A = 1}$ are
    connected.] <exc:unitary-groups-connected>

  #exercise[The group $upright(O)_(k, l)\/upright(O)_(k, l)^0$, where
    $k, l > 0$, is the direct product of two cyclic groups of
    order 2.] <exc:o-kl-component-group>

  #exercise[Construct the covering homomorphism
    $SU_2 -> SO_3$.] <exc:su2-covers-so3>

  #exercise[Suppose $alpha$ is an action of a simply connected Lie group $G$ on
    a connected differentiable manifold $X$ and $p: tilde(X) -> X$ the simply
    connected covering. Then there exists a $G$-action $tilde(alpha)$ on
    $tilde(X)$ such that $p(tilde(alpha)(g) tilde(x)) = alpha(g) p(tilde(x))$.]
  <exc:action-lifts-to-covering>

  #exercise[$SU_n$ and $Sp_n$ (see exercise~@exc:quaternionic-unitary-group) are
    simply connected.] <exc:compact-su-sp-simply-connected>

  #exercise[$pi_1 (SO_n) tilde.equiv ZZ_2$ for
    $n >= 3$.] <exc:compact-so-fundamental-group>

  #exercise[Any connected two-dimensional real Lie group is either commutative
    or isomorphic to the group of orientation preserving affine transformations
    of the line.] <exc:two-dimensional-lie-groups>

  #exercise[For any connected Lie group $G$ the differentials of all its
    automorphisms form a Lie subgroup in $Aut frak(g)$. (Hint: characterize a
    sufficiently small neighbourhood of the unit of this subgroup in terms of
    the $(Aut frak(g))$-action on the simply connected covering Lie group of
    $G$.)] <exc:automorphism-differentials-lie-subgroup>
]

#hints[
  #hint[@pr:prove-identity-component-normal][Use the fact that the inversion,
    left and right translations, and inner automorphisms are diffeomorphisms of
    the group manifold, and therefore can only permute connected components.]

  #hint[@pr:open-subgroup-closed][An open subgroup is closed since its
    complement is the union of cosets and each coset is also an open subset.]

  #hint[@pr:unit-neighbourhood-generates-group][Prove that the subgroup
    generated by a neighbourhood of the unit is open and use
    Problem~@pr:open-subgroup-closed.]

  #hint[@pr:prove-transitive-action-connectedness][Let $x in X$.
    Theorem~@th:stabilizer-is-lie-subgroup yields $rk alpha_x = dim X$. Applying
    this theorem to the restriction of the action $alpha$ to $G^0$ we find that
    the orbit $alpha(G^0) x$ contains a neighbourhood of $x$. Hence, all the
    orbits of $G^0$ are open in $X$. Since $X$ is connected, there is actually
    only one orbit, i.e. $G^0$ acts transitively on $X$. Hence, in any connected
    component of $G$, there is an element of the subgroup $G_x$ (for any given
    point $x in X$). The other statements of the theorem are deduced from here.]

  #hint[@pr:special-linear-connected][#source(64)Consider the natural
    $SL_n (K)$-action on the punctured space $K^n without {0}$. Prove that the
    stabilizer of any point is diffeomorphic to the direct product
    $SL_(n-1) (K) times K^(n-1)$.]

  #hint[@pr:orthogonal-two-components][Clearly, $SO_n (K)$ is an open subgroup
    of index 2 in $upright(O)_n (K)$. Therefore, it suffices to show that
    $SO_n (K)$ is connected. In order to do this consider the natural
    $SO_n (K)$-action on the sphere $x_1^2 + dots.c + x_n^2 = 1$ and prove that
    the stabilizer of any point is isomorphic to $SO_(n-1) (K)$.]

  #hint[@pr:symplectic-connected][Consider the natural $Sp_(2n) (K)$-action on
    the punctured space $K^(2n) without {0}$. Prove that this action is
    transitive and the stabilizer of any point is diffeomorphic to
    $Sp_(2n-2) (K) times K^(2n-1)$.]

  #hint[@pr:pseudoorthogonal-leading-minor-nonzero][If $d_k (A) = 0$ then the
    image of the subspace spanned by the first $k$ basic vectors has a nonzero
    intersection with the subspace spanned by the last $l$ basic vectors. This
    is impossible, since the quadratic form $q$ is positive definite on the
    former and negative definite on the latter.]

  #hint[@pr:so-kl-two-components][For $k >= 2$ and $l >= 1$ consider the
    $SO_(k, l)$-action on the hyperboloid
    $ x_1^2 + dots.c + x_k^2 - x_(k+1)^2 - dots.c - x_n^2 = 1. $
    Prove that this action is transitive and the stabilizer of any point is
    isomorphic to $SO_(k-1, l)$. Use the isomorphism
    $SO_(k, l) tilde.equiv SO_(l, k)$ to prove that the number of connected
    components of $SO_(k, l)$ does not exceed the number of connected components
    of $SO_(1, 1)$ which equals 2.]

  #hint[@pr:covering-homomorphism-criteria][The equivalences 1) $<=>$ 2) $<=>$
    4) follow from Theorem~@th:kernel-is-lie-subgroup and the implication 2)
    $=>$ 3) follows from Theorems~@th:coset-manifold-structure and
    @th:epimorphism-quotient-isomorphism.]

  #hint[@pr:discrete-normal-subgroup-central][Let $N$ be a discrete normal
    subgroup of a connected Lie group $G$. For any $n in N$ consider the map
    $ G -> N, quad "where" quad g |-> g n g^(-1). $
    Its image is connected, hence consists of one point $n$. That means that $n$
    belongs to the center of $G$.]

  #hint[@pr:covering-group-axioms][Since each of the maps
    $
      tilde(mu) compose (tilde(mu) times id), tilde(mu) compose
      (id times tilde(mu)): tilde(G) times tilde(G) times tilde(G) ->
      tilde(G),
    $
    where
    $
      tilde(mu) compose (tilde(mu) times id): (tilde(x), tilde(y), tilde(z))
      |-> tilde(mu)(tilde(mu)(tilde(x), tilde(y)), tilde(z)), \
      tilde(mu) compose (id times tilde(mu)): (tilde(x), tilde(y), tilde(z))
      |-> tilde(mu)(tilde(x), tilde(mu)(tilde(y), tilde(z))),
    $
    is covering for the map
    $ G times G times G -> G, wide (x, y, z) |-> x y z, $
    and transforms $(tilde(e), tilde(e), tilde(e))$ into $tilde(e)$ we obtain
    the associativity of the multiplication #source(65)$tilde(mu)$. We similarly
    prove that
    $
      tilde(mu)(tilde(x), tilde(iota)(tilde(x)))
      = tilde(mu)(tilde(iota)(tilde(x)), tilde(x)) = tilde(e)
    $
    and
    $
      tilde(mu)(tilde(x), tilde(e)) = tilde(mu)(tilde(e), tilde(x))
      = tilde(x).
    $]

  #hint[@pr:covering-lift-group-isomorphism][Each of the maps
    $
      tilde(G)_1 times tilde(G)_1 -> tilde(G)_2, wide
      (tilde(x), tilde(y)) |-> tilde(f)(tilde(x) tilde(y)), wide
      (tilde(x), tilde(y)) |-> tilde(f)(tilde(x)) tilde(f)(tilde(y)),
    $
    covers the map
    $
      (tilde(G)_1\/N_1) times (tilde(G)_1\/N_1) -> tilde(G)_2\/N_2, wide
      (x, y) |-> f(x y),
    $
    and transforms $(tilde(e)_1, tilde(e)_1)$ into $tilde(e)_2$. Hence,
    $tilde(f)(tilde(x) tilde(y)) = tilde(f)(tilde(x)) tilde(f)(tilde(y))$.]

  #hint[@pr:covering-kernel-fundamental-group][Let $p: tilde(G) -> G$ be a
    covering homomorphism with kernel $N$. Prove that the elements of the group
    $Gamma(p)$ are multiplications by elements of $N$.]

  #hint[@pr:boundary-map-homomorphism][Let $beta_1$ and $beta_2$ be closed paths
    on $G\/H$ with the source at $p(e)$. Let $alpha_1$ and $alpha_2$ be paths on
    $G$ beginning at $e$ such that $p(alpha_1) = beta_1$ and
    $p(alpha_2) = beta_2$. Let the ends of $alpha_1$ and $alpha_2$ be $h_1 in H$
    and $h_2 in H$, respectively. Consider the path $alpha_2^(h_1)$ obtained
    from $alpha_2$ via the right multiplication by $h_1$. This path begins at
    $h_1$ and terminates at $h_2 h_1$. We have
    $p(alpha_1 alpha_2^(h_1)) = beta_1 beta_2$. Therefore $partial$ transforms
    the homotopic class of the path $beta_1 beta_2$ into
    $h_2 h_1 H^0 = (h_2 H^0)(h_1 H^0)$, i.e. $partial$ is an antihomomorphism.
    Therefore, $iota dot.op partial$ is a homomorphism.]

  #hint[@pr:complex-sl-sp-simply-connected][Consider the action of these groups
    on the punctured spaces $CC^n without {0}$ and $CC^(2n) without {0}$,
    respectively. (See hints to Problems~@pr:special-linear-connected and
    @pr:symplectic-connected).]

  #hint[@pr:complex-so-fundamental-group][For $n > 3$ consider the
    $SO_n (CC)$-action on the complex sphere in the space $CC^n$ (see hint to
    Problem~@pr:orthogonal-two-components). Prove that the complex sphere is
    homotopically equivalent to the real sphere of the same dimension.]
]
