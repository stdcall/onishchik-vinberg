// Chapter 4, § 1. Preliminaries. Printed pages 136-152; § 2 begins at the
// top of page 153.
#import "main-defs.typ": *
#import "statements.typ": *

== Preliminaries <sec:semisimple-preliminaries>

=== Invariant Scalar Products <ss:invariant-scalar-products>
Let $G$ be a Lie group (real or complex). A bilinear function $b$ on the tangent
algebra $frak(g)$ of $G$ is said to be #idx(
  "bilinear function",
  "invariant",
)_invariant_ if it is invariant with respect to $Ad G$, i.e. if
$ b((Ad g) x, (Ad g) y) = b(x, y) $
for any $g in G$, $x$, $y in frak(g)$.

#problem[An invariant bilinear function $b$ on $frak(g)$ satisfies
  $ b([x, y], z) + b(y, [x, z]) = 0 $ <eq:ad-invariant-bilinear-form>
  for any $x$, $y$, $z in frak(g)$. If $G$ is connected then the converse
  statement holds: any bilinear function $b$ on $frak(g)$ satisfying
  @eq:ad-invariant-bilinear-form is
  invariant.] <pr:invariant-form-infinitesimal>

Now let $frak(g)$ be a Lie algebra over an arbitrary field $K$. A bilinear
function $b$ on $frak(g)$ satisfying @eq:ad-invariant-bilinear-form is called
_invariant._ If, in addition, $b$ is symmetric we will call $b$ an #idx(
  "product",
  "scalar",
  "invariant",
)_invariant scalar product on_ $frak(g)$.

_Examples._ #eg <exm:cross-product-invariant-form> Let $E$ be the
three-dimensional Euclidean space with the scalar product $(dot, dot)$. Fixing
an orientation on $E$ we make $E$ into a Lie algebra over $RR$ with respect to
the vector product, and the scalar product $(dot, dot)$ is invariant.

#eg <exm:trace-form-on-gl> In $frak(g l)(V)$, there is the canonical invariant
scalar product
$ (X, Y) = tr X Y. $ <eq:trace-form>

#eg <exm:trace-form-and-killing-form> #source(152)Let $frak(g)$ be an arbitrary
Lie algebra, $rho: frak(g) -> frak(g l)(V)$ its linear representation. Then the
bilinear function
$ (x, y)_rho = (rho(x), rho(y)) = tr(rho(x) rho(y)) $
is an invariant scalar product on $frak(g)$. In particular, on any Lie algebra
$frak(g)$ the invariant scalar product
$ (x, y)_ad = tr((ad x)(ad y)) $
is defined; it is called the #idx("Cartan scalar product")_Cartan scalar
product_ (or the #idx("Killing bilinear function")_Killing bilinear function_).
It is not difficult to verify that this scalar product is invariant with respect
to all the automorphisms $alpha$ of $frak(g)$:
$ (alpha(x), alpha(y))_ad = (x, y)_ad. $

Let $(dot, dot)$ be an invariant scalar product on a Lie algebra $frak(g)$. For
any subspace $frak(a) subset frak(g)$ the orthogonal complement is defined:
$ frak(a)^perp = {x in frak(g): (x, y) = 0 "for all" y in frak(a)}. $

#problem[If $frak(a)$ is an ideal of $frak(g)$, then so is
  $frak(a)^perp$.] <pr:orthogonal-of-ideal-is-ideal>

Let $V$ be a vector space over $K$ and $frak(g)$ a subalgebra of $frak(g l)(V)$.
The embedding $frak(g) -> frak(g l)(V)$ defines an invariant scalar product
$(dot, dot)$ on $frak(g)$ (see Example~@exm:trace-form-and-killing-form); it is
defined by @eq:trace-form. We wish to specify (for $K = CC$) those algebraic
linear Lie algebras for which this scalar product is nondegenerate.

A complex linear Lie algebra $frak(t)$ is called #idx(
  "Lie algebra",
  "linear",
  "diagonalizable",
)_diagonalizable_ if it is commutative and all its elements are semisimple.

#problem[A complex algebraic linear Lie algebra is diagonalizable if and only if
  it is the tangent algebra of a torus.] <pr:diagonalizable-iff-torus-algebra>

#problem[Let $frak(t)$ be a diagonalizable complex algebraic linear Lie algebra.
  Then the scalar product~@eq:trace-form is nondegenerate on $frak(t)$ and
  positive definite on the real form $frak(t)(RR)$ (see
  @ss:rational-structure-torus-algebra[°]).] <pr:trace-form-positive-on-torus>

#problem[Let $frak(n)$ be a complex linear Lie algebra, on which the scalar
  product~@eq:trace-form vanishes identically. If $frak(n)$ is algebraic then it
  is unipotent; in general case it is
  solvable.] <pr:vanishing-trace-form-solvable>

#problem[If $frak(n)$ is a unipotent ideal of a linear Lie algebra $frak(g)$
  then $(frak(n), frak(g)) = 0$.] <pr:unipotent-ideal-orthogonal>

#problem[Let $K = CC$ or $RR$ and let $frak(g)$ be a semisimple linear Lie
  algebra. Then the scalar product~@eq:trace-form is nondegenerate on
  $frak(g)$.] <pr:semisimple-trace-form-nondegenerate>

Notice that any semisimple Lie algebra admits a faithful linear representation,
e.g. the adjoint one. Therefore it may always be assumed linear.
Problem~@pr:semisimple-trace-form-nondegenerate implies

#theorem[#source(153)Any semisimple Lie algebra $frak(g)$ over $CC$ or $RR$
  possesses a nondegenerate invariant scalar product. In particular, the Cartan
  scalar product on $frak(g)$ is
  nondegenerate.] <th:semisimple-killing-nondegenerate>

#problem[If there is an invariant scalar product on a Lie algebra $frak(g)$ then
  the center $frak(z)(frak(g))$ is contained in $frak(g)'^perp$. If this scalar
  product is nondegenerate then
  $frak(z)(frak(g)) = frak(g)'^perp$.] <pr:center-orthogonal-to-derived>

#problem[A semisimple Lie algebra (complex or real) coincides with its derived
  algebra. Any semisimple linear Lie algebra $frak(g) subset frak(g l)(V)$ is
  contained in the subalgebra $frak(s l)(V)$ of traceless
  operators.] <pr:semisimple-equals-derived-algebra>

A complex linear Lie algebra $frak(g)$ is called #idx(
  "Lie algebra",
  "linear",
  "reductive",
)_reductive_ if $frak(g) = frak(z) plus.o frak(g)_1$ where $frak(z)$ is a
diagonalizable and $frak(g)_1$ is a semisimple ideal of $frak(g)$. Clearly,
$frak(z)$ coincides with $frak(z)(frak(g))$ and also with $rad frak(g)$. By
Problem~@pr:semisimple-equals-derived-algebra $frak(g)_1$ coincides with the
derived algebra $frak(g)'$ of $frak(g)$.
Problems~@pr:trace-form-positive-on-torus,
@pr:semisimple-trace-form-nondegenerate and @pr:center-orthogonal-to-derived
imply that the scalar product~@eq:trace-form is nondegenerate on any reductive
algebraic linear Lie algebra.

Now let $frak(g)$ be an algebraic linear Lie algebra over $CC$ such that the
scalar product~@eq:trace-form is nondegenerate on it.

#problem[The center $frak(z)(frak(g))$ of $frak(g)$ is algebraic and consists of
  semisimple elements.] <pr:center-algebraic-and-semisimple>

Problems~@pr:center-algebraic-and-semisimple, @pr:trace-form-positive-on-torus
and @pr:center-orthogonal-to-derived imply that
$frak(g) = frak(z)(frak(g)) plus.o frak(g)'$.

#problem[$frak(g)'$ is semisimple.] <pr:nondegenerate-trace-derived-semisimple>

Thus we have proved

#theorem[Let $frak(g) subset frak(g l)(V)$ be an algebraic linear Lie algebra
  over $CC$. The following conditions are equivalent:

  1) $frak(g)$ is a reductive algebraic linear Lie algebra;

  2) the scalar product~@eq:trace-form is nondegenerate on
  $frak(g)$.] <th:reductive-iff-trace-form-nondegenerate>

=== Algebraicity <ss:algebraicity-of-semisimple>
Let $frak(g) subset frak(g l)(V)$ be a semisimple linear Lie algebra over
$K = CC$ or $RR$. By Problem~@pr:center-orthogonal-to-derived and
Corollary~@cor:derived-subalgebra-algebraic of
Theorem~@th:algebraic-closure-same-derived (valid also over $RR$ as had been
mentioned in @ss:tangent-algebra-real-algebraic-group) $frak(g)$ is an algebraic
Lie algebra. This means that there exists an irreducible algebraic subgroup
$G subset GL(V)$ with the tangent algebra $frak(g)$. For $K = CC$ this subgroup
is connected (see Theorem~@th:irreducible-complex-group-connected).

#problem[Any connected semisimple virtual Lie subgroup $G subset GL(V)$ is a Lie
  subgroup, which is algebraic if $K = CC$ or which is the identity component of
  an irreducible algebraic linear group if
  $K = RR$.] <pr:semisimple-virtual-subgroup-algebraic>

