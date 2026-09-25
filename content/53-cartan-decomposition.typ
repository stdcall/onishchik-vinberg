// Chapter 5, § 3. Cartan Decomposition. Printed pages 254-268; § 3 begins
// below the § 2 hints on page 254 and ends above § 4 on page 268.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/cd.typ": ar, cd

== Cartan Decomposition <sec:cartan-decomposition>

In this section we will study the so-called Cartan decomposition of a real
semisimple Lie group. It is an analogue of the polar decomposition considered in
@ss:polar-decomposition[°] and for semisimple algebraic groups these
decompositions coincide. The Cartan decomposition leads to an important theorem
on conjugacy of maximal compact subgroups of any real semisimple Lie group with
a finite number of connected components. It also enables us to give a global
classification of connected semisimple Lie groups.

=== Cartan Decomposition of a Semisimple Lie Algebra
<ss:cartan-decomposition-lie-algebra>
Let $frak(g)$ be a real semisimple Lie algebra, $(dot, dot)$ the Cartan scalar
product in $frak(g)$. A decomposition of $frak(g)$ into the direct sum of vector
spaces
$ frak(g) = frak(k) plus.o frak(p) $ <eq:cartan-decomposition-algebra>
#source(270)is a #idx("Cartan decomposition")_Cartan decomposition_ if

1) the map $theta: x + y |-> x - y$ ($x in frak(k)$, $y in frak(p)$) is an
automorphism of $frak(g)$;

2) the bilinear form
$ b_theta (x, y) = -(x, theta y) $ <eq:cartan-involution-inner-product>
is positive definite on $frak(g)$.

Note that $theta^2 = id$, therefore $b_theta$ is a symmetric bilinear form.

#problem[Condition 1) is equivalent to the following condition:
  $
    [frak(k), frak(k)] subset frak(k), quad
    [frak(k), frak(p)] subset frak(p), quad
    [frak(p), frak(p)] subset frak(k).
  $ <eq:cartan-bracket-relations>] <pr:cartan-automorphism-criterion>

#problem[If 1) holds then $(x, y) = 0$ for $x in frak(k)$, $y in frak(p)$ and 2)
  is equivalent to the following condition:
  $
    (x, x) < 0 wide "for" quad x in frak(k), quad x != 0; quad
    (y, y) > 0 quad "for" quad y in frak(p), quad y != 0.
  $ <eq:killing-form-signs-cartan>] <pr:cartan-positivity-criterion>

Therefore the decomposition~@eq:cartan-decomposition-algebra is a Cartan one if
and only if @eq:cartan-bracket-relations and @eq:killing-form-signs-cartan hold.

_Example._ If $frak(u)$ is a compact real form of a semisimple complex Lie
algebra $frak(g)$ then the decomposition
$
  frak(g)^RR = frak(u) plus.o I frak(u)
$ <eq:cartan-decomposition-realification>
is a Cartan decomposition of $frak(g)^RR$. Here $theta = tau$ is the real
structure corresponding to the real form $frak(u)$ and the scalar product
$b_theta$ coincides with $2 Re h_tau$ (see
Theorem~@th:compact-real-form-exists).

We will now describe Cartan decompositions of an arbitrary real semisimple Lie
algebra $frak(g)$. For this consider the complex semisimple Lie algebra
$frak(g)(CC)$. Let $frak(u)$ be a compact real form of $frak(g)(CC)$ compatible
with $frak(g)$. By Problem~@pr:compatible-real-forms-criteria
$
  frak(g) = frak(k) plus.o frak(p), quad "where" quad
  frak(k) = frak(g) inter frak(u), quad frak(p) = frak(g) inter (i frak(u)).
$ <eq:cartan-from-compatible-compact-form>

#problem[The decomposition~@eq:cartan-from-compatible-compact-form is a Cartan
  one and $theta = sigma tau$, where $sigma$ and $tau$ are the real structures
  corresponding to the real forms $frak(g)$ and $frak(u)$. Conversely, any
  Cartan decomposition~@eq:cartan-decomposition-algebra is of the
  form~@eq:cartan-from-compatible-compact-form for a compact real form
  $frak(u) = frak(k) plus.o (i frak(p))$ compatible with
  $frak(g)$.] <pr:cartan-compact-form-correspondence>

Therefore we have established a one-to-one correspondence between Cartan
decompositions of $frak(g)$ and compact real forms of $frak(g)(CC)$ compatible
with $frak(g)$. Note that any automorphism of $frak(g)$ transforms a Cartan
decomposition into a Cartan decomposition.

Problem~@pr:cartan-compact-form-correspondence and
Theorem~@th:compact-forms-conjugacy-compatibility imply

#theorem[Any real semisimple Lie algebra $frak(g)$ possesses a Cartan
  decomposition. Any two Cartan decompositions of $frak(g)$ are transformed into
  each other by an inner
  automorphism.] <th:cartan-decomposition-existence-conjugacy>

Now we will establish certain properties of Cartan decompositions. Let
$frak(g) = frak(k) plus.o frak(p)$ be a Cartan decomposition of a semisimple Lie
algebra $frak(g)$ over $RR$. It is clear #source(271)from
@eq:cartan-bracket-relations that $frak(k)$ is a subalgebra of $frak(g)$ and
$frak(p)$ is an invariant subspace with respect to $ad frak(k)$, where $ad$ is
the adjoint representation of $frak(g)$. The subspace $frak(p)$ is called the
#idx("Cartan subspace")_Cartan subspace_ of $frak(g)$.

Let us consider $frak(g)$ as a Euclidean space with the scalar product $b_theta$
given by formula~@eq:cartan-involution-inner-product.

#problem[We have $ad theta(x) = -(ad x)^*$ for any $x in frak(g)$. In
  particular, the operator $ad x$ is symmetric if and only if $x in frak(p)$ and
  skew symmetric if and only if
  $x in frak(k)$.] <pr:ad-symmetric-on-cartan-subspace>

#problem[Let $frak(g) = plus.o.big_(1 <= i <= s) frak(g)_i$, where $frak(g)_i$
  are simple ideals, and let $frak(g)_i = frak(k)_i plus.o frak(p)_i$
  ($i = 1, ..., s$) be their Cartan decompositions. Then
  $frak(k) = plus.o.big_(1 <= i <= s) frak(k)_i$ and
  $frak(p) = plus.o.big_(1 <= i <= s) frak(p)_i$ determine a Cartan
  decomposition of $frak(g)$ and any Cartan decomposition of this algebra can be
  obtained in this way.] <pr:cartan-decomposition-simple-ideals>

#problem[A Lie algebra $frak(g)$ is compact if and only if $frak(k) = frak(g)$
  and $frak(p) = 0$.] <pr:compact-iff-trivial-cartan-subspace>

=== Cartan Decomposition of a Semisimple Lie Group
<ss:cartan-decomposition-lie-group>
Let $G$ be a real semisimple Lie group (not necessarily connected) and let a
Cartan decomposition~@eq:cartan-decomposition-algebra of its tangent algebra be
given. In this section we will prove the existence of the corresponding global
decomposition $G = K P$, where $K$ is a Lie subgroup of $G$ with the tangent
algebra $frak(k)$ and $P = exp frak(p)$. This decomposition described in
Theorem~@th:cartan-decomposition-group will be called a #idx(
  "Cartan decomposition",
)_Cartan decomposition_ of $G$.

Denote by $theta$ the involutive automorphism of $frak(g)$ corresponding to the
decomposition~@eq:cartan-decomposition-algebra and consider $frak(g)$ as a
Euclidean space with the scalar product $b_theta$ defined by
formula~@eq:cartan-involution-inner-product.

#problem[For any $a in Aut frak(g)$ we have $theta a theta^(-1) = (a^*)^(-1)$.
  In particular, $Aut frak(g)$ is a self-adjoint linear
  group.] <pr:automorphism-group-self-adjoint>

