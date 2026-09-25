// Chapter 5, § 2. Compact Lie Groups and Reductive Algebraic Groups.
// Printed pages 238-254; § 2 opens at the top of page 238, and page 254
// goes on with the beginning of § 3.
#import "main-defs.typ": *
#import "statements.typ": *

== Compact Lie Groups and Reductive Algebraic Groups
<sec:compact-and-reductive-groups>

#source(253)The main goal of this section is to establish a one-to-one
correspondence between the compact Lie groups and the reductive complex
algebraic groups and also between homomorphisms of compact and reductive groups.
In the language of category theory this means that there is an equivalence
between the categories of compact Lie groups and reductive complex algebraic
groups. An important corollary is the theorem on complete reducibility of linear
representations of semisimple Lie algebras. An essential role in the theory
developed here is played by the theorem on polar decomposition which we prove in
the real setting having in mind its different applications. One of them is the
proof of the connectedness of the set of real points of a simply connected
complex semisimple Lie group $G$, defined over $RR$.

=== Polar Decomposition <ss:polar-decomposition>
In linear algebra the theorem on polar decomposition of a linear operator in a
finite-dimensional Euclidean or Hermitian space $bold(E)$ is well-known: any
element $A in GL(bold(E))$ uniquely presents in the form $A = X Y$, where $X$ is
an orthogonal (or unitary) operator and $Y$ is a positive definite self-adjoint
operator. In this subsection we distinguish a class of algebraic linear groups
for which a similar theorem holds. In the complex case all algebraic groups
possessing a compact real form belong to this class (we shall see later that
these algebraic groups are exactly the reductive ones).

At first we want to refine the above theorem on polar decomposition for the
group $GL(bold(E))$. Set $K = upright(O)(bold(E))$ (respectively
$upright(U)(bold(E))$). Consider the map
$phi: K times S(bold(E)) -> GL(bold(E))$ defined by
$ phi(k, y) = k exp y. $ <eq:polar-decomposition-map>
The uniqueness of the polar decomposition and
Problem~@pr:exp-self-adjoint-to-positive imply that $phi$ is bijective.
Actually, the following lemma holds.

#lemma[The map $phi: K times S(bold(E)) -> GL(bold(E))$ given by
  @eq:polar-decomposition-map is a
  diffeomorphism.] <lem:polar-map-gl-diffeomorphism>

#proof[Show that the map $d_((k_0, y_0)) phi$ is injective for all $k_0 in K$,
  $y_0 in S(bold(E))$. Using the left translation by $k_0$ we reduce the proof
  to the case $k_0 = e$. The tangent algebra $frak(k)$ of $K$ consists of all
  skew-symmetric (skew-Hermitian) operators. It is easy to see that
  $
    d_((e, y_0)) phi(x, y) = x exp y_0 + (d_(y_0) exp) y wide
    (x in frak(k), y in S(bold(E))).
  $
  Set $p_0 = exp y_0$, $z = (d_(y_0) exp) y$. Suppose
  $d_((e, y_0)) phi(x, y) = x p_0 + z = 0$. Then
  $p_0^(-1\/2) x p_0^(1\/2) = -p_0^(-1\/2) z p_0^(-1\/2)$; the right-hand side
  of this identity is, clearly, a self-adjoint operator, but on the left we have
  an operator whose characteristic roots are purely imaginary. Hence,
  $x = z = 0$. Therefore, we have to prove that $y = 0$, i.e. the injectivity of
  $d_(y_0) exp$.

  Consider the curves $y(t) = y_0 + t y$ and $z(t) = exp y(t)$ and differentiate
  the identity $y(t) z(t) = z(t) y(t)$ with respect to $t$. Since $z = 0$, we
  have $y p_0 = p_0 y$. Since #source(254)$y_0$ and $p_0$ have the same
  eigenspaces, $y y_0 = y_0 y$. It follows from Problem~@pr:exp-of-commuting-sum
  that $z(t) = p_0 exp t y$. Hence, $p_0 y = 0$ and $y = 0$.]

For an arbitrary $g in frak(g l)(bold(E))$ denote by $g^*$ its adjoint operator.
A linear group $G subset GL(bold(E))$ is called #idx(
  "Group",
  "linear",
  "self-adjoint",
)_self-adjoint_ if $g^* in G$ for any $g in G$.

#theorem[Let $bold(E)$ be a finite-dimensional Euclidean (Hermitian) vector
  space, $G subset GL(bold(E))$ a self-adjoint algebraic (real or complex)
  group, $K = G inter upright(O)(bold(E))$ (resp. $G inter upright(U)(bold(E))$)
  and $P = G inter P(bold(E))$. Then
  $ G = K P, $ <eq:polar-decomposition-kp>
  each element $g in G$ being uniquely presented in the form $g = k p$, where
  $k in K$, $p in P$. More precisely, denote
  $frak(p) = frak(g) inter S(bold(E))$, then the map $phi: K times frak(p) -> G$
  defined by @eq:polar-decomposition-map is a diffeomorphism. For any $g in G$
  we have
  $
    g P g^* = P.
  $ <eq:polar-positive-part-invariance>]
<th:self-adjoint-group-polar-decomposition>

#proof[Formula~@eq:polar-decomposition-kp is proved by a trick well known in the
  linear algebra. If $g in G$ then $q = g^* g in P$.
  Problem~@pr:algebraic-group-real-powers implies that $p = q^(1\/2) in P$.
  Clearly, $k = g p^(-1)$ is an orthogonal (unitary) operator, whence $k in K$
  and $g = k p$. It follows from Lemma~@lem:polar-map-gl-diffeomorphism that
  $phi$ is a diffeomorphism. Formula~@eq:polar-positive-part-invariance is
  obvious.]

The decomposition~@eq:polar-decomposition-kp is called the #idx(
  "polar decomposition",
)_polar decomposition_ of a self-adjoint algebraic linear group $G$.

#corollary[A self-adjoint algebraic linear group $G$ is diffeomorphic to
  $K times RR^m$, where $K$ is the compact subgroup defined in
  Theorem~@th:self-adjoint-group-polar-decomposition and $m = dim frak(p)$. In
  particular, $G$ is connected if and only if so is $K$, and in this case
  $pi_1 (G) tilde.eq pi_1 (K)$.] <cor:self-adjoint-group-topology>

#problem(corollary: true)[Under the assumptions of
  Theorem~@th:self-adjoint-group-polar-decomposition
  $ Z(G) = (Z(G) inter K) times (Z(G) inter P), $
  and $Z(G) inter P tilde.eq RR^s$ for some $s >= 0$. If $G$ is semisimple then
  $Z(G) subset K$.] <pr:self-adjoint-group-center>
#as-corollary <cor:self-adjoint-group-center>

#problem(corollary: true)[Under the same assumptions $L inter P = {e}$ for any
  compact subgroup $L subset G$. In particular, $K$ is a maximal compact
  subgroup of $G$ (i.e. is not contained in any larger compact subgroup of
  $G$).] <pr:self-adjoint-k-maximal-compact>
#as-corollary <cor:self-adjoint-k-maximal-compact>

Now we may consider a special case which is convenient to formulate as a
separate theorem because it is important in what follows.

#theorem[Let $G subset GL(V)$ be a complex algebraic linear group with a compact
  real form $K$ and $frak(p) = i frak(k)$. The map $phi: K times frak(p) -> G$
  defined by @eq:polar-decomposition-map is a diffeomorphism of real manifolds.
  A real form $K$ is an algebraic one.] <th:polar-decomposition-compact-form>

#proof[Make $V$ into a Hermitean space $bold(E)$ fixing a positive definite
  Hermitian form in it invariant with respect to $K$ (see
  Theorem~@th:compact-invariant-inner-product). Then $frak(k)$ consists of
  skew-Hermitian operators and $frak(p) = i frak(k)$ consists of self-adjoint
  operators so that $frak(p) = frak(g) inter S(bold(E))$.

  #problem[#source(255)$G$ is
    self-adjoint.] <pr:compact-form-group-self-adjoint>

  Problem~@pr:compact-form-group-self-adjoint implies that
  Theorem~@th:self-adjoint-group-polar-decomposition is applicable to $G$, where
  the role of $K$ is played by $K_1 = G inter upright(U)(bold(E))$.

  #problem[$K_1$ coincides with $K$.] <pr:unitary-part-is-compact-form>

  Therefore it only remains to prove the last statement of
  Theorem~@th:polar-decomposition-compact-form. Consider the automorphism
  $S: g |-> (g^*)^(-1)$ of $G$. Clearly, $S$ is an algebraic real structure on
  $G$ and by Problem~@pr:unitary-part-is-compact-form $K = G^S$.]

