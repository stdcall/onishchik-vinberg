// Chapter 3, § 1. Background. Printed pages 98-110; page 98 begins with the
// chapter opening (30-algebraic-groups.typ), page 110 ends with the
// beginning of § 2.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/cd.typ": ar, cd

== Background <sec:algebraic-groups-background>

=== Main Definitions <ss:algebraic-group-definitions>
In this subsection the ground field $K$ is an arbitrary infinite field. An #idx(
  "algebraic group",
)_algebraic group_ is a group $G$ endowed with the structure of an affine
algebraic variety so that the maps
$
  mu: G times G -> G, wide (x, y) |-> x y \
  iota: G -> G, wide x |-> x^(-1)
$
are morphisms of algebraic varieties.

The most important example of an algebraic group is the general linear group,
i.e. $GL_n (K)$ or, in another interpretation, the group $GL(V)$, where $V$ is
an $n$-dimensional vector space over $K$. Being a principal open subset in the
vector space $upright(L)_n (K)$, the group $GL_n (K)$ inherits the canonical
structure of an affine variety (see @ss:zariski-topology). In this situation the
rational functions in matrix elements whose denominators are powers of the
determinant serve as polynomials on $GL_n (K)$. This implies that the
multiplication and the inversion in $GL_n (K)$ are morphisms of algebraic
varieties, i.e. $GL_n (K)$ is an algebraic group.

#source(114)Similarly, the group of affine transformations of the
$n$-dimensional affine space over $K$ can be considered as an algebraic group.

Other important examples of algebraic groups are the #idx(
  "Group",
  "additive of the ground field",
)_additive group of the field
$K$_, which we will denote also by $K$, and the #idx(
  "Group",
  "multiplicative of the ground field",
)_multiplicative group of
$K$_, which we will denote by $K^*$. The latter is, however, just $GL_1 (K)$.
The #idx("product", "direct", "of algebraic groups")_direct product of algebraic
groups_ is the direct product of abstract groups endowed with the structure of
an affine variety as the direct product of affine varieties (see
@ss:direct-product-affine-varieties). Clearly, the direct product of algebraic
groups is an algebraic group.

The algebraic group $K^n$ (the direct product of $n$ copies of the additive
group of $K$) is called the _$n$-dimensional (algebraic) vector group._

The definition of an algebraic group $G$ implies that for any $g in G$ the left
and the right translations
$ l(g): x |-> g x, wide r(g): x |-> x g^(-1) $
and also the inner automorphism $a(g) = l(g) r(g)$ are automorphisms of the
algebraic variety $G$.

Since left translations act transitively on $G$, all points of the variety $G$
are on an equal footing.

#theorem[Let $G$ be an algebraic group. Put $G^0$ for the irreducible component
  of $G$ that contains the unit. Then $G^0$ is a normal subgroup and other
  irreducible components of $G$ are cosets with respect to
  $G^0$.] <th:algebraic-identity-component>

#problem[Prove Theorem~@th:algebraic-identity-component.]
<pr:prove-algebraic-identity-component>

An #idx("subgroup", "algebraic")_algebraic subgroup_ of an algebraic group is a
closed (in the Zariski topology) subgroup. Clearly, an algebraic subgroup is an
algebraic group with respect to the same group operation and induced structure
of the affine variety.

#problem[The closure of any subgroup of an algebraic group is an (algebraic)
  subgroup.] <pr:subgroup-closure-algebraic>

#problem[Any irreducible subgroup of an algebraic group épais in its closure is
  closed.] <pr:epais-irreducible-subgroup-closed>

An algebraic subgroup of a general linear group is called an #idx(
  "algebraic group",
  "linear",
)_algebraic linear group._ Let us emphasize that an _algebraic linear group_ is
_not_ just an algebraic group but an algebraic group given in a linear
representation (do not confuse this term with the term “linear algebraic group”
which means in this text the same as just “algebraic group”!).

_Examples of algebraic linear groups._ #eg <exm:special-linear-algebraic> The
group $SL(V)$ of unimodular linear transformations. The polynomials on $SL(V)$,
or on any of its algebraic subgroups, are simply polynomials in matrix elements.

#eg <exm:orthogonal-symplectic-algebraic> The groups $upright(O)(V, f)$
($Sp(V, f)$) of linear transformations that preserve a nondegenerate
(skew)symmetric bilinear form $f$.

#eg <exm:subspace-stabilizer-algebraic> The group
$ GL(V; U) = {A in GL(V): A U subset U}, $
#source(115)where $U$ is a subspace of a space $V$, and more generally, the
group
$ GL(V; U, W) = {A in GL(V): (A - E) U subset W}, $
where $U$, $W$ are subspaces of $V$ such that $W subset U$.

#eg <exm:finite-linear-group-algebraic> Any finite linear group.

#problem[Linear groups in the above examples are
  algebraic.] <pr:classical-linear-groups-algebraic>