#theorem[Let $G$ be a real semisimple Lie group and let a Cartan
  decomposition~@eq:cartan-decomposition-algebra of its tangent algebra be
  given. Set $K = {g in G: Ad g in upright(O)(frak(g))}$, $P = exp frak(p)$.
  Then $G = K P$ and every element $g in G$ uniquely presents in the form
  $g = k p$, where $k in K$, $p in P$. The map $phi: K times frak(p) -> G$ given
  by the formula
  $ phi(k, y) = k exp y wide (k in K, y in frak(p)) $
  is a diffeomorphism. The map $Theta: k p |-> k p^(-1)$ is an automorphism of
  $G$.] <th:cartan-decomposition-group>

#proof[It follows from Problem~@pr:automorphism-group-self-adjoint and
  Theorem~@th:self-adjoint-group-polar-decomposition that $Aut frak(g)$ admits
  the polar decomposition $Aut frak(g) = hat(K) hat(P)$, where
  $hat(K) = (Aut frak(g)) inter upright(O)(frak(g))$,
  $hat(P) = (Aut frak(g)) inter P(frak(g))$. By
  Problem~@pr:real-semisimple-derivations-inner the tangent algebra of
  $Aut frak(g)$ is $ad frak(g)$ and it is clear from
  Problem~@pr:ad-symmetric-on-cartan-subspace that
  $(ad frak(g)) inter S(frak(g)) = ad frak(p)$. Therefore
  $hat(P) = exp ad frak(p)$ (see
  Theorem~@th:self-adjoint-group-polar-decomposition).

  It follows from the commutative diagram
  $
    #cd(
      (
        A: (0, 0, $frak(p)$),
        B: (0, 1, $P$),
        C: (1, 0, $ad frak(p)$),
        D: (1, 1, $hat(P)$),
      ),
      (
        ar("A", "B", label: $exp$),
        ar("A", "C", label: $ad$, side: "right"),
        ar("B", "D", label: $Ad$),
        ar("C", "D", label: $exp$),
      ),
      column: 22mm,
      row: 17mm,
    )
  $ <eq:cartan-subspace-exp-diagram>
  #source(272)that $hat(P) = Ad P$ and the maps $exp: frak(p) -> P$ and
  $Ad: P -> hat(P)$ are one-to-one. If $g in G$ then $Ad g = hat(k) hat(p)$
  where $hat(k) in hat(K)$, $hat(p) in hat(P)$. Since $hat(p) = Ad p$, where
  $p in P$, then $Ad(g p^(-1)) = hat(k) in upright(O)(frak(g))$ implying
  $g p^(-1) = k in K$ and $g = k p$. If there is another decomposition
  $g = k' p'$, where $k' in K$, $p' in P$, then $(Ad k)(Ad p) = (Ad k')(Ad p')$
  which thanks to the uniqueness of the polar decomposition implies
  $Ad p = Ad p'$. Therefore $p = p'$ and hence $k = k'$. This also implies that
  $phi$ is bijective.

  Since the diagram
  $
    #cd(
      (
        A: (0, 0, $K times frak(p)$),
        B: (0, 1, $G$),
        C: (1, 0, $hat(K) times hat(frak(p))$),
        D: (1, 1, $Aut frak(g)$),
      ),
      (
        ar("A", "B", label: $phi$),
        ar("A", "C", label: $Ad times ad$, side: "right"),
        ar("B", "D", label: $Ad$),
        ar("C", "D", label: $hat(phi)$),
      ),
      column: 28mm,
      row: 17mm,
    )
  $
  where $hat(phi)$ determines the polar decomposition of $Aut frak(g)$,
  commutes, $d_((k, y)) phi$ is injective for any $k in K$, $y in frak(p)$. In
  fact, $hat(phi)$ is a diffeomorphism by
  Theorem~@th:self-adjoint-group-polar-decomposition and the differential of the
  left-hand column map is injective. Therefore, $phi$ is a diffeomorphism.

  Presenting $g in G$ in the form $g = k p$, where $k in K$, $p in P$, we get
  $ Ad Theta(g) = (Ad k)(Ad p)^(-1) = ((Ad g)^*)^(-1). $
  Therefore $(Ad) Theta$ is a homomorphism and
  $Ad(Theta(g_1 g_2) Theta(g_2)^(-1) Theta(g_1)^(-1)) = id$ for any
  $g_1, g_2 in G$, hence
  $
    Psi(g_1, g_2) = Theta(g_1 g_2) Theta(g_2)^(-1) Theta(g_1)^(-1) in Ker Ad.
  $
  The subgroup $Ker Ad$ is discrete since $(Ker Ad) inter G^0 = Z(G^0)$ (see
  Problem~@pr:adjoint-kernel-is-center). Therefore $Psi(g_1, g_2)$ depends only
  on the connected components of $G$ to which the elements $g_1, g_2$ belong.
  Since $P subset G^0$, an element of $K$ is contained in each connected
  component of the group $G = K P$. But $Psi(g_1, g_2) = id$ for $g_1$,
  $g_2 in K$, hence $Psi(g_1, g_2) = id$ for all $g_1, g_2 in G$.]

#corollary[$G$ is diffeomorphic to $K times RR^m$, where
  $m = dim frak(p)$.] <cor:cartan-decomposition-topology>

#problem(corollary: true)[$K$ coincides with the subgroup
  $G^Theta = {g in G: Theta(g) = g}$; its tangent algebra is
  $frak(k)$.] <pr:cartan-k-theta-fixed-points>
#as-corollary <cor:cartan-k-theta-fixed-points>

#problem(corollary: true)[$K$ coincides with
  $N(K^0)$.] <pr:cartan-k-normalizer-of-k0>
#as-corollary <cor:cartan-k-normalizer-of-k0>

#problem(corollary: true)[The Cartan decomposition of $G^0$ corresponding to
  decomposition~@eq:cartan-decomposition-algebra is of the form $G^0 = K^0 P$,
  where $K^0 = K inter G^0$ and
  $K\/K^0 tilde.eq G\/G^0$.] <pr:cartan-identity-component>
#as-corollary <cor:cartan-identity-component>

The definition of $K$ and Corollary~@cor:cartan-identity-component imply

#corollary[$Z(G) subset Z(K)$,
  $Z(G^0) subset Z(K^0)$.] <cor:group-center-in-k-center>

#problem(corollary: true)[#source(273)$K$ is compact if and only if $G$ has a
  finite number of connected components and $Z(G^0)$ is
  finite.] <pr:cartan-k-compactness-criterion>
#as-corollary <cor:cartan-k-compactness-criterion>

Proof of Theorem~@th:cartan-decomposition-group (see
@eq:cartan-subspace-exp-diagram) also implies

#corollary[The map $Ad: P -> hat(P) = Aut frak(g) inter P(frak(g))$ is a
  diffeomorphism.] <cor:adjoint-diffeomorphism-on-p>

*Remarks.* 1) Let $G subset GL(V)$ be a complex semisimple algebraic linear
group, $K$ its compact real form. Then the Cartan decomposition of $G$
corresponding to the Cartan decomposition $frak(g) = frak(k) plus.o (i frak(k))$
of its tangent algebra (see Example of @ss:cartan-decomposition-lie-algebra)
coincides with the polar decomposition described in
Theorem~@th:polar-decomposition-compact-form. In fact, these decompositions are
defined by the same set $P = exp(i frak(k))$, and
Corollary~@cor:cartan-k-normalizer-of-k0 of
Theorem~@th:cartan-decomposition-group implies that $K$ coincides with the
subgroup from the Cartan decomposition.

2) Let $G subset GL(V)$, where $V$ is a vector space over $RR$, be a real
semisimple linear Lie group. Then $Z(G^0)$ is finite since it is contained in
the center of the connected semisimple complex algebraic group
$(G^0)^a subset GL(V(CC))$. Therefore if $G$ has a finite number of connected
components then the subgroup $K$ of Theorem~@th:cartan-decomposition-group is
compact (Corollary~@cor:cartan-k-compactness-criterion).