#corollary[Under the assumptions of Theorem~@th:polar-decomposition-compact-form
  $G$ is diffeomorphic to $K times RR^m$, where
  $m = dim_CC G$.] <cor:complex-group-topology-compact-form>

Problems~@pr:self-adjoint-group-center and @pr:center-of-real-form imply

#corollary[Under the assumptions of Theorem~@th:polar-decomposition-compact-form
  $ Z(G) = Z(K) times (Z(G) inter P). $
  If $G$ is semisimple then $Z(G) = Z(K)$.] <cor:group-center-via-compact-form>

#corollary[Under the assumptions of Theorem~@th:polar-decomposition-compact-form
  $ N(K) = K times (Z(G) inter P). $
  If $G$ is semisimple then $N(K) = K$.] <cor:normalizer-of-compact-form>

#proof[Clearly, $N(K) = K(N(K) inter P)$. If $g in N(K) inter P$ then the
  uniqueness of the polar decomposition and @eq:polar-positive-part-invariance
  imply that $g in Z(K)$. Since $frak(g) = frak(k)(CC)$, then $Ad g = E$. One
  easily deduces that $g p g^(-1) = p$ for all $p in P$, whence $g in Z(G)$.]

Let us apply the polar decomposition to the proof of the following statement.

#theorem[Let $S$ be a real structure on a simply connected complex semisimple
  Lie group $G$. Then the real form $G^S$ is algebraic and
  connected.] <th:simply-connected-real-form-connected>

#proof[Set $sigma = d S$. Let us show that there exists a compact real form $K$
  of $G$ such that the corresponding real form $frak(k)$ of $frak(g)$ is
  compatible with $frak(g)^sigma$. By Problem~@pr:quarter-power-makes-compatible
  there exists on $frak(g)$ a real structure $tau$ commuting with $sigma$ such
  that $frak(g)^tau$ is compact. By
  Theorem~@th:homomorphism-existence-simply-connected there exists an
  automorphism $T$ of $G$ (considered as a real Lie group) such that
  $tau = d T$.

  Clearly, $T$ is a real structure in $G$ commuting with $S$. Thanks to
  Problem~@pr:compactness-criteria-real-form the real form $K = G^T$ is compact.

  By Theorem~@th:perfect-group-homomorphisms-polynomial the involutive
  automorphism $Theta = T S$ of $G$ is polynomial. Therefore the algebraicity of
  the real structure $T$ (Theorem~@th:polar-decomposition-compact-form) implies
  that $S$ is also an algebraic real structure.

  As in the proof of Theorem~@th:polar-decomposition-compact-form, we may assume
  that $G subset GL(bold(E))$, where $bold(E)$ is a Hermitian vector space,
  whose scalar product is $K$-invariant. Moreover, $T(g) = (g^*)^(-1)$ and $G$
  is a self-adjoint algebraic linear group. Since $T$ commutes with $S$ and
  $Theta$, the groups $G^S$ and $G^Theta$ are also self-adjoint. Clearly, the
  compact parts $G^S inter K$ and $G^Theta inter K$ of the polar decompositions
  coincide. By Theorem~@th:fixed-subgroup-connected $G^Theta$ #source(256)is
  connected. Applying Corollary~@cor:self-adjoint-group-topology of
  Theorem~@th:self-adjoint-group-polar-decomposition we derive from here that
  the subgroup $G^Theta inter K = G^S inter K$ is connected and therefore so is
  $G^S$.]

=== Lie Groups with Compact Tangent Algebras
<ss:groups-with-compact-tangent-algebra>
By Problem~@pr:compact-algebra-has-compact-group each compact Lie algebra is
isomorphic to the tangent algebra of a compact Lie group. However, a non-compact
Lie group can have a compact tangent algebra: the simplest example is the
additive group $RR$. In this subsection we will study the structure of Lie
groups with a finite number of connected components whose tangent algebra is
compact. First consider connected groups. Recall (see
Problem~@pr:compact-algebra-reductive-splitting) that a compact Lie algebra
$frak(k)$ presents in the form $frak(k) = frak(z) plus.o frak(k)'$, where
$frak(z)$ is the center of $frak(k)$ and the derived algebra $frak(k)'$ is a
semisimple compact Lie algebra.

#problem[Any simply connected Lie group $K$ with a compact semisimple tangent
  algebra is isomorphic to a compact real form of a simply connected complex
  semisimple Lie group.] <pr:simply-connected-is-compact-form>

Problem~@pr:simply-connected-is-compact-form implies that a simply connected
(hence an arbitrary connected) semisimple Lie group with a compact tangent
algebra is compact and therefore has a finite center.

#problem[Any connected compact Lie group $K$ has a finite-sheeted covering
  $Z times L -> K$, where $Z$ is a compact torus and $L$ is a simply connected
  semisimple compact Lie group.] <pr:compact-group-torus-semisimple-cover>

#problem[Any connected compact Lie group $K$ is isomorphic to an algebraic real
  form of a connected complex reductive algebraic group. In particular, $K$
  admits a faithful linear
  representation.] <pr:connected-compact-is-reductive-form>

Problem~@pr:connected-compact-is-reductive-form implies the following theorem
describing the structure of connected compact Lie groups.

#theorem[Let $K$ be a connected compact Lie group. Then $K'$ is a connected
  semisimple compact Lie subgroup of $K$ and $K$ admits the locally direct
  decomposition $K = Z K'$, where $Z = Rad K$ is the compact torus coinciding
  with the identity component $Z(K)^0$ of the center of
  $K$.] <th:compact-group-center-times-derived>

#problem[Prove this theorem.] <pr:prove-compact-group-center-times-derived>

Now pass to arbitrary connected Lie groups with compact tangent algebras. The
simplest class of these groups are connected commutative groups. Recall (see
Proposition~@prop:commutative-real-lie-groups) that any connected commutative
group $G$ presents in the form $G = A times B$, where $A tilde.eq RR^p$ is a
vector group and $B tilde.eq TT^q$ a compact torus.

#problem[$B$ is the largest compact subgroup of the connected commutative group
  $G$, i.e. contains all compact subgroups of this group, and therefore is
  uniquely defined. For $A$ one can take any subgroup of the form $exp frak(a)$,
  where $frak(a)$ is a subspace of the tangent algebra $frak(g)$ of $G$ such
  that $frak(g) = frak(a) plus.o frak(b)$, where $frak(b)$ is the tangent
  algebra of $B$.] <pr:commutative-group-compact-part>

$A$ and $B$ are called the #idx(
  "Non-compact part (of a commutative Lie group)",
)_non-compact_ and #idx("compact part (of a commutative Lie group)")_compact_
parts of the connected commutative group $G$ respectively.

#theorem[#source(257)Let $G$ be a connected Lie group with a compact tangent
  algebra and $A$ and $B$ the non-compact and compact parts of $Z(G)^0$. Then
  $G = A times K$, where $K = B G'$ is a compact Lie subgroup. $K$ is the
  largest compact subgroup of $G$.] <th:compact-algebra-vector-times-compact>

To prove this theorem we will need the following

#problem[Let $pi: G -> G_0$ be a finite-sheeted covering and $G_0$ satisfy
  Theorem~@th:compact-algebra-vector-times-compact. Then $G$ also satisfies
  Theorem~@th:compact-algebra-vector-times-compact.]
<pr:vector-times-compact-lifts-cover>

Now let $G$ be a connected Lie group with a compact tangent algebra. Let us
construct a finite-sheeted covering $G -> G_0$ satisfying the conditions of
Problem~@pr:vector-times-compact-lifts-cover. Let $pi: tilde(G) -> G$ be a
simply connected covering of $G$. Clearly,
$tilde(G) = tilde(Z) times tilde(G)'$, where $tilde(Z)$ is a vector group,
$tilde(G)'$ a semisimple compact Lie group (see
Problem~@pr:compact-group-torus-semisimple-cover). Set
$ N = Ker pi, quad N_0 = N Z(tilde(G)'), quad G_0 = tilde(G)\/N_0. $

#problem[$N_0 = N_1 times Z(tilde(G)')$, where $N_1$ is a discrete subgroup of
  $tilde(Z)$ and $G_0 = tilde(Z)\/N_1 times tilde(G)'\/Z(tilde(G)')$. There
  exists a finite-sheeted covering
  $pi_0: G -> G_0$.] <pr:finite-covering-onto-product>

Since $tilde(G)'\/Z(tilde(G)')$ is compact, $G_0$ satisfies
Theorem~@th:compact-algebra-vector-times-compact. By
Problem~@pr:vector-times-compact-lifts-cover so does $G$.#qed-mark