Let $V_1, ..., V_n$ be vector spaces. The algebraic group
$GL(V_1) times dots.c times GL(V_n)$ is naturally identified with an algebraic
linear group in the space $V = V_1 plus.o dots.c plus.o V_n$ consisting of all
invertible linear transformations that preserve each of the subspaces
$V_1, ..., V_n$. In the basis of $V$, which is the union of bases of
$V_1, ..., V_n$, the elements of $GL(V_1) times dots.c times GL(V_n)$ are
presented by block-diagonal matrices. In particular,
$(K^*)^n equiv GL_1 (K) times dots.c times GL_1 (K)$ ($n$ factors) can be
presented as a group of invertible diagonal $n times n$ matrices.

A #idx("homomorphism of algebraic groups")_homomorphism of algebraic groups_ is
a map which is a group homomorphism and at the same time a morphism of algebraic
varieties. An #idx("isomorphism of algebraic groups")_isomorphism_ of algebraic
groups is an invertible homomorphism, i.e. a map which is simultaneously an
isomorphism of groups and of algebraic varieties.

Let $f: G -> H$ be a homomorphism of algebraic groups and $H_1 subset H$ an
algebraic subgroup. Clearly, $f^(-1) (H_1)$ is an algebraic subgroup in $G$. In
particular, $Ker f$ is a (normal) algebraic subgroup in $G$.

A #idx("representation", "linear")_linear representation of an algebraic group_
in a space $V$ is its homomorphism into $GL(V)$.

#problem[If $R$ and $S$ are linear representations of an algebraic group $G$,
  then the representations $R + S$, $R S$ and $R^*$ (see
  @ss:operations-on-representations) are also its linear representations as of
  an algebraic group. (Cf. Problem~@pr:sum-product-dual-representations).]
<pr:polynomial-representation-operations>

In particular, this implies that the natural linear representation $T_(k, l)$ of
$GL(V)$ in the space of tensors of type $(k, l)$ (see
@ss:operations-on-representations) is its linear representation as of an
algebraic group.

The one-dimensional linear representations of an algebraic group $G$ are called
its #idx("character of an algebraic group")_characters._ They constitute a group
which will be denoted by $cal(X)(G)$, cf. @ss:operations-on-representations.

Let $L$ be a field extension of $K$. For any algebraic group $G$ over $K$ we may
consider the algebraic group $G(L)$ over $L$ whose variety is obtained from the
variety $G$ by a field extension, cf. @ss:embedded-affine-varieties and
@ss:morphisms-affine-varieties, and the group operations are the morphisms
extending the operations of $G$. The group $G$ is a dense subgroup of $G(L)$ as
is shown in Problem~@pr:field-extension-zariski-closure.

=== Complex and Real Algebraic Groups <ss:complex-real-algebraic-groups>

#problem[Any complex algebraic group is a nonsingular algebraic
  variety.] <pr:algebraic-group-nonsingular>

Due to this fact any complex algebraic group possesses a canonical complex
analytic manifold structure, cf. @ss:analytic-structure-of-varieties. Similarly,
any real algebraic group possesses a canonical real analytic manifold structure.
Since morphisms of nonsingular complex and real affine varieties are analytic,
the following statement holds.

#theorem[#source(116)Any complex (real) algebraic group is a complex (real) Lie
  group of the same dimension. Any algebraic subgroup of a complex or real
  algebraic group is its Lie subgroup.] <th:algebraic-group-is-lie-group>

However, not any Lie subgroup is an algebraic subgroup.

#problem[Subgroups ${exp t mat(1, 0; 0, i): t in CC}$ and
  ${exp t mat(1, 1; 0, 1): t in CC}$ of $GL_2 (CC)$ are Lie subgroups but not
  algebraic subgroups.] <pr:non-algebraic-lie-subgroups>

Any homomorphism of complex or real algebraic groups is at the same time a Lie
group homomorphism but not vice versa. If it is necessary to emphasize that we
are speaking about an algebraic group homomorphism we will say “polynomial
homomorphism”. We will also adopt the similar convention for linear
representations.

#problem[Any complex algebraic group connected in the real topology is
  irreducible.] <pr:connected-complex-group-irreducible>

The converse is also true: see Theorem~@th:irreducible-complex-group-connected.
Moreover, any irreducible complex algebraic variety is connected, see e.g.
[@bib:Shafarevich1974].

The #idx("realification of an algebraic group")realification of complex affine
varieties (see @ss:realification-of-varieties) transforms any complex algebraic
group $G$ into a real algebraic group $G^RR$ of the doubled dimension.

As an example, consider $GL_n (CC)$. The polynomial algebra on this group is
generated by the matrix elements and the function $A |-> (det A)^(-1)$. By
@ss:realification-of-varieties this implies that the algebraic subgroups of
$GL_n (CC)^RR$ (we will call them #idx("subgroup", "algebraic", "real")_real
algebraic subgroups_ of $GL_n (CC)$) are the subgroups which can be determined
by algebraic equations in the matrix elements and their complex conjugates.

For instance, the unitary group $upright(U)_n$ is a real algebraic subgroup of
$GL_n (CC)$ and therefore a real algebraic group.