3) If the subalgebra $frak(k) subset frak(g)$ is semisimple and $G$ has a finite
number of connected components then $K$ is compact by
Problem~@pr:simply-connected-is-compact-form and
Corollary~@cor:cartan-identity-component of
Theorem~@th:cartan-decomposition-group. If $frak(k)$ is not semisimple then by
Corollary~@cor:cartan-decomposition-topology of
Theorem~@th:cartan-decomposition-group applied to a simply connected group $G$
the subgroup $K$ is also simply connected, hence is not compact. The simplest
example of such a group is $G = tilde(SL)_2 (RR)$ (see
Example~@exm:sl2r-cover-not-real-form[] of @ss:real-structures-and-forms[°]).
Here $frak(k) = frak(s o)_2$, $K tilde.eq RR$, therefore by
Corollary~@cor:cartan-decomposition-topology $G$ is diffeomorphic to $RR^3$.

4) Let $G = PSL_2 (RR) = SL_2 (RR)\/{plus.minus E}$ and
$pi: SL_2 (RR) -> PSL_2 (RR)$ the natural homomorphism. If
$SL_2 (RR) = SO_2 dot P$ is a Cartan decomposition, then
$PSL_2 (RR) = pi(SO_2) pi(P)$. This is a Cartan decomposition of $PSL_2 (RR)$.
Since $pi(SO_2) = SO_2\/{plus.minus E} tilde.eq SO_2$, then
$pi_1 (PSL_2 (RR)) tilde.eq ZZ$, implying $Z(tilde(SL)_2 (RR)) tilde.eq ZZ$.

Suppose $frak(g)$ is a simple Lie algebra over $RR$ admitting no complex
structure, i.e. a real form of a complex simple Lie algebra. Then the
automorphism $theta$ extended by linearity onto $frak(g)(CC)$ is the involutive
automorphism of $frak(g)(CC)$ that corresponds to the real form $frak(g)$ by
Theorem~@th:real-forms-involutions-bijection (see
Problem~@pr:real-form-of-involution-explicit) and $frak(k)(CC)$ coincides with
$frak(g)(CC)^theta$. According to the classification of
Problem~@pr:involution-kac-diagram-types the case of a semisimple subalgebra
$frak(k)$ corresponds to types I, III, and that of a non-semisimple subalgebra
to the type II; in the latter case $frak(k)$ has a one-dimensional center.

=== Conjugacy of Maximal Compact Subgroups <ss:maximal-compact-conjugacy>
In this subsection we will describe maximal compact subgroups of semisimple Lie
groups with a finite number of connected components. In particular, we will
prove that all maximal compact subgroups are conjugate. First, we consider the
general case and formulate a conjugacy theorem for subgroups more general than
compact ones.

A subgroup $M$ of a semisimple Lie group $G$ is called #idx(
  "subgroup",
  "pseudocompact",
)_pseudocompact_ if the linear group $Ad M subset GL(frak(g))$ is compact. Any
compact group is pseudocompact.

#problem[The subgroup $K$ considered in Theorem~@th:cartan-decomposition-group
  is a maximal pseudocompact subgroup of
  $G$.] <pr:cartan-k-maximal-pseudocompact>

#theorem[#source(274)Let $G = K P$ be a Cartan decomposition of a semisimple Lie
  group $G$. For any pseudocompact subgroup $M subset G$ there exists $g in P$
  such that $g M g^(-1) subset K$.] <th:pseudocompact-conjugate-into-k>

Before we prove this theorem let us deduce from it several corollaries. If $G$
has a finite number of connected components then so has $K$ by
Corollary~@cor:cartan-identity-component of
Theorem~@th:cartan-decomposition-group. Since $frak(k)$ is compact,
Theorems~@th:compact-algebra-vector-times-compact and
@th:compact-algebra-semidirect-splitting imply that $K = A times.r L$, where
$A tilde.eq RR^s$ and $L$ is a maximal compact subgroup of $K$.

#problem(corollary: true)[If $G$ has a finite number of connected components
  then any maximal compact subgroup $L$ of $K$ is a maximal compact subgroup of
  $G$. Any maximal compact subgroup of $G$ is conjugate to $L$ by an
  automorphism of the form $a(g)$, where
  $g in G^0$.] <pr:maximal-compact-subgroups-conjugate>
#as-corollary <cor:maximal-compact-subgroups-conjugate>

#corollary[A semisimple Lie group $G$ with a finite number of connected
  components is diffeomorphic to $L times RR^N$, where $L$ is any maximal
  compact subgroup of $G$.] <cor:semisimple-topology-maximal-compact>

#problem(corollary: true)[Let $frak(g)$ be a real semisimple Lie algebra and let
  $M$ be a compact subgroup of $Aut frak(g)$. Then $frak(g)$ admits a Cartan
  decomposition invariant with respect to
  $M$.] <pr:invariant-cartan-decomposition>
#as-corollary <cor:invariant-cartan-decomposition>

The classical proof of Theorem~@th:pseudocompact-conjugate-into-k due to
E.~Cartan (see [@bib:Helgason1978]), as well as its simplified versions (see,
e.g., [@bib:Sirota1963]), are based on the study of geometry of the symmetric
space $G\/K$. The proof that follows, exploiting an idea presented in
[@bib:Sirota1963], does not use Riemannian geometry at all.

Observe that $GL(bold(E))$ acts on the manifold $P(bold(E))$ of positive
definite self-adjoint operators in a Euclidean space $bold(E)$ by the formula
$
  Sq(A)(X) = A X A^* wide
  (X in P(bold(E)), A in GL(bold(E))).
$
As it is known from linear algebra, this action is transitive, and the
stabilizer of the identity operator $E in P(bold(E))$ is the orthogonal group
$upright(O)(bold(E))$. Consider the differentiable function $r$ of two variables
on $P(bold(E))$ given by the formula
$ r(X, Y) = tr(X Y^(-1)). $ <eq:trace-ratio-function>

#problem[$r(Sq(A)(X), Sq(A)(Y)) = r(X, Y)$ for any
  $A in GL(bold(E))$.] <pr:trace-ratio-invariance>

Let $Omega$ be a compact set in $P(bold(E))$. Let
$ rho(X) = max_(Y in Omega) r(X, Y), $ <eq:max-trace-ratio-function>

#problem[The function $rho$ is continuous on
  $P(bold(E))$.] <pr:max-trace-ratio-continuous>

Set $S P(bold(E)) = P(bold(E)) inter SL(bold(E))$. Clearly, $S P(bold(E))$ is
closed in $SL(bold(E))$ and therefore is closed in the space
$frak(g l)(bold(E))$.

#lemma[For any compact set $Omega subset P(bold(E))$ the function $rho$ defined
  by formula~@eq:max-trace-ratio-function assumes its minimum on any closed
  subset $F subset S P(bold(E))$.] <lem:max-trace-ratio-attains-minimum>

