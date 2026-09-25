// Chapter 4, § 2. Root Systems, 1°–4°. Printed pages 153-163. Subsections
// 5°–8°, the Exercises and the Hints are in 42-root-systems-2.typ.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/42-root-systems.typ": rank-two-root-systems

== Root Systems <sec:root-systems>

#source(168)In @ss:weight-and-root-decompositions[°] we have introduced the root
system of a reductive (in particular, semisimple) algebraic group. In this
section this notion will be axiomized and studied in detail. The exposition of
the properties of abstract root systems is intermitted with interpretation of
these properties in the language of algebraic groups and Lie algebras. The
ground field is $CC$.

=== Principal Definitions and Examples <ss:root-system-definitions>
Let $bold(E)$ be a finite-dimensional Euclidean space with the scalar product
$(dot, dot)$. For an arbitrary nonzero vector $alpha in bold(E)$ denote by
$L_alpha$ the hyperplane of $bold(E)$ orthogonal to $alpha$ and by $r_alpha$ the
reflection with respect to $L_alpha$. To express $r_alpha$ explicitly set
$
  chevron.l lambda|mu chevron.r = 2(lambda, mu)\/(mu, mu) wide
  (lambda, mu in bold(E), mu != 0).
$
Note that the function $chevron.l lambda|mu chevron.r$ is linear only in the
first argument and does not vary if the scalar product in $bold(E)$ is
multiplied by a positive number.

#problem[The reflection $r_alpha$ acts by the formula
  $
    r_alpha (beta) = beta - chevron.l beta|alpha chevron.r alpha wide
    (beta in bold(E)).
  $] <pr:root-reflection-formula>

A subset $Delta subset bold(E)$ is a #idx("root system")_root system_ in
$bold(E)$ if it has the following properties:

1) $Delta$ is finite and consists of nonzero vectors;

2) for any $alpha in Delta$ the reflection $r_alpha$ transforms $Delta$ into
itself;

3) $chevron.l alpha|beta chevron.r in ZZ$ for any $alpha, beta in Delta$.

The #idx("rank of a root system")_rank_ $rk Delta$ of a root system $Delta$ is,
as usual, the dimension of its linear span. By 2) we have
$-alpha = r_alpha (alpha) in Delta$ for any $alpha in Delta$. A root system
$Delta$ is #idx("root system", "reduced")_reduced_ if

4) $alpha in Delta$ and $c alpha in Delta$ for some $c in RR$ imply
$c = plus.minus 1$.

#problem[Let $Delta$ be a root system, $alpha in Delta$ and $c alpha in Delta$
  for some $c in RR$. Then $c = plus.minus 1\/2, plus.minus 1, plus.minus 2$.]
<pr:proportional-roots-in-root-system>

Let $G$ be a reductive algebraic group, $T$ its maximal torus. In
@ss:weight-and-root-decompositions[°] the root system $Delta_G$ of $G$ with
respect to $T$ (or, which is the same, the root system $Delta_frak(g)$ of the
Lie algebra $frak(g)$) was defined. This is a system of vectors of the Euclidean
space $bold(E) = frak(t)(RR)^*$. By Problem~@pr:coroot-in-integral-lattice and
Theorems~@th:weights-invariant-under-reflections,
@th:root-spaces-one-dimensional $Delta_G$ is a reduced root system in the sense
of the above definition. The group $G$ is semisimple if and only if $Delta_G$
spans $bold(E)$; $G^0$ is a torus if and only if $Delta_G = emptyset$ (see
Problem~@pr:root-system-of-reductive-algebra). In the general case
$rk Delta_frak(g) = rk frak(g)'$.

We will prove that any nonempty reduced root system is (naturally) isomorphic to
a root system of a semisimple algebraic group. We will encounter nonreduced root
systems in Ch.~@ch:real-semisimple-groups.

Let $Omega$ and $Omega'$ be two sets of vectors of Euclidean spaces $bold(E)$
and $bold(E)'$ respectively. An #idx(
  "isomorphism of vector systems",
)_isomorphism_ of $Omega$ onto $Omega'$ is any linear isomorphism
$phi: chevron.l Omega chevron.r -> chevron.l Omega' chevron.r$ of their #source(
  169,
)linear spans such that $phi(Omega) = Omega'$ and
$chevron.l phi(alpha)|phi(beta) chevron.r = chevron.l alpha|beta chevron.r$
$(alpha, beta in Omega)$. The map $phi$ need not be orthogonal (e.g. any
homothety $alpha |-> c alpha$, $c != 0$, of $bold(E)$ defines an isomorphism of
$Omega$ onto $c Omega$). Clearly an isomorphism
$phi: chevron.l Omega chevron.r -> chevron.l Omega' chevron.r$ is completely
determined by the map $phi|Omega: Omega -> Omega'$. In particular, we may speak
about an isomorphism of root systems and isomorphic root systems. The
isomorphisms of a set $Omega$ onto itself are its #idx(
  "automorphism of a vector system",
)_automorphisms_; they form the group $Aut Omega$.

Consider the root system $Delta_frak(g) (frak(t))$ of a semisimple Lie algebra
$frak(g)$ with respect to a maximal diagonalizable subalgebra $frak(t)$. As we
have seen in @ss:weight-and-root-decompositions[°], the vector space
$bold(E) = frak(t)(RR)^*$ is uniquely determined by $(frak(g), frak(t))$. The
scalar product in $bold(E)$ depends, in general, on the realization of $frak(g)$
as an algebra of linear transformations. The numbers
$chevron.l alpha|beta chevron.r$ $(alpha, beta in Delta_frak(g))$, however, are
only defined by the structure of $frak(g)$, i.e. do not depend on the choice of
this realization (see @ss:weight-and-root-decompositions[°]). Furthermore, if we
replace $frak(t)$ by another maximal diagonalizable subalgebra $tilde(frak(t))$
then by Problem~@pr:automorphisms-act-on-weights-roots the corresponding root
system $Delta_frak(g) (tilde(frak(t)))$ is obtained from
$Delta_frak(g) (frak(t))$ via
$attach((Ad g), tl: t)^(-1): frak(t)(RR)^* -> tilde(frak(t))(RR)^*$, where $g$
is an element of $G^circle.small$. The invariance of the scalar product implies
that $attach((Ad g), tl: t)^(-1)$ is orthogonal, i.e. is an isomorphism of the
root systems.