A complex algebraic linear Lie group $G$ is called #idx(
  "algebraic group",
  "linear",
  "reductive",
)_reductive_ if its tangent algebra $frak(g)$ is reductive.
Problem~@pr:representation-semisimple-nilpotent implies that this property of
$G$ does not depend on its representation as a linear group, so the notion of
#idx(
  "algebraic group",
  "reductive",
)_reductive complex algebraic group_ is well-defined. Any semisimple complex
algebraic group is reductive. A reductive algebraic group $G$ is semisimple if
and only if $frak(z)(frak(g)) = 0$.

Theorem~@th:reductive-iff-trace-form-nondegenerate implies that a complex
algebraic linear group is reductive if and only if the scalar
product~@eq:trace-form is nondegenerate on its tangent algebra.

#problem[#source(154)The classical complex linear groups $SL_n (CC)$ ($n >= 2$),
  $SO_n (CC)$ ($n >= 3$), $Sp_n (CC)$ ($n >= 2$) are semisimple and $GL_n (CC)$
  is reductive. All these groups are
  irreducible.] <pr:classical-groups-semisimple>

_Example._ Consider the real algebraic group $SO_(k, l)$, where $k$, $l > 0$,
$k + l = n$, consisting of unimodular matrices corresponding to linear operators
preserving a nondegenerate quadratic form $q$ of signature $(k, l)$. The group
$SO_(k, l) (CC)$ is the group of unimodular complex matrices whose corresponding
operators preserve $q$. Since all nondegenerate quadratic forms in $CC^n$ are
equivalent, $SO_(k, l) (CC)$ is isomorphic to $SO_n (CC)$. Therefore $SO_(k, l)$
is an irreducible semisimple algebraic group. At the same time it is not
connected (see Problem~@pr:pseudoorthogonal-leading-minor-nonzero).

Problem~@pr:semisimple-equals-derived-algebra and
Theorem~@th:commutator-subgroup-tangent-algebra imply that a connected
semisimple Lie group coincides with its commutator group. Therefore (see
Theorem~@th:perfect-group-homomorphisms-polynomial) any differentiable
representation of a connected semisimple complex algebraic group $G$ is
polynomial. By Theorem~@th:perfect-lie-group-algebraic-structure the algebraic
structure on $G$ is unique. (Actually these statements are also true for
arbitrary reductive algebraic groups over $CC$, see
Exercise~@exc:reductive-algebraic-structure-unique). In
§~@sec:existence-uniqueness-theorems we will show that any connected semisimple
complex Lie group admits the structure of an algebraic group.

Let $frak(g)$ be the tangent algebra of an algebraic group $G$ over $CC$. Any
commutative subalgebra of $frak(g)$ consisting of semisimple elements is called
#idx("subalgebra", "diagonalizable")_diagonalizable._

#problem[An algebraic subalgebra $frak(t) subset frak(g)$ is diagonalizable if
  and only if it is the tangent algebra of a torus $T subset G$. The maximal
  diagonalizable subalgebras are algebraic and correspond to maximal tori of
  $G$. If a maximal diagonalizable subalgebra $frak(t)$ is zero then $G^0$ is
  unipotent.] <pr:maximal-diagonalizable-and-maximal-tori>

Two subalgebras of a Lie algebra $frak(g)$ are #idx(
  "conjugate subalgebras",
)_conjugate_ if they are transformed into each other by an automorphism from
$Int frak(g)$. Problems~@pr:maximal-diagonalizable-and-maximal-tori and
@pr:algebraic-maximal-tori-conjugate imply that all maximal diagonalizable
subalgebras of the tangent algebra of a complex algebraic group are conjugate.

The #idx("rank of a reductive group")_rank of a reductive algebraic group $G$_
(or of its #idx("rank of a Lie algebra")_tangent algebra_ $frak(g)$) is the
dimension of a maximal torus of $G$ (or of a maximal diagonalizable subalgebra
of $frak(g)$) and is denoted by $rk G = rk frak(g)$.

=== Normal Subgroups <ss:normal-subgroups-of-semisimple>
We assume that the ground field $K$ is either $CC$ or $RR$. If $frak(g)$ is
#idx("Lie algebra", "simple")_simple_, i.e. has no proper ideals, then either
$frak(g)$ is noncommutative or $frak(g)$ is a one-dimensional commutative Lie
algebra. Clearly, a noncommutative simple Lie algebra is semisimple.

Let $frak(g)$ be a semisimple Lie algebra; we may consider it as a subalgebra of
$frak(g l)(V)$, where $V$ is a vector space over $K$.

#problem[On any ideal $frak(a)$ of $frak(g)$ the scalar product~@eq:trace-form
  is nondegenerate and $frak(g) = frak(a) plus.o frak(a)^perp$. If $frak(b)$ is
  an ideal of $frak(a)$, then $frak(b)$ is also an ideal of
  $frak(g)$.] <pr:semisimple-ideal-direct-summand>

#problem[If $frak(a)$ is an ideal of $frak(g)$, then $frak(a)$ and
  $frak(g)\/frak(a)$ are semisimple.] <pr:ideals-quotients-semisimple>

#problem[$frak(g)$ splits into the orthogonal direct sum of noncommutative
  simple ideals $frak(g)_i$, and any ideal of $frak(g)$ is the sum of some of
  $frak(g)_i$'s.] <pr:orthogonal-sum-of-simple-ideals>

Problems~@pr:semisimple-ideal-direct-summand and
@pr:orthogonal-sum-of-simple-ideals imply

#theorem[#source(155)A semisimple Lie algebra splits uniquely into the direct
  sum of noncommutative simple ideals.] <th:semisimple-sum-of-simple-ideals>

The converse statement is also true:

#problem[If a Lie algebra $frak(g)$ splits into the direct sum of noncommutative
  simple ideals then $frak(g)$ is semisimple.] <pr:sum-of-simple-is-semisimple>

Now let us prove the corresponding results for Lie and algebraic groups.

A Lie group (in particular an algebraic group) is called #idx(
  "Lie group",
  "simple",
)_simple_ if its tangent algebra is simple. By
Problem~@pr:normal-subgroup-iff-ideal and
Theorem~@th:subalgebra-has-virtual-subgroup, a connected Lie group $G$ is simple
if and only if $G$ has no connected normal virtual Lie subgroups, not coinciding
with ${e}$ or $G$.

#problem[A connected simple Lie group or an irreducible simple algebraic group
  is either noncommutative and semisimple or commutative and
  one-dimensional.] <pr:simple-group-semisimple-or-abelian>

#problem[A connected complex algebraic group $G$ is simple if and only if it
  does not contain proper connected normal algebraic
  subgroups.] <pr:simple-algebraic-group-criterion>

Let $G$ be a Lie group, $G_1$, ..., $G_s$ its normal Lie subgroups. We say that
$G$ locally splits into the direct product of subgroups $G_i$'s if
$G = G_1 dots G_s$ and all the intersections
$G_i inter (G_1 dots G_(i-1) G_(i+1) dots G_s)$ ($i = 1, ..., s$) are discrete.

#problem[A connected Lie group $G$ locally splits into the direct product of
  connected normal Lie groups $G_i$, $i = 1, ..., s$, if and only if its tangent
  algebra $frak(g)$ splits into the direct sum
  $frak(g) = frak(g)_1 plus.o dots.c plus.o frak(g)_s$, where $frak(g)_i$ is the
  ideal tangent to $G_i$.] <pr:local-direct-product-criterion>

Theorem~@th:semisimple-sum-of-simple-ideals and
Problems~@pr:local-direct-product-criterion, @pr:sum-of-simple-is-semisimple
imply

#theorem[A connected semisimple Lie group $G$ locally splits into the direct
  product of connected noncommutative simple normal Lie subgroups
  $G = G_1 dots G_s$. Given such a decomposition, any normal Lie subgroup of $G$
  is a product of some of $G_i$'s. Any Lie group that locally splits into the
  direct product of noncommutative simple normal Lie subgroups is
  semisimple.] <th:semisimple-group-local-direct-product>

#problem[A connected complex algebraic group $G$ is reductive if and only if it
  locally splits into the direct product $G = Z G_1$, where $Z$ is a torus and
  $G_1$ is a semisimple normal subgroup. In this case $Z$ coincides with
  $Z(G)^0$ and with $Rad G$, whereas $G_1$ coincides with the commutator group
  of $G$. A homomorphic image of a reductive group is a reductive
  group.] <pr:reductive-group-local-splitting>

=== Weight and Root Decompositions <ss:weight-and-root-decompositions>
From now on and till the end of the section we will assume that the ground field
is $CC$. Algebraic tori will be briefly called tori.

Let $T$ be a nontrivial torus, $frak(t)$ its tangent algebra. As follows from
Problem~@pr:character-differentials-basis the correspondence
$lambda |-> d lambda$ is an injective homomorphism of the group of characters of
$T$ into $frak(t)^*$ sending any basis of the group $cal(X)(T)$ into a basis of
the space $frak(t)(RR)^*$, where $frak(t)(RR)$ is the real form of $frak(t)$
defined in @ss:rational-structure-torus-algebra[°]. It will be convenient for us
to identify the characters $lambda in cal(X)(T)$ with their differentials. Then
$cal(X)(T)$ is #source(156)identified with the discrete subgroup of the space
$frak(t)(RR)^*$ generated by a basis of this space.