Now we can prove the main result of this subsection.

#theorem[Let $G$ be a Lie group with a finite number of connected components and
  a compact tangent algebra and $Z = Z(G^0)^0$. We can choose a non-compact part
  $A$ of $Z$ which is a normal subgroup of $G$. For any such choice of $A$ we
  have $G = A times.r K$, $G^0 = A times K^0$, where $K$ is a compact Lie
  subgroup.] <th:compact-algebra-semidirect-splitting>

Let $frak(b) subset frak(z)$ be the tangent algebras of the compact part $B$ of
$Z$ and $Z$ itself, respectively. Clearly, the automorphisms $a(g)$ $(g in G)$
transform $Z$ into itself. By Problem~@pr:commutative-group-compact-part $B$ is
also mapped into itself by all the $a(g)$. Therefore $frak(z)$ and $frak(b)$ are
invariant with respect to the adjoint representation of $G$.

#problem[In $frak(z)$, there exists a subspace $frak(a)$ invariant with respect
  to $Ad G$ such that $frak(z) = frak(a) plus.o frak(b)$.]
<pr:invariant-complement-to-compact-part>

Problems~@pr:commutative-group-compact-part and
@pr:invariant-complement-to-compact-part imply the existence of a subgroup
$A subset G$ described in Theorem~@th:compact-algebra-semidirect-splitting.
Applying Theorem~@th:compact-algebra-vector-times-compact to $G^0$ we get
$G^0 = A times K_0$, where $K_0$ is a compact Lie subgroup. To finish the proof
of Theorem~@th:compact-algebra-semidirect-splitting we need the following.

#lemma[Let $G$ be a Lie group with a normal vector Lie subgroup $A$ of finite
  index. Then $G = A times.r L$, where $L$ is a finite
  subgroup.] <lem:vector-group-finite-extension-splits>

#proof[Let $L_0 = G\/A$, $pi: G -> L_0$ the natural homomorphism. It suffices to
  construct a homomorphism $phi: L_0 -> G$ such that $pi phi = id$; then
  $G = A times.r L$, where $L = phi(L_0)$. Choose a map $psi: L_0 -> G$ such
  that $pi psi = id$ and seek $phi$ in the form
  $ phi(x) = h(x) psi(x) wide (x in L_0), $ <eq:splitting-homomorphism-ansatz>
  where $h: L_0 -> A$ is a map. Observe that
  #source(258)
  $
    psi(x) psi(y) = f(x, y) psi(x y) wide (x, y in L_0)
  $ <eq:factor-set-definition>
  where $f(x, y) in A$. The condition $phi(x y) = phi(x) phi(y)$ is equivalent
  to the following identity relating $h$ with the map $f: L_0 times L_0 -> A$:
  $
    f(x, y) = psi(x) h(y)^(-1) psi(x)^(-1) h(x)^(-1) h(x y) wide
    (x, y in L_0)
  $ <eq:factor-set-coboundary-multiplicative>
  We will express the group operation in $A$ additively. As follows from
  Problem~@pr:homomorphism-commutes-with-exp any automorphism of the vector
  group $A$ is a linear transformation. Therefore the formula
  $ R(g) = a(g)|A wide (g in G) $ <eq:conjugation-action-on-vector-group>
  determines a linear representation $R: G -> GL(A)$. Since $A subset Ker R$,
  there arises a linear representation $R_0: L_0 -> GL(A)$ such that
  $R = R_0 pi$. Formula~@eq:factor-set-coboundary-multiplicative takes the form
  $
    f(x, y) = h(x y) - h(x) - R_0 (x) h(y) wide (x, y in L_0)
  $ <eq:factor-set-coboundary-additive>
  Thus, it suffices to choose a map $h: L_0 -> A$ satisfying
  @eq:factor-set-coboundary-additive with $f$ defined by
  @eq:factor-set-definition\; then @eq:splitting-homomorphism-ansatz defines the
  desired homomorphism $phi$.

  #problem[For any $x, y, z in L_0$ we have
    $
      f(x, y z) + R_0 (x) f(y, z) = f(x y, z) + f(x, y).
    $] <pr:factor-set-cocycle-identity>

  #problem[The map $h: L_0 -> A$ defined by the formula
    $ h(x) = -frac(1, abs(L_0)) sum_(y in L_0) f(x, y), $
    satisfies
    @eq:factor-set-coboundary-additive.] <pr:cocycle-coboundary-by-averaging>

  Therefore Lemma~@lem:vector-group-finite-extension-splits is proved.]

#problem[Prove Theorem~@th:compact-algebra-semidirect-splitting.]
<pr:prove-compact-algebra-semidirect-splitting>

A subgroup $K$ of a Lie group $G$ is a #idx(
  "subgroup",
  "maximal compact",
)_maximal compact subgroup_ of $G$ if $K$ is compact and is not contained in any
larger compact subgroup of $G$. We will not assume that $K$ is a Lie subgroup.
(This is automatically so since $K$ is closed in $G$ (see
@ss:virtual-lie-subgroups[°]\; this fact will not be used though).) Any
automorphism of $G$ permutes its maximal compact subgroups.

The following theorem shows that the subgroup $K$ mentioned in
Theorem~@th:compact-algebra-semidirect-splitting is maximal compact in $G$ and
is unique up to conjugacy.

#theorem[Let $G = A times.r K$, where $A$ is a vector group, $K$ a compact Lie
  group. Then $K$ is a maximal compact subgroup of $G$. For any compact subgroup
  $K_1 subset G$ there exists $a in A$ such that $a K_1 a^(-1) subset K$ and if
  $K_1$ is a maximal compact subgroup this inclusion is actually an
  equality.] <th:maximal-compact-conjugacy-semidirect>

#source(259)Before proving this theorem make several general remarks on
semidirect products of Lie groups. Let $G = A times.r K$, where $A$ is a vector
group. Then the automorphisms $a(g)|A$ $(g in G)$ are linear transformations of
the space $A$ (see the proof of
Lemma~@lem:vector-group-finite-extension-splits). Therefore
formula~@eq:conjugation-action-on-vector-group defines linear representation
$R: G -> GL(A)$. Now, consider the vector space $A$ as an affine space. Then we
may define a natural affine $G$-action on $A$:

#problem[There exists a unique affine action $tilde(R): G -> GA(A)$ such that
  $tilde(R)(a) = t_a$ $(a in A)$ and $tilde(R)(k) = R(k)$ $(k in K)$. This
  action contains all translations and in particular it is transitive on $A$.
  The subgroup $K$ is the stabilizer of $0 in A$.] <pr:semidirect-affine-action>

Since the stabilizers of any two points are conjugate for a transitive action of
a group, Problem~@pr:semidirect-affine-action implies that the subgroup
$K_1 subset G = A times.r K$ is conjugate to a subgroup contained in $K$ if and
only if $A$ contains a point fixed under $tilde(R)(K_1)$. An element $a in G$
such that $a K_1 a^(-1) subset K$ may be assumed to belong to $A$.

#proof(head: [_Proof of
  Theorem_~@th:maximal-compact-conjugacy-semidirect.])[Since $A$ does not
  contain non-trivial compact subgroups, $K$ is a maximal compact subgroup of
  $G = A times.r K$. The conjugacy follows from the above remarks and the
  existence of a fixed point for any affine action of a compact group
  (Theorem~@th:compact-affine-fixed-point).]

=== Compact Real Forms of Reductive Algebraic Groups
<ss:compact-forms-of-reductive-groups>
In this subsection we will generalize Theorem~@th:compact-real-form-exists on
the existence of a compact real form of a connected complex semisimple Lie group
to arbitrary reductive algebraic groups. Besides, we will prove the conjugacy of
compact real forms. The main results are formulated as follows:

#theorem[Any reductive complex algebraic group possesses an algebraic compact
  real form.] <th:reductive-group-compact-form-exists>

#theorem[Any two compact real forms of a reductive complex algebraic group $G$
  are transformed into each other by an automorphism of the form $a(g)$, where
  $g in G^0$.] <th:reductive-compact-forms-conjugate>