Now let $frak(g)$ be a reductive algebraic Lie algebra, $frak(t)$ its maximal
diagonalizable subalgebra. By Problem~@pr:span-of-weight-system the root system
$Delta_frak(g)$ spans the subspace ${lambda in frak(t)(RR)^*: lambda(x) = 0$ for
all $x in frak(z)(frak(g)) inter frak(t)(RR)}$ of $frak(t)(RR)^*$. In
Problem~@pr:root-system-of-reductive-algebra we have identified $Delta_frak(g)$
with $Delta_(frak(g)')$. Clearly, this identification is an isomorphism of the
root systems.

Examples of root systems of rank 1 and 2 are depicted in
Fig.~@fig:rank-one-two-root-systems.

#book-figure(rank-two-root-systems) <fig:rank-one-two-root-systems>

#problem[All the vector systems depicted in Fig.~@fig:rank-one-two-root-systems
  are root systems and all of them, except for $B C_1$ and $B C_2$ are reduced
  and nonisomorphic. The root systems of types $A_1$, $A_2$, $A_1 + A_1$, $B_2$
  are isomorphic to the root systems of Lie algebras $frak("sl")_2 (CC)$,
  $frak("sl")_3 (CC)$, $frak("so")_4 (CC)$ (or $frak("so")_3 (CC)$,
  $frak("so")_5 (CC)$, $frak("sl")_2 (CC) plus.o frak("sl")_2 (CC)$), and
  $frak("sp")_4 (CC)$ respectively (see
  Examples~@exm:roots-of-sl-n[]--@exm:roots-of-sp[] of
  @ss:roots-of-classical-lie-algebras[°]).]
<pr:rank-two-root-systems-classical>

#problem[The systems $A_1$ and $B C_1$ are the only up to an isomorphism root
  systems of rank 1.] <pr:rank-one-root-systems>

#source(170)We will see that any root system of rank 2 is isomorphic to one of
the systems depicted in Fig.~@fig:rank-one-two-root-systems.

#problem[Let $Delta_i subset bold(E)_i$ $(i = 1, ..., s)$ be root systems and
  $bold(E) = plus.o.big_(1 <= i <= s) bold(E)_i$ the orthogonal direct sum of
  Euclidean spaces $bold(E)_i$. Then $Delta = union.big_(1 <= i <= s) Delta_i$
  is a root system in $bold(E)$.] <pr:direct-sum-of-root-systems>

The system $Delta$ constructed in Problem~@pr:direct-sum-of-root-systems is
called the _direct sum of root systems_ $Delta_i$ $(i = 1, ..., s)$. For
example, by Problem~@pr:roots-of-direct-sum-algebra the root system
$Delta_(frak(g)_1 plus.o frak(g)_2)$ of the direct sum of semisimple Lie
algebras is the direct sum of $Delta_(frak(g)_1)$ and $Delta_(frak(g)_2)$.

A system of nonzero vectors $Omega subset bold(E)$ is #idx(
  "Vector system",
  "indecomposable",
)_indecomposable_ if it cannot be presented as the union
$Omega = Omega_1 union Omega_2$ of two proper subsets, orthogonal to each other;
otherwise $Omega$ is called _decomposable._ Clearly, all the root systems
expressed on Fig.~@fig:rank-one-two-root-systems except $A_1 + A_1$ are
indecomposable.

#problem[For an arbitrary root system $Delta subset bold(E)$ there exists an
  orthogonal direct decomposition $bold(E) = plus.o.big_(1 <= i <= s) bold(E)_i$
  such that $Delta = union.big_(1 <= i <= s) Delta_i$, where
  $Delta_i subset bold(E)_i$ $(i = 1, ..., s)$ are indecomposable root
  systems.] <pr:decomposition-into-indecomposables>

The subsystems $Delta_i$ are maximal indecomposable subsystems in $Delta$ and
therefore are determined uniquely.

The systems $Delta_i$ mentioned in
Problem~@pr:decomposition-into-indecomposables are called #idx(
  "component",
  "indecomposable",
)_indecomposable components_ of $Delta$. Obviously, $Delta$ is the direct sum of
its indecomposable components.

#problem[The root system $Delta_frak(g)$ of a semisimple Lie algebra $frak(g)$
  is indecomposable if and only if $frak(g)$ is simple. If
  $frak(g) = plus.o.big_(1 <= i <= s) frak(g)_i$ is a decomposition of $frak(g)$
  into the direct sum of simple ideals then
  $Delta_frak(g) = union.big_(1 <= i <= s) Delta_(frak(g)_i)$ is a decomposition
  of $Delta_frak(g)$ into the direct sum of indecomposable
  components.] <pr:indecomposable-iff-simple-algebra>

Now let us study the simplest geometric properties of root systems. The axiom 3)
imposes rigorous constraints on the possible angles between roots and the ratios
of their lengths.