We may assume that the group $T$ is linear. By
Problem~@pr:trace-form-positive-on-torus the space $frak(t)(RR)$ is a Euclidean
one with respect to the scalar product~@eq:trace-form. Consider the canonical
isomorphism $lambda |-> u_lambda$ of $frak(t)^*$ onto $frak(t)$ defined by the
formula
$ (u_lambda, x) = lambda(x) quad (x in frak(t)) $ <eq:u-lambda-definition>
which maps $frak(t)(RR)^*$ onto $frak(t)(RR)$. With this isomorphism we may
translate the Euclidean space structure from $frak(t)(RR)$ into $frak(t)(RR)^*$
setting
$
  (lambda, mu) = (u_lambda, u_mu) = lambda(u_mu) = mu(u_lambda) quad
  (lambda, mu in frak(t)(RR)^*).
$ <eq:dual-scalar-product>
For any nonzero $lambda in frak(t)(RR)^*$ choose an element $h_lambda$ on the
line $CC u_lambda subset frak(t)$, such that $lambda(h_lambda) = 2$. Clearly,
$h_lambda$ is uniquely defined, belongs to $frak(t)(RR)$ and is of the form
$ h_lambda = 2 u_lambda \/(lambda, lambda) $ <eq:coroot-h-lambda>
For any $mu in frak(t)^*$ we have
$ mu(h_lambda) = 2(mu, lambda)\/(lambda, lambda) $ <eq:weight-value-on-coroot>

Now let $G$ be an algebraic linear group containing a torus $T$ and let
$R: G -> GL(V)$ be a polynomial linear representation. By
Theorem~@th:quasitorus-diagonalizable all the operators of $R(T)$ are expressed
in some basis by diagonal matrices. This means that
$
  V = plus.o.big_(lambda in Phi_R) V_lambda,
$ <eq:weight-decomposition-group-rep>
where $Phi_R subset cal(X)(T)$ is the system of weights of the restriction
$R|T$. The elements of the system $Phi_R$ will be called the #idx(
  "weight of a representation",
)_weights of the representation $R$_ with respect to $T$ and the
decomposition~@eq:weight-decomposition-group-rep the #idx(
  "weight decomposition",
)_weight decomposition_ with respect to $T$. Sometimes we write $Phi_R$ instead
of $Phi_R (T)$.

#problem[The system $Phi_R$ spans the subspace
  ${lambda in frak(t)(RR)^*: lambda(x) = 0
    "for all" x in frak(t) inter Ker d R}$
  in $frak(t)(RR)^*$. In particular, if $d R$ is faithful then $Phi_R$ spans
  $frak(t)(RR)^*$.] <pr:span-of-weight-system>

Now take for $R$ the adjoint representation $Ad$ of $G$ in its tangent algebra.
For any $lambda in Phi_Ad$ we have
$
  frak(g)_lambda = {x in frak(g): [h, x] = lambda(h) x
    "for all" h in frak(t)}.
$ <eq:root-subspace-definition>
In particular, $frak(g)_0$ is the centralizer of the subalgebra $frak(t)$ of
$frak(g)$ and therefore is an algebraic subalgebra containing $frak(t)$.

The nonzero weights of $Phi_Ad (T)$ are called #idx("root")_roots_ and the
weight subspaces $frak(g)_alpha$ ($alpha != 0$) #idx("root subspace")_root
subspaces_ of $frak(g)$ with respect to $T$. The root system is denoted by
$Delta(T)$ #source(157)or $Delta$, hence $Phi_Ad = Delta(T) union {0}$. The
decomposition
$ frak(g) = frak(g)_0 plus.o plus.o.big_(alpha in Delta(T)) frak(g)_alpha $
<eq:root-decomposition>
is called the #idx("root decomposition")_root decomposition_ of $frak(g)$ with
respect to $T$.

Let us study the action of automorphisms of $G$ on weights and roots. Let
$Theta in Aut G$, $theta = d Theta in Aut frak(g)$. The automorphism $Theta$
transforms $T$ into $tilde(T) = Theta(T)$. By
Problem~@pr:torus-differential-rational the isomorphism
$theta: frak(t) -> tilde(frak(t))$ maps $frak(t)(RR)$ onto $tilde(frak(t))(RR)$
and therefore induces an isomorphism
$attach(theta, tl: t): tilde(frak(t))(RR)^* -> frak(t)(RR)^*$. We have
$attach(theta, tl: t)(cal(X)(tilde(T))) = cal(X)(T)$ and under the assumed
identification of the character with its differential the obtained isomorphism
of the groups of characters is identified with the isomorphism
$lambda |-> lambda dot Theta$.

#problem[If $Theta = a(g)$, where $g in G$, then
  $attach(theta, tl: t) = attach((Ad g), tl: t)$ maps $Phi_R (tilde(T))$ onto
  $Phi_R (T)$ and we have
  $V_(attach((Ad g), tl: t)^(-1) lambda) = R(g) V_lambda$. For any
  $Theta in Aut G$ we have $attach(theta, tl: t)(Delta(tilde(T))) = Delta(T)$
  and $frak(g)_(attach(theta, tl: t)^(-1) (alpha)) = theta(frak(g)_alpha)$.]
<pr:automorphisms-act-on-weights-roots>

#problem[For any representation $R: G -> GL(V)$, any $alpha in Phi_Ad (T)$,
  $lambda in Phi_R (T)$ and any $x in frak(g)_alpha$ we have
  $
    d R(x) V_lambda cases(
      subset V_(lambda + alpha) & quad "if" lambda + alpha in Phi_R (T)",",
      = 0 & quad "otherwise"
    )
  $
  In particular, for any $alpha$, $beta in Phi_Ad (T)$
  $
    [frak(g)_alpha, frak(g)_beta] cases(
      subset frak(g)_(alpha + beta) & quad "if" alpha + beta in Phi_Ad (T),
      = 0 & quad "otherwise."
    )
  $] <pr:root-vectors-shift-weights>

Now let us investigate the behavior of the root
decomposition~@eq:root-decomposition with respect to the invariant scalar
product~@eq:trace-form.

#problem[If $alpha$, $beta in Phi_Ad (T)$ and $alpha + beta != 0$ then
  $(frak(g)_alpha, frak(g)_beta) = 0$.] <pr:root-spaces-orthogonality>

#problem[Let $G$ be a reductive algebraic group. Then the scalar
  product~@eq:trace-form is nondegenerate on $frak(g)_0$. If $alpha in Delta(T)$
  then $-alpha in Delta(T)$ and the scalar product is nondegenerate on
  $frak(g)_alpha plus.o frak(g)_(-alpha)$.] <pr:opposite-root-spaces-paired>

#problem[If $G$ is a reductive algebraic group then the subalgebra $frak(g)_0$
  is a reductive algebraic algebra. If, in particular, $T$ is a maximal torus of
  $G$ then $frak(g)_0 = frak(t)$.] <pr:zero-root-space-is-torus>

Since all maximal tori in $G$ are conjugate
(Problem~@pr:algebraic-maximal-tori-conjugate),
Problem~@pr:automorphisms-act-on-weights-roots implies that the weight system of
a representation and the root system of $G$ with respect to a maximal torus $T$
are defined uniquely up to an isomorphism of the form $attach((Ad g), tl: t)$,
where $g in G$, of the corresponding spaces $frak(t)(RR)^*$. The roots with
respect to a maximal torus $T$ are simply called the #idx("root")_roots_ of $G$;
the root system is denoted $Delta_G$ or $Delta_frak(g)$ since it is transparent
from @eq:root-subspace-definition that the root system is completely #source(
  158,
)determined by the pair $(frak(g), frak(t))$. The root subspaces with respect to
a maximal torus are simply called #idx(
  "root subspace",
)_root subspaces_ of $frak(g)$.

In the sequel we assume that $G$ is a reductive algebraic group and $T$ is its
maximal torus. The most interesting is the case when $G$ is semisimple.

Let us present $frak(g)$ in the form
$frak(g) = frak(z)(frak(g)) plus.o frak(g)'$, where $frak(g)'$ is a semisimple
ideal. Problem~@pr:zero-root-space-is-torus implies that any maximal
diagonalizable subalgebra $frak(t) subset frak(g)$ contains $frak(z)(frak(g))$
and therefore is of the form $frak(t) = frak(z)(frak(g)) plus.o frak(t)'$, where
$frak(t)' = frak(t) inter frak(g)'$ is a maximal diagonalizable subalgebra of
$frak(g)'$. Conversely, any subalgebra
$frak(t) = frak(z)(frak(g)) plus.o frak(t)'$, where
$frak(t)' = frak(t) inter frak(g)'$ is a maximal diagonalizable subalgebra of
$frak(g)'$, is a maximal diagonalizable subalgebra of $frak(g)$. Assigning to
each linear function on $frak(t)$ its restriction onto $frak(t)'$ we identify
the subspace
${lambda in frak(t)^*: lambda(x) = 0 "for all" x in frak(z)(frak(g))}$ with
$frak(t)'^*$.

#problem[The root system $Delta_frak(g)$ is identified with $Delta_(frak(g)')$
  and $Delta_frak(g) = Delta_(frak(g)')$ spans the space $frak(t)'(RR)^*$ while
  the vectors $h_alpha$ ($alpha in Delta_frak(g)$) span $frak(t)'(RR)$. The
  algebra $frak(g)$ is commutative if and only if $Delta_frak(g) = emptyset$ and
  semisimple if and only if $Delta_frak(g)$ spans
  $frak(t)(RR)^*$.] <pr:root-system-of-reductive-algebra>