A real algebraic subgroup $G_0$ is a #idx(
  "real form of an algebraic group",
)_real form_ of a complex algebraic group $G$ if the identity embedding
$G_0 subset G$ extends to an isomorphism $G_0 (CC) arrow.r.tilde G$.

#problem[Any subgroup $G_0 subset G$ which is a real form of a group variety $G$
  is a real form of the group $G$. The complex conjugation with respect to $G_0$
  is an automorphism of $G$ as of an abstract
  group.] <pr:group-variety-real-form>

A map of complex algebraic groups which is a homomorphism of abstract groups and
an antiholomorphic morphism of their group varieties is called an #idx(
  "homomorphism",
  "antiholomorphic",
)_antiholomorphic homomorphism._ By the above, the complex conjugation with
respect to any real form $G_0$ is an involutive antiholomorphic automorphism of
the group $G$. For the irreducible groups the converse statement is also true.

#problem[The set of fixed points of any involutive antiholomorphic automorphism
  of an irreducible complex algebraic group is its real
  form.] <pr:group-real-form-from-involution>

For instance the subgroups $GL_n (RR)$ and $upright(U)_n$ are real forms of the
group $GL_n (CC)$ since they are the sets of fixed points of the involutive
antiholomorphic automorphisms $A |-> overline(A)$ and
$A |-> (overline(A)^t)^(-1)$, respectively.

#source(117)For the reducible groups the similar statement is false as the
example of the complex conjugation in the group of cubic roots of unity shows.

=== Semidirect Products <ss:algebraic-semidirect-products>
A #idx("product", "semidirect", "of algebraic groups")_semidirect product of
algebraic groups_ $G_1$ and $G_2$ is defined as the semidirect product
$G_1 times.r_b G_2$ of abstract groups, cf. @ss:semidirect-product-lie-groups,
endowed with the affine variety structure as the direct product of affine
varieties. Here it is required that the map~@eq:semidirect-action-map be
polynomial which ensures the polynomiality of the group operations.

Clearly, a semidirect product of complex or real algebraic groups is at the same
time their semidirect product as of Lie groups.

Let an algebraic group $G$ decompose into a semidirect product of its algebraic
subgroups $G_1$ and $G_2$, as an abstract group. Then the action $b$ of $G_2$ on
$G_1$ by conjugations is polynomial and we may form an algebraic group
$G_1 times.r_b G_2$. Theorem~@th:bijective-homomorphism-isomorphism which will
be proved in the following subsection shows that if the ground field $K$ is
algebraically closed and $char K = 0$ then the abstract isomorphism
$G_1 times.r_b G_2 arrow.r.tilde G$ defined by
@eq:semidirect-splitting-isomorphism is an algebraic group isomorphism.

If $char K = p > 0$ this might be false. For instance in this case the algebraic
group $(K^*)^2 = {(z_1, z_2): z_1, z_2 in K^*}$ splits as an abstract group into
the direct product of algebraic subgroups distinguished by the equations
$z_2 = 1$ and $z_2 = z_1^p$ respectively. However, $(K^*)^2$ is not the direct
product of these subgroups as an algebraic group.

_Examples._ (cf. @ss:semidirect-product-lie-groups).
#eg <exm:algebraic-affine-group-semidirect> The group of affine transformations
of a vector space $V$ decomposes as an algebraic group into the semidirect
product of the normal subgroup of parallel translations and $GL(V)$.

#eg <exm:algebraic-triangular-group-semidirect> The group of invertible (upper)
triangular $n times n$ matrices decomposes as an algebraic group into the
semidirect product of the normal subgroup of unitriangular matrices and the
subgroup of invertible diagonal matrices.

=== Certain Theorems on Subgroups and Homomorphisms of Algebraic Groups
<ss:algebraic-subgroups-homomorphisms>
Hereafter and till the end of §~@sec:tangent-algebra-algebraic-group
(subsection~@ss:tangent-algebra-real-algebraic-group excluded) the ground field
$K$ is assumed to be algebraically closed. This assumption is essential, in
particular, for the subsequent theorems whose proof is based on the theorems on
the image and the factorization of morphisms of algebraic varieties.

#theorem[Let $f: G -> H$ be an algebraic group homomorphism. Then $f(G)$ is an
  algebraic subgroup of $H$.] <th:homomorphism-image-algebraic>

#problem[Prove this theorem.] <pr:prove-homomorphism-image-algebraic>

#theorem[The subgroup $H$ of an algebraic group $G$ generated by an arbitrary
  family ${M_alpha | alpha in A}$ ($A$ is an index set) of irreducible subsets
  that contain the unit and are épais in their closures is an irreducible
  algebraic subgroup. In particular, the subgroup generated by an arbitrary
  family of irreducible algebraic subgroups is an irreducible algebraic
  subgroup.] <th:generated-subgroup-algebraic>