#problem[Let $alpha, beta$ be nonzero vectors of a Euclidean space $bold(E)$ and
  $theta$ the angle between $alpha$ and $beta$. Then
  $chevron.l alpha|beta chevron.r chevron.l beta|alpha chevron.r
  = 4 cos^2 theta$. If $chevron.l alpha|beta chevron.r$ and
  $chevron.l beta|alpha chevron.r$ are nonpositive integers and
  $abs(beta) >= abs(alpha)$ then for $theta$, $chevron.l alpha|beta chevron.r$,
  $chevron.l beta|alpha chevron.r$, $abs(beta)^2\/abs(alpha)^2$ only the
  following values are possible:
  #figure(
    table(
      columns: 4,
      align: center,
      inset: (x: 1.6em, y: 0.4em),
      stroke: (x, y) => (
        left: if x > 0 { 0.5pt },
        bottom: if y == 0 { 0.5pt },
      ),
      table.header(
        $theta$,
        $chevron.l alpha|beta chevron.r$,
        $chevron.l beta|alpha chevron.r$,
        $abs(beta)^2\/abs(alpha)^2$,
      ),
      $pi\/2$, $0$, $0$, [],
      $2 pi\/3$, $-1$, $-1$, $1$,
      $3 pi\/4$, $-1$, $-2$, $2$,
      $5 pi\/6$, $-1$, $-3$, $3$,
      $pi$, $-2$, $-2$, $1$,
      $pi$, $-1$, $-4$, $4$,
    ),
    numbering: none,
  )] <pr:root-angles-and-length-ratios>

#problem[Let $alpha, beta$ be two nonproportional roots from $Delta$. If
  $(alpha, beta) > 0$ then $alpha - beta in Delta$ and if $(alpha, beta) < 0$
  then $alpha + beta in Delta$.] <pr:root-sum-difference-criterion>

Let $alpha, beta$ be two nonproportional elements from a root system $Delta$.
The set ${gamma in Delta: gamma = beta + k alpha quad (k in ZZ)}$ is called the
#idx("α-string")_$alpha$-string through $beta$._

#problem[#source(171)The $alpha$-string through $beta$ is of the form
  ${beta + k alpha: -p <= k <= q}$, where $p, q >= 0$ and
  $p - q = chevron.l beta|alpha chevron.r$. In particular, if
  $beta - alpha in.not Delta$, then $beta + alpha in Delta$ if and only if
  $(beta, alpha) < 0$.] <pr:alpha-string-in-root-system>

In conclusion of this subsection let us construct the _dual_ root system. Let
$bold(E)$ be a finite-dimensional Euclidean space and $bold(F) = bold(E)^*$ its
dual. Let us identify $bold(F)^*$ with $bold(E)$ with the help of the natural
isomorphism $bold(E) -> (bold(E)^*)^* = bold(F)^*$, i.e. consider $bold(E)$ as
the dual of $bold(F)$. Let $lambda |-> u_lambda$ be the isomorphism of vector
spaces $bold(E) -> bold(F)$ defined by the scalar product in $bold(E)$, i.e.
given by the formula
$ lambda(u_mu) = (lambda, mu) wide (lambda, mu in bold(E)). $
Let us translate the Euclidean space structure onto $bold(F)$ with the help of
this isomorphism setting
$
  (u_lambda, u_mu) = (lambda, mu) = lambda(u_mu) = mu(u_lambda) wide
  (lambda, mu in bold(E)).
$
Let $Delta$ be a root system in $bold(E)$. For any $alpha in Delta$ set
$ alpha^or = 2 u_alpha \/(alpha, alpha) $
Then
$
  mu(alpha^or) = 2(mu, alpha)\/(alpha, alpha) = chevron.l mu|alpha chevron.r
  wide (mu in bold(E)).
$
In particular by Problem~@pr:root-reflection-formula
$
  r_alpha (lambda) = lambda - lambda(alpha^or) alpha wide
  (lambda in bold(E)).
$
It is easy to verify that
$
  chevron.l alpha^or|beta^or chevron.r = chevron.l beta|alpha chevron.r
  quad "for any" quad alpha, beta in Delta.
$ <eq:coroot-cartan-integers>

#problem[If $Delta$ is a root system in $bold(E)$ then
  $Delta^or = {alpha^or: alpha in Delta}$ is a root system in $bold(F)$, reduced
  if and only if so is $Delta$. We have
  $
    rk Delta = rk Delta^or, wide (Delta^or)^or = Delta.
  $] <pr:dual-root-system>

The root system $Delta^or$ is called the #idx("root system", "dual")_dual_ of
$Delta$.

In particular, let $bold(E) = frak(t)(RR)^*$, where $frak(t)$ is a maximal
diagonalizable subalgebra of a reductive algebraic linear Lie algebra $frak(g)$
(see @ss:weight-and-root-decompositions[°]). Then $bold(F) = frak(t)(RR)$ and
the root system dual to $Delta_frak(g)$ is the system
$Delta_frak(g)^or = {h_alpha: alpha in Delta_frak(g)}$.

=== Weyl Chambers and Simple Roots <ss:weyl-chambers-and-simple-roots>
Let $Delta subset bold(E)$ be a root system. Each nonzero $lambda in bold(E)$
defines in $bold(F) = bold(E)^*$ a hyperplane
$ P_lambda = {x in bold(F): lambda(x) = 0}. $ <eq:root-hyperplane>
#source(172)The hyperplanes $P_alpha$ $(alpha in Delta)$ separate $bold(F)$ into
finitely many polyhedral convex cones. The elements of
$bold(F)_bold("reg")
= bold(F) without union.big_(alpha in Delta) P_alpha$
are called #idx("Element", "regular")_regular_ and those of
$union.big_(alpha in Delta) P_alpha$ #idx("Element", "singular")_singular._ The
connected components of $bold(F)_bold("reg")$ are called (_open_) #idx(
  "Weyl chamber",
)_Weyl chambers,_ and their closures #idx(
  "Weyl chamber",
  "closed",
)_closed Weyl chambers._

