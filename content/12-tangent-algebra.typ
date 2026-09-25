// Chapter 1, § 2. Tangent Algebra. Printed pages 19-42; § 2 begins below
// the § 1 hints on page 19 and ends above § 3 on page 42.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/cd.typ": ar, cd

== Tangent Algebra <sec:lie-group-tangent-algebra>

=== Definition of the Tangent Algebra <ss:tangent-algebra-definition>
The structure of a Lie group in a neighbourhood of the unit is determined by an
algebra structure in the tangent space $T_e (G)$. The most straightforward way
to define it is the following one.

#source(35)Choose a coordinate system in a neighbourhood of the unit $e$ of $G$
such that all the coordinates of the point $e$ are zero. The column of
coordinates of a point $x$ will be denoted by $overline(x)$. Consider the Taylor
series expansion of the coordinates of the product $x y$. Since $e y = y$ and
$x e = x$, we have
$
  overline(x y) = overline(x) + overline(y) + alpha(overline(x), overline(y))
  + dots.c
$ <eq:product-taylor-expansion>
where $alpha$ is a bilinear vector-valued function and dots stand for the terms
of degree $>= 3$.

The transposition of $x$ and $y$ yields
$
  overline(y x) = overline(y) + overline(x) + alpha(overline(y), overline(x))
  + dots.c
$ <eq:reversed-product-taylor-expansion>
We see that the noncommutativity of the multiplication in $G$ can only manifest
itself in terms of degree $>= 2$. The noncommutativity is measured by the group
commutator $(x, y) = x y x^(-1) y^(-1)$. The second order terms in the Taylor
series expansion of coordinates of $(x, y)$ are easy to find from the relation
$(x, y) y x = x y$. Comparing @eq:product-taylor-expansion and
@eq:reversed-product-taylor-expansion we get
$
  overline((x, y)) = gamma(overline(x), overline(y)) + dots.c,
$ <eq:group-commutator-expansion>
where
$
  gamma(overline(x), overline(y)) = alpha(overline(x), overline(y))
  - alpha(overline(y), overline(x)),
$ <eq:commutator-term-skew-part>
and dots stand for the terms of degree $>= 3$.

In the tangent space $T_e (G)$, define a bilinear operation known as the #idx(
  "bracket",
)_bracket_ or #idx("commutator")_commutator_ $(xi, eta) |-> [xi, eta]$ by the
formula
$
  overline([xi, eta]) = gamma(overline(xi), overline(eta)),
$ <eq:tangent-bracket-definition>
where $overline(zeta)$ is the column of coordinates of a tangent vector $zeta$
in the coordinate system of $T_e (G)$ associated with the chosen local
coordinate system on $G$. Let us prove that this operation does not depend on
the choice of the coordinate system.

Consider another local coordinate system with the origin at $e$. The column of
coordinates of $x$ in the new coordinate system will be denoted by
$overline(overline(x))$. Then
$ overline(x) = C overline(overline(x)) + dots.c, $
where $C$ is the Jacobi matrix of the old coordinates with respect to the new
ones at $e$ and dots stand for the terms of degree $>= 2$. Hence,
$
  overline(overline((x, y)))
  = C^(-1) gamma(C overline(overline(x)), C overline(overline(y))) + dots.c,
$ <eq:commutator-coordinate-change>
where dots stand for the terms of degree $>= 3$.

#source(36)The coordinates of a tangent vector $xi in T_e (G)$ are transformed
via the formula
$ overline(xi) = C overline(overline(xi)), $
hence
$
  overline(overline([xi, eta]))
  = C^(-1) gamma(C overline(overline(xi)), C overline(overline(eta))).
$ <eq:bracket-coordinate-change>
Here $[xi, eta]$ stands for the bracket defined in the old coordinate system.
Formulas~@eq:commutator-coordinate-change and @eq:bracket-coordinate-change show
that $[xi, eta]$ coincides with the bracket of $xi$ and $eta$ defined in the new
coordinate system.

The space $T_e (G)$ endowed with the above defined bracket is called the
_tangent algebra of the Lie group $G$_ and is denoted by $frak(g)$. In the
sequel we also denote Lie groups by Latin capitals and the corresponding tangent
algebras by the corresponding small Gothic letters.

It is clear (see formula~@eq:commutator-term-skew-part) that the tangent algebra
is anticommutative, i.e.
$ [xi, eta] = -[eta, xi] $
for any $xi, eta in frak(g)$.

#problem[The tangent algebra of a commutative Lie group is an algebra with the
  zero bracket.] <pr:commutative-group-zero-bracket>

Let $V$ be a finite dimensional vector space over $K$. We will naturally
identify the tangent space of the Lie group $GL(V)$ at $E$ with the space
$upright(L)(V)$.

#problem[The tangent algebra of $GL(V)$ is the space $upright(L)(V)$ with the
  bracket
  $
    [cal(X), cal(Y)] = cal(X) cal(Y) - cal(Y) cal(X).
  $ <eq:matrix-commutator-bracket>] <pr:tangent-algebra-of-gl>

The tangent algebra of $GL(V)$ (resp. $GL_n (K)$) is denoted by $frak("gl")(V)$
(resp. $frak("gl")_n (K)$).

=== Tangent Homomorphism <ss:tangent-homomorphism>
Let $f: G -> H$ be a Lie group homomorphism. Let $d_e f: T_e G -> T_e H$ be its
differential at $e$.

#problem[The map $d_e f$ is a homomorphism of tangent
  algebras.] <pr:differential-is-algebra-homomorphism>

We will sometimes call the map $d_e f$ the #idx(
  "homomorphism",
  "tangent",
)_tangent homomorphism_ of $f$ and, by an abuse of notation denote it simply by
$d f$.

#problem[The tangent algebra of a Lie subgroup of a Lie group $G$ is a
  subalgebra of the tangent algebra $frak(g)$. In particular, the bracket in the
  tangent algebra of any linear Lie group is defined by the
  formula~@eq:matrix-commutator-bracket.] <pr:lie-subgroup-tangent-subalgebra>

By Theorem~@th:kernel-is-lie-subgroup the tangent algebra of the kernel of a Lie
group homomorphism coincides with the kernel of the tangent homomorphism.

For example, the kernel of the homomorphism
$ det: GL_n (K) -> K^* $
is $SL_n (K)$.

#problem[#source(37)$(d_E det)(X) = tr X$.] <pr:differential-of-determinant>

Thus, the tangent algebra of $SL_n (K)$ consists of all traceless matrices. It
is denoted by $frak("sl")_n (K)$.

#problem[Let $H$ be a normal subgroup of $G$. Then $frak(h)$ is an ideal of
  $frak(g)$ and, under the canonical identification of the tangent space
  $T_e (G\/H)$ with the quotient space $T_e (G)\/T_e (H)$ the tangent algebra of
  $G\/H$ coincides with $frak(g)\/frak(h)$.] <pr:quotient-group-tangent-algebra>

A particular case of the tangent homomorphism is the differential of a linear
representation. The differential of a representation $G -> GL(V)$ is a
homomorphism $frak(g) -> frak("gl")(V)$.

#problem[The differentials of the linear representations $Ad$ and $Sq$ defined
  in Problem~@pr:conjugation-congruence-representations are of the form
  $
    (d Ad)(Y)(X) = Y X - X Y, wide (d Sq)(Y)(X) = Y X + X Y^t.
  $] <pr:conjugation-congruence-differentials>

Let $R$ and $S$ be linear representations of a Lie group $G$ in spaces $V$ and
$U$, respectively, and let $d R$ and $d S$ be their differentials. Let us
compute the differentials of $R^*$ and $R S$.

#problem[$((d R^*)(xi) f)(v) = -f((d R)(xi) v)$.]
<pr:differential-of-dual-representation>

#problem[$(d(R S))(xi)(v times.o u) = (d R(xi)) v times.o u
  + v times.o (d S(xi)) u$.] <pr:differential-of-tensor-product>

Using these formulas we may compute the differential of the product of any
number of given linear representations and their duals.

For example, the natural linear representation $T_(k, l)$ of $GL(V)$ in the
space of tensors of type $(k, l)$ is the product of $k$ copies of the identity
representation and $l$ copies of its dual (see
@ss:operations-on-representations). Denote the differential of $T_(k, l)$ by
$tau_(k, l)$. Let us give convenient formulas for $tau_(0, l) (X)$ and
$tau_(1, l) (X)$, where $X in frak("gl")(V)$.

If $f$ is an $l$-linear function on $V$ then
$
  (tau_(0, l) (X) f)(v_1, ..., v_l)
  = -sum_i f(v_1, ..., v_(i-1), X v_i, v_(i+1), ..., v_l).
$ <eq:infinitesimal-action-multilinear-forms>
If $F: V times dots.c times V -> V$ ($l$ factors in the source) is a multilinear
map then
$
  (tau_(1, l) (X) F)(v_1, ..., v_l) & = X F(v_1, ..., v_l) \
  & - sum_i F(v_1, ..., v_(i-1), X v_i, v_(i+1), ..., v_l).
$ <eq:infinitesimal-action-multilinear-maps>

#problem[Prove formulas~@eq:infinitesimal-action-multilinear-forms and
  @eq:infinitesimal-action-multilinear-maps.]
<pr:prove-infinitesimal-action-formulas>