#proof[#source(275)First, prove that
  $
    rho(X) >= b norm(X) wide (X in P(bold(E))),
  $ <eq:max-trace-ratio-norm-bound>
  where $b > 0$ is a constant and $norm(X)$ is the norm of an operator $X$ in
  $bold(E)$. Fix $X in P(bold(E))$ and choose an orthonormal basis of $bold(E)$
  in which $X$ is expressed by a diagonal matrix $diag(x_1, ..., x_n)$. If
  $(y_(i j))$ is the matrix of $Y^(-1)$, where $Y in P(bold(E))$, then
  $y_(i i) > 0$ and
  $
    r(X, Y) = sum_(1 <= i <= n) x_i y_(i i).
  $ <eq:trace-ratio-diagonal-formula>
  Since $Omega$ and the orthogonal group are compact, there exists $b > 0$ such
  that $y_(i i) >= b$ ($i = 1, ..., n$) for all $Y in Omega$ and all orthonormal
  bases of $bold(E)$. Then
  $
    r(X, Y) >= b tr X >= b (max_(1 <= i <= n) x_i) = b norm(X) wide
    "for any" Y in Omega
  $
  implying @eq:max-trace-ratio-norm-bound.

  It follows from @eq:max-trace-ratio-norm-bound that for any $N > 0$ the set
  ${X in S P(bold(E)): rho(X) <= N}$ is compact. In fact, $rho(X) <= N$ implies
  $norm(X) <= N\/b$ and the intersection of the compact ball
  ${X in S(bold(E)): norm(X) <= N\/b}$ with the closed set $S P(bold(E))$ is
  compact.

  Now it is easy to prove the existence of a minimum point. Let $X_0 in F$.
  Consider the set $B = {X in F: rho(X) <= rho(X_0)}$ containing $X_0$ and
  compact by the above considerations. Problem~@pr:max-trace-ratio-continuous
  implies the existence of $X_1 in B$ such that $rho(X_1) <= rho(X)$ for all
  $X in B$. The point $X_1$ is a minimum point of $rho$ on the whole $F$ since
  $rho(X) > rho(X_0) >= rho(X_1)$ for $X in F without B$.]

Now we want to show that under appropriate conditions the minimum point of $rho$
is unique. We want to prove that the functions $r$ and $rho$ possess some
convexity property.

#problem[For any fixed $X, Y in P(bold(E))$, $X != E$ the functions
  $ f_(X, Y) (t) = r(X^t, Y), quad phi_X (t) = rho(X^t) $
  are strictly convex on the whole real axis.] <pr:trace-ratio-strict-convexity>

Return to the situation of Theorem~@th:pseudocompact-conjugate-into-k. Consider
the tangent algebra $frak(g)$ of $G$ as a Euclidean space with the scalar
product~@eq:cartan-involution-inner-product corresponding to our Cartan
decomposition. Set $hat(P) = exp ad frak(p)$.

#problem[$hat(P)$ is a closed submanifold of $S P(frak(g))$, coinciding with the
  orbit of the point $E$ under the action $(Sq)(Ad)$ of $G$ on $P(frak(g))$. The
  subgroup $K subset G$ is the stabilizer of $E$ with respect to this
  action.] <pr:positive-part-orbit-of-identity>

#lemma[For any compact set $Omega$ in $P(frak(g))$ the function $rho$ defined by
  @eq:max-trace-ratio-function has a unique minimum point in
  $hat(P)$.] <lem:unique-minimum-on-positive-part>

#proof[Let $A, B in hat(P)$ be two different minimum points of $rho$. Apply to
  $A$, $B$ and $Omega$ the map $Sq(B^(-1\/2))$ which transforms $hat(P)$ into
  itself, $B$ into $E$ and $Omega$ into a new #source(276)compact set. Making
  use of Problem~@pr:trace-ratio-invariance, we shall reduce our problem to the
  case $B = E$. Clearly, $A^t in hat(P)$ for all $t in RR$. By
  Problem~@pr:trace-ratio-strict-convexity the function $phi_A (t) = rho(A^t)$
  is strictly convex on the segment $[0, 1]$. Therefore, it can not assume its
  minimum on both ends of this segment.]

#proof(head: [_Proof of Theorem_~@th:pseudocompact-conjugate-into-k.])[Let $M$
  be a pseudocompact subgroup of $G$. Consider the action of the subgroup
  $M subset G$ on $P(frak(g))$ defined in
  Problem~@pr:positive-part-orbit-of-identity. Since $Ad M$ is compact, the
  orbit $Omega = Sq(Ad M)(E)$ is also compact. By
  Problem~@pr:trace-ratio-invariance the function $rho$ on $P(frak(g))$ given by
  @eq:max-trace-ratio-function is invariant with respect to $M$. Thus, its
  unique minimum point $A_0 in hat(P)$ (see
  Lemma~@lem:unique-minimum-on-positive-part) is fixed under $M$. Since $G$ acts
  transitively on $hat(P)$, it follows that $g M g^(-1) subset K$ for some
  $g in G$. It is easy to see that we may set $g = p^(-1\/2)$, where
  $p in P = exp frak(p)$ is such that $A_0 = Ad p$.]

=== Canonically Embedded Subalgebras <ss:canonically-embedded-subalgebras>
Given a Cartan decomposition~@eq:cartan-decomposition-algebra of a real
semisimple Lie algebra $frak(g)$ we call a subalgebra $frak(h) subset frak(g)$
#idx(
  "subalgebra",
  "canonically embedded",
)_canonically embedded in $frak(g)$ with respect to the
decomposition_~@eq:cartan-decomposition-algebra if $theta(frak(h)) = frak(h)$,
where $theta$ is the automorphism corresponding to the Cartan decomposition, or,
equivalently, if
$
  frak(h) = (frak(h) inter frak(k)) plus.o (frak(h) inter frak(p)).
$ <eq:canonically-embedded-splitting>

As it is known, any semisimple Lie algebra $frak(g)$ (over $RR$ or $CC$) can be
identified with the linear Lie algebra $ad frak(g) subset frak(g l)(frak(g))$
over the same field. Therefore we may introduce the notion of an algebraic
subalgebra of a semisimple Lie algebra. A subalgebra $frak(h)$ of a complex
semisimple Lie algebra $frak(g)$ is called a #idx(
  "subalgebra",
  "algebraic",
)#idx(
  "subalgebra",
  "algebraic",
  "reductive",
)_(reductive) algebraic subalgebra_ if $ad frak(h)$ is a (reductive) algebraic
linear Lie algebra in the sense of @ss:invariant-scalar-products[°]. A
subalgebra $frak(h)$ of a real semisimple Lie algebra $frak(g)$ is called
_reductive algebraic_ if $frak(h)(CC)$ is a reductive algebraic subalgebra of a
complex Lie algebra $frak(g)(CC)$. For instance, any semisimple subalgebra of a
semisimple Lie algebra (over $CC$ or $RR$) is reductive algebraic.

#problem[Let $frak(g)$ be a real semisimple Lie algebra. Any canonically
  embedded algebraic subalgebra $frak(h) subset frak(g)$ is reductive algebraic.
  If $frak(h)$ is semisimple then the
  decomposition~@eq:canonically-embedded-splitting is its Cartan
  decomposition.] <pr:canonically-embedded-is-reductive>

Our aim is to prove the following statement inverse to the first statement of
Problem~@pr:canonically-embedded-is-reductive.

#theorem[Any reductive algebraic subalgebra of a real semisimple Lie algebra
  $frak(g)$ is canonically embedded in $frak(g)$ with respect to a Cartan
  decomposition.] <th:reductive-subalgebra-canonical-embedding>

Proof is based on the following refinement of one of the statements of
Theorem~@th:compact-forms-conjugacy-compatibility.

#lemma[Let $frak(h)$ be a reductive algebraic subalgebra of a complex semisimple
  Lie algebra $frak(g)$ and let $sigma$ be a real structure on $frak(g)$ such
  that $sigma(frak(h)) = frak(h)$. Then on $frak(g)$, there exists a real
  structure $tau$ such that $frak(g)^tau$ is compact, $sigma tau = tau sigma$
  and $tau(frak(h)) = frak(h)$.] <lem:compact-structure-preserving-subalgebra>