Since the set of singular elements is transformed into itself while multiplied
by $-1$, then for any Weyl chamber $C$ the set $-C = {x in bold(F): -x in C}$ is
also a Weyl chamber, called the chamber #idx(
  "Weyl chamber",
  "opposite",
)_opposite_ to $C$.

A subsystem $Pi$ of $Delta$ is called a _system of simple roots_ (or a #idx(
  "Base (of a root system)",
)_base_) of $Delta$ if the elements of $Pi$ are linearly independent and any
$beta in Delta$ presents in the form
$ beta = sum_(alpha in Pi) k_alpha alpha, $ <eq:expansion-in-simple-roots>
where $k_alpha$ are simultaneously either nonnegative or nonpositive integers.

Clearly, the number of simple roots always equals $rk Delta$ and the
presentation~@eq:expansion-in-simple-roots is unique.

#example[For the root systems depicted in Fig.~@fig:rank-one-two-root-systems
  the systems ${alpha}$ and ${alpha_1, alpha_2}$ are
  bases.] <exm:bases-of-rank-two-systems>

A root $beta in Delta$ is #idx("root", "positive")_positive_ with respect to a
given base $Pi$ if $k_alpha >= 0$ $(alpha in Pi)$ in
@eq:expansion-in-simple-roots, and #idx(
  "root",
  "negative",
)_negative_ if $k_alpha <= 0$ $(alpha in Pi)$. If $Pi$ is fixed then denote the
set of positive (negative) roots by $Delta^+$ (resp. $Delta^-$). Clearly,
$Delta^- = -Delta^+$. We write $alpha > 0$ if $alpha in Delta^+$ and $alpha < 0$
if $alpha in Delta^-$. This notation agrees with the following partial order on
$bold(E)$:
$
  xi >= eta <=> xi - eta = sum_(alpha in Pi) k_alpha alpha, quad
  k_alpha in ZZ_+.
$

Now let us prove the existence of a base for any root system. We will also
establish a one-to-one correspondence between the bases of $Delta$ and the Weyl
chambers.

Let $C$ be a Weyl chamber and $alpha in Delta$. Since $C$ is connected, then
either $alpha(x) > 0$ for all $x in C$ or $alpha(x) < 0$ for all $x in C$ and we
accordingly call $alpha$ a _$C$-positive_ ($C$-negative) root. Clearly,
$C$-positive roots are $(-C)$-negative ones and vice versa. Denote by $Pi(C)$
the set of all $C$-positive roots $alpha$ not presentable in the form
$alpha = beta + gamma$, where $beta$ and $gamma$ are $C$-positive roots.

#theorem[For any Weyl chamber $C$ the system $Pi(C)$ is a system of simple roots
  of $Delta$. The roots positive with respect to $Pi(C)$ coincide with the
  $C$-positive ones and the negative roots coincide with the $C$-negative ones.
  The correspondence $C |-> Pi(C)$ is a bijection of the set of all Weyl
  chambers onto the set of all bases of
  $Delta$.] <th:chambers-and-bases-bijection>

The _proof_ is divided into several problems.

#problem[Each $C$-positive root $beta in Delta$ presents in the form
  $beta = sum_(alpha in Pi(C)) k_alpha alpha$, where
  $k_alpha in ZZ_+$.] <pr:positive-root-nonnegative-combination>

#problem[If $alpha, beta in Pi(C)$, $alpha != beta$, then
  $alpha - beta in.not Delta$ and
  $(alpha, beta) <= 0$.] <pr:simple-roots-obtuse>

#problem[Let $v_1, ..., v_s$ be a system of nonzero vectors of a Euclidean space
  $bold(E)$ with pairwise nonacute angles. If they are linearly dependent:
  $
    a_1 v_(i_1) + dots.c + a_k v_(i_k) - b_1 v_(j_1) - dots.c - b_l v_(j_l)
    = 0,
  $
  #source(173)where $i_1, ..., i_k, j_1, ..., j_l$ are different and all $a_p$,
  $b_q$ are positive, then

  a) $a_1 v_(i_1) + dots.c + a_k v_(i_k)
  = b_1 v_(j_1) + dots.c + b_l v_(j_l) = 0$;

  b) $(v_(i_p), v_(j_q)) = 0$ for $p = 1, ..., k$; $q = 1, ..., l$.

  If $v_1, ..., v_s$ belong to an open halfspace of $bold(E)$ then they are
  linearly independent.] <pr:nonacute-vectors-independent>

This implies the first two statements of the theorem. The injectivity of the map
$C |-> Pi(C)$ follows from

#problem[$C = {x in bold(F): alpha(x) > 0$ for all
  $alpha in Pi(C)} = {x in bold(F): alpha(x) > 0$ for all $C$-positive roots
  $alpha}$.] <pr:chamber-from-simple-roots>

Let us prove that the map $C |-> Pi(C)$ is surjective.

#problem[Let $V$ be a finite-dimensional vector space over $RR$ and
  $gamma_1, ..., gamma_r$ a linearly independent system of vectors of $V^*$.
  Then there exists a vector $x in V$, such that $gamma_i (x) > 0$
  $(i = 1, ..., r)$.] <pr:independent-functionals-positive-point>

#problem[If $Pi$ is a base in $Delta$, then
  $C = {x in bold(F): alpha(x) > 0 quad (alpha in Pi)}$ is a Weyl chamber and
  $Pi = Pi(C)$.] <pr:base-determines-chamber>

A hyperplane $P subset bold(F)$ is called a #idx(
  "Wall of a Weyl chamber",
)_wall of a Weyl chamber $C$_ if $P inter C = emptyset$ and
$P inter overline(C)$ contains a nonempty subset open in $P$.

#problem[If $C$ is a Weyl chamber then
  $overline(C) = {x in bold(F): alpha(x) >= 0 quad (alpha in Pi(C))}$. The
  hyperplanes $P_alpha$, where $alpha in Pi(C)$, are the walls of
  $C$.] <pr:walls-of-weyl-chamber>

