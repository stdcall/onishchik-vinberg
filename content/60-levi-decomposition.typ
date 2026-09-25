// Chapter 6. Levi Decomposition, the whole chapter: it is not divided into
// sections and counts as § 1 in references. Printed pages 282-288.
#import "main-defs.typ": *
#import "statements.typ": *

= Levi Decomposition <ch:levi-decomposition>

#source(297)In this chapter, which owing to its brevity is not divided into
sections, we prove Levi's theorem on the decomposition of an arbitrary Lie
algebra into a semidirect sum of a solvable ideal (radical) and a semisimple
subalgebra and the theorem on the uniqueness of this decomposition due to
A.I.~Malcev. Levi's theorem implies the result which concludes the classical Lie
group theory---the existence of a Lie group with an arbitrary given tangent
algebra. Next we will consider an analogue of Levi decomposition for algebraic
groups.

=== Levi's Theorem <ss:levi-theorem>
Let $frak(g)$ be a finite-dimensional Lie algebra over $K = CC$ or $RR$. A
subalgebra $frak(l) subset frak(g)$ is called a #idx("Levi subalgebra")_Levi
subalgebra_ if $frak(g)$ splits into the semidirect sum
$ frak(g) = rad frak(g) plus.o.r frak(l). $ <eq:levi-decomposition>
Decomposition~@eq:levi-decomposition is called the #idx(
  "Levi decomposition",
)_Levi decomposition_ of $frak(g)$.

#problem[The natural homomorphism $pi: frak(g) -> frak(g)\/rad frak(g)$
  isomorphically maps any Levi subalgebra $frak(l) subset frak(g)$ onto the
  semisimple Lie algebra $frak(s) = frak(g)\/rad frak(g)$. Any Levi subalgebra
  is a maximal semisimple subalgebra of
  $frak(g)$.] <pr:levi-subalgebra-maximal-semisimple>

#problem[An automorphism of a Lie algebra transforms any of its Levi subalgebras
  into a Levi subalgebra.] <pr:automorphism-preserves-levi>

In this section we will prove the following.

#theorem(title: [#idx("Levi’s theorem")Levi])[Any finite-dimensional Lie algebra
  $frak(g)$ over $K = CC$ or $RR$ contains a Levi
  subalgebra.] <th:levi-subalgebra-exists>

First, prove Theorem~@th:levi-subalgebra-exists when $frak(g)$ has a commutative
radical and the center of $frak(g)$ is trivial.

#problem[The kernel of any derivation of a Lie algebra is a
  subalgebra.] <pr:derivation-kernel-subalgebra>

It follows from Problem~@pr:derivation-kernel-subalgebra that it suffices to
construct a derivation $delta in der frak(g)$ which is the projection of
$frak(g)$ onto $rad frak(g)$, i.e. such that $delta(frak(g)) subset rad frak(g)$
and $delta(x) = x$ $(x in rad frak(g))$.

#problem[Suppose there exists a projection $h$ of $frak(g)$ onto $rad frak(g)$
  belonging to the normalizer of the subalgebra
  $ad frak(g) subset frak("gl")(frak(g))$. If $frak(z)(frak(g)) = 0$ then
  $frak(g)$ contains a Levi subalgebra.] <pr:normalizing-projection-gives-levi>

Now let us construct a projection $h: frak(g) -> rad frak(g)$ satisfying the
conditions of Problem~@pr:normalizing-projection-gives-levi. Let
$P = {v in frak("gl")(frak(g)): v(frak(g)) subset rad frak(g) "and"
  v|rad frak(g) "is a scalar operator"}$ and $Q = {v in P: v|rad frak(g) = 0}$.
Set $R = ad(rad frak(g)) = {ad x: x in rad frak(g)}$.

#problem[#source(298)The sets $P$, $Q$, $R$ are subspaces of
  $frak("gl")(frak(g))$ such that $Q subset P$ and $dim P - dim Q = 1$. If
  $rad frak(g)$ is commutative then
  $R subset Q$.] <pr:operators-scalar-on-radical>

Consider the linear representation $rho$ of $frak(g)$ in the space
$frak("gl")(frak(g))$ defined by the formula
$ rho(x) = ad(ad x) wide (x in frak(g)). $