#proof[For any finite sequence $(epsilon_1, ..., epsilon_k)$, where
  $epsilon_i = plus.minus 1$, consider the morphism ($k$ factors)
  #source(118)
  $
    mu^(epsilon_1 dots.c epsilon_k): G times dots.c times G -> G, wide
    (g_1, ..., g_k) |-> g_1^(epsilon_1) ... g_k^(epsilon_k).
  $
  The subgroup $H$ is the union of the subsets of the form
  $
    M_(alpha_1 ... alpha_k)^(epsilon_1 dots.c epsilon_k)
    = mu^(epsilon_1 dots.c epsilon_k) (M_(alpha_1) times dots.c times
      M_(alpha_k)) wide (alpha_1, ..., alpha_k in A).
  $
  Each of these subsets is irreducible and épais in its closure as the image of
  an irreducible subset which is épais in its closure, namely
  $M_(alpha_1) times dots.c times M_(alpha_k) subset G times dots.c times G$
  ($k$ factors), under the morphism $mu^(epsilon_1 dots.c epsilon_k)$ (see
  Theorem~@th:dominant-morphism-image-epais and
  Problems~@pr:principal-open-subsets-base and
  @pr:product-of-irreducible-varieties). Besides, since each of the subsets
  $M_alpha$ contains the unit,
  $
    M_(alpha_1 ... alpha_k)^(epsilon_1 dots.c epsilon_k) union
    M_(alpha_(k+1) ... alpha_(k+l))^(epsilon_(k+1) dots.c epsilon_(k+l))
    subset M_(alpha_1 ... alpha_(k+l))^(epsilon_1 dots.c epsilon_(k+l)).
  $

  By Theorem~@th:irreducible-chains-stabilize any non-decreasing chain
  consisting of the closures of
  $M_(alpha_1 ... alpha_k)^(epsilon_1 dots.c epsilon_k)$ stabilizes. Hence,
  among all such closures there is one that contains all the others. Denote it
  by $N$. Clearly, $overline(H) = N$ and $H$ is épais in $N$. By
  Problem~@pr:epais-irreducible-subgroup-closed this implies that $H = N$.]

#theorem[The commutator subgroup of an irreducible algebraic group is an
  irreducible algebraic subgroup.] <th:commutator-subgroup-irreducible>

#problem[Prove Theorem~@th:commutator-subgroup-irreducible.]
<pr:prove-commutator-subgroup-irreducible>

Note that the similar theorem for Lie groups is false (see
Exercise~@exc:commutator-not-lie-subgroup).

#corollary[The commutator subgroup of an irreducible complex algebraic group is
  a Lie subgroup.]

#problem[Let $G$ and $H$ be irreducible algebraic groups and $f: G -> H$ a map
  which is an abstract group homomorphism and coincides with a rational map
  $f_0: G -> H$ on the latter's domain. Then $f$ is a polynomial
  homomorphism.] <pr:rational-homomorphism-polynomial>

#theorem[A bijective homomorphism of algebraic groups over a field of zero
  characteristic is an isomorphism.] <th:bijective-homomorphism-isomorphism>

#problem[Prove this theorem.] <pr:prove-bijective-homomorphism-isomorphism>

Over a field $K$ of characteristic $p > 0$ the similar theorem fails. A
counterexample is given by the Frobenius endomorphism $x |-> x^p$ of $K$ (or
$K^*$).

=== Actions of Algebraic Groups <ss:algebraic-group-actions>
An #idx("Action of an algebraic group")_action of the algebraic group $G$_ on a
quasiprojective algebraic variety $M$ is a homomorphism $alpha$ of $G$ into the
group of automorphisms of $M$ such that the map
$ G times M -> M, wide (g, x) |-> alpha(g) x $ <eq:algebraic-action-map>
is a morphism of algebraic varieties.

For example, any algebraic group acts in three ways on itself: by the action $l$
by the left translations, the action $r$ by the right translations and the
action $a$ by inner automorphisms. Any linear representation of an algebraic
group may be considered as its action on the space of the representation.

#source(119)When it is necessary to emphasize that we mean an action of an
algebraic group and not of a Lie group or an abstract group we will use the term
“an algebraic action”.

#problem[The natural action of $GL(V)$ on the projective space $P(V)$ is
  algebraic.] <pr:projective-action-algebraic>

#problem[If an algebraic group $G$ acts on a reducible quasiprojective variety
  $M$, then the elements of $G^0$ transform each irreducible component of $M$
  into itself.] <pr:identity-component-preserves-components>

#theorem[Suppose $alpha$ is an action of an algebraic group $G$ on a
  quasiprojective algebraic variety $M$ and $x in M$. Then

  1) the stabilizer $G_x$ is an algebraic subgroup of $G$;

  2) the orbit $alpha(G) x$ is a non-singular algebraic subvariety of
  $M$.] <th:stabilizer-orbit-algebraic>

#problem[Prove Theorem~@th:stabilizer-orbit-algebraic.]
<pr:prove-stabilizer-orbit-algebraic>

#corollary[Under the conditions of the theorem $G$ possesses at least one closed
  orbit on $M$.]

#proof[The boundary of any orbit is invariant with respect to $G$. The dimension
  of the boundary is less than that of the orbit itself and therefore the
  boundary consists of orbits of lesser dimension. Therefore any orbit of the
  minimal dimension is closed.]