#problem[For any $x in frak(g)_alpha$, $y in frak(g)_(-alpha)$, where
  $alpha in Delta_frak(g)$, we have
  $ [x, y] = (x, y) u_alpha = 1/2 (x, y)(alpha, alpha) h_alpha. $
  The subspace $[frak(g)_alpha, frak(g)_(-alpha)]$ is one-dimensional and is
  spanned by $h_alpha$.] <pr:bracket-of-opposite-root-vectors>

It is clear from Problem~@pr:bracket-of-opposite-root-vectors that the line
$CC h_alpha$ for any given $alpha in Delta_frak(g)$ is determined by the Lie
algebra structure on $frak(g)$ and does not depend on the chosen realization of
$frak(g)$ as a linear Lie algebra. The definition of $h_alpha$ implies that it
is also uniquely defined. If $frak(g)$ is semisimple then by
Problem~@pr:root-system-of-reductive-algebra the space $frak(t)(RR)$ is
generated by the elements $h_alpha$ ($alpha in Delta_frak(g)$). Therefore if
$frak(g)$ is semisimple, $frak(t)(RR)$ is completely determined by $frak(g)$.

Now let us investigate what is the root system of the direct sum
$frak(g) = frak(g)_1 plus.o frak(g)_2$, where $frak(g)_1$, $frak(g)_2$ are
semisimple Lie algebras. From Problem~@pr:zero-root-space-is-torus we easily
deduce that any maximal diagonalizable subalgebra $frak(t) subset frak(g)$ is of
the form $frak(t) = frak(t)_1 plus.o frak(t)_2$, where $frak(t)_i$, $i = 1, 2$,
is a maximal diagonalizable subalgebra of $frak(g)_i$. The converse is true
since a subalgebra $frak(t)$ of such a form coincides with its centralizer in
$frak(g)$. Let us identify in a usual way $frak(t)_1^*$ with the subspace
${lambda in frak(t)^*: lambda(x) = 0 "for all" x in frak(t)_2}$ and
$frak(t)_2^*$ with
${lambda in frak(t)^*: lambda(x) = 0 "for all" x in frak(t)_1}$. Then
$frak(t)^* = frak(t)_1^* plus.o frak(t)_2^*$ and
$frak(t)(RR)^* = frak(t)_1 (RR)^* plus.o frak(t)_2 (RR)^*$. Let $Delta_frak(g)$,
$Delta_(frak(g)_1)$, $Delta_(frak(g)_2)$ be the root systems of $frak(g)$,
$frak(g)_1$, $frak(g)_2$ with respect to $frak(t)$, $frak(t)_1$, $frak(t)_2$,
respectively.

#problem[We have $Delta_frak(g) = Delta_(frak(g)_1) union Delta_(frak(g)_2)$ and
  $(alpha, beta) = 0$ for any $alpha in Delta_(frak(g)_1)$,
  $beta in Delta_(frak(g)_2)$.] <pr:roots-of-direct-sum-algebra>

#problem[For any decomposition $Delta_frak(g) = Delta_1 union Delta_2$ of the
  root system of a semisimple Lie algebra $frak(g)$ into a union of two
  orthogonal subsystems there exist ideals $frak(g)_1$,
  $frak(g)_2 subset frak(g)$ such that $frak(g) = frak(g)_1 plus.o frak(g)_2$
  and $Delta_i = Delta_(frak(g)_i)$
  ($i = 1, 2$).] <pr:orthogonal-roots-split-algebra>

Concluding this section we generalize the notion of weight system and weight
decomposition to an arbitrary linear representation $rho$ of a semisimple Lie
algebra. We need this generalization since $rho$ need not a priori coincide with
the differential #source(159)of a linear representation of any algebraic group
whose tangent algebra is $frak(g)$. Note that this generalization does not
actually give anything new since, as we shall see in
§~@sec:existence-uniqueness-theorems, there always exists a simply connected
algebraic group $G$ with the tangent algebra $frak(g)$ and $rho$ is the
differential of a representation of $G$ by
Theorem~@th:homomorphism-existence-simply-connected.

Let $frak(g)$ be a semisimple Lie algebra, $G$ an algebraic group with $frak(g)$
as the tangent algebra. Problems~@pr:representation-semisimple-nilpotent and
@pr:locally-faithful-reflects-semisimple applied to the adjoint representation
of $G$ yield that $x in frak(g)$ is semisimple (nilpotent) if and only if so is
$ad x$ in the space $frak(g)$. Therefore we may speak about #idx(
  "Element",
  "semisimple (of an algebraic Lie algebra)",
)_semisimple_ and #idx(
  "Element",
  "nilpotent (of an algebraic Lie algebra)",
)_nilpotent_ elements of an abstract semisimple Lie algebra.

#problem[A linear representation $rho$ of a semisimple Lie algebra $frak(g)$
  maps the semisimple elements in semisimple operators and the nilpotent
  elements in nilpotent operators.] <pr:representation-preserves-jordan>

Let $rho: frak(g) -> frak(g l)(V)$ be a linear representation of a semisimple
Lie algebra $frak(g)$, $frak(t)$ a maximal diagonalizable subalgebra of
$frak(g)$. Problem~@pr:representation-preserves-jordan implies that
$rho(frak(t))$ is a commutative subalgebra of $frak(g l)(V)$ consisting of
semisimple operators. By Problem~@pr:commuting-semisimple-diagonalizable we have
$
  V = plus.o.big_(lambda in Phi_rho) V_lambda,
$ <eq:weight-decomposition-algebra-rep>
where
$ V_lambda = {u in V: rho(x) u = lambda(x) u "for all" x in frak(t)} $
and $Phi_rho subset frak(t)^*$ is the set of linear functions $lambda$, such
that $V_lambda != 0$. The elements of $Phi_rho$ are called #idx(
  "weight of a representation",
)_weights_ and the corresponding subspaces $V_lambda$ #idx(
  "weight subspace",
)_weight subspaces_ of the representation $rho$. If $rho = d R$, where $R$ is a
linear representation of $G$, then $Phi_rho$ coincides with $Phi_R$ and the
decomposition~@eq:weight-decomposition-algebra-rep with the weight
decomposition~@eq:weight-decomposition-group-rep. It is also easy to verify that
the statement of Problem~@pr:root-vectors-shift-weights holds for
@eq:weight-decomposition-algebra-rep.

In @ss:three-dimensional-subalgebras we will show that
$Phi_rho subset frak(t)(RR)^*$.

=== Root Decompositions and Root Systems of Classical Lie Algebras
<ss:roots-of-classical-lie-algebras>
In this section we will give explicitly the form of maximal diagonalizable
subalgebras $frak(t)_frak(g)$, root decompositions, roots and vectors $h_alpha$
for the classical Lie algebras $frak(g) = frak(g l)_n (CC)$, $frak(s l)_n (CC)$,
$frak(s o)_n (CC)$, $frak(s p)_(2n) (CC)$ (see
Problem~@pr:classical-groups-semisimple).

The identity, i.e. standard, representation of the corresponding classical group
is denoted by $Id$; it is convenient to express the roots by means of weights of
$Id$.

Let $T$ be the torus in $GL_n (CC)$ consisting of all invertible diagonal
matrices. It is easy to verify that $T$ coincides with its centralizer implying
that $T$ is a maximal torus of $GL_n (CC)$. Its tangent algebra
$frak(t) subset frak(g l)_n (CC)$ is the algebra of all diagonal matrices and
the real form $frak(t)(RR)$ is the algebra of all real diagonal matrices. The
scalar product~@eq:trace-form is determined in $frak(t)$ by the formula
$
  (X, Y) = sum_(1 <= i <= n) x_i y_i, quad "where" quad
  X = diag(x_1, ..., x_n), quad Y = diag(y_1, ..., y_n).
$

#source(160)The vectors $e_i$ ($i = 1, ..., n$) of the standard basis of $CC^n$
are the weight vectors for the representation $Id|T$. The corresponding weight
$epsilon_i$ (and also the element $d epsilon_i in frak(t)(RR)^*$ identified with
it) is of the form
$
  epsilon_i (diag(x_1, ..., x_n)) = x_i wide (i = 1, ..., n).
$ <eq:standard-weights-epsilon>
In what follows $epsilon_i$ also denotes the restriction of the linear
function~@eq:standard-weights-epsilon onto the maximal diagonalizable subalgebra
of a classical Lie algebra $frak(g)$.

#example[For $frak(g) = frak(g l)_n (CC)$ we have
  $
          frak(t)_frak(g) & = frak(t), \
            Delta_frak(g) & = {alpha_(i j) = epsilon_i - epsilon_j:
                              i != j, i, j = 1, ..., n}, \
    frak(g)_(alpha_(i j)) & = CC E_(i j), \
          h_(alpha_(i j)) & = diag(0, ..., 0, 1, 0, ..., 0, -1, 0, ..., 0)
  $
  with 1 (resp. $-1$) at the $i$-th ($j$-th) place.] <exm:roots-of-gl-n>