#problem[The subspaces $P$, $Q$, $R$ are $rho(frak(g))$-invariant and
  $rho(x) P subset Q$ for all $x in frak(g)$. If $rad frak(g)$ is commutative
  then $rho(x) P subset R$ for all
  $x in rad frak(g)$.] <pr:operators-scalar-on-radical-invariant>

Now suppose $rad frak(g)$ is commutative and $frak(z)(frak(g)) = 0$.
Problem~@pr:operators-scalar-on-radical-invariant implies that $rho$ induces a
representation $hat(rho)$ of $frak(s) = frak(g)\/rad frak(g)$ in $P\/R$ such
that $hat(rho)(xi)(P\/R) subset Q\/R$ for all $xi in frak(s)$. By
Problem~@pr:operators-scalar-on-radical $dim P\/R - dim Q\/R = 1$. Since
$frak(s)$ is semisimple, $hat(rho)$ is completely reducible
(Corollary~@cor:weyl-complete-reducibility of
Theorem~@th:reductive-completely-reducible). Therefore there exists
$v_0 in P without Q$, such that $hat(rho)(xi)(v_0 + R) = 0$ for all
$xi in frak(s)$. This means that $[ad x, v_0] in R subset ad frak(g)$ for all
$x in frak(g)$, i.e. $v_0$ normalizes $ad frak(g)$. Furthermore,
$v_0|rad frak(g) = lambda E$, where $lambda != 0$, and the operator
$h = v_0\/lambda$ satisfies the conditions of
Problem~@pr:normalizing-projection-gives-levi. Therefore
Theorem~@th:levi-subalgebra-exists is proved under the above assumptions.

Notice that Problem~@pr:radical-central-algebra-splits implies that
Theorem~@th:levi-subalgebra-exists holds in another particular case: when
$rad frak(g) = frak(z)(frak(g))$.

To prove Levi's theorem in the general case we will need two properties of the
radical of a Lie algebra.

#problem[An ideal $frak(h) subset frak(g)$ contains $rad frak(g)$ if and only if
  $frak(g)\/frak(h)$ is semisimple.] <pr:semisimple-quotient-contains-radical>

#problem[Let $frak(r)$ be a solvable ideal of $frak(g)$. Then
  $rad(frak(g)\/frak(r)) = (rad frak(g))\/frak(r)$. The image of any Levi
  subalgebra of $frak(g)$ under the natural homomorphism
  $frak(g) -> frak(g)\/frak(r)$ is a Levi subalgebra of
  $frak(g)\/frak(r)$.] <pr:radical-and-levi-of-quotient>

Now we prove Theorem~@th:levi-subalgebra-exists by induction in
$dim(rad frak(g))$. Suppose it holds for Lie algebras with radicals of
dimensions $< dim(rad frak(g))$. Consider, separately, the cases of
non-commutative and commutative radical.