Thus any Weyl chamber is a simplicial cone.

#problem[Any hyperplane $P_alpha$, where $alpha in Delta$, is a wall of a Weyl
  chamber. For any $alpha in Delta$ there exists a Weyl chamber $C$ such that
  $alpha in Pi(C)$ (or perhaps $1/2 alpha in Pi(C)$, if $Delta$ is not
  reduced).] <pr:root-simple-for-some-chamber>

In the following problems a fixed base $Pi subset Delta$ is considered.

#problem[If $alpha in Delta^+ without Pi$, then there exists $beta in Pi$ such
  that $alpha - beta in Delta$ and
  $alpha - beta > 0$.] <pr:positive-root-minus-simple-root>

#problem[Any positive root $alpha in Delta$ presents in the form
  $alpha = alpha_1 + dots.c + alpha_s$, where $alpha_i in Pi$ and
  $alpha_1 + dots.c + alpha_k in Delta$ for any
  $k = 1, ..., s$.] <pr:positive-root-chain-of-simple>

#problem[A root system $Delta$ is indecomposable if and only if so is a base
  $Pi subset Delta$. If $Delta = Delta_1 union dots.c union Delta_r$ is the
  decomposition of $Delta$ into indecomposable components then
  $Pi = Pi_1 union dots.c union Pi_r$, where $Pi_i subset Delta_i$ is a
  base.] <pr:indecomposable-iff-base-indecomposable>

The latter statement has important applications in the theory of semisimple Lie
algebras. A _system of simple roots of a semisimple Lie algebra
$frak(g)$_ is any base of $Delta_frak(g)$.
Problems~@pr:indecomposable-iff-base-indecomposable and
@pr:indecomposable-iff-simple-algebra imply

#theorem[A semisimple Lie algebra $frak(g)$ is simple if and only if its system
  of simple roots $Pi$ is indecomposable. If $Pi = Pi_1 union dots.c union Pi_r$
  is the decomposition into indecomposable components then
  $frak(g) = frak(g)_1 plus.o dots.c plus.o frak(g)_r$, where $frak(g)_i$ is the
  simple ideal, whose system of simple roots is
  $Pi_i$.] <th:simple-iff-base-indecomposable>

#source(174)Let us indicate another useful construction of bases which
historically preceded the one described above. A real vector space $bold(E)$
over $RR$ is called #idx(
  "space",
  "ordered vector",
)_ordered_ if $bold(E)$ is endowed with an order $<$ such that for any
$lambda, mu in bold(E)$ we have

1) $lambda > 0, mu > 0 => lambda + mu > 0$;

2) $lambda > 0, c in RR, c > 0 => c lambda > 0$.

Clearly, $-lambda < 0$ for any $lambda > 0$. An example of an order satisfying
1) and 2) is the lexicographic order with respect to a basis of $bold(E)$
defined as follows: $lambda > mu$ if the first nonzero coordinate of
$lambda - mu$ with respect to this basis is positive.

Let $Delta$ be a root system in an ordered Euclidean space $bold(E)$. Let $Pi$
be the set of roots $alpha > 0$, such that $alpha != beta + gamma$, where
$beta, gamma in Delta$, $beta > 0, gamma > 0$.

#problem[$Pi$ is a base of $Delta$ and the corresponding set $Delta^+$ coincides
  with the set of all roots which are positive with respect to the given
  order.] <pr:base-from-ordered-space>

#example[Let us specify subsystems of positive and simple roots for the root
  systems $Delta_frak(g)$ of the classical Lie algebras $frak(g)$ described in
  @ss:roots-of-classical-lie-algebras[°].

  $frak(g) = frak("gl")_n (CC)$, $n >= 2$. Considering the lexicographic order
  in $frak(t)(RR)^*$ with respect to the basis $epsilon_1, ..., epsilon_n$ we
  get
  $
    Delta_frak(g)^+ & = {epsilon_i - epsilon_j: i < j; i, j = 1, ..., n}, \
         Pi_frak(g) & = {alpha_1, ..., alpha_(n-1)}, quad "where" quad
                      alpha_i = epsilon_i - epsilon_(i+1).
  $
  The corresponding Weyl chamber $C subset bold(F) = frak(t)(RR)$ is the set of
  the diagonal matrices $diag(x_1, ..., x_n)$ such that
  $x_1 > x_2 > dots.c > x_n$.

  $frak(g) = frak("sl")_n (CC)$, $n >= 2$.
  Problem~@pr:root-system-of-reductive-algebra implies that $Delta_frak(g)^+$
  and $Pi_frak(g)$ have the same form as for $frak("gl")_n (CC)$.

  $frak(g) = frak("so")_(2 l) (CC)$, $l >= 2$. Considering the lexicographic
  order in $frak(t)_frak(g) (RR)^*$ with respect to the basis
  $epsilon_1, ..., epsilon_l$ we get
  $
    Delta_frak(g)^+ & = {epsilon_i plus.minus epsilon_j:
                        i < j; i, j = 1, ..., l}, \
         Pi_frak(g) & = {alpha_1, ..., alpha_l}, quad "where" quad
                      alpha_i = epsilon_i - epsilon_(i+1)
                      quad (1 <= i <= l - 1),
                      alpha_l = epsilon_(l-1) + epsilon_l.
  $

  $frak(g) = frak("so")_(2 l + 1) (CC)$, $l >= 1$. Similarly,
  $
    Delta_frak(g)^+ & = {epsilon_i plus.minus epsilon_j quad (i < j),
                        epsilon_i: i, j = 1, ..., l}, \
         Pi_frak(g) & = {alpha_1, ..., alpha_l}, quad "where" quad
                      alpha_i = epsilon_i - epsilon_(i+1)
                      quad (1 <= i <= l - 1),
                      alpha_l = epsilon_l.
  $

  $frak(g) = frak("sp")_(2 l) (CC)$, $l >= 1$. Similarly,
  $
    Delta_frak(g)^+ & = {epsilon_i plus.minus epsilon_j quad (i < j),
                        2 epsilon_i: i, j = 1, ..., l}, \
         Pi_frak(g) & = {alpha_1, ..., alpha_l}, quad "where" quad
                      alpha_i = epsilon_i - epsilon_(i+1)
                      quad (1 <= i <= l - 1),
                      alpha_l = 2 epsilon_l.
  $

  As it is easy to verify all the described bases $Pi_frak(g)$ are
  indecomposable except for $frak(g) = frak("so")_4 (CC)$ (in
  @ss:dynkin-diagrams we will give a beautiful geometric method to verify this
  #source(
    175,
  )indecomposability). Therefore Theorem~@th:simple-iff-base-indecomposable
  implies that all semisimple classical Lie algebras are simple except
  $frak("so")_4 (CC)$.] <exm:simple-roots-of-classical-algebras>