#proof[Represent $frak(h)$ in the form $frak(h) = frak(z) plus.o frak(h)'$,
  where $frak(z)$ is the center of $frak(h)$. Clearly,
  $sigma(frak(h)') = frak(h)'$, $sigma(frak(z)) = frak(z)$. By
  Theorem~@th:compact-forms-conjugacy-compatibility there exists a real
  structure $tau_1$ on the #source(
    277,
  )semisimple Lie algebra $frak(h)'$ such that $(frak(h)')^(tau_1)$ is compact
  and $tau_1 sigma = sigma tau_1$ on $frak(h)'$. The corresponding compact real
  form $L$ of the group $Int frak(h)' subset Int frak(g)$ satisfies
  $sigma L sigma = L$. The algebraic torus
  $Z = exp ad frak(z) subset Int frak(g)$ determines a real form $frak(z)(RR)$
  of $frak(z)$. The subgroup $B = exp ad(i frak(z)(RR))$ is the compact part of
  $Z$ so that $sigma B sigma = B$. Then $M = B L$ is a compact Lie subgroup of
  $Int frak(g)$, its tangent algebra
  $frak(m) = i frak(z)(RR) plus.o (frak(h)')^(tau_1)$ is a real form of
  $frak(h)$ and $sigma M sigma = M$. Now consider $frak(g)$ as a real semisimple
  Lie algebra $frak(g)^RR$ and denote by $M_1$ the subgroup of $Aut frak(g)^RR$
  generated by $M$ and $chevron.l sigma chevron.r$. Clearly,
  $M_1 = chevron.l sigma chevron.r M$, so $M_1$ is compact. By
  Corollary~@cor:invariant-cartan-decomposition of
  Theorem~@th:pseudocompact-conjugate-into-k there is an $M_1$-invariant Cartan
  decomposition of $frak(g)^RR$. This means (see Example of
  @ss:cartan-decomposition-lie-algebra) that there exists a compact
  $M_1$-invariant real form of $frak(g)$. The corresponding real structure $tau$
  satisfies, as is easy to verify, the requirements of Lemma.]

#problem[Prove Theorem~@th:reductive-subalgebra-canonical-embedding.]
<pr:prove-reductive-subalgebra-canonical-embedding>

=== Classification of Connected Semisimple Lie Groups
<ss:real-semisimple-group-classification>
This section is devoted to the global classification of connected real
semisimple Lie groups. It turns out that as in the complex case this
classification can be given in terms of the tangent algebras and lattices in
some commutative subalgebras of these algebras. By a “torus” we always mean a
compact torus.

Let $G$ be a connected semisimple Lie group. A connected subgroup $A subset G$
will be called a #idx("pseudotorus")_pseudotorus_ if $Ad A$ is a torus. Fix a
Cartan decomposition $G = K P$.

#problem[The maximal connected commutative subgroups of $K$ are the maximal
  pseudotori of $G$ belonging to $K$. All maximal pseudotori of $G$ are
  conjugate.] <pr:maximal-pseudotori-conjugate>

A commutative subalgebra $frak(a)$ of a semisimple Lie algebra $frak(g)$ will be
called #idx("subalgebra", "pseudotoral")_pseudotoral_ if
$exp ad frak(a) subset Int frak(g)$ is compact, i.e. is a torus.

#problem[Let $frak(g)$ be the tangent algebra of a semisimple Lie group $G$. A
  subalgebra $frak(a) subset frak(g)$ is (maximal) pseudotoral if and only if it
  is the tangent algebra of a (maximal) pseudotorus in $G$. Any maximal
  commutative subalgebra of $frak(k)$ is pseudotoral. All maximal pseudotoral
  subalgebras of a semisimple Lie algebra $frak(g)$ are
  conjugate.] <pr:pseudotoral-subalgebras-conjugate>

Let $A$ be a maximal pseudotorus of a connected semisimple Lie group $G$ and let
$frak(a)$ be the corresponding maximal pseudotoral subalgebra of $frak(g)$. The
kernel of the homomorphism $exp = exp_G: frak(a) -> A$ is a lattice in $frak(a)$
which, as we will see, determines together with the Lie algebra $frak(g)$, the
group $G$ uniquely up to an isomorphism. But it is more convenient to consider
the lattice $L(G) = Ker cal(E) subset frak(a)(CC)$, where
$cal(E) = cal(E)_G: i frak(a) -> G$ is the homomorphism defined by
$cal(E)(x) = exp 2 pi i x$. The lattice $L(G)$ is called the #idx(
  "lattice",
  "characteristic",
)_characteristic lattice_ of $G$.

#problem[Let $G_1, G_2$ be two connected semisimple Lie groups with the same
  tangent algebra $frak(g)$, $frak(a) subset frak(g)$ a maximal pseudotoral
  subalgebra. The characteristic lattices of $G_1$ and $G_2$ satisfy
  $L(G_1) subset L(G_2)$ if and only if there exists a homomorphism
  $pi: G_1 -> G_2$ such that $d pi = id$. In this case
  $cal(E)_(G_1)^(-1) (Ker pi) = L(G_2)$, whence
  $Ker pi tilde.eq L(G_2)\/L(G_1)$.] <pr:characteristic-lattice-coverings>

#theorem[#source(278)Let $G_j$ ($j = 1, 2$) be two connected semisimple Lie
  groups, $frak(a)_j subset frak(g)_j$ maximal pseudotoral subalgebras of their
  tangent algebras, $L(G_j) subset i frak(a)_j$ their characteristic lattices.
  $G_1$ and $G_2$ are isomorphic if and only if there exists an isomorphism
  $phi: frak(g)_1 -> frak(g)_2$ such that $phi(frak(a)_1) = frak(a)_2$ and
  $phi(CC)(L(G_1)) = L(G_2)$.] <th:characteristic-lattice-determines-group>

#problem[Prove this theorem.] <pr:prove-characteristic-lattice-determines-group>

To complete the classification we need to find out which lattices in $i frak(a)$
might be characteristic ones.

Let $G$ be again a connected semisimple Lie group and $frak(a)$ a maximal
pseudotoral subalgebra of $frak(g)$. The lattice
$L_0 = L(tilde(G)) subset i frak(a)$ corresponds to the simply connected
covering $tilde(G)$ of $G$. On the other hand, the lattice
$L_1 = L(Int frak(g)) subset i ad frak(a) subset i ad frak(g)$ corresponds to
$Int frak(g)$. Identifying $frak(g)$ and $ad frak(g)$ with the help of the
isomorphism $ad$ we get $L_1 subset i frak(a)$.
Problem~@pr:characteristic-lattice-coverings implies that
$L_0 subset L(G) subset L_1$.

#problem[$cal(E)^(-1) (Z(G)) = L_1$, $Z(G) = cal(E)(L_1) tilde.eq L_1\/L(G)$,
  $pi_1 (G) tilde.eq L(G)\/L_0$.] <pr:center-fundamental-group-lattices>

#problem[Any lattice $L$ such that $L_0 subset L subset L_1$ is the
  characteristic lattice of a connected Lie group with the tangent algebra
  $frak(g)$.] <pr:intermediate-lattice-is-characteristic>

Now describe the lattices $L_0$ and $L_1$. Fix a Cartan decomposition
$frak(g) = frak(k) plus.o frak(p)$. Denote by $theta$ the involutive
automorphism of $frak(g)$ associated to this decomposition and the extension of
this automorphism onto the complex semisimple Lie algebra. Then
$frak(k)(CC) = frak(g)(CC)^theta$. By Problem~@pr:maximal-pseudotori-conjugate
we may assume that $frak(a)$ is a maximal commutative subalgebra of $frak(k)$.
We have $frak(k) = frak(k)' plus.o frak(z)(frak(k))$. By
Theorem~@th:compact-algebra-maximal-commutative
$frak(a) = frak(a)_0 plus.o frak(z)(frak(k))$, where $frak(a)_0$ is a maximal
commutative subalgebra of $frak(k)'$.

#problem[The subalgebras $frak(t) = frak(a)(CC)$ and
  $frak(t)_0 = frak(a)_0 (CC)$ are maximal diagonalizable subalgebras of the
  reductive algebraic subalgebra $frak(k)(CC) subset frak(g)(CC)$ and the
  semisimple Lie algebra $frak(k)'(CC) = frak(k)(CC)'$
  respectively.] <pr:complexified-pseudotoral-diagonalizable>