Let $(rad frak(g))' != 0$. Then
$0 < dim(rad frak(g)\/(rad frak(g))') < dim(rad frak(g))$ and $(rad frak(g))'$
is an ideal of $frak(g)$. By Problem~@pr:radical-and-levi-of-quotient
$rad frak(g)\/(rad frak(g))'$ is the radical of
$frak(g)_1 = frak(g)\/(rad frak(g))'$. Therefore $frak(g)_1$ contains a Levi
subalgebra $frak(l)_1$. Let $frak(g)_2 = pi^(-1) (frak(l)_1) subset frak(g)$,
where $pi: frak(g) -> frak(g)_1$ is the natural homomorphism. Then
$frak(g)_2\/(rad frak(g))' = frak(l)_1$ so that $(rad frak(g))'$ is the radical
of $frak(g)_2$ by Problem~@pr:semisimple-quotient-contains-radical. Applying the
inductive hypothesis to $frak(g)_2$ we see that $frak(g)_2$ contains a Levi
subalgebra $frak(l)$. Clearly, $frak(l)$ is a Levi subalgebra of $frak(g)$.

Let $rad frak(g)$ be commutative. By what we have already proved we may assume
that $dim frak(z)(frak(g)) > 0$. Then
$dim(rad frak(g)\/frak(z)(frak(g))) < dim(rad frak(g))$. By
Problem~@pr:radical-and-levi-of-quotient $rad frak(g)\/frak(z)(frak(g))$ is the
radical of $frak(g)\/frak(z)(frak(g))$. By the inductive hypothesis
$frak(g)\/frak(z)(frak(g))$ contains a Levi subalgebra $frak(l)_1$. If
$frak(g)_1$ is the preimage of $frak(l)_1$ with respect to the natural
homomorphism $frak(g) -> frak(g)\/frak(z)(frak(g))$ then
$frak(z)(frak(g)) = rad frak(g)_1$. By
Problem~@pr:radical-central-algebra-splits $frak(g)_1$ contains a Levi
subalgebra which is clearly a Levi subalgebra of $frak(g)$.

=== Existence of a Lie Group with the Given Tangent Algebra
<ss:lie-group-with-given-algebra>
In this section we will make use of Theorem~@th:levi-subalgebra-exists to prove
the following theorem which is one of the fundamental facts of the Lie group
theory.

#theorem[#source(299)Let $frak(g)$ be a finite-dimensional Lie algebra (over
  $CC$ or $RR$), $frak(l)$ its Levi subalgebra. Then there exists a simply
  connected Lie group $G$ (either complex or real respectively) whose tangent
  algebra is isomorphic to $frak(g)$. Moreover,
  $ G = A times.r L, $ <eq:group-levi-decomposition>
  where $A = Rad G$, $L$ is a simply connected Lie subgroup with the tangent
  algebra $frak(l)$.] <th:lie-third-theorem>

#proof[As it was shown in @ss:solvable-lie-groups there exists a simply
  connected Lie group $A$ whose tangent algebra is isomorphic to $rad frak(g)$.
  On the other hand, it is clear that there exists a simply connected Lie group
  $L$ with the tangent algebra isomorphic to $frak(l)$ (e.g. the simply
  connected covering group for $Int frak(l)$, see
  Problem~@pr:real-semisimple-derivations-inner). Applying
  Problem~@pr:semidirect-sum-integrates to the adjoint representation
  $ad: frak(l) -> der (rad frak(g))$ we get the simply connected Lie group
  $G = A times.r L$ with the tangent algebra
  $(rad frak(g)) plus.o.r frak(l) = frak(g)$.]

=== Malcev's Theorem <ss:malcev-theorem>
Our goal is the proof of the following statement.

#theorem(title: [#idx("Malcev’s theorem")A.I.~Malcev [@bib:Malcev1944]])[Let
  $frak(l)$ be a Levi subalgebra of $frak(g)$. For any semisimple subalgebra
  $frak(s) subset frak(g)$ there exists $phi in Int frak(g)$ such that
  $phi(frak(s)) subset frak(l)$. The automorphism $phi$ can be chosen from the
  connected virtual Lie subgroup of $Int frak(g)$ with the tangent algebra
  $ad(rad frak(g))$.] <th:malcev-conjugacy>

To prove it we will need an embedding of the group of affine transformations of
an affine space into the group of linear transformations of a vector space of
dimension greater by 1. Let $V$ be a vector space over $K = CC$ or $RR$.
Consider the vector space $W = V plus.o K$. The affine hyperplane
$AA = (V, 1) subset W$ is an affine space with the associated vector space $V$.
Consider the subgroup $GL(W; W, V) subset GL(W)$ consisting of transformations
preserving $V$ and inducing on $W\/V$ the identity transformation (see
Example~@exm:subspace-stabilizer-algebraic[] of
@ss:algebraic-group-definitions[°]).

#problem[The subgroup $GL(W; W, V)$ coincides with the subgroup of all
  invertible linear transformations of $W$ preserving $AA$. If
  $X in GL(W; W, V)$ then $X$ induces an affine transformation of $AA$.
  Conversely, any affine transformation of $AA$ is obtained in this way from a
  uniquely determined element of
  $GL(W; W, V)$.] <pr:affine-group-linear-embedding>

Therefore the group $GA(AA)$ is naturally identified with the subgroup
$GL(W; W, V) subset GL(W)$.