=== The Tangent Algebra of a Stabilizer <ss:tangent-algebra-of-stabilizer>
When a Lie subgroup $H$ of $G$ is defined as the stabilizer of a certain point
for some $G$-action, the tangent subalgebra corresponding to $H$ may be found
using Theorem~@th:stabilizer-is-lie-subgroup.

Consider the case of a linear action $R: G -> GL(V)$. The differentiation of the
identity $R_v (g) = R(g) v$ with respect to $g$ at $e$ gives
$ (d R_v)(xi) = (d R)(xi) v, $
#source(38)where $d R$ on the right-hand side stands for the differential of
$R$. Therefore, the second part of heading 1) of
Theorem~@th:stabilizer-is-lie-subgroup can be reformulated in this particular
case as follows.

#theorem[Suppose $R$ is a linear representation of $G$ in $V$ and $H$ is the
  stabilizer of $v in V$. Then
  $
    frak(h) = {xi in frak(g): d R(xi) v = 0}.
  $] <th:tangent-algebra-of-vector-stabilizer>

In particular, using this theorem we can find the tangent algebra of a linear
Lie group that preserves a tensor.

_Examples._ #eg <exm:skew-maps-of-bilinear-form> The group $G$ of invertible
linear transformations of a space $V$ that preserve a fixed bilinear form $f$ is
the stabilizer of $f$ with respect to the natural linear representation
$T_(0, 2)$ of $GL(V)$ in the space of bilinear forms on $V$ (see
formula~@eq:gl-action-on-multilinear-forms).
Formula~@eq:infinitesimal-action-multilinear-forms implies that the tangent
algebra of $G$ consists of all linear maps which are skew-symmetric with respect
to $f$.

#eg <exm:derivations-as-tangent-algebra> Let $A$ be a finite-dimensional algebra
over $K$. The group $Aut A$ of the automorphisms of $A$ is the stabilizer of the
structure tensor of $A$ with respect to the natural linear representation
$T_(1, 2)$ of $GL(A)$ in the space of tensors of type $(1, 2)$ on $A$ (see
formula~@eq:gl-action-on-multilinear-maps).
Formula~@eq:infinitesimal-action-multilinear-maps implies that the tangent
algebra of $Aut A$ consists of all linear transformations $D$ that satisfy
$ D(a b) = D(a) b + a D(b), wide (a, b in A) $ <eq:derivation-leibniz-rule>
Such transformations are called #idx("Derivation")_derivations_ of $A$. Hence,
they form an algebra with respect to the bracket. (This, however, may be
verified directly.) This algebra is denoted by $der A$.

=== The Adjoint Representation and the Jacobi Identity
<ss:adjoint-representation-jacobi>
Any Lie group $G$ has a natural linear representation in its tangent algebra
$frak(g)$. It is defined as follows:

For any $g in G$ consider the inner automorphism
$ a(g): x |-> g x g^(-1), quad "where" quad x in G. $
Denote by $Ad g$ the differential of $a(g)$ at $e$. It is an automorphism of the
tangent algebra.

#problem[The map $Ad: G -> GL(frak(g))$ is a linear representation of the Lie
  group $G$.] <pr:adjoint-is-representation>

$Ad$ is called the #idx("representation", "adjoint")_adjoint representation_ of
$G$. Let us compute the corresponding tangent homomorphism
$frak(g) -> frak("gl")(frak(g))$.

#problem[In local coordinates in a neighbourhood of the unit we have
  $
    overline(g x g^(-1)) = overline(x) + gamma(overline(g), overline(x))
    + dots.c,
  $
  where dots stand for the terms of degree
  $>= 3$.] <pr:conjugation-taylor-expansion>

#source(39)If we confine ourselves to terms of the first degree in $overline(x)$
we obtain
$
  overline((Ad g) xi) = overline(xi) + gamma(overline(g), overline(xi))
  + dots.c,
$
where dots stand for the terms of degree $>= 2$ in $overline(g)$. This implies
that
$ overline((d Ad)(eta) xi) = gamma(overline(eta), overline(xi)), $
i.e.
$
  (d Ad)(xi) eta = [xi, eta] wide (xi, eta in frak(g))
$ <eq:differential-of-adjoint>
Since $d Ad$ is a Lie algebra homomorphism $frak(g) -> frak("gl")(frak(g))$, we
have
$
  [[xi, eta], zeta] = [xi, [eta, zeta]] - [eta, [xi, zeta]]
$ <eq:jacobi-derivation-form>
for any $xi, eta, zeta in frak(g)$. Taking into account the anticommutativity of
the bracket we may rewrite this identity in a more symmetric form:
$
  [[xi, eta], zeta] + [[eta, zeta], xi] + [[zeta, xi], eta] = 0
$ <eq:jacobi-identity>
The identity~@eq:jacobi-identity is called the #idx("Jacobi identity")_Jacobi
identity._

#problem[Prove the Jacobi identity starting from
  $ Ad G subset Aut frak(g). $] <pr:jacobi-from-adjoint-automorphisms>

An anticommutative algebra that satisfies the Jacobi identity is called a #idx(
  "Lie algebra",
)_Lie algebra_#footnote[When the ground field is of characteristic 2 the
  anticommutativity should be replaced by a stronger condition: “$[xi, xi] = 0$
  for all $xi in frak(g)$”.]. We have proved

#theorem[The tangent algebra of any Lie group is a Lie
  algebra.] <th:tangent-algebra-is-lie-algebra>

In particular, $frak("gl")(V)$ is a Lie algebra. This however is easy to deduce
directly from @eq:matrix-commutator-bracket.

A Lie algebra homomorphism $frak(g) -> frak("gl")(V)$ is called a #idx(
  "representation",
  "linear",
)_linear representation_ of $frak(g)$. By
Problem~@pr:differential-is-algebra-homomorphism the differential of a linear
representation of a Lie group is a linear representation of its tangent algebra.

The Jacobi identity written in the form~@eq:jacobi-derivation-form means that
for any Lie algebra $frak(g)$ the map $ad: frak(g) -> frak("gl")(frak(g))$
defined by the formula
$ (ad xi) eta = [xi, eta] wide (xi, eta in frak(g)), $
is a linear representation of $frak(g)$. This representation is called the #idx(
  "representation",
  "adjoint",
)_adjoint representation_ of $frak(g)$. We have proved
(formula~@eq:differential-of-adjoint) the following statement:

#theorem[#source(40)The differential of the adjoint representation of a Lie
  group coincides with the adjoint representation of its tangent
  algebra.] <th:differential-of-adjoint-is-ad>

A Lie algebra with the zero bracket is called #idx(
  "Lie algebra",
  "commutative",
)_commutative._ By Problem~@pr:commutative-group-zero-bracket the tangent
algebra of a commutative Lie group is commutative.

=== Differential Equations for Paths on a Lie Group
<ss:differential-equations-for-paths>
By means of left or right translations we may define natural isomorphisms
between tangent spaces to the Lie group $G$ at different points. Let $l(g)$ be a
left translation by $g in G$, i.e. the transformation $x |-> g x$, and $r'(g)$
the right translation by $g$, i.e. the transformation $x |-> x g$. For any
$xi in T_h (G)$ put
$
  g xi & = d l(g)(xi) in T_(g h) (G), \
  xi g & = d r'(g)(xi) in T_(h g) (G).
$
In particular, if $xi in frak(g)$ then $g xi, xi g in T_g (G)$.

Evidently, if $G subset GL(V)$ is a linear Lie group and its tangent spaces at
different points are naturally embedded into $upright(L)(V)$, then $g xi$ and
$xi g$ are the usual products of linear transformations.

#problem[Let $G$ be a Lie group. Then
  $ (g h) xi = g(h xi), wide (g xi) h = g(xi h), wide (xi g) h = xi(g h) $
  for any $g, h in G$, $xi in frak(g)$.] <pr:translated-vectors-associativity>

Also, note that by the definition of the adjoint representation we have
$ g xi g^(-1) = (Ad g) xi wide (xi in frak(g)) $

#problem[Suppose a coordinate system with the origin at the unit $e$ of a Lie
  group $G$ is chosen in a neighbourhood of $e$. This naturally determines
  coordinate systems on the tangent spaces. Then the Taylor series expansions of
  coordinates of “products” $g xi$ and $xi g$, where $xi in frak(g)$, are of the
  form
  $
    overline(g xi) & = overline(xi) + alpha(overline(g), overline(xi))
                     + dots.c, \
    overline(xi g) & = overline(xi) + alpha(overline(xi), overline(g))
                     + dots.c,
  $
  where $alpha$ is the bilinear vector-valued function from
  formula~@eq:product-taylor-expansion and dots stand for the terms linear in
  $overline(xi)$ and of degree $>= 2$ in
  $overline(g)$.] <pr:translated-vector-expansion>

#problem[Let $f: G -> H$ be a Lie group homomorphism. Then
  $
    d f(g xi) & = f(g) d f(xi) \
    d f(xi g) & = d f(xi) f(g)
  $
  for any $g in G$ and $xi in T(G)$.] <pr:homomorphism-commutes-translations>

#source(41)One of the constructed parametrizations of tangent spaces of a Lie
group $G$ with the elements of the tangent algebra $frak(g)$ may be used to
describe the differentiable paths in $G$ in terms of $frak(g)$. This description
will play an important role in the remainder of this section.