#problem[The lattice $L_0$ coincides with
  $Q^or (frak(k)'(CC)) subset i frak(a)_0$, where $Q^or (frak(k)'(CC))$ is the
  dual root lattice of $frak(k)'(CC) = frak(k)(CC)'$ with respect to
  $frak(t)_0$.] <pr:simply-connected-characteristic-lattice>

By Problem~@pr:fixed-toral-centralizer-cartan the centralizer $frak(h)$ of
$frak(t)$ in $frak(g)(CC)$ is the only maximal diagonalizable subalgebra of
$frak(g)(CC)$ containing $frak(t)$ and $theta(frak(h)) = frak(h)$.

#problem[We have $L_1 = P^or inter frak(t)$, where $P^or$ is the weight lattice
  of the dual root system $Delta_(frak(g)(CC))^or$ of $frak(g)(CC)$ with respect
  to $frak(h)$.] <pr:adjoint-lattice-coweight-intersection>

For a lattice $L_1$ we may find another expression with the help of $theta$. By
Problem~@pr:automorphism-invariant-base there is a base $Pi$ of
$Delta_(frak(g)(CC))$ invariant with respect to $attach(theta, tl: t)$. Let
$tau = attach(theta, tl: t)^(-1) in Aut Pi$ and let $hat(tau)$ be the
automorphism of $frak(g)(CC)$ defined by @eq:diagram-automorphism-lift. By
Problems~@pr:root-restriction-to-fixed-cartan and
@pr:diagram-fixed-subalgebra-semisimple, $frak(t)$ is a maximal diagonalizable
subalgebra of the semisimple Lie algebra $frak(g)(CC)^hat(tau)$.

#problem[The lattice $L_1$ coincides with $P^or (frak(g)(CC)^hat(tau))$, the
  weight lattice of the dual root system $Delta_(frak(g)(CC)^hat(tau))^or$ of
  the Lie algebra $frak(g)(CC)^hat(tau)$ with respect to
  $frak(t)$.] <pr:adjoint-lattice-diagram-fixed-algebra>

Problems~@pr:center-fundamental-group-lattices,
@pr:intermediate-lattice-is-characteristic,
@pr:simply-connected-characteristic-lattice–@pr:adjoint-lattice-diagram-fixed-algebra
imply the following statements:

#theorem[#source(279)Let $frak(a)$ be a maximal commutative subalgebra of
  $frak(k)$. The lattice $L subset i frak(a)$ is characteristic for a connected
  Lie group with the tangent algebra $frak(g)$ if and only if
  $
    Q^or ((frak(g)(CC)^theta)') subset L subset P^or (frak(g)(CC)^hat(tau)),
  $
  where $tau = eta(theta)$ and $eta: Aut frak(g)(CC) -> Aut Pi$ is the
  homomorphism defined in
  @ss:outer-automorphism-group[°].] <th:characteristic-lattice-criterion>

#theorem[For any connected Lie group $G$ with the tangent algebra $frak(g)$ we
  have $cal(E)^(-1) (Z(G)) = P^or (frak(g)(CC)^hat(tau))$, implying
  $ Z(G) tilde.eq P^or (frak(g)(CC)^hat(tau))\/L(G). $
  We have also
  $ pi_1 (G) tilde.eq L(G)\/Q^or ((frak(g)(CC))^theta). $
  In particular, for a simply connected group $tilde(G)$ we have
  $
    Z(tilde(G)) tilde.eq
    P^or (frak(g)(CC)^hat(tau))\/Q^or ((frak(g)(CC)^theta)')
  $
  and
  $
    pi_1 (G) tilde.eq L(G)\/Q^or ((frak(g)(CC)^theta)').
  $] <th:real-semisimple-center-fundamental-group>

=== Linearizer <ss:linearizer>
Let $G$ be a Lie group. Denote by $Lambda(G)$ the intersection of the kernels of
all linear representations of $G$. As follows from
Theorem~@th:intersection-of-lie-subgroups $Lambda(G)$ is a normal Lie subgroup
of $G$. Call it the #idx(
  "linearizer",
)_linearizer_ of $G$ and set $G_"lin" = G\/Lambda(G)$.

#problem[Let $R: G -> GL(V)$ be a linear representation. Then there exists a
  unique linear representation $R_0: G_"lin" -> GL(V)$ such that $R = R_0 pi$,
  where $pi: G -> G_"lin"$ is the natural
  homomorphism.] <pr:linearizer-quotient-universal>

Our aim is to prove the following theorem which justifies the term “linearizer”
in case when $G$ is connected and semisimple.

#theorem[Let $G$ be a connected semisimple Lie group. The linearizer $Lambda(G)$
  is discrete, belongs to $Z(G)$ and $G_"lin"$ admits a faithful linear
  representation.] <th:linearizer-discrete-central>

#proof[It suffices to prove the existence of a locally faithful linear
  representation $R_0$ of $G$ such that $Lambda(G) = Ker R_0$. Let
  $pi: tilde(G) -> G$ be a simply connected covering, $Gamma = Ker pi$, and let
  $H$ be a simply connected complex Lie group with tangent algebra
  $frak(g)(CC)$. By Theorem~@th:homomorphism-existence-simply-connected there
  exists a homomorphism $j: tilde(G) -> H$ such that $d j$ is the identity
  embedding $frak(g) -> frak(g)(CC)$. Then $j(tilde(G))$ is a real form of $H$
  with the tangent algebra $frak(g)$. Problem~@pr:center-of-real-form implies
  that $j(Gamma) subset Z(H)$. Clearly, there exists a homomorphism
  $Phi: G -> H\/j(Gamma)$ such that the diagram
  $
    #cd(
      (
        A: (0, 0, $tilde(G)$),
        B: (0, 1, $H$),
        C: (1, 0, $G$),
        D: (1, 1, $H\/j(Gamma)$),
      ),
      (
        ar("A", "B", label: $j$),
        ar("A", "C", label: $pi$, side: "right"),
        ar("B", "D", label: $tilde(pi)$),
        ar("C", "D", label: $Phi$),
      ),
      column: 22mm,
      row: 17mm,
    )
  $ <eq:linearizer-diagram>
  #source(280)where $tilde(pi)$ is the natural homomorphism, commutes. By
  Theorem~@th:complex-semisimple-group-linear $H\/j(Gamma)$ admits a faithful
  linear representation. Therefore there exists a representation $R_0$ of $G$
  such that $Ker R_0 = Ker Phi$. Let us prove that this representation is the
  desired one, i.e. the kernel of any linear representation of $G$ contains
  $Ker Phi$.

  Let $R: G -> GL(W)$ be an arbitrary linear representation of $G$. The tangent
  representation $d R: frak(g) -> frak(g l)(W)$ extends to a complex
  representation $(d R)(CC): frak(g)(CC) -> frak(g l)(W(CC))$. By
  Theorem~@th:homomorphism-existence-simply-connected there exists a
  representation $tilde(R): H -> GL(W(CC))$ such that $d tilde(R) = (d R)(CC)$.
  Since $tilde(G)$ is connected,
  Theorem~@th:homomorphism-determined-by-differential implies that
  $R pi = tilde(R) j$. Hence, $tilde(R)(j(Gamma)) = {e}$ so that
  $tilde(R) = tilde(tilde(R)) tilde(pi)$, where $tilde(tilde(R))$ is a
  representation of $H\/j(Gamma)$. Therefore
  $R pi = tilde(tilde(R)) tilde(pi) j = tilde(tilde(R)) Phi pi$ and
  $R = tilde(tilde(R)) Phi$. It follows that $Ker Phi subset Ker R$.]

Notice that the proof of Theorem~@th:linearizer-discrete-central gives a method
of finding linearizer $Lambda(G)$: it coincides with $Ker Phi$ from
@eq:linearizer-diagram. Therefore, $G_"lin" tilde.eq Phi(G)$.