#lemma[If all finite-dimensional linear representations of a Lie group $H$ are
  completely reducible then any affine action of $H$ has a fixed
  point.] <lem:affine-action-fixed-point>

#proof[Let $R: H -> GA(AA)$ be an affine $H$-action. By
  Problem~@pr:affine-group-linear-embedding $R$ may be considered as a linear
  representation of $H$ in the space $W$ so that $V$ is an invariant subspace.
  The complete reducibility implies that there exists a vector $v_0 in AA$, such
  that $R(h) v_0 = c v_0$, where $c in K$, for any $h in H$. Since
  $R(h) v_0 in AA$, then $c = 1$, hence $v_0$ is a fixed point for $R$.]

#proof(head: [_Proof of Theorem_~@th:malcev-conjugacy.])[First suppose that
  $rad frak(g)$ is commutative. Consider a simply connected Lie group $G$ with
  the tangent algebra $frak(g)$ constructed in @ss:lie-group-with-given-algebra.
  Its radical #source(
    300,
  )$A = Rad G$ is a vector group. A connected semisimple virtual Lie subgroup
  $S subset G$ corresponds to the subalgebra $frak(s)$ by
  Theorem~@th:subalgebra-has-virtual-subgroup. Consider the affine action
  $tilde(R)$ of $G$ in $A$ defined in Problem~@pr:semidirect-affine-action.
  Since all linear representations of $S$ are completely reducible
  (Corollary~@cor:semisimple-group-complete-reducibility of
  Theorem~@th:reductive-completely-reducible),
  Lemma~@lem:affine-action-fixed-point implies that $S$ has a fixed point in
  $A$. As in @ss:groups-with-compact-tangent-algebra[°] we derive from here that
  $a S a^(-1) subset L$ for some $a in A$. Therefore
  $(Ad a) frak(s) subset frak(l)$. It remains to notice that $Ad a = exp(ad z)$,
  where $z in rad frak(g)$ is an element such that $exp z = a$.

  Now consider the general case and apply the induction in $dim(rad frak(g))$.
  Suppose the theorem is proved for all Lie algebras whose radical is of
  dimension $< dim(rad frak(g))$. Set $frak(g)_1 = frak(g)\/(rad frak(g))'$ and
  let $frak(l)_1$, $frak(s)_1$ be the projections of $frak(l)$, $frak(s)$ into
  $frak(g)_1$. By Problem~@pr:radical-and-levi-of-quotient $frak(l)_1$ is a Levi
  subalgebra of $frak(g)_1$ having the commutative radical
  $rad frak(g)\/(rad frak(g))'$. Therefore there exists $z_1 in rad frak(g)$
  such that $exp ad(z_1 + (rad frak(g))') frak(s)_1 subset frak(l)_1$ implying
  $exp(ad z_1) frak(s) subset (rad frak(g))' + frak(l)$. Since
  $dim(rad frak(g))' < dim(rad frak(g))$, we may apply the inductive hypothesis
  to $frak(g)_2 = (rad frak(g))' + frak(l) subset frak(g)$. Therefore there
  exist $z_2, ..., z_r in (rad frak(g))'$, such that
  $(exp ad z_r) dots.c (exp ad z_2)(exp ad z_1) frak(s) subset frak(l)$.]

#corollary[Any two Levi subalgebras of $frak(g)$ are transformed into each other
  by a product of automorphisms of the form $exp(ad z)$, where
  $z in rad frak(g)$.] <cor:levi-subalgebras-conjugate>

#corollary[Any maximal semisimple subalgebra of a Lie algebra is its Levi
  subalgebra.] <cor:maximal-semisimple-is-levi>

=== Algebraic Levi Decomposition <ss:algebraic-levi-decomposition>
In this section we consider algebraic groups over $CC$.

Let $G$ be an algebraic group. By Problem~@pr:radical-algebraic-subgroup the
radical $Rad G$ of $G$ is an irreducible solvable algebraic subgroup. Consider
the unipotent radical of $Rad G$, i.e. the set of all unipotent elements of this
group (see @ss:splitting-solvable-algebraic-group[°]). We will call it the #idx(
  "Radical",
  "unipotent",
)_unipotent radical_ of $G$ and denote by $Rad_u G$.