Let us now return to the notation from the beginning of the section and consider
the dual root system $Delta^or subset bold(F)$. The natural isomorphism
$lambda |-> u_lambda$ of Euclidean spaces $bold(E) -> bold(F)$ maps each
hyperplane $L_lambda$ onto $P_lambda$. Clearly
$
  L_alpha = {mu in bold(E): alpha^or (mu) = 0} wide
  (alpha in Delta).
$ <eq:mirror-as-coroot-kernel>
Therefore this isomorphism maps the Weyl chambers of $Delta^or$ onto the Weyl
chambers of $Delta$.

#problem[Let $Delta$ be a reduced root system, $Pi$ its base. Then
  $Pi^or = {alpha^or: alpha in Pi}$ is a base of
  $Delta^or$.] <pr:dual-base-of-dual-system>

=== Borel Subgroups and Maximal Tori <ss:borel-subgroups-and-maximal-tori>
In this section we will consider the root system $Delta_G$ of a reductive
algebraic group $G$ with respect to a fixed maximal torus $T$. We will see that
Weyl chambers in $bold(F) = frak(t)(RR)$ are in one-to-one correspondence with
the Borel subgroups of $G$ containing $T$ and we will establish several
important properties of Borel subgroups and maximal tori.

Let $C subset bold(F)$ be a Weyl chamber. Let us construct from $C$ a Borel
subgroup of $G$. Let $Delta = Delta^+ union Delta^-$ be the decomposition of
$Delta$ into the $C$-positive and $C$-negative roots.
Problem~@pr:root-vectors-shift-weights implies that the subspaces
$
  frak(n)^+ = plus.o.big_(alpha in Delta^+) frak(g)_alpha, wide
  frak(b)^+ = frak(t) plus.o frak(n)^+
$
are subalgebras of $frak(g)$. The subalgebras
$
  frak(n)^- = plus.o.big_(alpha in Delta^-) frak(g)_alpha, wide
  frak(b)^- = frak(t) plus.o frak(n)^-
$
are constructed similarly and correspond to the opposite Weyl chamber $-C$.

#problem[The Lie algebra $frak(b)^+$ is solvable and $frak(n)^+$ is its
  unipotent ideal.] <pr:standard-borel-algebra-solvable>

#problem[$frak(b)^+$ is a Borel subalgebra of $frak(g)$ and coincides with its
  normalizer.] <pr:standard-borel-is-borel-subalgebra>

By Problem~@pr:borel-subalgebra-of-borel-subgroup $G$ contains a Borel subgroup
$B^+$ with the tangent algebra $frak(b)^+$. Clearly, $B^+ supset T$. The group
$B^+$ will be called the #idx(
  "Borel subgroup",
  "corresponding to a Weyl chamber",
)_Borel subgroup corresponding to the Weyl chamber $C$._ By
Problem~@pr:unipotent-lie-algebra-algebraic, the ideal $frak(n)^+$ determines a
unipotent normal algebraic subgroup $N^+ subset B^+$. The connected algebraic
subgroups $N^- subset B^-$ are similarly defined and $B^-$ coincides with the
Borel subgroup corresponding to the opposite Weyl chamber $-C$.

Note that for $G = GL_n (CC)$ and the Weyl chamber $C$ chosen as in
Example~@exm:simple-roots-of-classical-algebras[] of
@ss:weyl-chambers-and-simple-roots the subgroups $B^+$ and $B^-$ coincide with
the subgroups of all upper and lower triangular matrices respectively and $N^+$
and $N^-$ coincide with the subgroups of the uni-triangular matrices.

#problem[$N^+$ coincides with the unipotent radical of $B^+$ and
  $B^+ = N^+ times.r T$.] <pr:borel-semidirect-decomposition>

#problem[#source(176)Different Borel subgroups of $G$ correspond to different
  Weyl chambers.] <pr:chamber-to-borel-injective>

Now we wish to show that any Borel subgroup containing $T$ corresponds to a Weyl
chamber. To do so consider the normalizer $N(T)$ of $T$. By
Problem~@pr:automorphisms-act-on-weights-roots, to any element $n in N(T)$ there
correspond linear transformations $w = Ad n$ and $attach(w, tl: t)$ of
$bold(F) = frak(t)(RR)$ and $bold(E) = frak(t)(RR)^*$ respectively, satisfying
$attach(w, tl: t)(Delta) = Delta$. Clearly,
$w(bold(F)_bold("reg")) = bold(F)_bold("reg")$ and $w$ permutes the Weyl
chambers. It is not difficult to see that if $B^+$ is the Borel subgroup
corresponding to a fixed Weyl chamber $C$ then $n B^+ n^(-1)$ corresponds to the
Weyl chamber $w(C)$.