_Example._ Let $G = tilde(SL)_2 (RR)$ (see
Example~@exm:sl2r-cover-not-real-form[] of @ss:real-structures-and-forms[°]).
Then $H = SL_2 (CC)$ and $Lambda(G) = Ker j$. Clearly, $j$ is the covering
$G -> SL_2 (RR) subset SL_2 (CC)$. Since $Z(SL_2 (RR)) tilde.eq ZZ_2$ and
$Z(G) tilde.eq ZZ$ (see Remark 4 of @ss:cartan-decomposition-lie-group), we have
$Lambda(G) = 2 Z(G) tilde.eq ZZ$. Furthermore, $G_"lin" tilde.eq SL_2 (RR)$.

Now, we will express the linearizer $Lambda(G)$ in terms of the characteristic
lattice of $G$. Suppose, as in @ss:real-semisimple-group-classification, that we
are given a Cartan decomposition $frak(g) = frak(k) plus.o frak(p)$. Let
$frak(a)$ be a maximal commutative subalgebra of $frak(k)$,
$frak(t) = frak(a)(CC) subset frak(k)(CC)$, $frak(h)$ a maximal diagonalizable
subalgebra of $frak(g)(CC)$ containing $frak(t)$.

#theorem[For any connected Lie group $G$ with tangent algebra $frak(g)$ we have
  $ cal(E)^(-1) (Lambda(G)) = L(G) + (Q^or inter frak(t)) $
  where $Q^or$ is the dual root lattice of the Lie algebra $frak(g)(CC)$ with
  respect to $frak(h)$. Therefore
  $ Lambda(G) tilde.eq (Q^or inter frak(t))\/(Q^or inter L(G)). $
  In particular, for a simply connected group $G = tilde(G)$ we have
  $
    cal(E)^(-1) (Lambda(tilde(G))) = Q^or inter frak(t), wide
    Lambda(tilde(G)) tilde.eq (Q^or inter frak(t))\/Q^or (frak(k)(CC)').
  $] <th:linearizer-via-characteristic-lattice>

#problem[Prove this theorem.] <pr:prove-linearizer-via-characteristic-lattice>

#exercises[
  In exercises 1--4 some Cartan decomposition $frak(g) = frak(k) plus.o frak(p)$
  of a real semisimple Lie algebra $frak(g)$ is fixed.

  #exercise[If $frak(g)$ is simple then the adjoint linear representation of
    $frak(k)$ in $frak(p)$ is irreducible and $frak(k)$ is a maximal subalgebra
    of $frak(g)$.] <exc:cartan-subspace-irreducible>

  #exercise[If $frak(g)$ contains no non-zero compact ideals, then
    $[frak(p), frak(p)] = frak(k)$ and the adjoint representation of $frak(k)$
    in $frak(p)$ is faithful.] <exc:cartan-subspace-brackets-span-k>

  #exercise[#source(281)In $frak(p)$, no one-dimensional $ad frak(k)$-invariant
    subspaces exist. In particular, $dim frak(p) >= 2$ if $frak(g)$ is
    non-compact.] <exc:cartan-subspace-no-invariant-lines>

  #exercise[$frak(k)$ coincides with its normalizer in
    $frak(g)$.] <exc:k-self-normalizing-subalgebra>

  In exercises 5--7 a Cartan decomposition $G = K P$ of a semisimple Lie group
  $G$ is fixed.

  #exercise[The formula $T_g (x) = g x Theta(g)^(-1)$ ($g, x in G$) defines a
    $G$-action on $G$. The orbit of $e$ under this action is $P$ and the
    stabilizer of $e$ is $K$. Therefore $P$ is a homogeneous space of $G$
    isomorphic to $G\/K$.] <exc:twisted-conjugation-orbit-p>

  #exercise[$P$ is the connected component of unit in each of the sets
    ${g in G: Theta(g) = g^(-1)}$, ${g in G: Ad g in P(frak(g))}$.]
  <exc:p-identity-component-characterization>

  #exercise[If $g in G$, $a in K$ are such that $g a g^(-1) in K$ then in the
    decomposition $g = k p$, where $k in K$, $p in P$, the factor $p$ satisfies
    $p a = a p$.] <exc:cartan-positive-factor-commutes>

  #exercise[The polar decomposition $G = K P$ of a real semisimple algebraic
    linear group (see Exercise~@exc:reductive-real-form-self-adjoint) is a
    Cartan one. If $H$ is an open subgroup of $G$ then its Cartan decomposition
    is of the form
    $H = (K inter H)(P inter H)$.] <exc:polar-is-cartan-decomposition>

  #exercise[The maximal compact subgroups of an irreducible reductive algebraic
    real linear group $G$ are conjugate with respect to automorphisms of the
    form $a(g)$, where $g in G^0$.] <exc:reductive-maximal-compact-conjugate>

  #exercise[Let $G$ be a semisimple Lie group, $H$ its semisimple Lie subgroup
    with a finite number of connected components. Then there exists a Cartan
    decomposition $G = K P$ such that $H = (H inter K)(H inter P)$. This
    decomposition of $H$ is a Cartan
    one.] <exc:compatible-cartan-decomposition-subgroup>

  #exercise[Let $G$ be a connected Lie group, $H$ its connected normal subgroup
    and $dim G\/H = 1$. Then there exists a Lie subgroup $C subset G$ such that
    $G = H times.r C$. (Hint: reduce the general case to the cases of a solvable
    and of a semisimple group $H$. In the solvable case see
    Exercise~@exc:codimension-one-normal-complement. In the semisimple case make
    use of the fact that $Z(H)$ is contained in a pseudotorus (see
    Problem~@pr:center-fundamental-group-lattices).)]
  <exc:codimension-one-normal-splits>
]