#example[For $frak(g) = frak(s l)_n (CC)$ ($n >= 2$) we have
  $
    frak(t)_frak(g) & = {x in frak(t): tr x = 0}, \
      Delta_frak(g) & = {alpha_(i j) = epsilon_i - epsilon_j:
                        i != j, i, j = 1, ..., n}.
  $
  The subspaces $frak(g)_(alpha_(i j))$ and vectors $h_(alpha_(i j))$ are the
  same as in Example~@exm:roots-of-gl-n (see
  Problem~@pr:root-system-of-reductive-algebra).

  In the simplest case $n = 2$ we have $Delta_frak(g) = {alpha, -alpha}$, where
  $alpha = alpha_12$. A basis of the Lie algebra $frak(s l)_2 (CC)$ is
  ${bold(h), bold(e), bold(f)}$, where $bold(h) = h_alpha = diag(1, -1)$,
  $bold(e) = E_12$, $bold(f) = E_21$ such that
  $
    [bold(h), bold(e)] = 2 bold(e), wide
    [bold(h), bold(f)] = -2 bold(f), wide
    [bold(e), bold(f)] = bold(h).
  $] <exm:roots-of-sl-n>

In the following two examples we consider $G = SO_n (CC)$. For our purposes it
is convenient to choose a basis in $CC^n$ so that the matrix of the
$G$-invariant quadratic form is
$
  mat(0, E_l; E_l, 0) quad (n = 2l) wide "or" wide
  mat(0, E_l, 0; E_l, 0, 0; 0, 0, 1) quad (n = 2l + 1)
$

#example[The Lie algebra $frak(g) = frak(s o)_(2l) (CC)$ ($l >= 2$) consists of
  matrices of the form
  $
    mat(X, Y; Z, -X^T), wide
    X, Y, Z in frak(g l)_l (CC), Y^T = -Y, Z^T = -Z.
  $
  We have
  #source(161)
  $
    frak(t)_frak(g) & = {diag(x_1, ..., x_l, -x_1, ..., -x_l): x_i in CC}, \
    Phi_Id & = {epsilon_1, ..., epsilon_l, -epsilon_1, ..., -epsilon_l}, \
    Delta_frak(g) & = {alpha_(i j) = epsilon_i - epsilon_j quad (i != j),
      beta_(i j) = epsilon_i + epsilon_j quad (i < j),
      -beta_(i j): i, j = 1, ..., l}, \
    frak(g)_(alpha_(i j)) & = CC(E_(i j) - E_(l+j, l+i)),
    frak(g)_(beta_(i j)) = CC(E_(i, l+j) - E_(j, l+i)),
    frak(g)_(-beta_(i j)) = CC(E_(l+i, j) - E_(l+j, i)), \
    h_(alpha_(i j)) & = diag(
      0, ..., 0, 1, 0, ..., 0, -1, 0, ..., 0,
      -1, 0, ..., 0, 1, 0, ..., 0
    ),
  $
  with entries 1 on the positions $i$, $l + j$ and $-1$ on the positions $j$,
  $l + i$,
  $
    h_(beta_(i j)) = diag(
      0, ..., 0, 1, 0, ..., 0, 1, 0, ..., 0,
      -1, 0, ..., 0, -1, 0, ..., 0
    ),
  $
  with entries 1 on the positions $i$, $j$ and $-1$ on the positions $l + i$,
  $l + j$.] <exm:roots-of-so-even>

#example[The Lie algebra $frak(g) = frak(s o)_(2l+1) (CC)$ consists of the
  matrices of the form
  $
    mat(X, Y, U; Z, -X^T, V; -V^T, -U^T, 0), wide
    X, Y, Z in frak(g l)_l (CC), Y^T = -Y, Z^T = -Z, U, V in CC^l.
  $
  We have
  $
    frak(t)_frak(g) & = {diag(x_1, ..., x_l, -x_1, ..., -x_l, 0):
      x_i in CC}, \
    Phi_Id & = {epsilon_1, ..., epsilon_l, -epsilon_1, ..., -epsilon_l, 0}, \
    Delta_frak(g) & = {alpha_(i j) = epsilon_i - epsilon_j quad (i != j),
      beta_(i j) = epsilon_i + epsilon_j quad (i < j),
      -beta_(i j), epsilon_i, -epsilon_i: i, j = 1, ..., l},
  $
  $frak(g)_(alpha_(i j))$, $frak(g)_(beta_(i j))$, $frak(g)_(-beta_(i j))$ are
  determined by the same formulas as in Example~@exm:roots-of-so-even.

  $frak(g)_(epsilon_i) = CC(E_(i, 2l+1) - E_(2l+1, l+i))$,
  $frak(g)_(-epsilon_i) = CC(E_(l+i, 2l+1) - E_(2l+1, i))$, $h_(alpha_(i j))$,
  $h_(beta_(i j))$ are determined by the same formula as in
  Example~@exm:roots-of-so-even,
  $h_(epsilon_i) = diag(0, ..., 2, 0, ..., -2, 0, ..., 0)$ with $2 (-2)$ on the
  $i$th ($(l + i)$-th) place.] <exm:roots-of-so-odd>

For $G = Sp_(2l) (CC)$ we choose a basis in $CC^(2l)$ such that the matrix of
the invariant bilinear form is $mat(0, E_l; -E_l, 0)$.

#example[The Lie algebra $frak(s p)_(2l) (CC)$ ($l >= 1$) consists of matrices
  of the form
  $
    mat(X, Y; Z, -X^T), wide
    X, Y, Z in frak(g l)_l (CC), Y^T = Y, Z^T = Z.
  $
  The subalgebra $frak(t)_frak(g)$ and the weight system $Phi_Id$ are the same
  as in Example~@exm:roots-of-so-even. We have
  $
    Delta_frak(g) = {alpha_(i j) = epsilon_i - epsilon_j quad (i != j),
      beta_(i j) = epsilon_i + epsilon_j quad (i <= j),
      -beta_(i j): i, j = 1, ..., l};
  $
  #source(162)$frak(g)_(alpha_(i j))$, $h_(alpha_(i j))$ and $h_(beta_(i j))$
  ($i < j$) are the same as in Example~@exm:roots-of-so-even,
  $frak(g)_(beta_(i j)) = CC(E_(i, l+j) + E_(j, l+i))$,
  $frak(g)_(-beta_(i j)) = CC(E_(l+i, j) + E_(l+j, i))$,
  $h_(beta_(i i)) = diag(0, ..., 0, 1, 0, ..., 0, -1, 0, ..., 0)$ with 1 (resp.
  $-1$) at the $i$-th ($(l + i)$-th) place.

  Note that $frak(s p)_2 (CC) = frak(s l)_2 (CC)$.] <exm:roots-of-sp>

=== Three-Dimensional Subalgebras <ss:three-dimensional-subalgebras>
We retain the notation of @ss:weight-and-root-decompositions and assume that $G$
is reductive and $T$ is a maximal torus of $G$. To each root
$alpha in Delta_frak(g)$ we will assign a three-dimensional subalgebra of
$frak(g)$ isomorphic to $frak(s l)_2 (CC)$, a priori defined not quite uniquely.
Let $e_alpha$ be a nonzero vector in $frak(g)_alpha$. By
Problem~@pr:opposite-root-spaces-paired there exists a nonzero vector
$e_(-alpha) in frak(g)_(-alpha)$ such that
$(e_alpha, e_(-alpha)) = 2\/(alpha, alpha)$. Then @eq:coroot-h-lambda and
@eq:weight-value-on-coroot imply that
$
  [e_alpha, e_(-alpha)] = h_alpha, wide
  [h_alpha, e_alpha] = 2 e_alpha, wide
  [h_alpha, e_(-alpha)] = -2 e_(-alpha).
$
Define the embedding $phi_alpha: frak(s l)_2 (CC) -> frak(g)$ by setting (see
Example~@exm:roots-of-sl-n[]):
$
  phi_alpha (bold(e)) = e_alpha, wide
  phi_alpha (bold(f)) = e_(-alpha), wide
  phi_alpha (bold(h)) = h_alpha.
$
The map $phi_alpha$ is an isomorphism of $frak(s l)_2 (CC)$ onto the subalgebra
$frak(g)^((alpha)) = chevron.l e_alpha, e_(-alpha), h_alpha chevron.r
subset frak(g)$.

By Problem~@pr:complex-sl-sp-simply-connected the group $SL_2 (CC)$ is simply
connected. Therefore (see Theorem~@th:homomorphism-existence-simply-connected)
there exists a differentiable homomorphism $F_alpha: SL_2 (CC) -> G$ such that
$d F_alpha = phi_alpha$. Since $SL_2 (CC)$ is semisimple, $F_alpha$ is a
polynomial homomorphism. Its image is a connected algebraic subgroup
$G^((alpha)) subset G$ with the tangent algebra $frak(g)^((alpha))$.

#problem[For any $alpha in Delta_frak(g)$ we have
  $h_alpha in frak(t)(ZZ)$.] <pr:coroot-in-integral-lattice>

#problem[If $alpha$, $c alpha in Delta_frak(g)$, where $c in RR$, then
  $c = plus.minus 1\/2$, $plus.minus 1$ or
  $plus.minus 2$.] <pr:proportional-roots-in-lie-algebra>

Now consider the elements
$n_alpha = F_alpha (mat(0, 1; -1, 0)) in G^((alpha))$
($alpha in Delta_frak(g)$).

#problem[$(Ad n_alpha) h_alpha = -h_alpha$; $(Ad n_alpha) x = x$, if
  $x in frak(t)$ and $alpha(x) = 0$.] <pr:n-alpha-negates-coroot>