#proof(head: [_Proof of Theorem_~@th:reductive-group-compact-form-exists.])[Let
  $G$ be a reductive complex algebraic group, $H = (G^0)'$,
  $Z = Rad G = Z(G^0)^0$. In a connected semisimple Lie group $H$ choose a
  compact real form $L$ (see Theorem~@th:compact-real-form-exists) which is
  connected thanks to Corollary~@cor:complex-group-topology-compact-form of
  Theorem~@th:polar-decomposition-compact-form and let $U = N(L)$. Applying
  Corollary~@cor:normalizer-of-compact-form of
  Theorem~@th:polar-decomposition-compact-form to $H$ and $L$ and using the
  decomposition $G^0 = Z H$, we get $U inter G^0 = Z L$. In particular, the
  group $U inter G^0$ is connected implying $U^0 = U inter G^0 = Z L$ and
  $frak(u) = frak(z) plus.o frak(l)$. Therefore the tangent algebra of $U$ is
  compact.

  #problem[$G = H U$,
    $G\/G^0 tilde.eq U\/U^0$.] <pr:derived-group-times-normalizer>

  Thus, $U$ has a finite number of connected components. In the tangent algebra
  $frak(z)$ of the torus $Z$, consider the real form $frak(z)(RR)$ defined in
  @ss:rational-structure-torus-algebra[°] and set $A = exp frak(z)(RR)$,
  $B = exp(i frak(z)(RR))$. Then $Z = A times B$, $A$ being the non-compact and
  $B$ the compact parts of $Z$ (see Example~@exm:compact-real-torus[] in
  @ss:real-structures-and-forms[°]). Since $frak(z)(RR)$ is stable under all
  automorphisms of $Z$ and $Z$ is a normal subgroup of $G$, $A$ is also a normal
  #source(
    260,
  )subgroup of $G$. Applying to $U$
  Theorem~@th:compact-algebra-semidirect-splitting we see that
  $U = A times.r K$, where $K subset U$ is a compact subgroup such that
  $K^0 = B L$.

  #problem[The subgroup $K$ is a real form of
    $G$.] <pr:normalizer-compact-part-real-form>

  The algebraicity of the real form $K$ follows from
  Theorem~@th:polar-decomposition-compact-form. Therefore
  Theorem~@th:reductive-group-compact-form-exists is proved.]

#proof(head: [_Proof of Theorem_~@th:reductive-compact-forms-conjugate.])[Let
  $K$ be a compact real form of $G$ constructed in the proof of
  Theorem~@th:reductive-group-compact-form-exists and $K_1$ another compact real
  form of $G$. Let $sigma$ be a real structure on $frak(g)$ such that
  $frak(k)_1 = frak(g)^sigma$. Then $sigma$ transforms the center $frak(z)$ and
  the derived algebra $frak(h)$ of $frak(g)$ into themselves and induces on each
  of these subalgebras a real structure. We have
  $frak(k)_1 = frak(z)^sigma plus.o frak(h)^sigma$. Since $K_1 inter Z$ is
  compact, it is contained in $B$ so that
  $frak(z)^sigma = frak(k)_1 inter frak(z) subset i frak(z)(RR)$ implying
  $frak(z)^sigma = i frak(z)(RR)$ and $K_1 inter Z = B$. Further,
  $frak(h)^sigma$ is a compact real form of $frak(h)$. Applying
  Theorem~@th:compact-forms-conjugacy-compatibility we may assume that
  $frak(h)^sigma = frak(l)$. Then $frak(k)_1 = frak(k)$, hence $K_1^0 = B L$.
  Therefore, $K_1 subset N(B L) = N(L) = U$.

  #problem[There exists $a in A$, such that
    $a K_1 a^(-1) = K$.] <pr:compact-forms-conjugate-in-normalizer>

  Thus Theorem~@th:reductive-compact-forms-conjugate is proved.]

=== Linearity of Compact Lie Groups <ss:linearity-of-compact-groups>
Thanks to Problem~@pr:connected-compact-is-reductive-form any connected compact
Lie group admits a faithful linear representation. Now let us extend this
statement to arbitrary compact Lie groups. Therefore we will prove

#theorem[Any compact Lie group admits a faithful linear
  representation.] <th:compact-group-faithful-representation>

Let $G$ be a Lie group. A differentiable function $f: G -> CC$ is said to be
_representative_ if the functions $r_* (g) f$ $(g in G)$ determined by
@eq:right-regular-representation generate a finite-dimensional subspace of the
space $C^infinity (G)$ of all differentiable complex functions on $G$. For
instance, if $G$ is a complex algebraic group then all polynomial functions on
$G$ are representative (see Theorem~@th:function-algebra-locally-finite). Denote
by $A_G$ the set of all representative functions on $G$.

#problem[$A_G$ is a subalgebra of $C^infinity (G)$ and coincides with the linear
  span of matrix elements of all finite-dimensional complex linear
  representations of $G$.] <pr:representative-functions-matrix-elements>

#lemma[If $G$ is a compact Lie group then for any $g in G$, $g != e$, there
  exists $f in A_G$ such that
  $f(g) != f(e)$.] <lem:representative-functions-separate-points>

#proof[If $g in.not G^0$ then we may take for $f$ the function which vanishes on
  $G^0$ and equals 1 on all the other connected components of $G$; clearly, its
  orbit with respect to right translations is contained in the
  finite-dimensional space of all functions which are constant on connected
  components. Let $g in G^0$. Since $G^0$ admits a faithful representation
  thanks to Problem~@pr:connected-compact-is-reductive-form, there exists a
  matrix element of this representation $f_0 in A_(G^0)$ such that
  $f_0 (g) != f_0 (e)$. Let us extend $f_0$ to a function $f$ on $G$ setting
  $f(x) = 0$, if $x in G without G^0$. Clearly, the linear span $L_f$ of the
  orbit of $f$ under right translations by elements $g in G^0$ is
  finite-dimensional. Furthermore, if $g$ and $g'$ belong to the same component
  of $G$ then $r_* (g) L_f = r_* (g') L_f$. Therefore the orbit of $f$ under
  right translations is contained in $sum_g r_* (g) L_f$, where $g$ runs
  #source(
    261,
  )through the set of representatives of the connected components of $G$. Hence,
  $f in A_G$ and Lemma~@lem:representative-functions-separate-points is proved.]

#problem[Any strictly descending chain of Lie subgroups in a compact Lie group
  is finite.] <pr:compact-group-descending-chain>

#proof(head: [_Proof of
  Theorem_~@th:compact-group-faithful-representation.])[Let $R_1$ be a linear
  representation of a compact Lie group $G$. If $Ker R_1 != {e}$ then choose
  some $g in Ker R_1$, $g != e$. By
  Lemma~@lem:representative-functions-separate-points and
  Problem~@pr:representative-functions-matrix-elements there exists a
  representation $S$ of $G$ such that a matrix element $f$ of this
  representation satisfies $f(g) != f(e)$. Then $g in.not Ker S$. Setting
  $R_2 = R_1 + S$ we have strict inclusion $Ker R_1 supset Ker R_2$. If
  $Ker R_2 != {e}$ then we similarly construct a representation $R_3$ with the
  strict inclusion $Ker R_2 supset Ker R_3$, etc. Due to
  Problem~@pr:compact-group-descending-chain this process terminates and we get
  a faithful representation.]

=== Correspondence Between Compact Lie Groups and Reductive Algebraic Groups
<ss:compact-reductive-correspondence>
In this subsection we will show that the complexification of real algebraic
groups leads to a one-to-one correspondence between compact Lie groups
(considered up to a differentiable isomorphism) and reductive complex algebraic
groups (considered up to a polynomial isomorphism).

Let $K$ be a compact Lie group. By
Theorem~@th:compact-group-faithful-representation $K$ admits a faithful linear
representation which may be considered as a real one. Therefore
Theorem~@th:compact-linear-group-algebraic implies that $K$ possesses a real
algebraic group structure. This structure a priori depends on the choice of a
faithful representation though actually it is unique as it will follow from our
future arguments.

Consider the complexification $K(CC)$ of a compact real algebraic group $K$.

#problem[The algebraic group $K(CC)$ is
  reductive.] <pr:complexified-compact-group-reductive>

Now we wish to prove that the algebraic group $K(CC)$ does not depend (up to an
isomorphism) on the choice of the algebraic group structure on $K$. This is a
consequence of the following

#theorem[Let $K_1$, $K_2$ be compact real algebraic groups. Then any
  differentiable homomorphism $phi: K_1 -> K_2$ uniquely extends to a polynomial
  homomorphism $phi(CC): K_1 (CC) -> K_2 (CC)$. If $psi: K_2 -> K_3$ is another
  differentiable homomorphism of compact real algebraic groups then
  $
    (psi phi)(CC) = psi(CC) phi(CC).
  $ <eq:complexification-functoriality>]
<th:complexification-of-homomorphisms>

#corollary[Under the assumptions of
  Theorem~@th:complexification-of-homomorphisms any differentiable isomorphism
  $phi: K_1 -> K_2$ extends to a polynomial isomorphism
  $phi(CC): K_1 (CC) -> K_2 (CC)$ and is a polynomial isomorphism itself.]