#problem[$Rad_u G$ is the largest unipotent normal subgroup of
  $G$.] <pr:unipotent-radical-largest>

#problem[An algebraic group is reductive if and only if its unipotent radical is
  trivial.] <pr:reductive-iff-trivial-unipotent-radical>

#problem[Let $N$ be an algebraic normal subgroup of an algebraic group $G$. The
  algebraic group $G\/N$ is reductive if and only if
  $N supset Rad_u G$.] <pr:reductive-quotient-criterion>

A _reductive Levi subgroup_ of an algebraic group $G$ is an algebraic subgroup
$H subset G$, such that
$ G = Rad_u G times.r H. $ <eq:algebraic-levi-decomposition>

#problem[Any reductive Levi subgroup $H$ of an algebraic group $G$ is a maximal
  reductive algebraic subgroup of this group and is isomorphic to
  $G\/Rad_u G$.] <pr:reductive-levi-maximal-reductive>

#problem[If a reductive algebraic subgroup $H subset G$ satisfies
  $G = (Rad_u G) H$, then $H$ is a reductive Levi subgroup of
  $G$.] <pr:reductive-levi-subgroup-criterion>

#problem[#source(301)Let $U$ be a unipotent algebraic normal subgroup of $G$.
  Then $Rad_u (G\/U) = (Rad_u G)\/U$. The image of a reductive Levi subgroup of
  $G$ under the natural homomorphism $G -> G\/U$ is a reductive Levi subgroup of
  $G\/U$.] <pr:unipotent-radical-of-quotient>

The decomposition~@eq:algebraic-levi-decomposition is called the #idx(
  "Levi decomposition",
  "algebraic",
)_algebraic Levi decomposition_ of $G$. Our goal is to prove the existence and
the uniqueness (up to inner automorphisms) of an algebraic Levi decomposition.

#theorem[In any algebraic group $G$ there exists a reductive Levi
  subgroup.] <th:reductive-levi-subgroup-exists>