#problem[$n_alpha T n_alpha^(-1) = T$ and $Ad n_alpha$ induces in the space
  $frak(t)(RR)$ the orthogonal reflection $r_alpha$ with respect to the
  hyperplane $P_alpha = {x in frak(t)(RR): alpha(x) = 0}$. The map
  $attach(r, tl: t, br: alpha)$ is the orthogonal reflection of $frak(t)(RR)^*$
  with respect to the hyperplane
  $L_alpha = {lambda in frak(t)(RR)^*: (alpha, lambda) = 0}$.]
<pr:n-alpha-induces-reflection>

This reflection will also be denoted by $r_alpha$.

Problems~@pr:automorphisms-act-on-weights-roots and
@pr:n-alpha-induces-reflection imply

#theorem[The weight system $Phi_R$ of any polynomial linear representation
  $R: G -> GL(V)$ of a reductive algebraic group $G$ is invariant with respect
  to the reflections $r_alpha$ ($alpha in Delta_G$). Moreover
  $V_(r_alpha (lambda)) = R(n_alpha) V_lambda$ for any $lambda in Phi_R$. In
  particular, $r_alpha (Delta_G) = Delta_G$ and
  $frak(g)_(r_alpha (beta)) = (Ad n_alpha) frak(g)_beta$ for any $alpha$,
  $beta in Delta_G$.] <th:weights-invariant-under-reflections>

#corollary[#source(163)The weight system $Phi_rho$ of any linear representation
  $rho$ of $frak(s l)_2 (CC)$ is symmetric: if $lambda in Phi_rho$, then
  $-lambda in Phi_rho$.]

We will use this corollary in the proof of the following important property of
root decompositions.

#theorem[The root subspaces of a reductive algebraic Lie algebra $frak(g)$ are
  one-dimensional. If $alpha in Delta_frak(g)$, then
  $c alpha in.not Delta_frak(g)$ for $c in RR$ and
  $c != plus.minus 1$.] <th:root-spaces-one-dimensional>

#proof[Consider the subspace
  $frak(m) = tilde(frak(g))_alpha + frak(g)_(2 alpha) subset frak(g)$, where
  $tilde(frak(g))_alpha = {x in frak(g)_alpha: (e_(-alpha), x) = 0}$ and
  $frak(g)_(2 alpha) = 0$ if $2 alpha in.not Delta_frak(g)$.

  #problem[The subspace $frak(m)$ is invariant with respect to
    $ad frak(g)^((alpha))$.] <pr:root-space-complement-sl2-invariant>

  This problem and Corollary of Theorem~@th:weights-invariant-under-reflections
  imply $frak(m) = 0$ which proves Theorem~@th:root-spaces-one-dimensional.]

Theorem~@th:root-spaces-one-dimensional shows, in particular, that
$frak(g)^((alpha))$ is of the form
$
  frak(g)^((alpha)) = frak(g)_alpha + frak(g)_(-alpha) + CC h_alpha,
$
hence it is uniquely determined by the root $alpha$.

Let $lambda in Phi_R$ and $alpha in Delta_G$. The set of all weights of $R$ of
the form $lambda + k alpha$, where $k in ZZ$, is called the #idx(
  "α-string",
)_$alpha$-string of weights_ through $lambda$. Set
$ U = plus.o.big V_(lambda + k alpha), $
where the sum runs through all the weights from the $alpha$-string. Denote
$rho = d R$.

#problem[The subspace $U$ is invariant with respect to the restriction of $rho$
  onto $frak(g)^((alpha))$ and all $V_(lambda + k alpha)$'s are weight subspaces
  for $rho|frak(g)^((alpha))$ with respect to the diagonalizable subalgebra
  $chevron.l h_alpha chevron.r$.] <pr:weight-string-sum-sl2-invariant>

#problem[The $alpha$-string of weights through $lambda in Phi_R$ is of the form
  ${lambda + k alpha: k in ZZ, -p <= k <= q}$, where $p$, $q$ are nonnegative
  integers and $p - q = lambda(h_alpha)$. If $lambda(h_alpha) < 0$, then
  $lambda + alpha in Phi_R$ and if $lambda(h_alpha) > 0$, then
  $lambda - alpha in Phi_R$.] <pr:alpha-string-of-weights>

#problem[In notation of Problem~@pr:alpha-string-of-weights
  $rho(e_alpha)^(p+q) V_(lambda - p alpha) != 0$. In particular, if $lambda$,
  $lambda + alpha in Phi_R$, then
  $rho(e_alpha) V_lambda != 0$.] <pr:root-vector-nonzero-on-string>

#problem[If $alpha$, $beta$, $alpha + beta in Delta_frak(g)$, then
  $[frak(g)_alpha, frak(g)_beta] = frak(g)_(alpha + beta)$.]
<pr:bracket-of-root-spaces>

Concluding this section we prove that the properties of the weight system
$Phi_R$ listed above remain valid for the weight system $Phi_rho$ of any linear
representation $rho$ of a semisimple Lie algebra $frak(g)$, as defined in
@ss:weight-and-root-decompositions. For this notice that
$frak(g) = frak(g)_1 plus.o frak(g)_2$, where $frak(g)_1$, $frak(g)_2$ are
semisimple ideals, $frak(g)_2 = Ker rho$ and $rho$ isomorphically maps
$frak(g)_1$ onto $rho(frak(g))$. Any maximal diagonalizable subalgebra $frak(t)$
of $frak(g)$ is of the form $frak(t) = frak(t)_1 plus.o frak(t)_2$, where
$frak(t)_i subset frak(g)_i$. By Problem~@pr:roots-of-direct-sum-algebra
$Delta_frak(g) = Delta_(frak(g)_1) union Delta_(frak(g)_2)$. Clearly,
$lambda(x) = 0$ if $lambda in Phi_rho$ and
$x in frak(t)_2 = frak(t) inter Ker rho$ implying $Phi_rho subset frak(t)_1^*$.
The set $Phi_rho$ is identified with the weight system $Phi_(rho_1)$, where
$rho_1 = rho|frak(g)_1$ is a faithful representation.

#problem[For any $lambda in Phi_rho$ and $alpha in Delta_frak(g)$ we have
  $lambda(h_alpha) in ZZ$. In particular, $Phi_rho subset frak(t)(RR)^*$. The
  representation $rho$ is faithful if and only if $Phi_rho$ spans
  $frak(t)(RR)^*$.] <pr:weights-integral-on-coroots>

#source(164)Reducing the general case to the case of a faithful representation
$rho$ and using Theorem~@th:weights-invariant-under-reflections, one proves
easily that the system $Phi_rho$ is invariant with respect to all reflections
$r_alpha$, $alpha in Delta$. This implies that for any representation $rho$ the
assertions analogous to those of Problems~@pr:alpha-string-of-weights and
@pr:root-vector-nonzero-on-string are true.