A continuous map of a connected subset of the real line into the manifold $X$ is
called a #idx("Path")_path_ in $X$.

For any differentiable path $t |-> g(t)$ in a Lie group $G$ define a path
$t |-> xi(t)$ in the Lie algebra $frak(g)$ of $G$ by the equation
$ (d g(t))/(d t) = xi(t) g(t). $ <eq:path-velocity-equation>
The path $xi(t)$ is called the #idx("velocity of a path")_velocity_ of the path
$g(t)$.

A velocity $xi(t)$ being given, equation~@eq:path-velocity-equation may be
considered as a differential equation for $g(t)$. Written in local coordinates
it is of the form
$
  (d overline(g)(t))/(d t) = F(overline(xi)(t), overline(g)(t)),
$ <eq:velocity-equation-in-coordinates>
where $overline(g)(t)$ and $overline(xi)(t)$ are the columns of coordinates of
the elements $g(t) in G$ and $xi(t) in frak(g)$, respectively, and $F$ is a
differentiable vector-valued function, that depends only on the chosen
coordinate system on $G$ and on the coordinate system on $frak(g)$.

The uniqueness theorem for a system of ordinary differential equations implies
that the velocity $xi(t)$ and the initial value $g(t_0) = g_0$ uniquely
determine the curve $g(t)$. The latter relation in
Problem~@pr:translated-vectors-associativity shows that the set of solutions of
@eq:path-velocity-equation is invariant with respect to right translations.
Since we can obtain any initial value by an appropriate right translation, any
two solutions of @eq:path-velocity-equation are obtained from each other by a
right translation.

Let us now discuss the existence of a solution of @eq:path-velocity-equation.

#proposition[Let $t |-> xi(t)$ be a differentiable map of a connected subset
  $S subset RR$ into the tangent algebra of a Lie group $G$. Then there exists a
  solution of @eq:path-velocity-equation defined for all
  $t in S$.] <prop:velocity-equation-global-solution>

#proof[Clearly, it suffices to prove the proposition in the case when $S$ is a
  segment. Furthermore, it suffices to show that there exists $epsilon > 0$ such
  that for any $t_0 in S$ there exists a solution of @eq:path-velocity-equation
  defined for $abs(t - t_0) < epsilon$. Since the set of solutions is invariant
  with respect to right translations, we may assume that $g(t_0) = e$. Choose a
  coordinate system in a neighbourhood $cal(O)(e)$ of the unit of $G$, which
  sends the unit to zero. Let $R$ be a positive number such that the
  neighbourhood $cal(O)(e)$ in the local coordinate system contains the ball
  $norm(x) < R$. (Hereafter $norm(x)$ stands for the Euclidean norm of the
  column-vector $x$). Choose a coordinate system in the tangent algebra
  $frak(g)$ and put $C = max_(t in S) norm(xi(t))$. Suppose that
  equation~@eq:path-velocity-equation in the above coordinate systems is of the
  form~@eq:velocity-equation-in-coordinates and put
  #source(42)
  $ M = max_(norm(x) <= C, norm(y) <= R) norm(F(x, y)). $
  Then by the known existence theorem for a system of differential equations
  [@bib:Dieudonne1966], equation~@eq:velocity-equation-in-coordinates has a
  solution defined for $abs(t - t_0) < R\/M$ and $t in S$. Since $R\/M$ does not
  depend on $t_0$, it may be taken as the desired $epsilon$.]

=== Uniqueness Theorem for Lie Group Homomorphisms
<ss:homomorphism-uniqueness>

#theorem[A homomorphism of a connected Lie group $G$ into a Lie group $H$ is
  uniquely determined by the corresponding tangent homomorphism of Lie
  algebras.] <th:homomorphism-determined-by-differential>

#proof[Let $phi = d f$ be the tangent homomorphism of the homomorphism
  $f: G -> H$. Let us show how $f$ can be recovered from $phi$.

  Let us join an arbitrary element $g in G$ with the unit by a differentiable
  path $g(t)$, where $0 <= t <= 1$. Let $xi(t)$ be the velocity of this path.
  Put $h(t) = f(g(t))$. Problem~@pr:homomorphism-commutes-translations implies
  that
  $ (d h(t))/(d t) = phi(xi(t)) h(t). $ <eq:homomorphism-path-equation>
  This relation may be considered as a differential equation for $h(t)$.
  Together with the initial condition $h(0) = e$ it uniquely determines the path
  $h(t)$ and therefore the element $f(g) = h(1)$.]

#theorem[Let $f$ be a homomorphism of a connected Lie group $G$ into a Lie group
  $H$. Let $H_1$ be a Lie subgroup of $H$. If $d f(frak(g)) subset frak(h)_1$,
  then $f(G) subset H_1$.] <th:homomorphism-into-subgroup-criterion>

#proof[If $phi(frak(g)) subset frak(h)_1$ then
  equation~@eq:homomorphism-path-equation may be considered as an equation in
  the group $H_1$. Its solution in $H_1$ is at the same time a solution in $H$.
  Hence, $h(t) in H_1$ for any $t in [0, 1]$ and, in particular,
  $f(g) = h(1) in H_1$.]

Theorems~@th:homomorphism-determined-by-differential and
@th:homomorphism-into-subgroup-criterion have plenty of important corollaries.

#problem[The kernel of the adjoint representation of a connected Lie group $G$
  coincides with the center $Z(G)$ of $G$.] <pr:adjoint-kernel-is-center>

Define the #idx("center of a Lie algebra")_center_ of a Lie algebra $frak(g)$ to
be the set $frak(z)(frak(g)) = {zeta in frak(g): [zeta, xi] = 0
  "for any" xi in frak(g)}$.

#problem[The tangent algebra of the center of a connected Lie group $G$
  coincides with the center $frak(z)(frak(g))$ of the tangent algebra
  $frak(g)$.] <pr:tangent-algebra-of-center>

#problem[Let $R$ be a linear representation of a connected Lie group $G$ in a
  space $V$. A subspace $U subset V$ is invariant with respect to $R$ if and
  only if it is invariant with respect to the tangent representation $d R$ of
  the Lie algebra $frak(g)$.] <pr:invariant-subspaces-group-algebra>

#problem[Let $G_1$ and $G_2$ be connected Lie subgroups of $G$. Then
  $
    & G_1 subset G_2 <=> frak(g)_1 subset frak(g)_2 quad "and" \
    & G_1 = G_2 <=> frak(g)_1 = frak(g)_2.
  $] <pr:connected-subgroups-by-subalgebras>

#problem[#source(43)A connected Lie subgroup $H$ of a connected Lie group $G$ is
  normal if and only if its tangent algebra $frak(h)$ is an ideal of
  $frak(g)$.] <pr:normal-subgroup-iff-ideal>

=== Exponential Map <ss:exponential-map>
A differentiable path $g(t)$ in a Lie group $G$ defined for all $t in RR$ is
called a #idx("subgroup", "one-parameter")_one-parameter subgroup_ if
$ g(s + t) = g(s) g(t) $
(and then we automatically have $g(0) = e$ and $g(-t) = g(t)^(-1)$).

In other words, a one-parameter subgroup is a homomorphism of the Lie group $RR$
into $G$. Sometimes one defines a one-parameter subgroup to be the image of such
a homomorphism. As Problem~@pr:torus-winding-commensurable shows a one-parameter
subgroup in the latter sense may fail to be a Lie subgroup.

#problem[The path $g(t)$ defined by the differential
  equation~@eq:path-velocity-equation is a one-parameter subgroup if and only if
  $xi(t) = "const"$ and $g(0) = e$.] <pr:one-parameter-subgroup-velocity>

For any $xi in frak(g)$ put $g_xi (t)$ for the one-parameter subgroup defined by
equation~@eq:path-velocity-equation, where $xi(t) equiv xi$. Call $xi$ its
directing vector. For $G = GL(V)$ it is known (and constitutes the theory of
systems of linear differential equations with constant coefficients) that
$ g_xi (t) = exp(t xi) $
where the exponent is understood as the sum of the series
$ exp X = sum_(k >= 0) X^k / k! wide (X in upright(L)(V)). $

The same is obviously true for any linear Lie group.

For an arbitrary Lie group $G$ put
$ exp(xi) = g_xi (1), quad "where" quad xi in frak(g). $
The map $exp: frak(g) -> G$ thus defined is called the #idx(
  "exponential map",
)_exponential map._ Here are some of its properties.

#problem[$g_xi (t) = exp(t xi)$.] <pr:one-parameter-subgroup-via-exp>

#problem[$exp$ is differentiable.] <pr:exp-differentiable>

#problem[$d_0 exp = Id$.] <pr:exp-differential-at-zero>

This implies the following statement.

#proposition[The map $exp$ is a diffeomorphism of a neighbourhood of zero of the
  tangent algebra $frak(g)$ onto a neighbourhood of the unit of
  $G$.] <prop:exp-local-diffeomorphism>

However at the global level, the exponential map does not possess, in general,
any nice properties. It may be neither injective, nor onto, nor open, etc. (see
Exercises~@exc:exp-complex-gln-surjective and @exc:exp-real-sl2-not-surjective).

#problem[#source(44)Let $f: G -> H$ be a Lie group homomorphism. Then
  $ f(exp(xi)) = exp(d f(xi)) wide "for any" xi in frak(g). $
  In particular,
  $
    Ad exp xi = exp ad xi wide "for any" xi in frak(g).
  $] <pr:homomorphism-commutes-with-exp>