#proof(head: [_Proof_])[of this theorem will be divided into two parts. First,
  we consider the case when the radical of $G$ consists of unipotent elements
  and then the general case.

  Suppose that $Rad_u G = Rad G$. In this case the proof will be carried out
  along the same lines as for Theorem~@th:levi-subalgebra-exists, i.e. first we
  consider the subcases a) $Rad G$ is commutative and $frak(z)(frak(g)) = 0$; b)
  $rad frak(g) = frak(z)(frak(g))$ and then reduce the general case to these two
  ones.

  a) Let $Rad G = Rad_u G$ be commutative and $frak(z)(frak(g)) = 0$. Let
  $frak(h)$ be a Levi subalgebra of the tangent algebra $frak(g)$ of $G$
  existing by Theorem~@th:levi-subalgebra-exists. Set
  $H = N(frak(h)) = {g in G: (Ad g) frak(h) = frak(h)}$. Clearly, $H$ is an
  algebraic subgroup of $G$. Its tangent algebra is
  $frak(n)(frak(h)) = (frak(n)(frak(h)) inter rad frak(g)) plus.o.r frak(h)$.
  Clearly, $frak(n)(frak(h)) inter rad frak(g) = frak(z)(frak(g)) = 0$, so that
  $frak(n)(frak(h)) = frak(h)$ and $H$ is semisimple. By
  Problem~@pr:reductive-levi-subgroup-criterion it remains to prove that
  $G = (Rad G) dot H$. To do this consider the action of $G$ on the set of all
  Levi subalgebras of $frak(g)$ by inner automorphisms $a(g)$ $(g in G)$. The
  stabilizer of $frak(h)$ is $H$ and (by Theorem~@th:malcev-conjugacy) the
  subgroup $Rad G$ acts transitively on the set of all Levi subalgebras. This
  implies the required decomposition.

  b) Let $rad frak(g) = frak(z)(frak(g))$. Then $frak(g)$ is a reductive Lie
  algebra, i.e. $G^0 = (Rad G)(G^0)'$
  (Problem~@pr:radical-central-algebra-splits). In this case we apply the same
  arguments as in the proof of Theorem~@th:compact-algebra-semidirect-splitting.
  Consider the algebraic group $G_1 = G\/(G^0)'$. Clearly, $G_1^0$ is a
  unipotent commutative group. By Theorem~@th:commutative-unipotent-vector-group
  $G_1^0 tilde.eq CC^p$. By Lemma~@lem:vector-group-finite-extension-splits
  $G_1 = G_1^0 times.r H_1$, where $H_1$ is a finite subgroup. The preimage $H$
  of $H_1$ with respect to the natural homomorphism $G -> G_1$ is a reductive
  Levi subgroup of $G$.

  #problem[Prove Theorem~@th:reductive-levi-subgroup-exists when
    $Rad_u G = Rad G$.] <pr:reductive-levi-unipotent-case>

  Now prove Theorem~@th:reductive-levi-subgroup-exists in the general case. For
  this fix a maximal torus $T$ in $Rad G$. By
  Theorem~@th:solvable-semidirect-unipotent-torus $Rad G = Rad_u G times.r T$.
  Set $G_1 = N(T)$.

  #problem[We have $G = (Rad_u G) G_1$.] <pr:frattini-argument-maximal-torus>

  #problem[$Rad_u G_1$ coincides with
    $(Rad_u G) inter G_1$.] <pr:unipotent-radical-of-torus-normalizer>

  Now let us carry out the induction in $dim(Rad_u G)$. Suppose that
  Theorem~@th:reductive-levi-subgroup-exists is proved for all algebraic groups
  whose unipotent radical is of dimension $< dim(Rad_u G)$. By
  Problem~@pr:unipotent-radical-of-torus-normalizer $Rad_u G_1 subset Rad_u G$.
  If $dim(Rad_u G_1) < dim(Rad_u G)$ then by the inductive hypothesis
  $G_1 = (Rad_u G_1) times.r H$, where $H$ is a reductive algebraic subgroup.
  Then problems~@pr:frattini-argument-maximal-torus,
  @pr:unipotent-radical-of-torus-normalizer and
  @pr:reductive-levi-subgroup-criterion imply that $H$ is a reductive Levi
  subgroup of $G$. If $dim Rad_u G_1 = dim Rad_u G$, then by
  Problem~@pr:frattini-argument-maximal-torus $G = G_1$ so that $T$ is a normal
  subgroup of $G$. Problem~@pr:radical-and-levi-of-quotient implies that the
  radical of the algebraic group $G_2 = G\/T$ coincides with
  $(Rad G)\/T tilde.eq Rad_u G$ and therefore #source(302)consists of unipotent
  elements. By what we have proved above, $G_2$ possesses a reductive Levi
  subgroup $H_2$ which is actually semisimple. Let $p: G -> G_2$ be the natural
  homomorphism and $H = p^(-1) (H_2)$. Then $T = Rad H$ (see
  Problem~@pr:semisimple-quotient-contains-radical) whence $H$ is a reductive
  algebraic subgroup by Problem~@pr:reductive-iff-radical-torus. Clearly, $H$ is
  a reductive Levi subgroup of $G$. Proof of
  Theorem~@th:reductive-levi-subgroup-exists is completed.]

#theorem[Let $G = Rad_u G times.r H$ be an algebraic Levi decomposition of $G$.
  Then for any reductive algebraic subgroup $Q subset G$ there exists
  $u in Rad_u G$ such that
  $u Q u^(-1) subset H$.] <th:reductive-subgroups-conjugate-into-levi>

#proof(head: [_Proof_], qed: false)[will be carried out along the same lines as
  that of Theorem~@th:malcev-conjugacy. First prove
  Theorem~@th:reductive-subgroups-conjugate-into-levi when the unipotent radical
  of $G$ is commutative. By Theorem~@th:commutative-unipotent-vector-group
  $Rad_u G$ is a vector group in this case. Therefore the argument used in
  @ss:malcev-theorem in the proof of Theorem~@th:malcev-conjugacy for the case
  of a commutative radical is applicable (Lemma~@lem:affine-action-fixed-point
  is applicable to $Q$ thanks to
  Corollary~@cor:reductive-group-complete-reducibility of
  Theorem~@th:reductive-completely-reducible).

  #problem[Prove Theorem~@th:reductive-subgroups-conjugate-into-levi in the
    general case.#qed-mark] <pr:reductive-conjugacy-general-case>]