#exercises[
  In
  exercises~@exc:trace-form-kernel-unipotent-radical–@exc:normality-is-transitive
  the ground field is either $CC$ or $RR$ unless otherwise stated.

  #exercise[If $frak(g) subset frak(g l)(V)$ is an algebraic Lie algebra then
    the kernel of the scalar product~@eq:trace-form in $frak(g)$ is the largest
    unipotent ideal. (This ideal is called the #idx(
      "Radical",
      "unipotent",
    )_unipotent radical_ of
    $frak(g)$).] <exc:trace-form-kernel-unipotent-radical>

  #exercise[In a simple Lie algebra any nonzero invariant scalar product is
    nondegenerate and all invariant scalar products are
    proportional.] <exc:simple-invariant-forms-proportional>

  #exercise[Simple ideals of a Lie algebra are orthogonal with respect to any
    invariant scalar product.] <exc:simple-ideals-orthogonal>

  #exercise[In a diagonalizable complex algebraic linear Lie algebra the
    orthogonal complement to an algebraic subalgebra with respect to the
    form~@eq:trace-form is an algebraic
    subalgebra.] <exc:orthogonal-algebraic-in-torus-algebra>

  #exercise[If $frak(a)$ is an ideal of a Lie algebra $frak(g)$, then the
    restriction of the Cartan scalar product of $frak(g)$ onto $frak(a)$
    coincides with the Cartan scalar product of
    $frak(a)$.] <exc:killing-form-of-ideal>

  #exercise[If $(frak(g), frak(g))_ad = 0$ then $frak(g)$ is solvable. If
    $frak(g)$ is solvable then $(frak(g), [frak(g), frak(g)])_ad = 0$.]
  <exc:cartan-solvability-criterion>

  #exercise[If the Cartan scalar product of a Lie algebra $frak(g)$ is
    nondegenerate then $frak(g)$ is
    semisimple.] <exc:cartan-semisimplicity-criterion>

  #exercise[If $ad frak(g)$ is an algebraic Lie algebra then the kernel of the
    Cartan scalar product of $frak(g)$ is the largest nilpotent ideal of
    $frak(g)$.] <exc:killing-kernel-nilpotent-ideal>

  #exercise[Let $W subset V$ be a subspace, neither 0 nor $V$. The group
    $ G = {A in SL(V): A v - v in W "for all" v in V} $
    is algebraic, connected and coincides with its commutator group but is not
    semisimple.] <exc:perfect-group-not-semisimple>

  #exercise[Any differentiable linear representation of a reductive complex
    algebraic group $G$ is polynomial. Considered as a Lie group, $G$ possesses
    a unique algebraic structure.] <exc:reductive-algebraic-structure-unique>

  #exercise[A normal Lie subgroup and a quotient of a semisimple Lie group are
    semisimple.] <exc:normal-subgroups-quotients-semisimple>

  #exercise[Let $G = product_(1 <= i <= s) G_i$ be a decomposition of a
    connected semisimple Lie group $G$ into a locally direct product of simple
    normal Lie subgroups. Then any normal Lie subgroup of $G$ is the product of
    some of $G_i$'s by a central
    subgroup.] <exc:normal-subgroups-of-local-product>

  #exercise[Any normal Lie subgroup of a connected normal Lie subgroup of a
    connected semisimple Lie group or a connected reductive algebraic group $G$
    is normal in $G$.] <exc:normality-is-transitive>

  #exercise[A connected complex algebraic group is reductive if and only if it
    locally splits into the direct product of connected simple normal algebraic
    subgroups with all the commutative factors isomorphic to
    $CC^*$.] <exc:reductive-local-product-of-simple>

  #exercise[#source(165)A polynomial linear representation $R$ of a reductive
    algebraic group is locally faithful if and only if the system $Phi_R$
    generates $frak(t)(RR)^*$ (here $frak(t)$ is the tangent algebra of the
    maximal torus with respect to which weights are
    considered).] <exc:locally-faithful-weight-criterion>

  In
  exercises~@exc:completing-root-vector-to-sl2–@exc:subalgebra-containing-torus-regular
  $G$ denotes a connected semisimple complex algebraic group and $frak(g)$ its
  tangent algebra.

  #exercise[Let $T$ be a torus in $G$, $tilde(frak(g))_0$ the orthogonal
    complement to $frak(t)$ in $frak(g)_0$, $alpha in Delta(T)$ and
    $x in frak(g)_alpha$, $x != 0$. For the existence of an element
    $y in frak(g)_(-alpha)$ such that $[x, y] = h_alpha$ it is necessary and
    sufficient that
    $x in.not [tilde(frak(g))_0, x]$.] <exc:completing-root-vector-to-sl2>

  #exercise[For any $x in frak(g)$ the subspace $[frak(g), x]$ coincides with
    the orthogonal complement to the centralizer of
    $x$.] <exc:image-of-ad-orthogonal-centralizer>

  #exercise[For any nilpotent $x in frak(g)$ there exists a semisimple
    $y in frak(g)$ such that
    $[y, x] = x$.] <exc:nilpotent-eigenvector-of-semisimple>

  #exercise[(#idx("Morozov’s theorem")_Morozov's theorem_). Any nilpotent
    $x in frak(g)$ can be included in a simple three-dimensional subalgebra.
    (Hint: choose a maximal torus $T$ in the group
    $N(x) = {g in G: (Ad g) x in chevron.l x chevron.r}$. Consider the root
    decomposition of $frak(g)$ with respect to $T$ and apply
    Exercise~@exc:completing-root-vector-to-sl2.)] <exc:morozov>

  A subalgebra of a Lie algebra $frak(g)$ is #idx(
    "subalgebra",
    "regular",
  )_regular_ if its normalizer contains the tangent algebra $frak(t)$ of a
  maximal torus $T subset G$. A subset $Sigma subset Delta_frak(g)$ is #idx(
    "subsystem",
    "closed",
  )_closed_ if for any $alpha$, $beta in Sigma$ such that
  $alpha + beta in Delta_frak(g)$ we have $alpha + beta in Sigma$.

  #exercise[Let $Sigma subset Delta_frak(g)$ be a closed subset,
    $frak(t)_1 subset frak(t)$ a subspace containing the vectors $h_alpha$ for
    all $alpha in Sigma$ such that $-alpha in Sigma$. Then
    $
      frak(g)(Sigma, frak(t)_1) = frak(t)_1 plus.o
      plus.o.big_(alpha in Sigma) frak(g)_alpha,
    $
    is a regular subalgebra of
    $frak(g)$.] <exc:closed-subset-regular-subalgebra>

  #exercise[Any regular subalgebra of $frak(g)$ is conjugate to a subalgebra of
    the form $frak(g)(Sigma, frak(t)_1)$.] <exc:regular-subalgebra-normal-form>

  #exercise[The subalgebra $frak(g)(Sigma, frak(t)_1)$ is algebraic if and only
    if $frak(t)_1$ is an algebraic subalgebra of
    $frak(t)$.] <exc:regular-subalgebra-algebraic>

  #exercise[The subalgebra $frak(g)(Sigma, frak(t)_1)$ is reductive if and only
    if $-alpha in Sigma$ for any $alpha in Sigma$. In this case the subalgebra
    is semisimple if and only if $frak(t)_1$ is spanned by the vectors
    $h_alpha$, $alpha in Sigma$.] <exc:regular-subalgebra-reductive>

  #exercise[The subalgebras $frak(g)(Sigma_1, frak(t)_1)$ and
    $frak(g)(Sigma_2, frak(t)_2)$ are conjugate if and only if there exists
    $g in G$ such that $g T g^(-1) = T$, $(Ad g) frak(t)_1 = frak(t)_2$ and
    $(Ad g) Sigma_2 = Sigma_1$.] <exc:regular-subalgebras-conjugacy>

  #exercise[Any subalgebra of $frak(g)$ containing $frak(t)$ coincides with its
    normalizer and therefore is a regular algebraic
    subalgebra.] <exc:subalgebra-containing-torus-regular>

  In
  Exercises~@exc:sl2-submodule-from-weight-space–@exc:raising-lowering-eigenvalue
  a linear representation $rho: frak(g) -> frak(g l)(V)$ is considered.

  #exercise[If $tilde(V)_lambda subset V_lambda$ is a subspace invariant with
    respect to $rho(e_alpha) rho(e_(-alpha))$, then
    $tilde(V)_lambda plus.o
    (plus.o.big_(k > 0) rho(e_alpha)^k tilde(V)_lambda) plus.o
    (plus.o.big_(l > 0) rho(e_(-alpha))^l tilde(V)_lambda)$
    is invariant with respect to
    $rho|frak(g)^((alpha))$.] <exc:sl2-submodule-from-weight-space>

  #exercise[Let $lambda$ and $lambda + alpha$, where $alpha in Delta_frak(g)$,
    be weights of $rho$ and $A: V_lambda -> V_(lambda + alpha)$ the linear map
    induced by $rho(e_alpha)$. Then

    a) if $lambda(h_alpha) < 0$ then $A$ is a monomorphism;

    b) if $lambda(h_alpha) >= -1$ then $A$ is an
    epimorphism.] <exc:root-vector-injective-surjective>

  #exercise[Let $v in V_lambda$ be an eigenvector of
    $rho(e_alpha) rho(e_(-alpha))$ with eigenvalue $c$. Define $p$ (resp. $q$)
    as the maximal integer such that $rho(e_(-alpha))^p v != 0$ (resp.
    $rho(e_alpha)^q v != 0$). Then $p - q = lambda(h_alpha)$ and
    $c = p(q + 1)$.] <exc:raising-lowering-eigenvalue>
]