As an example consider the homomorphism $det: GL_n (K) -> K^*$. Since
$d(det) = tr$ (Problem~@pr:differential-of-determinant), we have
$ det exp A = e^(tr A) $
for any $A in upright(L)_n (K)$.

#problem[If $[xi, eta] = 0$ then
  $exp(xi + eta) = exp xi dot exp eta$.] <pr:exp-of-commuting-sum>

In particular, if $G$ is a commutative Lie group then the same applies to any
$xi, eta in frak(g)$, i.e. $exp$ is a homomorphism of the vector group $frak(g)$
into $G$. Proposition~@prop:exp-local-diffeomorphism implies that the kernel of
this homomorphism is discrete and its image is an open subgroup of $G$. This can
be used to classify the connected commutative Lie groups.

#problem[If $G$ is a connected commutative Lie group then $exp frak(g) = G$.
  Therefore, any $n$-dimensional connected commutative Lie group over $K$ is
  isomorphic to $K^n\/Gamma$, where $Gamma$ is a discrete subgroup of
  $K^n$.] <pr:commutative-group-as-quotient>

#problem[If $G_1$ and $G_2$ are isomorphic commutative Lie groups then there
  exists an isomorphism of their tangent algebras which maps the kernel of the
  homomorphism $exp: frak(g)_1 -> G_1$ into the kernel of the homomorphism
  $exp: frak(g)_2 -> G_2$.] <pr:commutative-isomorphism-exp-kernels>

Therefore, if $Gamma_1$ and $Gamma_2$ are two discrete subgroups of $K^n$ then
the groups $K^n\/Gamma_1$ and $K^n\/Gamma_2$ are isomorphic (as Lie groups) if
and only if $Gamma_1$ can be transformed into $Gamma_2$ by a nondegenerate
linear transformation of $K^n$.

When $K = RR$ there is a simple classification of discrete subgroups of $K^n$:

#problem[Any discrete subgroup $Gamma$ of the vector Lie group $RR^n$ is
  transformed by a nondegenerate linear transformation into a subgroup of the
  form
  $
    Gamma_k = {(x_1, ..., x_n) in RR^n: x_1, ..., x_k in ZZ,
      x_(k+1) = dots.c = x_n = 0}
  $] <pr:discrete-subgroups-real-vector-space>

This implies

#proposition[Any $n$-dimensional connected commutative real Lie group is
  isomorphic to a Lie group of the form
  $TT^k times RR^(n-k)$.] <prop:commutative-real-lie-groups>

When $K = CC$ the classification of connected commutative Lie groups is
considerably more complicated (see
Exercises~@exc:noncompact-one-dimensional-complex and
@exc:one-dimensional-complex-tori).

Let us demonstrate one more application of the exponential map.

#problem[#source(45)Let $sigma$ be an automorphism of a Lie group $G$. Then
  $ G^sigma = {g in G: sigma(g) = g} $
  is a Lie subgroup with the tangent algebra
  $
    frak(g)^sigma = {xi in frak(g): d sigma(xi) = xi}.
  $] <pr:automorphism-fixed-point-subgroup>

=== Existence Theorem for Lie Group Homomorphisms <ss:homomorphism-existence>

#theorem[Let $G$ and $H$ be Lie groups and let $G$ be simply connected. Then for
  any Lie algebra homomorphism $phi: frak(g) -> frak(h)$ there exists a Lie
  group homomorphism $f: G -> H$ such that
  $d f = phi$.] <th:homomorphism-existence-simply-connected>

#proof[Let us try to construct $f$ following the lines of the proof of
  Theorem~@th:homomorphism-determined-by-differential. Namely, in order to
  define the image of an element $g in G$ let us connect it with the unit by a
  differentiable path $g(t)$, where $0 <= t <= 1$, and find the velocity $xi(t)$
  of this path. Furthermore, consider a solution $h(t)$ of
  equation~@eq:homomorphism-path-equation with the initial value $h(0) = e$. Set
  $f(g) = h(1)$.

  Since there is an arbitrariness in the choice of $g(t)$, we must prove that
  $f(g)$ is well defined. This constitutes the bulk of the proof of the theorem.

  We will use the fact that in a simply connected differentiable manifold $X$
  for any two differentiable paths $alpha_0$ and $alpha_1$ that join some points
  $x_0$ and $x_1$ there is a differentiable homotopy of $alpha_0$ into
  $alpha_1$, i.e. a differentiable map of the square
  $ I^2 = {(t_1, t_2) in RR^2: 0 <= t_1, t_2 <= 1} $
  into $X$ such that the bottom line is transformed into $alpha_0$ and the top
  line is transformed into $alpha_1$, while the side lines are transformed into
  $x_0$ and $x_1$, respectively.

  #lemma(numbered: false)[Let $(t_1, t_2) |-> g(t_1, t_2)$ be a differentiable
    map of $I^2$ into a Lie group $G$. Let
    $
      cases(
        display((partial g(t, s))/(partial t)) & = xi(t, s) g(t, s),
        display((partial g(t, s))/(partial s)) & = eta(t, s) g(t, s)\,,
      )
    $ <eq:two-parameter-velocity-system>
    where $xi(t, s), eta(t, s) in frak(g)$. Then
    $
      (partial eta(t, s))/(partial t) - (partial xi(t, s))/(partial s)
      = [xi(t, s), eta(t, s)].
    $ <eq:velocity-compatibility-condition>]

  #source(46)_Proof of the lemma._ Since $xi(t, s)$ and $eta(t, s)$ do not
  change under the multiplication of $g(t, s)$ on the right by any element of
  the group, then, proving @eq:velocity-compatibility-condition at a point
  $(t_0, s_0)$ we may assume that $g(t_0, s_0) = e$.

  Choose a coordinate system in a neighbourhood of the unit of $G$ and write
  @eq:two-parameter-velocity-system in coordinates in a neighbourhood of
  $(t_0, s_0)$. By Problem~@pr:translated-vector-expansion we get
  $
    cases(
      display((partial overline(g)(t, s))/(partial t))
      & = overline(xi)(t, s)
      + alpha(overline(xi)(t, s), overline(g)(t, s)) + dots.c,
      display((partial overline(g)(t, s))/(partial s))
      & = overline(eta)(t, s)
      + alpha(overline(eta)(t, s), overline(g)(t, s)) + dots.c\,,
    )
  $
  where dots stand for the terms of degree $>= 2$ in $(t - t_0, s - s_0)$. The
  differentiation of the first of these equations with respect to $s$ and of the
  second one with respect to $t$ performed at $(t_0, s_0)$ yields
  $
    (partial^2 overline(g)(t_0, s_0))/(partial t partial s)
    & = (partial overline(xi)(t_0, s_0))/(partial s)
    + alpha(overline(xi)(t_0, s_0), overline(eta)(t_0, s_0)) \
    & = (partial overline(eta)(t_0, s_0))/(partial t)
    + alpha(overline(eta)(t_0, s_0), overline(xi)(t_0, s_0)),
  $
  whence
  $
    (partial overline(eta)(t_0, s_0))/(partial t)
    - (partial overline(xi)(t_0, s_0))/(partial s)
    = gamma(overline(xi)(t_0, s_0), overline(eta)(t_0, s_0)).
  $
  This means that
  $
    (partial eta(t_0, s_0))/(partial t) - (partial xi(t_0, s_0))/(partial s)
    = [xi(t_0, s_0), eta(t_0, s_0)].
  $
  The lemma is proved.#qed-mark

  Let us continue with the proof of the theorem. Let $g_0 (t)$ and $g_1 (t)$ be
  two differentiable paths in $G$ that join $e$ with $g$. The corresponding
  paths in $H$ obtained as the solutions of
  equation~@eq:homomorphism-path-equation will be denoted by $h_0 (t)$ and
  $h_1 (t)$. We must show that $h_0 (1) = h_1 (1)$.

  There is a differentiable map $(t, s) |-> g(t, s)$ of the square $I^2$ into
  $G$ satisfying

  1) $g(t, 0) = g_0 (t)$, $g(t, 1) = g_1 (t)$;

  2) $g(0, s) = e$, $g(1, s) = g$.

  Find $xi(t, s)$ and $eta(t, s)$ from
  equations~@eq:two-parameter-velocity-system. The property 2) implies that
  $ eta(0, s) = eta(1, s) = 0. $

  #source(47)Now, define the differentiable map $(t, s) |-> h(t, s)$ of $I^2$
  into $H$ as the solution of the initial value problem for the differential
  equation in $t$ with $s$ as a parameter:
  $
    (partial h(t, s))/(partial t) = phi(xi(t, s)) h(t, s), wide h(0, s) = e.
  $

  Clearly, $h(t, 0) = h_0 (t)$ and $h(t, 1) = h_1 (t)$.

  Let
  $ (partial h(t, s))/(partial s) = zeta(t, s) h(t, s), $
  where $zeta(t, s) in frak(h)$. Let us prove that
  $zeta(t, s) = phi(eta(t, s))$. This will imply that $zeta(1, s) = 0$, hence
  $h(1, s) = "const"$. In particular, we get $h_0 (1) = h_1 (1)$.

  By Lemma,
  $
    (partial zeta(t, s))/(partial t) = (partial phi(xi(t, s)))/(partial s)
    + [phi(xi(t, s)), zeta(t, s)].
  $
  This relation may be considered as a differential equation (in $t$) for
  $zeta(t, s)$. Applying $phi$ to @eq:velocity-compatibility-condition we obtain
  the same differential equation for $phi(eta(t, s))$. Since
  $ zeta(0, s) = phi(eta(0, s)) = 0, $
  $zeta(t, s) = phi(eta(t, s))$ for any $t$.

  Thus, we have defined the mapping $f: G -> H$. Let us prove that $f$ is a
  homomorphism.

  Suppose $g_1 (t)$ and $g_2 (t)$, where $0 <= t <= 1$, are differentiable paths
  in $G$ that join $e$ with $g_1$ and $g_2$, respectively, $xi_1 (t)$ and
  $xi_2 (t)$ are their velocities. The path that connects $e$ with $g_1 g_2$ may
  be defined by
  $
    g(t) = cases(
      g_2 (2t) & "for" 0 <= t <= 1\/2,
      g_1 (2t - 1) g_2 & "for" 1\/2 <= t <= 1.
    )
  $
  Under an appropriate choice of paths $g_1 (t)$ and $g_2 (t)$ the path $g(t)$
  is differentiable. Its velocity $xi(t)$ is defined by
  $
    xi(t) = cases(
      2 xi_2 (2t) & "for" 0 <= t <= 1\/2,
      2 xi_1 (2t - 1) & "for" 1\/2 <= t <= 1.
    )
  $

  If $h_1 (t)$, $h_2 (t)$ and $h(t)$ are paths in $H$ corresponding to the paths
  $g_1 (t)$, $g_2 (t)$ and $g(t)$, then
  $
    h(t) = cases(
      h_2 (2t) & "for" 0 <= t <= 1\/2,
      h_1 (2t - 1) h_2 (1) & "for" 1\/2 <= t <= 1.
    )
  $
  #source(48)In particular,
  $ f(g_1 g_2) = h(1) = h_1 (1) h_2 (1) = f(g_1) f(g_2). $

  From the construction of $f$ we see that $f(exp(xi)) = exp phi(xi)$ for any
  $xi in frak(g)$, i.e. the diagram
  $
    #cd(
      (
        A: (0, 0, $frak(g)$),
        B: (0, 1, $frak(h)$),
        C: (1, 0, $G$),
        D: (1, 1, $H$),
      ),
      (
        ar("A", "B", label: $phi$),
        ar("A", "C", label: $exp$, side: "right"),
        ar("B", "D", label: $exp$),
        ar("C", "D", label: $f$, side: "right"),
      ),
      column: 24mm,
      row: 22mm,
    )
  $
  is commutative. Proposition~@prop:exp-local-diffeomorphism and
  Problem~@pr:exp-differential-at-zero show that $f$ is differentiable in a
  neighbourhood of the unit of $G$ and $d_e f = phi$. The homomorphism $f$ is
  differentiable at any point $g in G$ because the diagram
  $
    #cd(
      (A: (0, 0, $G$), B: (0, 1, $H$), C: (1, 0, $G$), D: (1, 1, $H$)),
      (
        ar("A", "B", label: $f$),
        ar("A", "C", label: $l(g)$),
        ar("B", "D", label: $l(h)$),
        ar("C", "D", label: $f$),
      ),
      column: 24mm,
      row: 22mm,
    )
  $
  where $h = f(g)$ is commutative. The theorem is proved.]