Therefore the group $K(CC)$ and the algebraic structure on the compact Lie group
$K$ are uniquely defined.

Let us precede the proof of Theorem~@th:complexification-of-homomorphisms by the
following

#problem[If under the conditions of
  Theorem~@th:complexification-of-homomorphisms the extending homomorphism
  $phi(CC)$ exists and the homomorphism $d phi$ is injective then
  $Ker phi(CC) = Ker phi subset K_1$.]
<pr:kernel-of-complexified-homomorphism>

#proof(head: [_Proof of
  Theorem_~@th:complexification-of-homomorphisms.])[#source(262)Let
  $G_i = K_i (CC)$ $(i = 1, 2)$. Then $G_1 times G_2 = (K_1 times K_2)(CC)$. Let
  $pi_i$ be the projection $G_1 times G_2 -> G_i$ onto the $i$-th component.
  Consider the graph $Gamma = {(k, phi(k)): k in K_1}$ of $phi$ which is a
  compact Lie subgroup of $K_1 times K_2$. By
  Theorem~@th:compact-linear-group-algebraic $Gamma$ is an algebraic subgroup.
  Clearly, $pi_1: Gamma -> K_1$ is a polynomial and bijective homomorphism.
  Consider an algebraic subgroup $Gamma(CC) subset G_1 times G_2$. The
  projection $pi_1: Gamma(CC) -> G_1$ extends $pi_1: Gamma -> K_1$ and therefore
  is injective by Problem~@pr:kernel-of-complexified-homomorphism.
  Theorem~@th:bijective-homomorphism-isomorphism implies that this is a
  polynomial isomorphism of $Gamma(CC)$ onto $G_1$. The homomorphism
  $phi(CC) = pi_2 pi_1^(-1): G_1 -> G_2$ is the desired extension.

  The uniqueness of the extension $phi(CC)$ follows from the fact that $K_1$ is
  dense in $G_1$ in Zariski topology and the
  relation~@eq:complexification-functoriality follows from the uniqueness.]

Now let us state the final result.

#theorem[On any compact Lie group $K$ there exists a unique real algebraic group
  structure and the complex algebraic group $K(CC)$ is reductive. Any reductive
  complex algebraic group possesses an algebraic compact real form. Two compact
  Lie groups are isomorphic (as Lie groups or as algebraic groups over $RR$) if
  and only if the corresponding reductive algebraic groups over $CC$ are
  isomorphic.] <th:compact-reductive-equivalence>

Proof of this theorem follows from Corollary of
Theorem~@th:complexification-of-homomorphisms,
Problem~@pr:complexified-compact-group-reductive,
Theorems~@th:reductive-group-compact-form-exists and
@th:reductive-compact-forms-conjugate.

#problem(corollary: true)[Any compact subgroup $L$ of a compact Lie group $K$ is
  an algebraic subgroup in $K$. In $K(CC)$, there exists a unique algebraic
  subgroup containing $L$ as a real form and isomorphic to $L(CC)$; its
  intersection with $K$ coincides with $L$.] <pr:compact-subgroup-is-algebraic>

=== Complete Reducibility of Linear Representations
<ss:complete-reducibility-representations>
In this subsection we will prove that a complex algebraic linear group is
completely reducible if and only if it is reductive. The proof is based on the
complete reducibility of compact linear groups proved in
@sec:compact-linear-groups. Furthermore, the completely reducible real algebraic
linear groups are real forms of complex reductive groups. In particular, it
turns out that any linear representation of a real semisimple Lie algebra is
completely reducible. This method of the proof of complete reducibility of
semisimple linear groups due to H.~Weyl [@bib:Weyl1925] is often called the
#idx(
  "Unitary trick",
)_unitary trick_. All considered linear groups and linear representations act in
finite-dimensional vector spaces over $CC$ or $RR$.

First discuss some general questions having to do with the definition of
complete reducibility (see @ss:complete-reducibility-compact[°]). A linear group
$G subset GL(V)$, where $V$ is a vector space over $RR$ or $CC$ is #idx(
  "Group",
  "linear",
  "completely reducible",
)_completely reducible_ if $V$ splits into the direct sum of irreducible
$G$-invariant subspaces or, equivalently (see
Problem~@pr:complete-reducibility-complements), if for any $G$-invariant
subspace $V_1 subset V$ there exists a $G$-invariant direct complement. In this
setting it clearly suffices to verify the latter property for the irreducible
subspaces $V_1$. A completely reducible linear group $G$ determines a completely
reducible linear group in any $G$-invariant subspace of $V$.

#problem[Let $G$ be a linear group in a vector space $V$ over $RR$. Consider it
  as a subgroup of $GL(V(CC))$ making use of the natural embedding
  $GL(V) -> GL(V(CC))$. #source(263)The group $G$ is completely reducible in $V$
  if and only if so it is in
  $V(CC)$.] <pr:complete-reducibility-complexification>

#problem[A linear group $G$ in a vector space $V$ over $CC$ is completely
  reducible if and only if $G$ is completely reducible (over $RR$) in
  $V^RR$.] <pr:complete-reducibility-realification>

#problem[A linear group $G$ in a vector space $V$ over $CC$ or $RR$ is
  completely reducible if and only if so is its algebraic closure
  $G^a subset GL(V)$.] <pr:complete-reducibility-algebraic-closure>

A real algebraic group $G$ is #idx(
  "algebraic group",
  "reductive",
)_reductive_ if its complexification $G(CC)$ is a reductive complex algebraic
group. For instance the compact and semisimple real algebraic groups are
reductive.

#theorem[A reductive (complex or real) linear algebraic group is completely
  reducible.] <th:reductive-completely-reducible>

#proof[A reductive complex algebraic group $G$ is an algebraic closure of a
  compact subgroup (see Theorem~@th:reductive-group-compact-form-exists) which
  is completely reducible thanks to Corollary of
  Theorem~@th:compact-invariant-inner-product. By
  Problem~@pr:complete-reducibility-algebraic-closure $G$ is also completely
  reducible. If $G$ is a real reductive linear algebraic group in a real vector
  space $V$ then $G(CC)$ is a complex reductive group in $V(CC)$. Therefore due
  to Problems~@pr:complete-reducibility-complexification and
  @pr:complete-reducibility-algebraic-closure $G$ is completely reducible over
  $RR$. Now if a real reductive group $G$ acts in a complex space then its
  complete reducibility follows from
  Problem~@pr:complete-reducibility-realification.]

Let us point out several corollaries for linear representations. Recall that a
linear representation of a group (or of a Lie algebra) is called #idx(
  "representation",
  "completely reducible",
)_completely reducible_ if its image is a completely reducible linear group
(linear Lie algebra). This is equivalent to the existence in the space of the
representation of a complementary invariant subspace for any invariant subspace.

Since the image of a reductive algebraic group under a linear representation is
reductive (see Problem~@pr:reductive-group-local-splitting),
Theorem~@th:reductive-completely-reducible implies

#corollary[A linear representation of a reductive complex algebraic group is
  completely reducible.] <cor:reductive-group-complete-reducibility>

// The book numbers this corollary also as a problem, "Corollary 2 (Problem
// 28).": the problem's label is the argument, the target of its hint and of
// references; the number links to the hint as in #problem.
#corollary(problem: true)[If $G$ is a semisimple real Lie group with a finite
  number of connected components then any linear representation of $G$ over $CC$
  or $RR$ is completely reducible.] <cor:semisimple-group-complete-reducibility>
#as-problem <pr:semisimple-group-complete-reducibility>

#problem[Let $G$ be a connected Lie group, $R$ its linear representation. The
  representation $R$ is completely reducible if and only if so is the
  representation $d R$ of the tangent algebra
  $frak(g)$.] <pr:complete-reducibility-of-differential>

Problem~@pr:complete-reducibility-of-differential and
Theorem~@th:reductive-completely-reducible imply

#corollary[A linear representation of a complex or real semisimple Lie algebra
  is completely reducible.] <cor:weyl-complete-reducibility>

Note some applications of this corollary.

#problem[Let $frak(g)$ be a complex or real Lie algebra. If
  $rad frak(g) = frak(z)(frak(g))$, then
  $frak(g) = frak(g)' plus.o frak(z)(frak(g))$, the derived algebra being
  semisimple.] <pr:radical-central-algebra-splits>

#problem[#source(264)If a connected complex algebraic group $G$ contains a
  normal subgroup $T$ which is a torus, then $T subset Z(G)$. A complex
  algebraic group is reductive if and only if its radical is a
  torus.] <pr:reductive-iff-radical-torus>