#corollary[If $H_1$ and $H_2$ are two reductive Levi subgroups of an algebraic
  group $G$ then there exists $u in Rad_u G$, such that
  $u H_1 u^(-1) = H_2$.] <cor:reductive-levi-subgroups-conjugate>

#corollary[Any maximal reductive algebraic subgroup of an algebraic group is its
  reductive Levi subgroup.] <cor:maximal-reductive-is-levi>

#exercises[
  Let $G$ be a Lie group. A #idx("Levi subgroup")_Levi subgroup_ of $G$ is a
  virtual Lie subgroup $L subset G$, such that $G = (Rad G) L$,
  $dim((Rad G) inter L) = 0$.

  #exercise[If $L$ is a Levi subgroup of $G$ then its tangent algebra $frak(l)$
    is a Levi subalgebra of $frak(g)$.] <exc:levi-subgroup-tangent-algebra>

  #exercise[If $G$ is connected then any of its virtual Lie subgroups whose
    tangent algebra is a Levi subalgebra of $frak(g)$ is a Levi
    subgroup.] <exc:levi-subgroup-from-subalgebra>

  #exercise[In a connected Lie group there always exists a connected Levi
    subgroup.] <exc:connected-levi-subgroup-exists>

  #exercise[If $L$ is a Levi subgroup of a Lie group $G$ then for any connected
    semisimple virtual Lie subgroup $S subset G$ there exists $g in Rad G$ such
    that $g S g^(-1) subset L$.] <exc:semisimple-subgroup-into-levi>

  #exercise[In a connected Lie group all connected Levi subgroups are
    conjugate.] <exc:levi-subgroups-conjugate>

  #exercise[A connected virtual Lie subgroup $L$ of the connected Lie group $G$
    is a Levi subgroup if and only if $L$ is a maximal connected semisimple
    virtual Lie subgroup of $G$.] <exc:levi-maximal-semisimple-subgroup>

  #exercise[Let a (not necessarily connected) Lie group $G$ be such that $Rad G$
    is commutative and $Z(G^0)$ is discrete. Then there exists a Levi subgroup
    $L$ of $G$ such that $G = Rad G times.r L$ and $Rad G$ is a vector group.
    (Hint: for $L$ take $N(frak(l))$, where $frak(l)$ is a Levi subalgebra of
    the tangent algebra $frak(g)$ and make use of
    Theorem~@th:malcev-conjugacy.)] <exc:levi-semidirect-commutative-radical>

  #exercise[In a simply connected Lie group $G$ the radical is simply connected,
    any connected Levi subgroup $L$ is a simply connected Lie subgroup and
    $G = Rad G times.r L$.] <exc:simply-connected-levi-decomposition>

  #exercise[Let $G$ be a simply connected Lie group, $frak(h)$ an ideal of its
    Lie algebra $frak(g)$. Then $G$ contains a connected normal Lie subgroup $H$
    with the tangent algebra $frak(h)$. (#source(303)Hint: consider a connected
    Lie group $Q$ with the tangent algebra $frak(g)\/frak(h)$ and the
    homomorphism $G -> Q$ whose differential is the natural homomorphism
    $frak(g) -> frak(g)\/frak(h)$.)] <exc:ideal-gives-normal-subgroup>

  #exercise[Let $G$ be a unipotent (i.e. consisting of unipotent elements) real
    algebraic linear group. Then $exp: frak(g) -> G$ is an isomorphism of real
    algebraic varieties. If $G$ is commutative then
    $G tilde.eq RR^p$.] <exc:real-unipotent-exp-isomorphism>

  #exercise[A real algebraic linear group $G$ is unipotent if and only if so is
    $G(CC)$.] <exc:real-unipotent-iff-complexification>

  Therefore we may speak about #idx("algebraic group", "unipotent")_unipotent
  real algebraic groups._

  #exercise[Let $G$ be a real algebraic group (which may be considered linear).
    The set $Rad_u G$ of all unipotent elements contained in $Rad G$ is a normal
    algebraic subgroup of $G$ and
    $Rad_u G(CC) = (Rad_u G)(CC)$.] <exc:real-unipotent-radical>

  $Rad_u G$ is called the #idx("Radical", "unipotent")_unipotent radical_ of
  $G$.

  #exercise[$Rad_u G$ is the largest unipotent normal subgroup of a real
    algebraic group $G$.] <exc:real-unipotent-radical-largest>

  #exercise[Let $N$ be a normal algebraic subgroup of a real algebraic group
    $G$. The algebraic group $G\/N$ is reductive if and only if
    $N supset Rad_u G$.] <exc:real-reductive-quotient-criterion>

  #exercise[A real algebraic group has a finite number of connected components
    (in the usual topology). (Hint: make use of
    Exercises~@exc:real-reductive-quotient-criterion and
    @exc:reductive-real-group-components.)]
  <exc:real-algebraic-finite-components>

  A _reductive Levi subgroup_ of a real algebraic group $G$ is an algebraic
  subgroup $H subset G$, such that $G = Rad_u G times.r H$.

  #exercise[Any real algebraic group $G$ has a reductive Levi subgroup. (Hint:
    reduce to the case when $Rad_u G$ is commutative. In the latter case
    consider the group $G(CC)$ and making use of
    Theorem~@th:reductive-levi-subgroup-exists and Corollary of
    Theorem~@th:compact-affine-fixed-point prove the existence of a reductive
    Levi subgroup $H$ of $G(CC)$ such that $sigma(H) = H$, where $sigma$ is the
    complex conjugation in $G(CC)$ with respect to
    $G$.)] <exc:real-reductive-levi-exists>

  #exercise[Prove the analogue of
    Theorem~@th:reductive-subgroups-conjugate-into-levi for real algebraic
    groups.] <exc:real-reductive-levi-conjugacy>
]