#corollary[Simply connected Lie groups are isomorphic if and only if their
  tangent Lie algebras are isomorphic.]

=== Virtual Lie Subgroups <ss:virtual-lie-subgroups>
As we have seen (Problem~@pr:torus-winding-commensurable), the image of a Lie
group under a homomorphism is not always a Lie subgroup. More general subgroups
obtained in this way can sometimes serve as substitutes of Lie subgroups.

A #idx("Lie subgroup", "virtual")_virtual Lie subgroup_ of a Lie group $G$ is a
subgroup endowed with a Lie group structure so that the identity embedding
$i: H -> G$ is a Lie group homomorphism. We will assume that $frak(h)$ is
embedded into $frak(g)$ via $d i$.

Clearly, any Lie subgroup (endowed with the induced Lie subgroup structure) is a
virtual Lie subgroup.

#problem[Let $f: H -> G$ be an arbitrary Lie group homomorphism. Then the group
  $f(H)$ endowed with a Lie group structure as the quotient group $H\/Ker f$ is
  a virtual Lie subgroup of $G$ with the tangent algebra
  $d f(frak(h))$.] <pr:homomorphic-image-virtual-subgroup>

The topology of a virtual Lie subgroup can be different from the topology
induced by the ambient group. This is the case for a dense winding of the torus
$TT^2$ which carries the Lie group (in particular, the topology) structure of
$RR$ but intersects with any nonempty open subset of the torus on an unbounded
subset of $RR$.

#source(49)However, Theorem~@th:kernel-is-lie-subgroup implies that any
sufficiently small neighbourhood $cal(O)_H (e)$ of the unit of a virtual Lie
subgroup $H$ is a submanifold of the ambient Lie group (in particular, possesses
the induced topology) and $T_e (cal(O)_H (e)) = frak(h)$.

The following problem elucidates the topological structure of virtual Lie
subgroups.

#problem[Let $H$ be a virtual Lie subgroup of $G$. There exists a neighbourhood
  $cal(O)_H (e)$ of the unit of $H$ and a submanifold $S subset G$ containing
  the unit such that the map
  $ nu: S times cal(O)_H (e) -> G, wide (s, h) |-> s h, $
  is a diffeomorphism of $S times cal(O)_H (e)$ onto a neighbourhood
  $cal(O)_G (e)$ of the unit of $G$ and
  $ H inter cal(O)_G (e) = T cal(O)_H (e), $
  where $T = H inter S$ is finite or countable. If $cal(O)_H (e)$ is connected,
  it is a connected component of $H inter cal(O)_G (e)$ in the induced
  topology.] <pr:virtual-subgroup-local-structure>

#theorem[Let $G_1$, $G_2$ be virtual Lie subgroups of $G$. If $G_1 subset G_2$
  then $G_1$ is a virtual Lie subgroup of $G_2$ and
  $frak(g)_1 subset frak(g)_2$. Conversely, if $frak(g)_1 subset frak(g)_2$ and
  $G_1$ is connected then $G_1 subset G_2$.] <th:virtual-subgroups-inclusion>

#problem[Prove this theorem.] <pr:prove-virtual-subgroups-inclusion>

#corollary[If virtual Lie subgroups $G_1$, $G_2$ of $G$ coincide as subsets then
  they carry the same Lie group
  structure.] <cor:virtual-subgroup-structure-unique>

#corollary[A connected virtual Lie subgroup is uniquely determined by its
  tangent algebra (the subalgebra of the tangent algebra of the ambient Lie
  group).] <cor:connected-virtual-subgroup-by-algebra>

Introducing virtual Lie subgroups makes the correspondence between Lie subgroups
and subalgebras of the tangent algebra more complete. Namely, the following
holds:

#theorem[Any subalgebra $frak(h)$ of the tangent algebra of a Lie group $G$ is
  the tangent algebra of a (uniquely determined) connected virtual Lie subgroup
  $H$.] <th:subalgebra-has-virtual-subgroup>

Proof of this theorem will be given in n.~@ss:existence-virtual-lie-subgroups.

There exists a simple topological characterization of Lie subgroups and virtual
Lie subgroups of real Lie groups. By E.~Cartan's theorem _any closed subgroup of
a real Lie group is a Lie subgroup_ (proof of this theorem can be found e.g. in
[@bib:Chevalley1946] or [@bib:Adams1969]). Therefore Lie subgroups of real Lie
groups are the same as closed subgroups.

_Any pathwise connected subgroup of a real Lie group is a virtual Lie subgroup_
(#idx("Yamabe’s theorem")_Yamabe's theorem_, see [@bib:Goto1969]). Therefore
virtual Lie subgroups of a real Lie group are just the subgroups with a finite
or countable number of pathwise connected components (in the induced topology).

=== Automorphisms and Derivations <ss:automorphisms-and-derivations>
#source(50)Let $G$ be a connected Lie group and #idx(
  "automorphism of a Lie group",
)$Aut G$ the group of its automorphisms (as of a Lie group).

Any group automorphism of $G$ generates an automorphism of its tangent algebra
$frak(g)$. If $G$ is simply connected then the converse is true
(Theorem~@th:homomorphism-existence-simply-connected); in this case $Aut G$ is
naturally isomorphic to #idx(
  "automorphism of a Lie algebra",
)$Aut frak(g)$, the automorphism group of the Lie algebra $frak(g)$. The latter
group is a linear Lie group (Example~@exm:algebra-automorphism-group).
Therefore, $Aut G$ is naturally endowed with a Lie group structure provided $G$
is simply connected.

#problem[The action of the Lie group $Aut G$ on a simply connected Lie group $G$
  is differentiable.] <pr:automorphism-action-differentiable>