#hints[
  #hint[@pr:cartan-compact-form-correspondence][To prove the converse statement
    make use of Problem~@pr:compact-algebra-killing-form-negative.]

  #hint[@pr:cartan-k-theta-fixed-points][Make use of
    Problem~@pr:ad-symmetric-on-cartan-subspace.]

  #hint[@pr:cartan-k-normalizer-of-k0][If $k in N(K^0)$ then the automorphism
    $Ad k$ preserves the decomposition~@eq:cartan-decomposition-algebra and
    therefore commutes with $theta$. Next, make use of
    Problem~@pr:automorphism-group-self-adjoint.]

  #hint[@pr:cartan-identity-component][The decomposition $G^0 = (G^0 inter K) P$
    implies that $G^0 inter K$ is connected and therefore coincides with $K^0$.]

  #hint[@pr:cartan-k-compactness-criterion][Notice that the group
    $Ad K^0 = Ad(G^0 inter K) = (Int frak(g)) inter upright(O)(frak(g))$ is
    compact and make use of Corollaries~@cor:cartan-identity-component and
    @cor:group-center-in-k-center of Theorem~@th:cartan-decomposition-group.]

  #hint[@pr:cartan-k-maximal-pseudocompact][First prove that
    $Ad K = (Ad G) inter upright(O)(frak(g))$ is a maximal compact subgroup of
    $Ad G$, making use of Corollary~@cor:self-adjoint-k-maximal-compact of
    Theorem~@th:self-adjoint-group-polar-decomposition and
    Problem~@pr:automorphism-group-self-adjoint.]

  #hint[@pr:maximal-compact-subgroups-conjugate][
    Theorems~@th:pseudocompact-conjugate-into-k and
    @th:maximal-compact-conjugacy-semidirect imply that for any compact subgroup
    $M subset G$ there exists $g in G^0$ such that $g M g^(-1) subset L$. If
    $L subset L_1$, where $L_1$ is a compact subgroup of $G$, then applying this
    statement to $L_1$ we get $g L_1 g^(-1) subset L$ for some $g in G^0$.
    Therefore $g L g^(-1) subset g L_1 g^(-1) subset L$ implying
    $g L g^(-1) = L$, since $L$ is a compact #source(282)Lie group. Therefore
    $L = L_1$. If $M$ is a maximal compact subgroup then obviously
    $g M g^(-1) = L$.]

  #hint[@pr:invariant-cartan-decomposition][Fix a Cartan decomposition
    $frak(g) = frak(k) plus.o frak(p)$ of $frak(g)$ and consider the
    corresponding Cartan decomposition $Aut frak(g) = K P$ of the group
    $Aut frak(g)$. If $a in Aut frak(g)$ is an element such that
    $a M a^(-1) subset K$ then the Cartan decomposition
    $frak(g) = a^(-1) (frak(k)) plus.o a^(-1) (frak(p))$ is $M$-invariant.]

  #hint[@pr:trace-ratio-strict-convexity][In $bold(E)$, choose an orthonormal
    basis, such that $log X = diag(lambda_1, ..., lambda_n)$ for
    $lambda_i in RR$. Then by
    @eq:trace-ratio-diagonal-formula
    $
      f_(X, Y) (t) = sum_(1 <= i <= n) e^(t lambda_i) y_(i i) wide "where"
      wide y_(i i) > 0.
    $
    Therefore $f_(X, Y)$ is strictly convex. The strict convexity of $phi_X$
    follows from the equality $phi_X (t) = max_(Y in Omega) f_(X, Y) (t)$.]

  #hint[@pr:positive-part-orbit-of-identity][By
    Problem~@pr:center-orthogonal-to-derived $Ad G^0 subset SL(frak(g))$, whence
    $hat(P) subset S P(frak(g))$. Lemma~@lem:polar-map-gl-diffeomorphism implies
    that $hat(P)$ is closed in $P(frak(g))$. By
    Problem~@pr:automorphism-group-self-adjoint and
    Corollary~@cor:adjoint-diffeomorphism-on-p of
    Theorem~@th:cartan-decomposition-group the action $(Sq)(Ad)$ transforms
    $hat(P)$ into itself. Since any $Y = exp ad y$, where $y in frak(p)$,
    presents in the form $Y = (Ad exp(y\/2))^2 = Sq(Ad exp(y\/2))(E)$, then
    $hat(P)$ coincides with the orbit of $E$.]

  #hint[@pr:canonically-embedded-is-reductive][Verify that the Cartan scalar
    product in $frak(g)(CC)$ is non-degenerate on $frak(h)(CC)$ if $frak(h)$ is
    canonically embedded and make use of
    Theorem~@th:reductive-iff-trace-form-nondegenerate.]

  #hint[@pr:prove-reductive-subalgebra-canonical-embedding][Apply
    Lemma~@lem:compact-structure-preserving-subalgebra to $frak(h)(CC)$ and the
    real structure $sigma: z |-> overline(z)$ on $frak(g)(CC)$. The subalgebra
    $frak(h)$ is canonically embedded in $frak(g)$ with respect to the Cartan
    decomposition
    $frak(g) = (frak(g) inter frak(u)) plus.o (frak(g) inter i frak(u))$, where
    $frak(u) = frak(g)(CC)^tau$.]

  #hint[@pr:maximal-pseudotori-conjugate][
    Theorem~@th:compact-algebra-maximal-commutative implies that if $A$ is a
    maximal connected commutative subgroup of $K$ then $Ad A$ is a maximal torus
    in the compact Lie group $Ad K$, whence $A$ is a pseudotorus in $G$. This
    makes it obvious that a maximal pseudotorus belonging to $K$ is a maximal
    connected commutative subgroup of $K$. The conjugacy follows from
    Theorems~@th:pseudocompact-conjugate-into-k and
    @th:compact-algebra-maximal-commutative.]

  #hint[@pr:characteristic-lattice-coverings][Let $A_j = exp_(G_j) (frak(a))$.
    If there exists a covering $pi: G_1 -> G_2$ such that $d pi = id$ then we
    have the commuting diagram
    $
      #cd(
        (
          a: (1, 0, $i frak(a)$),
          A: (0, 1, $A_1 subset G_1$),
          B: (2, 1, $A_2 subset G_2.$),
        ),
        (
          ar("a", "A", label: $cal(E)_(G_1)$),
          ar("a", "B", label: $cal(E)_(G_2)$, side: "right"),
          ar("A", "B", label: $pi$),
        ),
        column: 24mm,
        row: 11mm,
      )
    $ <eq:characteristic-lattice-covering-diagram>
    Corollary~@cor:group-center-in-k-center of
    Theorem~@th:cartan-decomposition-group and
    Theorem~@th:compact-algebra-maximal-commutative imply that
    $Ker pi subset A_1$. Therefore
    $L(G_2) = cal(E)_(G_1)^(-1) (Ker pi) supset L(G_1)$. To prove the existence
    of $pi$ provided $L(G_1) subset L(G_2)$, consider a simply connected group
    $tilde(G)$ covering $G_1$ and $G_2$ and prove that the kernel of the
    covering $tilde(G) -> G_1$ is contained in the kernel of the covering
    $tilde(G) -> G_2$.]

  #hint[@pr:center-fundamental-group-lattices][Make use of
    Problem~@pr:characteristic-lattice-coverings.]

  #hint[@pr:intermediate-lattice-is-characteristic][Let $tilde(G)$ be a simply
    connected Lie group with the tangent algebra $frak(g)$.
    Problem~@pr:center-fundamental-group-lattices implies that
    $N = cal(E)_(tilde(G)) (L)$ is a subgroup of $Z(tilde(G))$ and
    $L = cal(E)_(tilde(G))^(-1) (N)$. Verify that $L = L(G)$ for
    $G = tilde(G)\/N$.]

  #hint[@pr:simply-connected-characteristic-lattice][#source(283)If $G$ is
    simply connected then so is $K$
    (Corollary~@cor:cartan-decomposition-topology of
    Theorem~@th:cartan-decomposition-group). Making use of
    Theorem~@th:simply-connected-iff-weight-lattice we deduce that
    $L(G) = Q^or (frak(k)(CC)')$.]

  #hint[@pr:adjoint-lattice-coweight-intersection][Use
    Theorem~@th:center-via-character-lattice.]

  #hint[@pr:adjoint-lattice-diagram-fixed-algebra][Apply
    Problems~@pr:adjoint-lattice-coweight-intersection and
    @pr:diagram-fixed-subalgebra-semisimple.]

  #hint[@pr:prove-linearizer-via-characteristic-lattice][Let
    $A = exp_G frak(a)$, $tilde(A) = exp_(tilde(G)) frak(a)$. Consider the
    commutative diagram which follows from @eq:linearizer-diagram and
    @eq:characteristic-lattice-covering-diagram:
    $
      #cd(
        (
          a: (1, 0, $i frak(a)$),
          A: (0, 1, $tilde(A) subset tilde(G)$),
          H: (0, 2.7, $H$),
          B: (2, 1, $A subset G$),
          Q: (2, 2.7, $H\/j(Gamma)$),
        ),
        (
          ar("a", "A", label: $cal(E)_(tilde(G))$),
          ar("a", "B", label: $cal(E)_G$, side: "right"),
          ar("a", "H", label: $exp_H$, side: "right", end: "south-west"),
          ar("A", "H", label: $j$),
          ar("A", "B", label: $pi$),
          ar("H", "Q", label: $tilde(pi)$),
          ar("B", "Q", label: $Phi$),
        ),
        column: 24mm,
        row: 13mm,
      )
    $
    It implies that
    $
      exp_G^(-1) (Ker Phi) & = exp_(tilde(G))^(-1) (j^(-1) (j(Gamma))) \
                           & = exp_(tilde(G))^(-1) (Gamma Ker j) \
                           & = exp_(tilde(G))^(-1) (Gamma)
                             + exp_(tilde(G))^(-1) (Ker j) \
                           & = Ker exp_G + Ker exp_H \
                           & = L(G) + Ker exp_H.
    $
    Theorem~@th:simply-connected-iff-weight-lattice implies that
    $Ker exp_H = 2 pi i (Q^or inter frak(t))$.]
]