Let $frak(g)$ be a semisimple complex Lie algebra.
Corollary~@cor:weyl-complete-reducibility implies that any finite-dimensional
linear representation $rho$ of $frak(g)$ is equivalent to the sum
$rho_1 + dots.c + rho_s$ of irreducible representations $rho_i$ which are
determined uniquely up to an isomorphism. The representations $rho_i$ are called
the #idx(
  "component",
  "irreducible (of a representation)",
)_irreducible components_ of $rho$.

#corollary[A linear representation of a semisimple complex Lie algebra is
  determined up to an isomorphism by the system of its highest (or lowest)
  weights their multiplicities (the dimensions of the corresponding weight
  subspaces) counted.] <cor:highest-weights-determine-representation>

Now we prove a theorem converse to Theorem~@th:reductive-completely-reducible.

#theorem[Any completely reducible complex or real algebraic linear group is
  reductive.] <th:completely-reducible-is-reductive>

#proof[Thanks to Problems~@pr:complete-reducibility-complexification and
  @pr:complete-reducibility-algebraic-closure the real case is reduced to the
  complex one. Let $G subset GL(V)$ be a completely reducible complex algebraic
  group. As we see from Problem~@pr:reductive-iff-radical-torus, it suffices to
  show that $Rad G$ is a torus.

  By Lie's theorem (see @ss:lie-theorem[°]) $Rad G$ possesses weight vectors in
  $V$. Denote by $lambda_1, ..., lambda_p$ the complete set of distinct weights
  of $Rad G$ in $V$ and by $V_(lambda_i)$ the corresponding weight subspaces.
  Then the subspace $V' = V_(lambda_1) plus.o dots.c plus.o V_(lambda_p)$ is
  invariant with respect to $G$. Therefore $V = V' plus.o V''$, where $V''$ is
  another invariant subspace. If $V'' != 0$, then by Lie's theorem $Rad G$
  possesses a weight vector in $V''$ which is impossible. Thus, $V = V'$. It
  follows that $Rad G$ is a torus (see
  Problem~@pr:commutative-semisimple-is-quasitorus).]

=== Maximal Tori in Compact Lie Groups <ss:maximal-tori-compact-groups>
In this subsection we consider connected compact Lie groups and their
generalization---connected Lie groups with compact tangent algebras. We will
study some properties of maximal connected commutative subgroups of these groups
similar to the properties of maximal tori in complex algebraic groups. The term
“torus” means a compact torus, i.e. a Lie group isomorphic to $TT^n$. Recall
that any connected compact commutative Lie group is a torus (see
Proposition~@prop:commutative-real-lie-groups).

Let $K$ be a compact Lie group.

#problem[Any maximal connected commutative subgroup $A$ of $K$ is a torus. The
  tangent algebra $frak(a)$ of $A$ is a maximal commutative subalgebra of Lie
  algebra $frak(k)$ and $A = exp frak(a)$. Conversely, for any maximal
  commutative subalgebra $frak(a) subset frak(k)$ the subgroup
  $A = exp frak(a) subset K$ is a maximal connected commutative subgroup with
  the tangent algebra $frak(a)$.] <pr:maximal-connected-commutative-is-torus>

A maximal connected commutative subgroup of a compact Lie group $K$ is called a
#idx("Torus", "maximal")_maximal torus_ of $K$.

#problem[A compact subgroup $A$ of $K$ is a (maximal) torus if and only if
  $A(CC)$ is a (maximal) algebraic torus of
  $K(CC)$.] <pr:torus-iff-complexification-torus>

#problem[#source(265)A maximal torus $A$ of a connected compact Lie group $K$
  coincides with its centralizer in $K$. The subgroup $A$ contains $Z(K)$ and is
  maximal among commutative (not necessarily connected) subgroups of
  $K$.] <pr:maximal-torus-self-centralizing>

#theorem[Any two maximal tori of a compact Lie group $K$ are
  conjugate.] <th:compact-maximal-tori-conjugate>

#proof[Let $A_1$, $A_2$ be maximal tori of $K$. By
  Problem~@pr:torus-iff-complexification-torus $A_1 (CC)$ and $A_2 (CC)$ are
  maximal algebraic tori in $K(CC)$. Therefore (see
  Problem~@pr:algebraic-maximal-tori-conjugate), there exists $g in K(CC)$ such
  that $g A_1 (CC) g^(-1) = A_2 (CC)$. Since $A_1$ and $A_2$ are the largest
  compact subgroups of $A_1 (CC)$ and $A_2 (CC)$, then $g A_1 g^(-1) = A_2$.
  Since $K(CC)$ can be considered as a linear group, we have the polar
  decomposition $K(CC) = K P$, where $P = exp(i frak(k))$ (see
  Theorem~@th:polar-decomposition-compact-form). Let $g = k p$, where $k in K$,
  $p in P$. Set $l = p a p^(-1)$. Then $l in K$ for any $a in A_1$ implying
  $a^(-1) p a = a^(-1) l p$. It follows from @eq:polar-positive-part-invariance
  and the uniqueness of the polar decomposition that $a^(-1) p a = p$. Therefore
  $p a p^(-1) = a$ for any $a in A_1$, hence $A_2 = k A_1 k^(-1)$.]

Now consider a more general situation, when $K$ is a connected Lie group whose
tangent algebra $frak(k)$ is compact. By
Theorem~@th:compact-algebra-vector-times-compact we have the direct product
decomposition $K = L times C$, where $L supset K'$ is the largest compact
subgroup of $K$, $C tilde.eq RR^p$ the non-compact part of the commutative group
$Z(K)^0$.

#theorem[If $K$ is a connected Lie group with a compact tangent algebra
  $frak(k)$ then any maximal connected commutative subgroup $A$ in $K$ is of the
  form $A = (A inter L) times C$, where $A inter L$ is a maximal torus of $L$.
  The subgroup $A$ coincides with its centralizer and, in particular, contains
  $Z(K)$. All maximal connected commutative subgroups of $K$ are conjugate. The
  map $exp: frak(k) -> K$ defines a one-to-one correspondence between the
  maximal commutative subalgebras of $frak(k)$ and the maximal connected
  commutative subgroups of $K$.] <th:compact-algebra-maximal-commutative>

#problem[Prove this theorem.] <pr:prove-compact-algebra-maximal-commutative>