#hints[
  #hint[@pr:normalizing-projection-gives-levi][Since
    $ad h: frak("gl")(frak(g)) -> frak("gl")(frak(g))$ induces a derivation of
    the algebra $ad frak(g)$ and since $ad: frak(g) -> ad frak(g)$ is an
    isomorphism, there exists $delta in der frak(g)$ such that
    $ [h, ad x] = ad delta(x) wide (x in frak(g)). $
    Clearly $delta$ is a projection of $frak(g)$ onto $rad frak(g)$.]

  #hint[@pr:unipotent-radical-largest][Follows from the fact that any unipotent
    normal subgroup is connected and solvable
    (Theorem~@th:unipotent-group-exp-isomorphism) and therefore is contained in
    $Rad G$.]

  #hint[@pr:reductive-iff-trivial-unipotent-radical][Make use of
    Problem~@pr:reductive-iff-radical-torus.]

  #hint[@pr:reductive-levi-subgroup-criterion][
    Problems~@pr:unipotent-radical-largest and
    @pr:reductive-iff-trivial-unipotent-radical imply that
    $(Rad_u G) inter H = {e}$.]

  #hint[@pr:reductive-levi-unipotent-case][Carry out the induction in
    $dim(Rad G)$ as in the proof of Theorem~@th:levi-subalgebra-exists.]

  #hint[@pr:frattini-argument-maximal-torus][Consider the $G$-action on the set
    of maximal tori of $Rad G$ via inner automorphisms and take into account the
    fact that the subgroup $Rad G subset G$ acts transitively on this set
    (Problem~@pr:solvable-maximal-tori-conjugate).]

  #hint[@pr:unipotent-radical-of-torus-normalizer][
    Problem~@pr:frattini-argument-maximal-torus implies that the algebraic group
    $G_1\/((Rad_u G) inter G_1) tilde.eq G\/Rad_u G$ is reductive so that
    $(Rad_u G) inter G_1 supset Rad_u G_1$ by
    Problem~@pr:reductive-quotient-criterion. The converse inclusion follows
    from Problem~@pr:unipotent-radical-largest.]

  #hint[@pr:reductive-conjugacy-general-case][Carry out the induction in
    $dim(Rad_u G)$ as in the proof of Theorem~@th:malcev-conjugacy.]
]