#problem[Let $B$ be any Borel subgroup of $G$ containing $T$. Then there exists
  $a in N(T)$, such that
  $a B a^(-1) = B^+$.] <pr:normalizer-conjugates-borel-subgroups>

Problems~@pr:chamber-to-borel-injective,
@pr:normalizer-conjugates-borel-subgroups and the above remarks imply

#theorem[The map $C |-> B^+$ constructed above is a bijection of the set of all
  Weyl chambers in $bold(F)$ onto the set of all Borel subgroups of $G$
  containing $T$.] <th:chambers-borel-subgroups-bijection>

Now suppose that $G$ is connected. Let us consider, as in the proof of
Theorem~@th:borel-conjugate-quotient-projective, a closed orbit $D$ of $G$ in
the flag variety. There exists $p in D$ whose stabilizer $G_p$ contains $B^+$ as
the identity component. Our next aim is to prove that $D$ is simply connected
and $G_p = B^+$.

For this consider the orbit $N^- (p)$ of the subgroup $N^- subset G$ in $D$
which by Theorem~@th:stabilizer-orbit-algebraic is a nonsingular algebraic
subvariety. The $G$-action on $D$ gives rise to the surjective morphism
$alpha_p: G -> D$ given by the formula $alpha_p (g) = g p$.

#problem[The orbit $N^- (p)$ is open in $D$ and $alpha_p: N^- -> N^- (p)$ is an
  isomorphism of algebraic varieties.] <pr:big-cell-open-orbit>

Since $G$ is connected, $D$ is irreducible. Problem~@pr:big-cell-open-orbit
implies that $D without N^- (p)$ is an algebraic subvariety of a real
codimension $>= 2$ in $D$. Theorem~@th:unipotent-group-exp-isomorphism implies
that $N^- (p)$ is isomorphic to $CC^q$ and, in particular, it is simply
connected. Therefore, so is $D$. This implies that $G_p = B^+$ (see
Theorem~@th:homotopy-sequence-homogeneous-space).

Since all Borel subgroups of $G$ are conjugate
(Theorem~@th:borel-conjugate-quotient-projective), all the results obtained for
$B^+$ hold for any Borel subgroup. Since any Borel subgroup of an algebraic
group contains the radical of this group, the following statement holds:

#theorem[Let $G$ be a connected algebraic group and $B$ its Borel subgroup. Then
  $D = G\/B$ is a simply connected projective algebraic
  variety.] <th:flag-variety-simply-connected>

#problem[Prove the following theorem:] <pr:prove-borel-self-normalizing>

#theorem[A Borel subgroup $B$ of a connected algebraic group $G$ coincides with
  its normalizer $N(B)$.] <th:borel-self-normalizing>

From this we derive the following property of a maximal torus.

#theorem[A maximal torus of a connected reductive algebraic group $G$ coincides
  with its centralizer; in particular, it contains the center of
  $G$.] <th:maximal-torus-equals-centralizer>

#corollary[The intersection of all maximal tori of a connected reductive
  algebraic group coincides with the center of the group.]

#problem[#source(177)Under the conditions of
  Theorem~@th:maximal-torus-equals-centralizer let $T$ be a maximal torus
  contained in a Borel subgroup $B$. Then the normalizer $N_B (T)$ of $T$ in $B$
  coincides with $T$.] <pr:torus-normalizer-in-borel>

#problem[Prove Theorem~@th:maximal-torus-equals-centralizer.]
<pr:prove-maximal-torus-equals-centralizer>

=== Weyl Group <ss:weyl-group>
We will use the notation of @ss:weyl-chambers-and-simple-roots. Let
$lambda in bold(E)$, $lambda != 0$. Recall that we denote by $r_lambda$ the
orthogonal reflection in $bold(E)$ with respect to the hyperplane $L_lambda$.
Clearly, the orthogonal reflection in the dual space $bold(F) = bold(E)^*$ with
respect to the hyperplane given by @eq:root-hyperplane coincides with
$attach(r, tl: t)_lambda$, but for simplicity we denote it by $r_lambda$ as
well. Consider the groups $W$ and $W^or$ of orthogonal transformations of the
spaces $bold(F)$ and $bold(E)$, respectively, generated by reflections $r_alpha$
$(alpha in Delta)$. The group $W$ is called the #idx(
  "Weyl group",
)_Weyl group_ of the root system $Delta$. It is clear from
@eq:mirror-as-coroot-kernel that $W^or$ is the Weyl group of the dual root
system $Delta^or$. Since $r_alpha^2 = e$, the map $w -> attach(w, tl: t)^(-1)$
is an isomorphism $W -> W^or$.

The definition of a root system implies that $W^or (Delta) = Delta$. Therefore
$W$ transforms the system of singular hyperplanes $P_alpha$, $alpha in Delta$,
into itself and permutes Weyl chambers.

#problem[The Weyl group is finite.] <pr:weyl-group-finite>

#theorem[The Weyl group $W$ acts simply transitively on the set of all the Weyl
  chambers in $bold(F)$ and so does $W^or$ on the set of all the bases of
  $Delta$. Fix a base $Pi subset Delta$. Then $W$ and $W^or$ are generated by
  reflections $r_alpha$, $alpha in Pi$, and for any $alpha in Delta$ there
  exists $w in W^or$ such that $w(alpha) in Pi$ (or
  $1/2 w(alpha) in Pi$).] <th:weyl-group-simply-transitive>