Clearly, any algebraic action of a complex algebraic group on a non-singular
quasiprojective variety is also an action in the sense of Lie group theory, i.e.
it is differentiable. In this situation the orbits are differentiable
submanifolds due to Theorem~@th:stabilizer-orbit-algebraic, which is in general
false for arbitrary differentiable actions. (See Example in
@ss:image-and-kernel-of-homomorphism\; its complexification gives a similar
example for complex Lie groups).

The local closedness of orbits and closedness of images of homomorphisms stand
in favour of the theory of algebraic groups as compared to the theory of Lie
groups, where the phenomenon of dense winding of a torus, that does not deserve
such an attention, required lengthy discussions. Confining ourselves to
algebraic Lie groups and their algebraic actions we may get rid of various
nuisances without substantially impoverishing the Lie group theory.

=== Existence of a Faithful Linear Representation
<ss:faithful-linear-representation>
In the theory of linear representations of compact topological groups one of the
main methods is the study of the regular representation, i.e. the linear
representation of the group in the space of functions on this group induced by
its action on itself, say by right translations. This method turns out to be
fruitful in the theory of algebraic groups as well. Making use of this method we
will prove in this subsection the following

#theorem[Any algebraic group is isomorphic to an algebraic linear
  group.] <th:algebraic-group-linear>

First, consider the following general situation. Suppose $alpha$ is an action of
any algebraic group $G$ on an affine variety $M$. Put $alpha_*$ for the
corresponding linear #source(120)representation of $G$ in the space $K[M]$ of
polynomials on $M$ defined by the formula
$
  (alpha_* (g) f)(x) = f(alpha(g)^(-1) x).
$ <eq:induced-function-representation>
This representation is infinite-dimensional (unless $M$ consists of a finite
number of points). However, we will see that it is the inductive limit of
finite-dimensional representations.

By the definition of an algebraic action, the function
$ (g, x) |-> f(alpha(g)^(-1) x) = f(alpha(g^(-1)) x) $
is a polynomial on $G times M$ for any $f in K[M]$. Since
$K[G times M] = K[G] times.o K[M]$ (see @ss:direct-product-affine-varieties),
there exist polynomials $phi_i in K[G]$, $f_i in K[M]$, where $i = 1, ..., n$,
such that
$ f(alpha(g)^(-1) x) = sum_(1 <= i <= n) phi_i (g) f_i (x). $
For a fixed $g in G$ we deduce that
$ alpha_* (g) f = sum_(1 <= i <= n) c_i f_i, $
where $c_i = phi_i (g) in K$. In other words, the orbit of a polynomial $f$
under the action $alpha_*$ of $G$ is contained in the finite-dimensional
subspace $chevron.l f_1, ..., f_n chevron.r subset K[M]$. Its linear span is a
finite-dimensional invariant subspace containing $f$. Therefore, we have proved

#theorem[For any action $alpha$ of $G$ on an affine algebraic variety $M$ the
  space $K[M]$ is the union of finite-dimensional subspaces invariant with
  respect to $alpha_* (G)$.] <th:function-algebra-locally-finite>

#problem[Any finite-dimensional subrepresentation of $alpha_*$ is a polynomial
  one.] <pr:finite-subrepresentation-polynomial>

Now, let $r$ be an action of an algebraic group $G$ on itself by right
translations. The corresponding linear representation $r_*$ of $G$ in the space
$K[G]$ defined by the formula
$ (r_* (g) f)(x) = f(x g) $ <eq:right-regular-representation>
is called the (_right_) #idx("representation", "regular")_regular
representation_ of $G$.

Let $V subset K[G]$ be a finite dimensional subspace invariant with respect to
$r_* (G)$. Denote by $R$ the linear representation of $G$ in the space $V$
induced by $r_*$. By Theorem~@th:homomorphism-image-algebraic the image
$H = R(G)$ of $G$ under this representation is an algebraic subgroup of $GL(V)$.
We will see that the space $V$ may be chosen so that the map $R: G -> H$ is an
isomorphism of algebraic groups. The homomorphism $R^*: K[H] -> K[G]$ is
injective by the definition of $H$ and its image is a subalgebra generated by
the matrix elements of $R$.

#problem[#source(121)The linear span of the matrix elements of $R$ contains
  $V$.] <pr:matrix-elements-contain-subspace>

If we take for $V$ a subspace containing a system of generators of $K[G]$, then
the homomorphism $R^*: K[H] -> K[G]$ is an algebra isomorphism, hence the map
$R: G -> H$ is an isomorphism of algebraic groups. Therefore,
Theorem~@th:algebraic-group-linear is proved.#qed-mark

With this theorem we easily prove the following important statement: _the
adjoint representation of a complex algebraic group $G$ is polynomial._ Indeed,
if $G$ is realized as a linear group, then its adjoint representation is a
subrepresentation of the linear representation $T_(1, 1)|_G$ whose polynomiality
follows from Problem~@pr:polynomial-representation-operations.

=== The Coset Variety and the Quotient Group <ss:coset-variety-quotient-group>
Let $G$ be an algebraic group, $H$ its algebraic subgroup. It is natural to ask:
how to introduce an algebraic variety structure on the coset space $G\/H$? The
necessary requirement here is that the action of $G$ on $G\/H$ be algebraic.
When $K$ is of zero characteristic this requirement already guarantees the
uniqueness of the desired structure.