Similarly as for abstract groups, the #idx(
  "automorphism of a Lie group",
  "inner",
)inner automorphisms of a Lie group $G$ constitute a normal subgroup of $Aut G$
isomorphic to the quotient group $G\/Z$ (where $Z$ is the center of $G$) and
denoted by $Int G$. Accordingly, their differentials $Ad g$, $g in G$, called
the #idx("automorphism of a Lie algebra", "inner")_inner automorphisms_ of the
Lie algebra $frak(g)$, constitute the normal subgroup of $Aut frak(g)$. This
subgroup is denoted by $Int frak(g)$.

The quotient group $Aut G\/Int G$ (resp. $Aut frak(g)\/Int frak(g)$) is called
the _group of outer automorphisms_ of the Lie group $G$ (resp. Lie algebra
$frak(g)$). (Clearly, this term should not be understood literally. Moreover the
outer, i.e. not inner, automorphisms do _not_ constitute a group at all.) For a
simply connected group $G$ we have the natural isomorphism
$Aut G\/Int G tilde.eq Aut frak(g)\/Int frak(g)$.

The group $Int frak(g)$, being the image of $G$ under the adjoint
representation, is a virtual Lie subgroup of $Aut frak(g)$. However, it might be
not a genuine Lie subgroup: cf. Exercise~@exc:inner-automorphisms-not-closed.

The tangent algebra of $Aut frak(g)$ is the Lie algebra $der frak(g)$ of
derivations of $frak(g)$ (Example~@exm:derivations-as-tangent-algebra). The
tangent algebra of $Int frak(g)$ is the image of $frak(g)$ under the
homomorphism
$ ad = d Ad: frak(g) -> der frak(g) $
This shows, in particular, (see
Corollary~@cor:connected-virtual-subgroup-by-algebra of
Theorem~@th:virtual-subgroups-inclusion) that $Int frak(g)$ does not depend on
the choice of $G$ from connected Lie groups with the tangent algebra $frak(g)$.

The derivations of the form $ad xi$, $xi in frak(g)$, are called the #idx(
  "Derivation of a Lie algebra",
  "inner",
)_inner derivations_ of the Lie algebra $frak(g)$.

#problem[The inner derivations constitute an ideal of $der frak(g)$. More
  precisely
  $
    [D, ad xi] = ad D xi wide "for any" D in der frak(g),
    xi in frak(g).
  $ <eq:derivation-ad-commutator>] <pr:inner-derivations-ideal>

_Examples._ #eg <exm:commutative-algebra-automorphisms> If $frak(g)$ is a
commutative Lie algebra then
$ Aut frak(g) = GL(frak(g)), wide Int frak(g) = {E}. $

#eg <exm:nil-triangular-automorphisms> Let $frak(g)$ be the Lie algebra of
nil-triangular (triangular with zeroes on the diagonal) $3 times 3$ matrices.
This is the tangent algebra of the Lie group of unitriangular $3 times 3$
matrices. For its basis take:
#source(51)
$
  X = mat(0, 1, 0; 0, 0, 0; 0, 0, 0), quad
  Y = mat(0, 0, 0; 0, 0, 1; 0, 0, 0), quad
  Z = mat(0, 0, 1; 0, 0, 0; 0, 0, 0),
$
with the commutation relations
$ [X, Y] = Z, wide [X, Z] = [Y, Z] = 0. $
The subspace $frak(z) = chevron.l Z chevron.r$ is the center of $frak(g)$. Any
automorphism should transform $frak(z)$ into itself, i.e. multiply $Z$ by some
$c != 0$. It is subject to a straightforward verification that such an
automorphism induces in $frak(g)\/frak(z)$ a linear transformation with
determinant $c$. Conversely, any linear transformation with these properties is
an automorphism of $frak(g)$. The inner automorphisms are of the form
$ X |-> X + a Z, quad Y |-> Y + b Z, quad Z |-> Z quad (a, b in K). $
The group $Int frak(g)$ in this case is a Lie subgroup of $Aut frak(g)$ and is
isomorphic to the two-dimensional vector group. The quotient group
$Aut frak(g)\/Int frak(g)$ (the group of outer automorphisms of $frak(g)$) is
isomorphic to $GL_2 (K)$.

#eg <exm:affine-line-algebra-automorphisms> Let $frak(g)$ be the Lie algebra of
matrices of the form $mat(x, y; 0, 0)$, where $x, y in K$. This is the tangent
algebra of the Lie group $G$ of matrices of the form $mat(a, b; 0, 1)$, where
$a, b in K$, $a != 0$. The group $G$ is isomorphic to the group of affine
transformations of the line. For the basis of $frak(g)$ take
$X = mat(1, 0; 0, 0)$, and $Y = mat(0, 1; 0, 0)$, satisfying $[X, Y] = Y$. A
straightforward calculation shows that the inner automorphism defined by
$mat(a, b; 0, 1) in G$ acts as follows:
$ X |-> X - b Y, wide Y |-> a Y. $
On the other hand, any automorphism of $frak(g)$ is, clearly, of this form.
Thus, in this case
$ Aut frak(g) = Int frak(g) tilde.eq G. $

=== The Tangent Algebra of a Semidirect Product of Lie Groups
<ss:tangent-algebra-semidirect-product>
To semidirect products of Lie groups there correspond _semidirect sums_ of Lie
algebras (which could as well have been called _semidirect products_).

A semidirect sum of Lie algebras $frak(g)_1$ and $frak(g)_2$ is the direct sum
of vector spaces $frak(g)_1$ and $frak(g)_2$ endowed with the bracket
#source(52)
$
  [(xi_1, xi_2), (eta_1, eta_2)]
  = ([xi_1, eta_1] + beta(xi_2) eta_1 - beta(eta_2) xi_1, [xi_2, eta_2]),
$ <eq:semidirect-sum-bracket>
where $beta$ is a Lie algebra homomorphism $frak(g)_2 -> der frak(g)_1$. We will
denote the semidirect sum by $frak(g)_1 plus.o.r frak(g)_2$, or more prudently
by $frak(g)_1 plus.o.r_beta frak(g)_2$.

#problem[A semidirect sum of Lie algebras is a Lie
  algebra.] <pr:semidirect-sum-is-lie-algebra>

The elements of the form $(xi_1, 0)$ (resp. $(0, xi_2)$) constitute a subalgebra
of $frak(g)_1 plus.o.r frak(g)_2$ isomorphic to $frak(g)_1$ (resp. $frak(g)_2$),
usually identified with $frak(g)_1$ (resp. $frak(g)_2$). The subalgebra
$frak(g)_1$ is an ideal and
$
  [xi_2, xi_1] = beta(xi_2) xi_1, wide
  (xi_1 in frak(g)_1, xi_2 in frak(g)_2).
$ <eq:semidirect-sum-action>
The subalgebra $frak(g)_2$ is an ideal if and only if $beta = 0$. In this case
the semidirect sum is isomorphic to the direct sum $frak(g)_1 plus.o frak(g)_2$.

_Example._ Let $V$ be a vector space considered as a commutative Lie algebra.
Then $der V = frak("gl")(V)$. For any linear representation
$rho: frak(g) -> frak("gl")(V)$ of $frak(g)$ we may construct the semidirect sum
$V plus.o.r_rho frak(g)$ which is also a Lie algebra. The space $V$ is a
commutative ideal in it.

One says that a Lie algebra $frak(g)$ splits into a #idx(
  "sum of Lie algebras",
  "semidirect",
)_semidirect sum of Lie subalgebras_ $frak(g)_1$ and $frak(g)_2$ if

1) $frak(g)_1$ is an ideal;

2) $frak(g)$ is the direct sum of subspaces $frak(g)_1$ and $frak(g)_2$ as a
vector space.

In this case we have an isomorphism
$
  frak(g)_1 plus.o.r_beta frak(g)_2 tilde.equiv frak(g), wide
  (xi_1, xi_2) |-> xi_1 + xi_2,
$
where $beta: frak(g)_2 -> der frak(g)_1$ is the homomorphism defined by
formula~@eq:semidirect-sum-action. In this situation we will write
$frak(g) = frak(g)_1 plus.o.r frak(g)_2$ or
$frak(g) = frak(g)_2 plus.o.l frak(g)_1$.

#theorem[The tangent algebra of the semidirect product $G_1 times.r_b G_2$ of
  Lie groups $G_1$ and $G_2$ is the semidirect sum
  $frak(g)_1 plus.o.r_beta frak(g)_2$ of their tangent algebras and
  $beta = d B$, where $B: G_2 -> Aut frak(g)_1$ is a Lie group homomorphism
  defined by the formula $B(g_2) = d(b(g_2))$ for any
  $g_2 in G_2$.] <th:semidirect-product-tangent-algebra>

#problem[Prove this theorem.] <pr:prove-semidirect-tangent-algebra>

_Examples._ #eg <exm:representation-semidirect-sum> Let $R: G -> GL(V)$ be a
linear representation of a Lie group $G$. The tangent algebra of the semidirect
product $V times.r_R G$ (see Example~@exm:representation-semidirect-product) is
the semidirect sum $V plus.o.r_rho frak(g)$, where $rho = d R$.

#eg <exm:affine-group-tangent-algebra> The Lie group $GA(V)$ of affine
transformations of a vector space $V$ is identified with the semidirect product
$V times.r_Id GL(V)$ (see Example~@exm:affine-group-semidirect). Its tangent
algebra is identified with the semidirect sum $V plus.o.r_id frak("gl")(V)$,
where $id$ is the identity linear representation of the Lie algebra
$frak("gl")(V)$ in $V$.