The proof uses the following notion. Two Weyl chambers $C$ and $C'$ are called
#idx("Weyl chamber", "adjacent")_adjacent_ if there exists a hyperplane
$P subset bold(F)$ such that $P inter C = P inter C' = emptyset$ and
$P inter overline(C) inter overline(C)'$ contains a nonempty subset, open in
$P$. In this case the hyperplane $P$ is a common wall of the chambers $C$ and
$C'$ and these chambers are located on different sides of $P$.
Problem~@pr:walls-of-weyl-chamber implies that the reflection with respect to
$P$ maps $C$ and $C'$ onto each other.

#problem[Given two Weyl chambers $C$, $C'$, there exists a sequence $C_0$,
  $C_1$, ..., $C_r$ of Weyl chambers such that $C = C_0$, $C' = C_r$ and $C_i$,
  $C_(i+1)$ are adjacent $(i = 0, ..., r - 1)$.] <pr:chambers-joined-by-gallery>

Now fix a system of simple roots $Pi subset Delta$ and denote by $W'$ the
subgroup of $W$ generated by the reflections $r_alpha$ $(alpha in Pi)$, i.e. the
reflections with respect to the walls of the Weyl chamber $C_0$ corresponding to
$Pi$ (Problem~@pr:walls-of-weyl-chamber).

#problem[$W'$ is transitive on the set of all Weyl
  chambers.] <pr:simple-reflections-transitive>

#problem[$W'$ coincides with $W$.] <pr:simple-reflections-generate-weyl>

#problem[Let $w = r_(alpha_1) ... r_(alpha_t)$ be an expression of an element
  $w in W$ as a product of the smallest possible number of generators $r_alpha$
  $(alpha in Pi)$ ($t = 0$ if $w = e$). Then the only hyperplanes of the form
  $P_beta$ $(beta in Delta)$ that separate the Weyl chambers #source(
    178,
  )$C_0$ and $w(C_0)$ are the following $t$ hyperplanes:
  $
    P_(alpha_1), r_(alpha_1) (P_(alpha_2)), ...,
    r_(alpha_1) ... r_(alpha_(t-1)) (P_(alpha_t)).
  $] <pr:reduced-word-separating-hyperplanes>

The number $t = l(w)$ is called the #idx("length")_length_ of $w$.

Problems~@pr:simple-reflections-transitive,
@pr:simple-reflections-generate-weyl, @pr:reduced-word-separating-hyperplanes
and @pr:root-simple-for-some-chamber imply
Theorem~@th:weyl-group-simply-transitive.

#theorem[Any closed Weyl chamber $overline(C)$ is a fundamental set for the Weyl
  group $W$, i.e. it intersects the orbit $W(y)$ of any point $y in bold(F)$ at
  a single point.] <th:closed-chamber-fundamental-domain>

The existence of a point $y_0 in W(y) inter overline(C)$ follows from
Theorem~@th:weyl-group-simply-transitive and its uniqueness follows from
Problem~@pr:common-point-of-chambers-fixed:

#problem[If $y in overline(C) inter w(overline(C))$, where $w in W$, then
  $w(y) = y$.] <pr:common-point-of-chambers-fixed>

Another application of Theorem~@th:weyl-group-simply-transitive is the following
important theorem which shows that a reduced root system is determined up to an
isomorphism by its system of simple roots.

#theorem[Let $Delta subset bold(E)$, $Delta' subset bold(E)'$ be root systems of
  the same rank, $Pi subset Delta$ a base,
  $phi: chevron.l Delta chevron.r -> chevron.l Delta' chevron.r$ an isomorphism
  of $Pi$ onto a subsystem $Pi' = phi(Pi) subset Delta'$. If $Delta$ is reduced
  then $phi$ is an isomorphism of $Delta$ onto the root system
  $phi(Delta) subset Delta'$. If $Delta'$ is also reduced and $Pi'$ is a base of
  $Delta'$ then $phi(Delta) = Delta'$.] <th:root-system-determined-by-base>

#problem[Prove this theorem.] <pr:prove-base-determines-root-system>

Now consider the case when $Delta = Delta_G$ is the root system of a connected
reductive algebraic group $G$ with respect to a maximal torus $T$. Consider the
map $nu: n |-> (Ad n)|frak(t)(RR)$ of $N(T)$ in the group of orthogonal
transformations of the space $bold(F) = frak(t)(RR)$. Clearly, this map is a
homomorphism. Let $W''$ be its image. It is clear from
Problem~@pr:n-alpha-induces-reflection that $W subset W''$.

#problem[The kernel of the homomorphism $nu: N(T) -> W''$ coincides with
  $T$.] <pr:normalizer-action-kernel-torus>

#problem[The group $W''$ acts simply transitively on the set of Weyl chambers
  and coincides with $W$.] <pr:normalizer-image-is-weyl-group>

Therefore, we have proved

#theorem[The homomorphism $nu$ defines an isomorphism of the group $N(T)\/T$
  onto the Weyl group of the root system
  $Delta_G$.] <th:reductive-weyl-group-normalizer-quotient>

Problem~@pr:normalizer-image-is-weyl-group gives also another proof of simple
transitivity of the Weyl group action on the set of Weyl chambers (cf.
Theorem~@th:weyl-group-simply-transitive).

The Weyl group of the root system $Delta_G$ is called the #idx(
  "Weyl group",
)_Weyl group of the reductive algebraic group $G$ or of its Lie algebra
$frak(g)$._

_Example._ Let $G = GL_n (CC)$ and let $T$ be the subgroup of all invertible
diagonal matrices (see @ss:roots-of-classical-lie-algebras[°]). In
$frak(t)(RR)$, consider the basis ${E_(i i) quad (i = 1, ..., n)}$. Clearly, the
reflection $r_(alpha_(i j))$ transposes $E_(i i)$ with $E_(j j)$ and preserves
all other vectors of the basis. Therefore, $W tilde.equiv S_n$. The group $N(T)$
is the group of all monomial matrices, i.e. matrices with exactly one nonzero
element in each row and column.