#problem[Let $char K = 0$. Suppose that a quasiprojective algebraic variety
  structure is introduced on $G\/H$ so that the canonical action of $G$ on
  $G\/H$ is an algebraic one. Then for any action $alpha$ of $G$ on a
  quasiprojective variety $M$ and any point $x in M$ satisfying $G_x supset H$
  the map
  $ beta: G\/H -> M, wide g H |-> alpha(g) x $
  is a morphism of algebraic varieties. If $beta$ is a bijection (i.e. if
  $G_x = H$ and $alpha$ is transitive), then $beta$ is an
  isomorphism.] <pr:coset-variety-universal-property>

The existence of an algebraic structure on $G\/H$ is proved with the help of the
following theorem.

#theorem(title: [#idx("Chevalley theorem")Chevalley's theorem])[Let $G$ be an
  algebraic group, $H$ its algebraic subgroup. There exist a linear
  representation $R: G -> GL(V)$ and a vector $v_0 in V$ such that
  $H = {h in G: R(h) v_0 in K v_0}$. If $H$ is a normal subgroup, then there
  exists a linear representation $T$ of $G$ such that
  $H = Ker T$.] <th:chevalley-line-stabilizer>

_Proof_ of this theorem makes use of the regular representation $r_*$ of $G$.
Let $I_G (H)$ be the ideal of $K[G]$ consisting of all polynomials that vanish
on $H$.

#problem[$H = {h in G: r_* (h) I_G (H) subset I_G (H)}$.]
<pr:subgroup-stabilizes-its-ideal>

Choose a finite-dimensional subspace $U subset K[G]$ invariant with respect to
$r_* (G)$ and containing a system of generators of $I_G (H)$. Denote by $W$ its
intersection with $I_G (H)$ and by $S$ a (polynomial) linear representation of
$G$ in $U$ induced by $r_*$ (see
Problem~@pr:finite-subrepresentation-polynomial).

#problem[$H = {h in G: S(h) W subset W}$.]
<pr:subgroup-stabilizes-finite-subspace>

Let $(f_1, ..., f_m)$ be a basis of $W$. Put $V = Lambda^m U$,
$v_0 = f_1 and dots.c and f_m$ and denote by $R$ the linear representation of
$G$ in $V$ induced by $S$ (the subrepresentation of $T_(m, 0) compose S$).

#problem[#source(
    122,
  )$H = {h in G: R(h) v_0 in K v_0}$.] <pr:subgroup-stabilizes-wedge-line>

Thus, the first part of the theorem is proved. Now suppose that $H$ is a normal
subgroup. Denote by $chi_0$ the character of $H$ defined from the identity
$ R(h) v_0 = chi_0 (h) v_0 wide (h in H) $

By the definition (see @ss:lie-theorem) $chi_0$ is a weight of the
representation $R|_H$ and $v_0$ the corresponding weight vector.

Let $chi_0, chi_1, ..., chi_k$ be different characters of $H$ constituting
${chi_0^g: g in G}$. By Problem~@pr:normal-subgroup-weights-permuted the sum
$plus.o.big_(0 <= i <= k) V_(chi_i) (H) = V_1$ is invariant with respect to the
representation $R$ of $G$ and the operators of the representation transitively
permute its summands. (In particular, if $G$ is irreducible the sum contains
only one summand, i.e. the space $V_(chi_0) (H)$ is already invariant with
respect to $R(G)$.)

Consider the restriction $T$ of the natural linear representation of $G$ in
$upright(L)(V_1)$ onto the invariant subspace
$plus.o.big_(0 <= i <= k) upright(L)(V_(chi_i) (H)) = upright(L)_0 (V_1)$.

#problem[$H = Ker T$.] <pr:normal-subgroup-as-kernel>

The theorem is proved.#qed-mark

Returning to the problem of defining an algebraic variety structure on $G\/H$ we
can, under the notation of Theorem~@th:chevalley-line-stabilizer, identify
$G\/H$ with the orbit $O$ of the point $K v_0 in P(V)$ under the natural
$G$-action in the projective space $P(V)$ defined by the representation $R$. By
Theorem~@th:stabilizer-orbit-algebraic it is an (embedded) quasiprojective
variety. The $G$-action on $G\/H$ by left translations coincides with the
restriction onto $O$ of the natural $G$-action in the space $P(V)$, hence, it is
algebraic.

Similarly, if $H$ is a normal subgroup, then we can, under the notation of
Theorem~@th:chevalley-line-stabilizer, identify $G\/H$ with the group $T(G)$
which is, due to Theorem~@th:homomorphism-image-algebraic, an algebraic linear
group.

These results combined with Problem~@pr:coset-variety-universal-property yield
the following theorem.