#exercises[
  #exercise[Let $bold(E)$ be a finite-dimensional Euclidean (or Hermitian)
    space, $G$ a subgroup of $GL(bold(E))$, $K = G inter upright(O)(bold(E))$
    (or $G inter upright(U)(bold(E))$), $P = G inter P(bold(E))$. If $G = K P$
    then $G$ is a self-adjoint linear
    group.] <exc:polar-decomposition-implies-self-adjoint>

  #exercise[Let $G subset GL(V)$ be a reductive algebraic complex linear group,
    $K$ its compact real form and $S$ an algebraic real structure in $G$ such
    that $S(K) = K$. In $V$, introduce a Hermitian $K$-invariant scalar product.
    Then the linear group $H = G^S$ is
    self-adjoint.] <exc:reductive-real-form-self-adjoint>

  #exercise[Let $G$ be a connected reductive algebraic group over $CC$, $H$ its
    algebraic real form. Then there exists a compact real form of $G$ such that
    the corresponding real form of $frak(g)$ is compatible with
    $frak(h)$.] <exc:compact-form-compatible-real-form>

  #exercise[An irreducible reductive real algebraic group $G$ is diffeomorphic
    to $L times RR^s$, where $L$ is a maximal compact subgroup of
    $G$.] <exc:reductive-real-group-topology>

  #exercise[A reductive real algebraic group consists of a finite number of
    connected components (in the usual
    topology).] <exc:reductive-real-group-components>

  #exercise[#source(266)Real algebraic linear groups $G subset GL_n (k)$, where
    $k = RR$, $CC$ or $HH$ listed in
    Examples~@exm:conjugation-real-forms-classical–@exm:quaternionic-pseudo-unitary-forms
    are self-adjoint with respect to the standard scalar product in $RR^n$ (the
    standard Hermitian products in $CC^n$ and $HH^n$, respectively). Find the
    corresponding polar decompositions $G = K P$ (i.e. determine $K$, the
    subalgebra $frak(k)$ and the subspace $frak(p)$ of
    $frak(g)$).] <exc:classical-groups-polar-decompositions>

  #exercise[The groups $upright(U)_(k, l)$, $SU_(k, l)$, $GL_m (HH)$,
    $SL_m (HH)$, $upright(U)_m^* (HH)$, $Sp_(k, l)$ are
    connected.] <exc:unitary-quaternionic-groups-connected>

  #exercise[The fundamental groups of the classical groups (except those studied
    in @sec:connectedness-simple-connectedness) are of the following form:
    $
      & pi_1 (upright(U)_n) tilde.eq pi_1 (Sp_(2 n) (RR))
        tilde.eq pi_1 (upright(U)_m^* (HH)) tilde.equiv ZZ; \
      & pi_1 (upright(U)_(k, l)) tilde.eq ZZ plus.o ZZ      && (k, l > 0); \
      & pi_1 (SU_(k, l)) tilde.eq ZZ                        && (k, l > 0); \
      & pi_1 (SL_n (RR)) tilde.eq ZZ_2                      && (n >= 3);
    $
    $pi_1 (upright(O)_(k, l)^0)$ are contained in the table:
    #figure(
      table(
        columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
        align: center,
        $k, l$,
        $k, l > 2$,
        $k = 1, l > 2$,
        $k = 2, l > 2$,
        $k = l = 2$,
        $k = 1, l = 2$,

        $pi_1 (upright(O)_(k, l)^0)$,
        $ZZ_2 plus.o ZZ_2$,
        $ZZ_2$,
        $ZZ plus.o ZZ_2$,
        $ZZ plus.o ZZ$,
        $ZZ$,
      ),
      numbering: none,
    )] <exc:classical-fundamental-groups>

  #exercise[Let $bold(E)$ be a Euclidean (or Hermitian) space and let
    $g in GL(bold(E))$ and $a in upright(O)(bold(E))$ (resp.
    $upright(U)(bold(E))$) be such that
    $g a g^(-1) in upright(O)(bold(E))$
    $(upright(U)(bold(E)))$. Then in the polar decomposition $g = k p$, where
    $k in upright(O)(bold(E))$ $(upright(U)(bold(E)))$, $p in P(bold(E))$, the
    factor $p$ satisfies $a p = p a$.] <exc:polar-positive-factor-commutes>

  #exercise[Each element of a connected compact Lie group is contained in a
    maximal torus.] <exc:element-in-maximal-torus>

  #exercise[The center of a connected compact Lie group coincides with the
    intersection of all of its maximal
    tori.] <exc:center-intersection-maximal-tori>

  #exercise[Let $A$ be a connected closed commutative subgroup of a connected
    compact Lie group $K$. Then the centralizer $Z(A)$ of $A$ in $K$ is
    connected.] <exc:torus-centralizer-connected>

  #exercise[Let $K$ be a simply connected compact Lie group and
    $Theta in Aut K$. Then $K^Theta$ is
    connected.] <exc:simply-connected-fixed-points-connected>

  #exercise[Let $K$ be a compact Lie group. The algebra of polynomial functions
    $RR[K]$ on $K$ considered as a real algebraic group coincides with the
    algebra of real representative
    functions.] <exc:compact-polynomials-representative>

  #exercise[Let $G$ be a reductive algebraic complex group. The algebra of
    polynomial functions $CC[G]$ coincides with the algebra of holomorphic
    representative functions $A_G^h$. If $K$ is a compact real form of $G$ then
    the restriction map determines an isomorphism
    $A_G^h -> A_K$.] <exc:reductive-polynomials-holomorphic>

  #exercise[A compact real algebraic group is irreducible if and only if it is
    connected (in the usual topology).] <exc:compact-irreducible-iff-connected>

  #exercise[Let $rho$ be a linear representation of a semisimple complex Lie
    algebra. Let us represent its decomposition into irreducible components in
    the form
    #source(267)
    $
      rho = rho_1 + dots.c + rho_s + rho_1^* + dots.c + rho_s^*
      + rho_(s+1) + dots.c + rho_t,
    $
    where $rho_i tilde.not rho_j^*$ for $i, j > s$ and $i != j$. The
    representation $rho$ is self-adjoint if and only if so are all $rho_i$
    $(i > s)$. Moreover, $rho$ is orthogonal (symplectic) if and only if so are
    all $rho_i$ $(i > s)$.] <exc:self-adjoint-representation-components>

  A complex or real Lie algebra $frak(g)$ is called #idx(
    "Lie algebra",
    "reductive",
  )_reductive_, if $rad frak(g) = frak(z)(frak(g))$.

  #exercise[A Lie algebra is reductive if and only if its adjoint representation
    is completely reducible.] <exc:reductive-adjoint-complete-reducibility>

  #exercise[If an arbitrary finite-dimensional representation of a Lie algebra
    $frak(g)$ is completely reducible then $frak(g)$ is
    semisimple.] <exc:complete-reducibility-implies-semisimple>
]