#problem[Let $G_1$ and $G_2$ be simply connected Lie groups. For any
  homomorphism $beta: frak(g)_2 -> der frak(g)_1$ there exists a homomorphism
  $b: G_2 -> Aut G_1$, such that #source(53)the $G_2$-action on $G_1$ defined by
  $b$ is differentiable and the tangent algebra of the semidirect product
  $G_1 times.r_b G_2$ is
  $frak(g)_1 plus.o.r_beta frak(g)_2$.] <pr:semidirect-sum-integrates>

#exercises[
  #exercise[The tangent algebra of the group of invertible triangular matrices
    is the Lie algebra of all triangular
    matrices.] <exc:triangular-group-tangent-algebra>

  #exercise[Let $A$ be a finite-dimensional associative algebra with unit 1 over
    a field $K$. Then the multiplicative group $A^*$ of invertible elements of
    $A$ endowed with the induced differentiable structure (as an open subset of
    the space $A$) is a Lie group. Prove that under the canonical identification
    of the tangent space $T_1 (A^*)$ with the space $A$ the bracket in the
    tangent algebra of the group $A^*$ is defined by the formula
    $[xi, eta] = xi eta - eta xi$.] <exc:associative-algebra-unit-group>

  #exercise[With the notation of @ss:tangent-algebra-definition, define a
    bilinear operation $*$ in the space $T_e (G)$ by the formula
    $
      overline(xi * eta) = alpha(overline(xi), overline(eta))
      + alpha(overline(eta), overline(xi)).
    $
    Prove that for a suitable coordinate system this operation coincides with
    any given commutative bilinear operation in
    $T_e (G)$.] <exc:symmetric-part-not-invariant>

  #exercise[The tangent algebra of the centralizer $Z(g)$ of an element $g in G$
    (see Exercise~@exc:centralizer-of-element) coincides with
    $
      frak(z)(g) = {xi in frak(g): (Ad g) xi = xi}
      = {xi in frak(g): g xi = xi g}.
    $] <exc:centralizer-of-element-algebra>

  #exercise[Suppose $xi$ is an element of the tangent algebra $frak(g)$ of a Lie
    group $G$. Its centralizer $Z(xi)$ in $G$ defined as
    $ Z(xi) = {g in G: (Ad g) xi = xi} $
    is a Lie subgroup whose tangent algebra coincides with the subalgebra
    $frak(z)(xi) = {eta in frak(g): [xi, eta] = 0}$ called the #idx(
      "centralizer",
    )_centralizer_ of $xi$ in the Lie algebra
    $frak(g)$.] <exc:centralizer-of-algebra-element>

  #exercise[Let $H$ be a connected Lie subgroup of $G$. Its normalizer
    $ N(H) = {g in G: g H g^(-1) = H} $
    is a Lie subgroup and the tangent algebra of $N(H)$ coincides with the
    algebra
    $ frak(n)(frak(h)) = {xi in frak(g): [xi, frak(h)] subset frak(h)}, $
    called the #idx("normalizer")_normalizer_ of $frak(h)$ in
    $frak(g)$.] <exc:normalizer-tangent-algebra>

  #exercise[The tangent algebra of $upright(U)_n$ consists of all skewhermitian
    $n times n$ matrices.] <exc:unitary-group-tangent-algebra>

  #exercise[Deduce the Jacobi identity in the tangent algebra of a Lie group
    directly from the associativity of the product in the Lie group. (Consider
    the terms of degree $<= 3$ in the Taylor series expansions of coordinates of
    products of any three elements close to the
    unit.)] <exc:jacobi-from-associativity>

  #exercise[#source(54)For $GL_n (CC)$ the exponential map is onto, but it is
    neither open nor injective.] <exc:exp-complex-gln-surjective>

  #exercise[For $SL_2 (RR)$ the exponential map is not
    onto.] <exc:exp-real-sl2-not-surjective>

  #exercise[If the tangent algebra of a connected Lie group $G$ is commutative
    then $G$ is commutative.] <exc:commutative-algebra-commutative-group>

  #exercise[Any noncompact connected one-dimensional complex Lie group is
    isomorphic to either $CC$ or
    $CC^*$.] <exc:noncompact-one-dimensional-complex>

  #exercise[Any compact connected one-dimensional complex Lie group is
    isomorphic to a Lie group of the form $A(u) = CC\/(ZZ + ZZ u)$, where
    $u in CC$, $Im u > 0$. The Lie groups $A(u)$ and $A(v)$ are isomorphic (as
    _complex_ Lie groups!) if and only if $v = display((a u + b)/(c u + d))$,
    where $mat(a, b; c, d) in SL_2 (ZZ)$.] <exc:one-dimensional-complex-tori>

  #exercise[Any connected compact complex Lie group $G$ is commutative. (Hint:
    For any $xi in frak(g)$ the linear transformation $ad xi$ is diagonalizable
    and its eigenvalues are purely
    imaginary.)] <exc:compact-complex-group-commutative>

  #exercise[If the center $Z$ of a connected Lie group $G$ is discrete then the
    center of the quotient group $G\/Z$ is
    trivial.] <exc:quotient-by-discrete-center>

  #exercise[A connected Lie group is nilpotent (as an abstract group) if and
    only if its tangent algebra is nilpotent. (A Lie algebra $frak(g)$ is called
    _nilpotent_ if there exists a sequence of subalgebras
    $
      frak(g) = frak(g)_0 supset frak(g)_1 supset dots.c
      supset frak(g)_(m-1) supset frak(g)_m = 0,
    $
    such that $[frak(g), frak(g)_i] subset frak(g)_(i+1)$.) (Hint: Prove that
    the center of a connected nilpotent Lie group is of positive
    dimension.)] <exc:nilpotent-group-iff-algebra>

  #exercise[The connected components of open sets in the induced topology on a
    virtual Lie subgroup constitute a base of its inner
    topology.] <exc:virtual-subgroup-inner-topology>

  #exercise[Let $frak(g)$ be the #idx("Heisenberg algebra")_Heisenberg algebra_
    i.e. the Lie algebra with basis ${x_1, ..., x_n, y_1, ..., y_n, z}$ such
    that $[x_i, y_i] = z$ ($i = 1, ..., n$), all the other brackets of base
    elements being zero. Find $Aut frak(g)$, $Int frak(g)$ and
    $Aut frak(g)\/Int frak(g)$.] <exc:heisenberg-algebra-automorphisms>

  #exercise[Let $frak(g)$ be the Lie algebra of triangular complex $3 times 3$
    matrices whose diagonal elements $x_1, x_2, x_3$ satisfy the condition
    $x_1 ratio x_2 ratio x_3 = c_1 ratio c_2 ratio c_3$, where $c_1, c_2, c_3$
    are fixed real numbers. The group $Int frak(g)$ is a Lie subgroup of
    $Aut frak(g)$ if and only if the differences $c_1 - c_2$ and $c_2 - c_3$ are
    commensurable.] <exc:inner-automorphisms-not-closed>

  #exercise[Let a Lie group $G$ split (as an abstract group) into a semidirect
    product of its virtual Lie subgroups $G_1$ and $G_2$. Then $G_1$ and $G_2$
    are genuine Lie subgroups.] <exc:semidirect-factors-are-lie-subgroups>
]
#hints[
  #hint[@pr:tangent-algebra-of-gl][In $V$, choose a basis and assign to any
    linear transformation $X in GL(V)$ the matrix $overline(X) = [X] - E$, where
    $[X]$ is the matrix of $X$ in this basis. The elements of $overline(X)$ may
    be taken for local coordinates in a neighbourhood of the unit $E$; then $E$
    has zero coordinates. A straightforward verification shows that
    $
      overline(X Y) = overline(X) + overline(Y)
      + overline(X) thin overline(Y).
    $
    #source(55)Hence, $alpha(X, Y) = X Y$ and $gamma(X, Y) = X Y - Y X$ for any
    $X$, $Y$. In the associated coordinate system of the tangent space
    $upright(L)(V)$ of the Lie group $GL(V)$ (at $E$) the coordinates of a
    linear transformation coincide with the elements of its matrix. Therefore
    $ [X, Y] = X Y - Y X wide "for any" X, Y in upright(L)(V). $]

  #hint[@pr:differential-is-algebra-homomorphism][Choose coordinate systems in
    neighbourhoods of the units of $G$ and $H$. Let $gamma_G$ and $gamma_H$ be
    bilinear vector-functions defined by formula~@eq:group-commutator-expansion
    in these coordinate systems on $G$ and $H$, respectively. Let $C$ be the
    Jacobi matrix of the map $f$ at $e in G$. Then
    $ overline(f(x)) = C overline(x) + dots.c, $
    where dots stand for the terms of degree $>= 2$. Hence
    $
      overline(f((x, y))) = C gamma_G (overline(x), overline(y)) + dots.c,
    $
    $
      overline((f(x), f(y))) = gamma_H (C overline(x), C overline(y))
      + dots.c,
    $
    where dots stand for the terms of degree $>= 3$. Since
    $f((x, y)) = (f(x), f(y))$, we have
    $
      C gamma_G (overline(x), overline(y))
      = gamma_H (C overline(x), C overline(y)).
    $

    Furthermore
    $ overline(d f(xi)) = C overline(xi). $
    Therefore, the above formula and the definition of the brackets in $frak(g)$
    and $frak(h)$ imply that
    $
      d f([xi, eta]) = [d f(xi), d f(eta)] wide "for any" xi, eta in frak(g),
    $
    i.e. $d f$ is a tangent algebra homomorphism.]

  #hint[@pr:lie-subgroup-tangent-subalgebra][Apply
    Problem~@pr:differential-is-algebra-homomorphism to the identity embedding
    of the subgroup.]

  #hint[@pr:differential-of-determinant][Find the coefficient of $t$ in the
    polynomial $det(E + t X)$.]

  #hint[@pr:quotient-group-tangent-algebra][Apply
    Problem~@pr:differential-is-algebra-homomorphism to the canonical
    homomorphism $p: G -> G\/H$.]

  #hint[@pr:conjugation-congruence-differentials][In the definitions of the
    representations $Ad$ and $Sq$ put $A = E + t Y$ and differentiate with
    respect to $t$ at $t = 0$.]

  #hint[@pr:prove-infinitesimal-action-formulas][It suffices to prove these
    formulas for simple tensors $f$ and $F$, respectively. It can be done using
    Problems~@pr:differential-of-dual-representation and
    @pr:differential-of-tensor-product. The other possible approach is to take a
    derivative of formulas~@eq:gl-action-on-multilinear-forms and
    @eq:gl-action-on-multilinear-maps with respect to $A$ (at $E$).]

  #hint[@pr:adjoint-is-representation][Use the fact that $a$ is a $G$-action,
    i.e. $a(g_1 g_2) = a(g_1) a(g_2)$.]

  #hint[@pr:conjugation-taylor-expansion][The simplest approach is to start from
    the relation $(g x g^(-1)) g = g x$.]

  #hint[@pr:jacobi-from-adjoint-automorphisms][#source(56)If we consider $Ad$ as
    a Lie group homomorphism $G -> Aut frak(g)$, then $ad$ is a Lie algebra
    homomorphism $frak(g) -> der frak(g)$ (see
    Example~@exm:derivations-as-tangent-algebra). Hence $ad xi$ is a derivation
    of the Lie algebra $frak(g)$ for any $xi in frak(g)$. By anticommutativity
    this is equivalent to the Jacobi identity.]

  #hint[@pr:translated-vector-expansion][The Taylor series expansion of the
    coordinates of $g xi$ (resp. $xi g$) is obtained from the Taylor series
    expansion of the coordinates of the group products, when we choose only
    terms linear in the second (resp. first) factor.]

  #hint[@pr:adjoint-kernel-is-center][By the definition, $Ad g$ is the
    differential of the inner automorphism $a(g)$ of the group $G$. By
    Theorem~@th:homomorphism-determined-by-differential $Ad g = E$ if and only
    if $a(g)$ is the identity automorphism, i.e. when $g in Z(G)$.]

  #hint[@pr:tangent-algebra-of-center][Since $Z(G)$ is the kernel of $Ad$, the
    tangent algebra of $Z(G)$ is the kernel of the tangent representation $ad$
    (see @ss:tangent-homomorphism), and the latter is just $frak(z)(frak(g))$.]

  #hint[@pr:invariant-subspaces-group-algebra][Apply
    Theorem~@th:homomorphism-into-subgroup-criterion to the homomorphism
    $R: G -> GL(V)$ and the Lie subgroup $GL(V; U) subset GL(V)$. (See the
    solution of Problem~@pr:stabilizer-of-subspace).]

  #hint[@pr:connected-subgroups-by-subalgebras][Apply
    Theorem~@th:homomorphism-into-subgroup-criterion to the identity embedding
    $G_1 arrow.r.hook G$ and the subgroup $G_2 subset G$.]

  #hint[@pr:normal-subgroup-iff-ideal][The subgroup $H$ is normal if and only if
    it is invariant with respect to the inner automorphisms of the group $G$. By
    Problem~@pr:connected-subgroups-by-subalgebras this is equivalent to the
    invariance of the tangent algebra $frak(h)$ with respect to the adjoint
    representation of $G$. Next, apply
    Problem~@pr:invariant-subspaces-group-algebra and
    Theorem~@th:differential-of-adjoint-is-ad.]

  #hint[@pr:one-parameter-subgroup-velocity][If $g(t)$ is a one-parameter
    subgroup, then
    $
      (d g(t))/(d t) = lr((d g(s + t))/(d t) |)_(s=0)
      = lr((d g(s))/(d s) |)_(s=0) dot g(t).
    $
    Conversely, if the path $g(t)$ satisfies @eq:path-velocity-equation, where
    $xi(t) = "const"$, then for any fixed $s in RR$ the path $h(t) = g(t + s)$
    satisfies the same equation with the initial value $h(0) = g(s)$. If,
    moreover, $g(0) = e$, then $h(t) = g(t) g(s)$.]

  #hint[@pr:one-parameter-subgroup-via-exp][Make a linear change of the variable
    $t$ in equation~@eq:path-velocity-equation.]

  #hint[@pr:exp-differentiable][The differentiability in a neighbourhood of zero
    follows from the theorem on smooth dependence of solution of a system of
    differential equations on parameters. The global differentiability can be
    proved using the fact that by Problem~@pr:one-parameter-subgroup-via-exp
    $exp xi = (exp xi\/m)^m$ for any $m in ZZ$.]

  #hint[@pr:exp-differential-at-zero][
    Problem~@pr:one-parameter-subgroup-via-exp and the definition of $g_xi (t)$
    imply that $(d_0 exp)(xi) = xi$.]

  #hint[@pr:homomorphism-commutes-with-exp][Use
    Problem~@pr:homomorphism-commutes-translations.]

  #hint[@pr:exp-of-commuting-sum][Prove that $(Ad exp t xi) eta = eta$, next
    prove that
    $
      d / (d t) (exp t xi dot exp t eta)
      = (xi + eta) exp t xi dot exp t eta.
    $]

  #hint[@pr:commutative-group-as-quotient][Follows from
    Problem~@pr:connected-subgroups-by-subalgebras.]

  #hint[@pr:commutative-isomorphism-exp-kernels][Follows from
    Problem~@pr:homomorphism-commutes-with-exp.]

  #hint[@pr:discrete-subgroups-real-vector-space][Show by induction in $n$ that
    $Gamma$ is generated by a linearly independent set of vectors. For this
    choose an indivisible vector $e_1 in Gamma$ and prove that $Gamma\/ZZ e_1$
    is a discrete subgroup of the $(n - 1)$-dimensional vector group
    $RR^n\/RR e_1$.]

  #hint[@pr:automorphism-fixed-point-subgroup][#source(57)Make use of the fact
    that
    $ sigma(exp xi) = exp d sigma(xi) wide "for any" xi in frak(g). $]

  #hint[@pr:homomorphic-image-virtual-subgroup][Make use of
    Problem~@pr:quotient-map-universal-property.]

  #hint[@pr:virtual-subgroup-local-structure][The neighbourhood $cal(O)_H (e)$
    and the submanifold $S subset G$ are constructed as in the solution of
    Problem~@pr:slice-transversal-to-subgroup. The countability of $T$ follows
    from the fact that $H$ can only contain a finite or countable family of
    mutually nonintersecting open subsets. To prove the latter statement one
    should make use of the fact that any discrete subset of $RR^n$ is
    countable.]

  #hint[@pr:prove-virtual-subgroups-inclusion][In order to prove the first
    statement of the theorem it is necessary to show that the identity embedding
    of $G_1$ into $G_2$ is differentiable. With the help of
    Problem~@pr:virtual-subgroup-local-structure applied to $G_2$ one can show
    that a sufficiently small connected neighbourhood of the unit of $G_1$ is
    contained in a neighbourhood of the unit of $G_2$ which is a submanifold of
    $G$. This implies the required differentiability.

    The second part of the theorem is proved as
    Theorem~@th:homomorphism-into-subgroup-criterion.]

  #hint[@pr:automorphism-action-differentiable][The differentiability of the
    $(Aut frak(g))$-action on $frak(g)$ and the fact that automorphisms commute
    with the exponential map imply the differentiability of the map
    $
      (Aut G) times G -> G, wide (alpha, g) |-> alpha(g)
    $ <eq:automorphism-action-map>
    on $(Aut G) times cal(O)(e)$, where $cal(O)(e)$ is a neighbourhood of the
    unit of $G$. On the other hand, the theorem on differentiable dependence of
    a solution of a system of differential equations on parameters implies that
    $alpha(g)$ is differentiable with respect to $alpha$ for any $g$. The
    differentiability of the map~@eq:automorphism-action-map at any point
    $(alpha_0, g_0)$ follows from this with the help of the identity
    $ alpha(g) = alpha(g_0) alpha(g_0^(-1) g). $]

  #hint[@pr:prove-semidirect-tangent-algebra][Calculate the differential of the
    adjoint representation of $G_1 times.r_b G_2$.]

  #hint[@pr:semidirect-sum-integrates][The desired homomorphism $b$ is obtained
    from $beta$ by “integrating”, i.e. the procedure inverse to the one
    described in the formulation of
    Theorem~@th:semidirect-product-tangent-algebra. The differentiability of the
    $G_2$-action on $G_1$ defined by it follows from
    Problem~@pr:automorphism-action-differentiable.]
]