#theorem[Let $char K = 0$ and $G$ an algebraic group, $H$ its algebraic
  subgroup. Then, on $G\/H$, there is a unique quasiprojective algebraic variety
  structure for which the canonical $G$-action on $G\/H$ is algebraic. If, in
  addition, $H$ is normal, then $G\/H$ is an affine variety and the quotient
  group $G\/H$ is algebraic.] <th:coset-variety-char-zero>

The reader has probably noticed the difference of our approaches to the
definition of coset varieties for algebraic groups and coset manifolds for Lie
groups. In fact we might base the definition of an algebraic structure on cosets
for an algebraic group on the notion of factorization as we had done for Lie
groups.

A map $p: M -> N$ of algebraic varieties is called a #idx(
  "quotient map of algebraic varieties",
)_quotient map_ if

1) a subset $U subset N$ is open if and only if $p^(-1) (U)$ is open in $M$;

2) a function $f$ defined on an open subset $U subset N$ belongs to
$cal(O)_N (U)$ if and only if $p^* f in cal(O)_M (p^(-1) (U))$.

For the proof of the following theorem see e.g. [@bib:Merzlyakov1987].

#theorem[Let $G$ be an algebraic group and $H$ an algebraic subgroup. Then there
  exists a unique quasiprojective algebraic variety structure on $G\/H$ for
  which #source(123)the canonical map $p: G -> G\/H$ is a quotient map. With
  respect to this structure the canonical $G$-action on $G\/H$ is algebraic and
  if $H$ is normal then $G\/H$ is an algebraic
  group.] <th:coset-variety-quotient-map>

#exercises[
  #exercise[In the definition of an algebraic group the requirement on the
    inversion to be a morphism is redundant. (Hint: analyze the proof of
    Theorem~@th:algebraic-group-linear.)] <exc:inversion-morphism-redundant>

  #exercise[The automorphism group of an arbitrary finite-dimensional algebra is
    an algebraic linear group.] <exc:algebra-automorphisms-algebraic>

  #exercise[If $M$ and $N$ are épais subsets of an irreducible algebraic group
    $G$ then $M N = G$.] <exc:product-of-epais-subsets>

  In
  exercises~@exc:generated-subgroup-finite-product–@exc:commutator-subgroup-algebraic
  the ground field $K$ should be assumed algebraically closed.

  #exercise[Under the conditions of Theorem~@th:generated-subgroup-algebraic
    there exist $alpha_1, ..., alpha_k$ and
    $epsilon_1, ..., epsilon_k = plus.minus 1$ such that
    $H = M_(alpha_1)^(epsilon_1) ... M_(alpha_k)^(epsilon_k)$.]
  <exc:generated-subgroup-finite-product>

  #exercise[Give an example which shows that the irreducibility of $M_alpha$'s
    in Theorem~@th:generated-subgroup-algebraic is essential for the
    algebraicity of $H$.] <exc:reducible-generators-counterexample>

  #exercise[The commutator group of any (not necessarily irreducible) algebraic
    group $G$ is its algebraic subgroup. (Hint: first prove using
    Theorem~@th:generated-subgroup-algebraic that $(G, G^0)$ is an algebraic
    subgroup; then make use of the theorem that if the center of a group is of
    finite index then its commutator group is
    finite.)] <exc:commutator-subgroup-algebraic>

  #exercise[Any connected real algebraic group is
    irreducible.] <exc:connected-real-group-irreducible>

  #exercise[Give an example of an irreducible real algebraic group which is not
    connected.] <exc:irreducible-real-group-disconnected>

  #exercise[Let $G subset GL_n (CC)$ be an irreducible complex algebraic group,
    $overline(G)$ its complex conjugate. The map
    $G^RR (CC) arrow.r.tilde G times overline(G)$ which to any $A in G^RR$
    assigns $(A, overline(A))$ is an
    isomorphism.] <exc:realification-complexification-group>

  #exercise[The set of fixed points of an action of an algebraic group $G$ on a
    quasiprojective variety $M$ is closed in
    $M$.] <exc:action-fixed-points-closed>

  #exercise[The kernel of an action of an algebraic group $G$ on a
    quasiprojective variety $M$ is a (normal) algebraic subgroup of
    $G$.] <exc:action-kernel-algebraic>

  #exercise[For any action of an algebraic group $G$ on an affine variety $M$
    there exists an embedding of $M$ in a vector space $V$ such that the action
    is induced by a linear representation of $G$ in $V$. (Hint: for $V$ take the
    vector space dual to a finite-dimensional $G$-invariant subspace of $K[M]$
    that contains a system of generators of this
    algebra).] <exc:affine-action-linearization>

  #exercise[Reproducing the proof of Theorem~@th:algebraic-group-linear
    construct a faithful linear representation of the additive group of the
    field.] <exc:additive-group-faithful-representation>

  #exercise[Let $H$ be an algebraic subgroup of a complex algebraic group $G$
    such that the quotient space $G\/H$ is compact in the real topology. Then
    $G\/H$ is a projective algebraic
    variety.] <exc:compact-coset-space-projective>
]