#hints[
  #hint[@pr:self-adjoint-group-center][Apply
    Theorem~@th:self-adjoint-group-polar-decomposition to $Z(G)$. It follows
    from Problem~@pr:exp-self-adjoint-to-positive that $Z(G) inter P$ is a Lie
    subgroup of $G$ isomorphic to $RR^s$, $s >= 0$.]

  #hint[@pr:self-adjoint-k-maximal-compact][If $p in P$ and $p != e$ then
    ${p^s = exp(s log p): s = 1, 2, ...}$ is an infinite discrete sequence.
    Therefore $p$ cannot belong to any compact subgroup of $G$.]

  #hint[@pr:compact-form-group-self-adjoint][First verify that $x^* in frak(g)$
    for any $x in frak(g)$. Since $S: g |-> g^(* -1)$ is an automorphism of
    $GL(bold(E))$ (as a real Lie group) and $(d S) x = -x^*$, then
    $S(G^0) = G^0$. Since $G = K G^0$ and $K$ consists of unitary operators,
    this implies the statement of the problem.]

  #hint[@pr:unitary-part-is-compact-form][By
    Theorem~@th:self-adjoint-group-polar-decomposition $G = K_1 P$ with
    $K subset K_1$ and $K^0 = K_1^0$ since $K$ and $K_1$ have the same tangent
    algebra. Since $K$ is a real form of $G$, we have
    $G = K G^0 = K(K_1^0 P) = K P$ which easily implies that $K_1 = K$.]

  #hint[@pr:simply-connected-is-compact-form][Let $frak(k)$ be a compact
    semisimple Lie algebra and let $G$ be a simply connected semisimple
    algebraic group over $CC$ with the tangent algebra $frak(k)(CC)$ existing
    thanks to Theorem~@th:complex-semisimple-group-linear. By
    Corollary~@cor:complex-group-topology-compact-form of
    Theorem~@th:polar-decomposition-compact-form the compact real form $K$ of
    $G$ is a simply connected Lie group with the tangent algebra $frak(k)$.]

  #hint[@pr:compact-group-torus-semisimple-cover][Let $Z = Z(K)^0$ and let $L$
    be a simply connected Lie group with the tangent algebra $frak(k)'$. The
    group $L$ is compact thanks to Problem~@pr:simply-connected-is-compact-form.
    There exists a covering $pi: frak(z) times L -> K$ such that
    $pi|frak(z) = exp: frak(z) -> Z$. Clearly, $Gamma = Ker exp subset Ker pi$.
    Therefore there exists a covering $pi': Z times L -> K$ such that
    $pi'(exp times id) = pi$. The kernel $Ker pi' tilde.eq Ker pi\/Gamma$ is
    finite since so is $Z(L)$.]

  #hint[@pr:connected-compact-is-reductive-form][Consider the covering
    $pi': tilde(K) = Z times L -> K$ from
    Problem~@pr:compact-group-torus-semisimple-cover.
    Problem~@pr:simply-connected-is-compact-form and
    Example~@exm:compact-real-torus[] of @ss:real-structures-and-forms[°] imply
    that $tilde(K)$ is isomorphic to a compact form of a connected complex
    reductive algebraic group $tilde(G)$. Let $N = Ker pi'$, then
    $N subset Z(tilde(G))$ by Problem~@pr:center-of-real-form and $K$ is
    isomorphic to a real form of the reductive group $tilde(G)\/N$.]

  #hint[@pr:prove-compact-group-center-times-derived][By
    Problem~@pr:connected-compact-is-reductive-form we may assume that $K$ is a
    linear group. Then $K'$ is a Lie subgroup since $frak(k)'$ is algebraic. The
    decomposition $K = Z K'$ follows from
    Problem~@pr:local-direct-product-criterion.]

  #hint[@pr:vector-times-compact-lifts-cover][Let $G_0 = A_0 times K_0$ be a
    decomposition satisfying the conditions of
    Theorem~@th:compact-algebra-vector-times-compact. Prove that
    $A = pi^(-1) (A_0)^0$, $K = pi^(-1) (K_0)^0$ and $G = A times K$.]

  #hint[@pr:invariant-complement-to-compact-part][Consider the representation of
    the compact group $G\/Z$ in $frak(z)$ induced by the adjoint representation
    and make use of Corollary of Theorem~@th:compact-invariant-inner-product.]

  #hint[@pr:prove-compact-algebra-semidirect-splitting][#source(268)Since $K_0$
    is a maximal compact subgroup of $G^0$, then $K_0$ is normal in $G$. The
    group $hat(G) = G\/K_0$ contains a normal Lie subgroup of finite index,
    $hat(A)$, isomorphic to $A$. By
    Lemma~@lem:vector-group-finite-extension-splits $hat(G) = hat(A) times.r L$,
    where $L$ is a finite subgroup. Then the preimage $K$ of $L$ with respect to
    the natural homomorphism $G -> hat(G)$ is the desired subgroup.]

  #hint[@pr:derived-group-times-normalizer][Consider the $G$-action on the set
    of compact real forms of $frak(h)$ determined by the adjoint representation.
    The subgroup $H subset G$ acts on this set transitively
    (Theorem~@th:compact-forms-conjugacy-compatibility) and $U$ is the
    stabilizer of $frak(l)$. This implies that $G = H U$.]

  #hint[@pr:normalizer-compact-part-real-form][The identity $G = K G^0$ follows
    from Problem~@pr:derived-group-times-normalizer.]

  #hint[@pr:compact-forms-conjugate-in-normalizer][Make use of
    Theorem~@th:maximal-compact-conjugacy-semidirect.]

  #hint[@pr:representative-functions-matrix-elements][In
    @ss:faithful-linear-representation[°] we have actually proved that the
    matrix elements of any representation belong to $A_G$. Conversely, let
    $f in A_G$, $f != 0$, and let $V$ be the linear span of
    ${r_* (g) f: g in G}$. In $V$, choose a basis $f_1 = f, f_2, ..., f_n$ and
    let $a_(i j)$ be the matrix elements of the representation
    $r_*: g |-> r_* (g)$ of $G$ in the space $V$ with respect to this basis.
    Then
    $ f(g) = sum_(1 <= k <= n) a_(k 1) (g) f_k (e), $
    i.e. $f$ is linearly expressed in terms of the matrix elements $a_(k 1)$ of
    the representation $r_*$.]

  #hint[@pr:complexified-compact-group-reductive][Let $K subset GL(V)$ be a
    compact real linear group. Theorem~@th:compact-invariant-inner-product
    implies that the scalar product~@eq:trace-form is negative definite on the
    tangent algebra $frak(k)$. Therefore a similar scalar product in
    $frak(s l)(V(CC))$ is non-degenerate on $frak(k)(CC)$. The reductivity of
    $K(CC)$ follows from Theorem~@th:reductive-iff-trace-form-nondegenerate.]

  #hint[@pr:kernel-of-complexified-homomorphism][Let $frak(p)_j = i frak(k)_j$,
    $P_j = exp frak(p)_j$ $(j = 1, 2)$. Then
    $d phi(CC)(frak(p)_1) subset frak(p)_2$ and therefore
    $phi(CC)(P_1) subset P_2$. Let $N = Ker phi(CC)$. The uniqueness of the
    polar decomposition~@eq:polar-decomposition-kp implies that if
    $g = k p in N$, where $k in K_1$, $p in P_1$, then $k, p in N$. It is clear
    from Problem~@pr:exp-self-adjoint-to-positive that $p = e$ and
    $g = k in Ker phi$.]

  #hint[@pr:compact-subgroup-is-algebraic][The algebraicity of $L$ follows from
    Theorem~@th:compact-linear-group-algebraic. If $phi: L -> K$ is an embedding
    then $phi(CC)$ is injective by
    Problem~@pr:kernel-of-complexified-homomorphism. The subgroup
    $phi(CC)(L(CC))$ is the desired one.]

  #hint[@pr:complete-reducibility-complexification][Let $G$ be completely
    reducible in $V$ and let $W_1 subset V(CC)$ be an irreducible $G$-invariant
    subspace. Then $V_1 = (W_1 + overline(W_1)) inter V$ is a $G$-invariant
    subspace of $V$ such that $V_1 (CC) = W_1 + overline(W_1)$ and either
    $W_1 inter overline(W_1) = 0$ or $W_1 = overline(W_1)$. If $V_2$ is a
    $G$-invariant complement to $V_1$ in $V$ then the $G$-invariant complement
    to $W_1$ in $V(CC)$ is either $overline(W_1) plus.o V_2 (CC)$ or $V_2 (CC)$,
    respectively. Conversely, let $G$ be completely reducible in $V(CC)$, let
    $V_1$ be an irreducible $G$-invariant subspace in $V$ and $W_2$ the
    $G$-invariant complement to $V_1 (CC)$ in $V(CC)$. Then
    $V = V_1 plus.o V_2$, where $V_2 = {x + overline(x): x in W_2}$.]

  #hint[@pr:complete-reducibility-realification][Let us embed $G$ in
    $GL(V^RR (CC))$ as in Problem~@pr:complete-reducibility-complexification and
    let us extend the complex structure operator $I$ from $V$ onto $V^RR (CC)$
    (cf. @ss:real-structures-and-forms[°]). Then
    $V^RR (CC) = V_i plus.o V_(-i)$, where $V_(plus.minus i)$ are eigenspaces of
    $I$ corresponding to eigenvalues $plus.minus i$. The subspaces
    $V_(plus.minus i)$ are invariant with respect to $G$, the projections
    $V = V^RR -> V_i$ and $V = V^RR -> V_(-i)$ commute with the $G$-action and
    are an isomorphism and #source(269)an antilinear isomorphism of complex
    vector spaces respectively. This implies that $G$ is completely reducible in
    $V$ if it is completely reducible in $V^RR (CC)$. Now apply
    Problem~@pr:complete-reducibility-complexification.]

  #hint[@pr:complete-reducibility-algebraic-closure][First prove that $G$ and
    $G^a$ have the same invariant subspaces.]

  #hint[@pr:semisimple-group-complete-reducibility][The image $G_1$ of $G$ under
    a linear representation is a semisimple linear group (see
    Problem~@pr:ideals-quotients-semisimple) and $(G_1^a)^0 = G_1^0$. Therefore,
    the statement follows from Theorem~@th:reductive-completely-reducible and
    Problem~@pr:complete-reducibility-algebraic-closure.]

  #hint[@pr:complete-reducibility-of-differential][Make use of
    Problem~@pr:invariant-subspaces-group-algebra.]

  #hint[@pr:radical-central-algebra-splits][Consider the representation of the
    semisimple Lie algebra $frak(g)\/rad frak(g)$ in $frak(g)$ induced by the
    adjoint representation.]

  #hint[@pr:reductive-iff-radical-torus][Let $G$ be an algebraic subgroup of
    $GL(V)$. Consider the weight decomposition
    $V = plus.o.big_(1 <= i <= p) V_(lambda_i)$ of $V$ with respect to $T$. Each
    $g in G$ permutes the subspaces $V_(lambda_i)$, thereby a homomorphism
    $G -> S_p$ is defined. Its kernel is a closed subgroup of a finite index in
    $G$ and, therefore, coincides with $G$. Thus, all the $V_(lambda_i)$'s are
    $G$-invariant, whence $T subset Z(G)$.]

  #hint[@pr:maximal-connected-commutative-is-torus][Note that for any connected
    commutative subgroup $A subset K$ the closure $overline(A)$ is a compact
    connected commutative subgroup, hence a torus.]

  #hint[@pr:torus-iff-complexification-torus][If $A$ is a torus then the
    reductive group $A(CC)$ is connected (e.g. by
    Corollary~@cor:complex-group-topology-compact-form of
    Theorem~@th:polar-decomposition-compact-form) and commutative, i.e. is an
    algebraic torus. Conversely, if $A(CC)$ is an algebraic torus then the
    compact commutative group $A$ is connected thanks to the same Corollary.]

  #hint[@pr:maximal-torus-self-centralizing][Pass to the maximal algebraic torus
    $A(CC) subset K(CC)$ and apply
    Theorem~@th:maximal-torus-equals-centralizer.]

  #hint[@pr:prove-compact-algebra-maximal-commutative][If $A$ is a maximal
    connected commutative subgroup of $K$, then $A C$ is also a connected
    commutative subgroup, hence $A = A C supset C$. Therefore
    $A = (A inter L) times C$, where $A inter L$ is a maximal connected
    commutative subgroup of $L$. The other statements of the theorem follow from
    Problems~@pr:maximal-connected-commutative-is-torus,
    @pr:maximal-torus-self-centralizing and
    Theorem~@th:compact-maximal-tori-conjugate.]
]