#hints[
  #hint[@pr:invariant-form-infinitesimal][#source(166)Make use of
    Example~@exm:skew-maps-of-bilinear-form[] from
    @sec:lie-group-tangent-algebra and
    Theorem~@th:homomorphism-into-subgroup-criterion.]

  #hint[@pr:trace-form-positive-on-torus][Nondegeneracy follows from the
    positive definiteness on $frak(t)(RR)$ and the latter is obvious.]

  #hint[@pr:vanishing-trace-form-solvable][The first statement follows from
    Problem~@pr:trace-form-positive-on-torus\; to prove the second one consider
    $[frak(n), frak(n)]$.]

  #hint[@pr:unipotent-ideal-orthogonal][By Theorem~@th:engel
    $ V_0 = {v in V: frak(n) v = 0} != 0. $
    Clearly, $V_0$ is $frak(g)$-invariant. The definition of $V_0$ implies that
    $
      (X, Y) = tr_(V\/V_0) (X Y) quad "for" quad X in frak(g), Y in frak(n).
    $
    This makes it possible to apply induction on $dim V$.]

  #hint[@pr:semisimple-trace-form-nondegenerate][For $K = CC$ apply
    Problem~@pr:vanishing-trace-form-solvable to the kernel $frak(n)$ of the
    scalar product~@eq:trace-form. By Problem~@pr:orthogonal-of-ideal-is-ideal
    this kernel is an ideal of $frak(g)$. For $K = RR$ consider $frak(g)(CC)$
    which is semisimple by Problem~@pr:radical-complexification.]

  #hint[@pr:center-algebraic-and-semisimple][The semisimplicity of the elements
    of the center follows from Problem~@pr:unipotent-ideal-orthogonal.]

  #hint[@pr:nondegenerate-trace-derived-semisimple][Let $frak(n)$ be a solvable
    ideal in $frak(g)' = [frak(g), frak(g)]$. Since $frak(g)'$ is algebraic,
    then by passing to a solvable ideal $frak(n)^a$ we may assume that $frak(n)$
    is an algebraic linear Lie algebra. Problem~@pr:unipotent-ideal-orthogonal
    implies that $frak(n)$ is the tangent algebra of a torus.
    Problem~@pr:trace-form-positive-on-torus implies that
    $frak(g)' = frak(n) plus.o frak(n)^perp$ and $[frak(n), frak(n)^perp] = 0$.
    Therefore $frak(n) subset frak(z)(frak(g))$, hence $frak(n) = 0$.]

  #hint[@pr:semisimple-virtual-subgroup-algebraic][Make use of
    Corollary~@cor:connected-virtual-subgroup-by-algebra of
    Theorem~@th:virtual-subgroups-inclusion.]

  #hint[@pr:maximal-diagonalizable-and-maximal-tori][Notice that for any
    diagonalizable subalgebra $frak(t) subset frak(g)$ the algebraic subalgebra
    $frak(t)^a$ is also diagonalizable. The last statement of the problem
    follows from Problem~@pr:vanishing-trace-form-solvable.]

  #hint[@pr:semisimple-ideal-direct-summand][Apply
    Problem~@pr:vanishing-trace-form-solvable to the ideal
    $frak(n) = frak(a) inter frak(a)^perp$ of $frak(g)$. Then make use of the
    fact that $[frak(a), frak(a)^perp] subset frak(a) inter frak(a)^perp = 0$.]

  #hint[@pr:orthogonal-sum-of-simple-ideals][The existence of the decomposition
    is proved by induction in $dim frak(g)$. Let $frak(g)_1$ be a minimal ideal
    of $frak(g)$. Problem~@pr:semisimple-ideal-direct-summand implies that
    $frak(g)_1$ is simple and $frak(g) = frak(g)_1 plus.o frak(g)_1^perp$. It is
    clear from Problem~@pr:ideals-quotients-semisimple that $frak(g)_1^perp$ is
    a semisimple ideal which enables us to apply to it the inductive hypothesis.
    To prove the second statement notice that the projection $frak(h)_i$ of any
    ideal $frak(h)$ of $frak(g)$ onto $frak(g)_i$ is an ideal of $frak(g)_i$;
    therefore either $frak(h)_i = 0$ or $frak(h)_i = frak(g)_i$. But in the
    second case $frak(g)_i = [frak(g)_i, frak(h)] subset frak(h)$.]

  #hint[@pr:simple-algebraic-group-criterion][Let $G$ satisfy the conditions of
    the theorem and $frak(h)$ be a nonzero ideal of its tangent algebra
    $frak(g)$. Then $frak(h)^a$ is an ideal of $frak(g)$
    (Problem~@pr:algebraic-closure-of-ideal). Therefore $frak(h)^a = frak(g)$
    implying $frak(g)' = frak(h)' subset frak(h)$ by
    Theorem~@th:algebraic-closure-same-derived. Since $frak(g)'$ is an algebraic
    ideal of $frak(g)$, then either $frak(g)' = frak(g)$ (and hence
    $frak(h) = frak(g)$) or $frak(g)' = 0$. In the second case the description
    of connected commutative algebraic groups (see Corollary of
    Theorem~@th:commutative-algebraic-group-structure) implies that
    $dim frak(g) = 1$; therefore $frak(h) = frak(g)$.]

  #hint[@pr:local-direct-product-criterion][First, prove that $a b = b a$ for
    any $a in G_i$, $b in G_j$, $i != j$. Then consider the homomorphism
    $m: G_1 times dots.c times G_s -> G$ defined by the formula
    $m(g_1, ..., g_s) = g_1 dots g_s$ and apply
    Problem~@pr:covering-homomorphism-criteria.]

  #hint[@pr:span-of-weight-system][#source(167)Note that $frak(t) inter Ker d R$
    coincides with the intersection of the kernels $Ker lambda$ for all
    $lambda in Phi_R$.]

  #hint[@pr:root-spaces-orthogonality][Follows from the invariance of the scalar
    product with respect to $Ad T$.]

  #hint[@pr:opposite-root-spaces-paired][Follows from
    Problems~@pr:root-spaces-orthogonality and
    @pr:semisimple-trace-form-nondegenerate.]

  #hint[@pr:zero-root-space-is-torus][The algebraic Lie algebra $frak(g)_0$ is
    reductive thanks to Theorem~@th:reductive-iff-trace-form-nondegenerate and
    Problem~@pr:opposite-root-spaces-paired. We have
    $frak(t) subset frak(z)(frak(g)_0)$. If $T$ is a maximal torus then
    $frak(t) = frak(z)(frak(g)_0)$ so that
    $frak(g)_0 = frak(t) plus.o frak(g)'_0$, where $frak(g)'_0$ is the
    semisimple ideal of $frak(g)_0$. If $frak(g)'_0 != 0$, then $frak(g)'_0$
    contains a nonzero semisimple element (see
    Corollary~@cor:unipotent-algebra-solvable of Theorem~@th:engel)
    contradicting the maximality of the diagonalizable subalgebra $frak(t)$.]

  #hint[@pr:root-system-of-reductive-algebra][Make use of
    Problem~@pr:span-of-weight-system.]

  #hint[@pr:roots-of-direct-sum-algebra][To prove the orthogonality note that
    $alpha(h_beta) = 0$ if $alpha$ and $beta$ belong to different
    $Delta_(frak(g)_i)$ ($i = 1, 2$).]

  #hint[@pr:orthogonal-roots-split-algebra][If $alpha in Delta_1$,
    $beta in Delta_2$ then $(alpha + beta, alpha) > 0$,
    $(alpha + beta, beta) > 0$ implying $alpha + beta in.not Delta_frak(g)$.
    Therefore the subspaces $frak(g)_i = frak(t)_i plus.o
    plus.o.big_(alpha in Delta_i) frak(g)_alpha$, where $frak(t)_i$ is the
    linear span of all $h_alpha$ such that $alpha in Delta_i$, satisfy
    $[frak(g)_1, frak(g)_2] = 0$ and $frak(g)_i$ are subalgebras such that
    $frak(g) = frak(g)_1 plus.o frak(g)_2$ and $Delta_(frak(g)_i) = Delta_i$
    ($i = 1, 2$).]

  #hint[@pr:representation-preserves-jordan][The statement is obvious if $rho$
    is a faithful representation. It is easy to verify that the projection of
    $frak(g)$ onto any direct summand maps the semisimple elements into
    semisimple ones and the nilpotent elements into nilpotent ones. By
    Problems~@pr:semisimple-ideal-direct-summand,
    @pr:ideals-quotients-semisimple $frak(g)$ decomposes as
    $frak(g) = frak(g)_1 plus.o frak(g)_2$, where $frak(g)_i$ are semisimple
    ideals, $frak(g)_2 = Ker rho$ and $rho_1 = rho|frak(g)_1$ is a faithful
    representation. We have $rho = rho_1 compose pi$, where
    $pi: frak(g) -> frak(g)_1$ is the projection.]

  #hint[@pr:coroot-in-integral-lattice][Notice that $bold(h) in frak(t)(ZZ)$ for
    $SL_2 (CC)$ and that for any homomorphism of tori $phi: T -> tilde(T)$ we
    have $d phi(frak(t)(ZZ)) subset tilde(frak(t))(ZZ)$.]

  #hint[@pr:proportional-roots-in-lie-algebra][If $alpha$,
    $c alpha in Delta_frak(g)$, where $c in RR$, then
    Problem~@pr:coroot-in-integral-lattice implies that $2\/c$, $2 c in ZZ$.]

  #hint[@pr:n-alpha-negates-coroot][The first statement follows from the
    identity $mat(0, 1; -1, 0) bold(h) mat(0, 1; -1, 0)^(-1) = -bold(h)$. To
    prove the second statement note that if $alpha(x) = 0$, then
    $[frak(g)^((alpha)), x] = 0$, hence $(Ad g) x = x$ for any
    $g in G^((alpha))$.]

  #hint[@pr:alpha-string-of-weights][Let $r <= s$ be integers such that
    $lambda + k alpha in Phi_R$ for all integers $k$, $r <= k <= s$, but
    $lambda + (r - 1) alpha in.not Phi_R$ and
    $lambda + (s + 1) alpha in.not Phi_R$. Then
    $tilde(U) = plus.o.big_(r <= k <= s) V_(lambda + k alpha)$ is invariant with
    respect to $rho|frak(g)^((alpha))$. Applying Corollary of
    Theorem~@th:weights-invariant-under-reflections we see that the set of
    numbers ${lambda(h_alpha) + 2 k: r <= k <= s}$ is symmetric with respect to
    zero. Therefore $lambda(h_alpha) = -(r + s)$ and the segment
    ${lambda + k alpha: r <= k <= s}$ of our $alpha$-string is symmetric. There
    are no other weights in the $alpha$-string since any of its segments is
    symmetric and therefore intersects with the one already considered.]

  #hint[@pr:root-vector-nonzero-on-string][Let $s >= 0$ be the maximal of
    integers $k$ such that $rho(e_alpha)^k V_(lambda - p alpha) != 0$. Verify
    that $U = plus.o.big_(0 <= k <= s) rho(e_alpha)^k V_(lambda - p alpha)$ is
    invariant with respect to $rho|frak(g)^((alpha))$. If $s < p + q$ then the
    weight system of the subrepresentation of $G^((alpha))$ in $U$ is not
    symmetric.]

  #hint[@pr:bracket-of-root-spaces][Apply
    Problem~@pr:root-vector-nonzero-on-string to the adjoint representation.]

  #hint[@pr:weights-integral-on-coroots][If $rho$ is faithful then it may be
    replaced by the identity representation of $rho(frak(g))$ in which case
    Problem~@pr:coroot-in-integral-lattice is applicable. This and the above
    arguments imply that in general case $lambda(h_alpha) in ZZ$ for all
    $lambda in Phi_rho$ and all $alpha in Delta_(frak(g)_1)$. Besides,
    $lambda(h_alpha) = 0$ for all $alpha in Delta_(frak(g)_2)$.]
]