#hints[
  #hint[@pr:prove-algebraic-identity-component][Make use of the fact that
    transformations of the form $l(g)$, $r(g)$ and $a(g)$, where $g in G$, being
    automorphisms of the group variety, can only permute its irreducible
    components.]

  #hint[@pr:epais-irreducible-subgroup-closed][#source(124)Proof is similar to
    that of Problem~@pr:lie-subgroup-is-closed.]

  #hint[@pr:algebraic-group-nonsingular][Follows from the fact that all the
    points of a group variety are on equal footing.]

  #hint[@pr:non-algebraic-lie-subgroups][If $A$ is one of the matrices
    $mat(1, 0; 0, i)$, $mat(1, 1; 0, 1)$, then the map $CC -> GL_2 (CC)$,
    $t |-> exp t A$, is a proper one (i.e. the preimage of any compact is
    compact itself). This implies that these subgroups are Lie subgroups. The
    first of them is contained in the algebraic subgroup of diagonal matrices
    but is not algebraic itself since there is no nonzero polynomial $f$ of two
    variables (the diagonal elements of the matrices) such that
    $f(e^t, e^(i t)) = 0$ for all $t in CC$. The proof of the fact that the
    other subgroup is not algebraic is similar.]

  #hint[@pr:group-variety-real-form][Proof is deduced from the continuity of the
    group operations and the complex conjugation and from the density of $G_0$
    in $G$.]

  #hint[@pr:group-real-form-from-involution][Follows from
    Theorem~@th:antiholomorphic-involution-real-form.]

  #hint[@pr:prove-homomorphism-image-algebraic][For an irreducible $G$ follows
    from Theorem~@th:dominant-morphism-image-epais and
    Problem~@pr:epais-irreducible-subgroup-closed.]

  #hint[@pr:prove-commutator-subgroup-irreducible][Apply
    Theorem~@th:generated-subgroup-algebraic to the set $M$ of all commutators
    of elements of $G$.]

  #hint[@pr:rational-homomorphism-polynomial][For any $g in G$ the diagram of
    rational maps
    $
      #cd(
        (A: (0, 0, $G$), B: (0, 1, $H$), C: (1, 0, $G$), D: (1, 1, $H$)),
        (
          ar("A", "B", label: $f_0$),
          ar("A", "C", label: $l(g)$, side: "right"),
          ar("B", "D", label: $l(f(g))$),
          ar("C", "D", label: $f_0$),
        ),
        column: 26mm,
        row: 22mm,
      )
    $
    commutes. From here we deduce that $f_0$ is defined everywhere, hence $f_0$
    is polynomial (see Problem~@pr:rational-functions-on-principal-open).]

  #hint[@pr:prove-bijective-homomorphism-isomorphism][For irreducible groups
    this follows from Theorem~@th:morphism-factors-through-dominant and
    Problem~@pr:rational-homomorphism-polynomial. In the general case it is
    necessary to make use of Problem~@pr:morphism-local-on-covering.]

  #hint[@pr:prove-stabilizer-orbit-algebraic][The orbit $alpha(G) x$ is the
    image of $G$ under the morphism
    $ alpha^x: G -> M, wide g |-> alpha(g) x. $

    We may assume that $G$ is irreducible.
    Theorem~@th:quasiprojective-dominant-image-epais implies then that the orbit
    is épais in its closure but, since all its points are on equal footing, it
    is open in its closure, i.e. is an algebraic subvariety of $M$. The same
    (“equality of rights” of points) considerations show that this subvariety is
    non-singular.]

  #hint[@pr:finite-subrepresentation-polynomial][Let $(f_1, ..., f_n)$ be a
    basis of a $G$-invariant subspace $V subset K[M]$. Then the definition of an
    algebraic action implies that
    $
      f_j (alpha(g)^(-1) x) = sum_i a_(i j) (g) f_i (x) wide
      (g in G, x in M),
    $
    where $a_(i j) in K[G]$.]

  #hint[@pr:matrix-elements-contain-subspace][Let $(f_1, ..., f_n)$ be a basis
    of $V$. Then
    $ f_j (x g) = sum_i a_(i j) (g) f_i (x), $
    #source(125)where $a_(i j)$ are the matrix elements of the representation
    $R$. Substituting $x = e$ we find that $f_j = sum_i c_i a_(i j)$, where
    $c_i = f_i (e)$.]

  #hint[@pr:coset-variety-universal-property][For an irreducible group $G$ it
    follows from Theorem~@th:quasiprojective-morphism-factorization and the
    homogeneity (equal rights of points) considerations. For a reducible group
    $G$ it is necessary to make use of Problem~@pr:morphism-local-on-covering.]

  #hint[@pr:subgroup-stabilizes-its-ideal][
    $r(h) H subset H <=> r_* (h) I_G (H) subset I_G (H)$.]

  #hint[@pr:subgroup-stabilizes-wedge-line][Follows from the fact that a
    subspace is uniquely determined by the exterior product of its basis vectors
    (see Problem~@pr:simple-multivector-subspace).]

  #hint[@pr:normal-subgroup-as-kernel][Follows from the fact that the
    centralizer of $upright(L)_0 (V_1)$ in $upright(L)(V_1)$ consists of
    operators acting as scalars on each of $V_(chi_i) (H)$.]
]
