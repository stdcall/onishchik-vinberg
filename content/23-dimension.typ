// Chapter 2, § 3. Dimension and Analytic Properties of Algebraic Varieties.
// Printed pages 87-97; page 87 begins with the end of § 2, whose file
// carries its source-page anchor.
#import "main-defs.typ": *
#import "statements.typ": *

== Dimension and Analytic Properties of Algebraic Varieties
<sec:dimension-analytic-properties>

In this section “algebraic varieties” are understood as quasiprojective
algebraic varieties (but other varieties will do if the reader knows what those
concepts mean).

=== Definition of the Dimension and its Main Properties
<ss:dimension-definition-properties>
Let $A$ be an algebra without zero divisors. Elements $u_1, ..., u_m in A$ are
called _algebraically independent_ (over $K$) if they do not satisfy any
nontrivial algebraic relation with coefficients in $K$. In such a case
$K[u_1, ..., u_m] tilde.equiv K[X_1, ..., X_m]$. A maximal algebraically
independent system of elements is called a _transcendence basis_ of $A$.

#problem[Algebraically independent elements $u_1, ..., u_m in A$ form a
  transcendence basis if and only if $A$ is an algebraic extension of a
  subalgebra $K[u_1, ..., u_m]$ (see
  @ss:homomorphism-extension-theorems).] <pr:transcendence-basis-criterion>

#problem[Let $A = K[u_1, ..., u_n]$ and ${u_1, ..., u_m}$ be a maximal
  algebraically independent subsystem of ${u_1, ..., u_n}$. Then
  ${u_1, ..., u_m}$ is a transcendence basis of
  $A$.] <pr:transcendence-basis-from-generators>

#problem[Any transcendence basis of $A$ is a transcendence basis of
  $Q A$.] <pr:transcendence-basis-fraction-field>

#theorem[If $A$ has a transcendence basis of $m$ elements, then any $n > m$ of
  its elements are algebraically
  dependent.] <th:dependence-beyond-transcendence-basis>

Proof see e.g. in [@bib:Lang1965]. Another proof will be given in
@ss:derivations-of-function-algebra.

#corollary[#source(103)All transcendence bases of $A$ contain the same number of
  elements.]

This number is called the _transcendence degree_ of $A$ and denoted $trdeg A$.
If $A$ has no (finite) transcendence basis we set $trdeg A = oo$.

Clearly, the transcendence degrees of a subalgebra and a quotient algebra do not
exceed the transcendence degree of the algebra. By
Problem~@pr:transcendence-basis-fraction-field $trdeg A = trdeg Q A$. Finally,
$trdeg K[X_1, ..., X_n] = n$.

The #idx("dimension (of an algebraic variety)")_dimension_ of an irreducible
algebraic variety $M$ is $dim M = trdeg K(M)$. The _dimension_ of an arbitrary
algebraic variety is the maximum of dimensions of its irreducible components.
Clearly, the dimension of a variety equals the dimension of any of its dense
open subvarieties and $dim PP^n = dim AA^n = n$.

#problem[If $N$ is a subvariety of an algebraic variety $M$ then
  $dim N <= dim M$.] <pr:subvariety-dimension-bound>

#problem[Under the conditions of Problem~@pr:subvariety-dimension-bound, if $M$
  is irreducible and $N$ is closed in $M$, then $dim N = dim M$ implies
  $N = M$.] <pr:equal-dimension-closed-subvariety>

#theorem[Any non-descending chain $N_1 subset N_2 subset dots.c$ of irreducible
  closed subsets in an algebraic variety $M$ is
  stable.] <th:irreducible-chains-stabilize>

#problem[Prove Theorem~@th:irreducible-chains-stabilize.]
<pr:prove-irreducible-chains-stabilize>

=== Derivations of the Algebra of Functions
<ss:derivations-of-function-algebra>
Let $phi$ be a homomorphism of an algebra $A$ without zero divisors into a field
$L$ containing $K$ (and considered as a $K$-algebra). A linear map
$partial: A -> L$ is called a #idx("Derivation")_$phi$-derivation of $A$ into
$L$_ if
$
  partial(a b) = partial(a) phi(b) + phi(a) partial(b),
$ <eq:phi-derivation-leibniz>
for any $a, b in A$. It is easy to see that $partial(1) = 0$. The set of all
$phi$-derivations of $A$ into $L$ is a vector space over $L$ with respect to the
natural operations:
$
  (partial_1 + partial_2)(a) & = partial_1 (a) + partial_2 (a), \
         (lambda partial)(a) & = lambda partial(a) wide "for" lambda in L.
$ <eq:derivation-space-operations>
This space will be denoted by $D(A, L)$.

#problem[Let $A = K[X_1, ..., X_n]$. Then for any $lambda_1, ..., lambda_n in L$
  there exists a unique $phi$-derivation $partial: A -> L$ which transforms
  $X_i$ into $lambda_i$ for
  $i = 1, ..., n$.] <pr:polynomial-derivation-by-generators>

Clearly, under the conditions of Problem~@pr:polynomial-derivation-by-generators
$dim D(A, L) = n$.

Consider a particular case, when $A subset L$ and $phi = id$. In this case we
will simply speak about a derivation of $A$ into $L$.

#problem[Any derivation $partial: A -> L$ uniquely extends to a derivation
  $Q A -> L$.] <pr:derivation-extends-to-fractions>

#problem[Let $char K = 0$#ed-note[The book omits this assumption. Without it the
    statement fails: if $char K = p > 0$, the derivation $d\/d t$ of $A = K[t]$
    does not extend to $B = K[t^(1\/p)]$, since
    $1 = partial t = partial((t^(1\/p))^p)
    = p (t^(1\/p))^(p-1) partial(t^(1\/p)) = 0$.
    Problem~@pr:derivation-space-dimension-trdeg and
    Theorem~@th:dimension-jacobian-rank nevertheless hold for every $K$: the
    field $Q A$ is a separable algebraic extension of a field of rational
    functions $K(z_1, ..., z_d)$, and the argument of the hint to
    Problem~@hint:derivation-extends-algebraically applies to it; see #cite(
      <Geck2003>,
      form: "full",
    ), Proposition 1.4.5 and Exercise 1.8.15.] and let $B subset L$ be a
  subalgebra finitely generated over $A$. If $B$ is an algebraic extension of
  $A$, then any derivation $partial: A -> L$ uniquely extends to a derivation
  $B -> L$.] <pr:derivation-extends-algebraically>

#problem[If $A subset L$ is a finitely generated algebra, then
  $dim D(A, L) = trdeg A$.] <pr:derivation-space-dimension-trdeg>

#source(104)Theorem~@th:dependence-beyond-transcendence-basis easily follows
from Problem~@pr:derivation-space-dimension-trdeg: take $Q A$ instead of $L$.

Thus, if $M$ is an irreducible algebraic variety then
$ dim M = dim D(K(M), K(M)). $ <eq:dimension-via-derivations>

#theorem[Let $M subset AA^n$ be an irreducible algebraic variety and
  ${f_1, ..., f_m}$ a system of generators of $I(M)$. Let $r$ be the rank of
  $J = lr(display((partial(f_1, ..., f_m))/(partial(X_1, ..., X_n))) |)_M$
  (as of a matrix with entries in $K(M)$). Then
  $dim M = n - r$.] <th:dimension-jacobian-rank>

To prove the theorem first of all note that $dim M = dim D(K[M], K(M))$.
Further, $K[M] tilde.equiv K[X_1, ..., X_n]\/I(M)$. Let $pi$ be a homomorphism
of $K[X_1, ..., X_n]$ into the field $K(M)$ defined by the formula
$pi(f) = f|_M$. To any derivation $partial: K[M] -> K(M)$ assign a
$pi$-derivation $tilde(partial): K[X_1, ..., X_n] -> K(M)$ by the formula
$tilde(partial) f = partial pi(f)$.

#problem[The map $partial |-> tilde(partial)$ is an isomorphism of the space
  $D(K[M], K(M))$ onto the space of $pi$-derivations of $K[X_1, ..., X_n]$ into
  $K(M)$ that vanish on $I(M)$.] <pr:derivations-vanishing-on-ideal>

#problem[Prove
  Theorem~@th:dimension-jacobian-rank.] <pr:prove-dimension-jacobian-rank>

=== Simple Points <ss:simple-points>
Let $M$ be an irreducible algebraic variety in $AA^n$ and $J$ a matrix with
entries from $K[M]$ constructed as in Theorem~@th:dimension-jacobian-rank. A
point $x in M$ is #idx("point", "simple")_simple_, if $rk J(x) = rk J$.

This definition has, actually, an intrinsic sense. Moreover, _for any point
$x in M$ the number $n - rk J(x)$ does not depend on an embedding of $M$ into an
affine space._ The proof of this fact is similar to that of
Theorem~@th:dimension-jacobian-rank. Consider the homomorphism
$ phi_x: K[M] -> K, quad f |-> f(x) $
and denote by $D_x (K[M], K)$ the space of all $phi_x$-derivations of $K[M]$
into the field $K$. The elements of this space are the linear maps
$partial: K[M] -> K$ satisfying
$ partial(f g) = partial f dot g(x) + f(x) dot partial g. $

#problem[$dim D_x (K[M], K) = n - rk J(x)$.]
<pr:point-derivations-jacobian-rank>

In particular, since $rk J(x) <= rk J = r$, then
$dim D_x (K[M], K) >= n - r = dim M$, and the equality holds if and only if $x$
is a simple point of $M$. This gives an intrinsic characterization of simple
points of irreducible affine varieties.

The notion of a simple point may be extended to arbitrary algebraic varieties.
To do this let us give a local definition of a simple point of an irreducible
affine variety $M$ that does not involve $K[M]$.

For a point $x in M$ define its local algebra $O_x$ as the algebra of all
rational functions on $M$ defined at $x$.

#problem[#source(105)Any $phi_x$-derivation of $K[M]$ into $K$ uniquely extends
  to a $phi_x$-derivation of $O_x$ into
  $K$.] <pr:point-derivation-extends-local>

Now, denote by $D_x (O_x, K)$ the space of all $phi_x$-derivations of $O_x$ into
$K$. Problems~@pr:point-derivations-jacobian-rank and
@pr:point-derivation-extends-local imply that $x$ is simple if and only if
$ dim D_x (O_x, K) = dim M. $ <eq:simple-point-criterion>

For an _irreducible quasiprojective variety $M$_ the
equality~@eq:simple-point-criterion is understood as a definition of a _simple_
point. The local algebra $O_x$ in this situation is defined exactly as in the
affine case, i.e. as the algebra of all rational functions on $M$ defined at
$x$.

The set of all simple points of $M$ is denoted by $M^"reg"$.

#problem[Let $N$ be an open subvariety of an irreducible algebraic variety $M$.
  Then $N^"reg" = N inter M^"reg"$.] <pr:simple-points-of-open-subvariety>

#problem[The set $M^"reg"$ is non-empty and open in
  $M$.] <pr:simple-points-nonempty-open>

Finally, a point of a reducible algebraic variety $M$ is _simple_ if it is a
simple point of an irreducible component of $M$ of the maximal dimension and is
not contained in any other irreducible component.

All points of an algebraic variety $M$ which are not simple are called #idx(
  "point",
  "singular",
)_singular._ A variety $M$ is called #idx(
  "algebraic variety",
  "non-singular",
)_non-singular_ if it has no singular points. Clearly, it is so if and only if
all irreducible components of $M$ are non-singular, have the same dimension and
have empty intersections.

Problem~@pr:simple-points-nonempty-open and the definition of simple points of
reducible varieties imply that the set of singular points is always a closed
subvariety whose dimension is strictly less than that of the variety itself.

#problem[Any algebraic variety $M$ is the union of a finite number of
  nonintersecting nonsingular subvarieties.] <pr:nonsingular-stratification>

=== The Analytic Structure of Complex and Real Algebraic Varieties
<ss:analytic-structure-of-varieties>
The _dimension of a real affine variety $M$_ is the dimension of its
complexification $M(CC)$; a point $x in M$ is _simple_ if it is a simple point
of $M(CC)$. Clearly, simple points constitute a nonempty open subset of $M$. It
is denoted by $M^"reg"$.

#theorem[Let $M$ be a $d$-dimensional irreducible algebraic variety in a complex
  or real affine space $AA^n$. Then $M^"reg"$ is a $d$-dimensional analytic
  subvariety of $AA^n$.] <th:simple-points-analytic-subvariety>

In both cases the theorem is proved similarly. Let $K$ stand for $CC$ in the
first case and for $RR$ in the second case. Let
$f_1, ..., f_m in K[X_1, ..., X_n]$ be a system of generators of $I(M)$ and $J$
a matrix with entries from $K[M]$ constructed as in
Theorem~@th:dimension-jacobian-rank.

Let $x in M(K)$ be a simple point. We may assume that the minor
$Delta = display((D(f_1, ..., f_r))/(D(X_1, ..., X_r)))$ of the matrix
$display((partial(f_1, ..., f_m))/(partial(X_1, ..., X_n)))$ is non-zero at $x$
and all the bordering minors vanish identically on $M$.

#problem[#source(106)There exist $g_(i k) in K[X_1, ..., X_n]$, where
  $i = 1, ..., m$ and $k = 1, ..., r$, such that
  $
    Delta (partial f_i)/(partial X_j)
    equiv sum_(1 <= k <= r) g_(i k) (partial f_k)/(partial X_j)
    quad (mod I(M)) quad (i = 1, ..., m; j = 1, ..., n)
  $] <pr:jacobian-rows-linear-dependence>

Consider the algebraic variety $M' subset AA^n$ defined by the equations
$f_i (x) = 0$, where $i = 1, ..., r$.

#problem[There exists a neighbourhood $U$ of $x$ in the real topology of $AA^n$
  such that $M' inter U$ is a $d$-dimensional analytic subvariety of $AA^n$ and
  $M inter U = M' inter U$.] <pr:local-equations-at-simple-point>

The theorem is proved.#qed-mark

Notice that if $K = RR$ then $M^"reg"$ is at the same time a real analytic
subvariety of the complex analytic variety $M^"reg" (CC)$ and any of its tangent
spaces is a real form of the tangent space of $M^"reg" (CC)$ at the same point.

#problem(corollary: true)[Any $d$-dimensional algebraic variety $M$ in a complex
  or real affine space $AA^n$ is the union of a finite number of nonintersecting
  analytic subvarieties of $AA^n$, the maximal of their dimensions being equal
  to $d$.] <pr:analytic-stratification>

Theorem~@th:simple-points-analytic-subvariety proved enables us to introduce a
natural analytic structure on an arbitrary nonsingular complex algebraic
variety.

#theorem[Any $d$-dimensional nonsingular complex algebraic variety possesses a
  unique structure of a $d$-dimensional complex analytic variety such that

  1) all rational functions are analytic in their domains;

  2) in an appropriate neighbourhood of any point a system of analytic
  coordinates may be chosen from the restrictions of rational
  functions.] <th:nonsingular-variety-analytic-structure>

#problem[The analytic structure on an embedded nonsingular affine complex
  algebraic variety defined as on an analytic subvariety of an affine space
  satisfies the conditions of
  Theorem~@th:nonsingular-variety-analytic-structure.]
<pr:affine-analytic-structure-conditions>

#problem[Prove Theorem~@th:nonsingular-variety-analytic-structure.]
<pr:prove-nonsingular-analytic-structure>

#problem[Any morphism of nonsingular complex algebraic varieties is an analytic
  map.] <pr:morphisms-are-analytic>

#problem[The analytic structure of the direct product of nonsingular complex
  algebraic varieties coincides with the analytic structure of their direct
  product as of analytic varieties.] <pr:analytic-structure-of-product>

=== Realification of Complex Algebraic Varieties
<ss:realification-of-varieties>
A complex analytic variety can be considered as a real analytic variety (of
doubled dimension), and similarly a complex algebraic variety can be considered
as a real algebraic variety. We confine ourselves to the construction of the
realification functor for affine varieties.

#source(107)First, let us agree to consider the $n$-dimensional complex affine
space $AA^n$ also as the $2n$-dimensional real affine space $AA^(2n) (RR)$
identifying $(Z_1, ..., Z_n) in AA^n$ with
$(X_1, ..., X_n, Y_1, ..., Y_n) in AA^(2n) (RR)$, where $X_k + i Y_k = Z_k$.

Now let $M$ be an algebraic variety in $AA^n$. Rewriting the equations which
define it in real coordinates, it is easy to see that it is an algebraic variety
in $AA^(2n) (RR)$, too. The variety $M$ determined in this way will be called a
#idx("realification of an algebraic variety")_realification_ of $M$ and denoted
by $M^RR$.

Similarly, passing to real coordinates it is easy to see that any morphism of
embedded complex affine varieties is at the same time a morphism of the
corresponding real varieties. Therefore the realification makes sense
independently of an embedding.

#problem[$dim M^RR = 2 dim M$.] <pr:realification-doubles-dimension>

Let us describe the polynomial algebra on $M^RR$. Let $z_1, ..., z_n$ be the
restrictions onto $M$ of coordinate functions on $AA^n$. By the definition
$RR[M^RR]$ is generated by the real and imaginary parts of these functions.
Sometimes it is more convenient to consider the algebra
$CC[M^RR] = RR[M^RR] times.o_RR CC$ of “complex polynomials” on $M^RR$ that
contains functions $z_1, ..., z_n$ themselves. The above implies that
$
  CC[M^RR] = CC[z_1, ..., z_n, overline(z)_1, ..., overline(z)_n]
$ <eq:realification-polynomial-algebra>
Therefore, $CC[M^RR]$ is generated by $CC[M] = CC[z_1, ..., z_n]$ and
$overline(CC[M]) = CC[overline(z)_1, ..., overline(z)_n]$.

This shows, in particular, that closed subsets of $M^RR$ are the subsets defined
by algebraic equations with respect to $z_1, ..., z_n$ and
$overline(z)_1, ..., overline(z)_n$. Considered as real algebraic varieties,
they are called (_closed_) _real subvarieties_ of $M$.

A map $f: M -> N$ of complex affine varieties is an #idx(
  "map",
  "antiholomorphic",
)_antiholomorphic morphism_ if $f^* CC[N] subset overline(CC[M])$. Clearly,
antiholomorphic morphisms, as well as genuine (holomorphic) morphisms, are
morphisms of realified varieties.

#problem[Any antiholomorphic morphism is continuous in the complex Zariski
  topology.] <pr:antiholomorphic-zariski-continuous>

#problem[Let $M$ be a real affine variety. Then there exists a unique
  antiholomorphic automorphism $x |-> overline(x)$ (complex conjugation) of
  $M(CC)$ identical on $M$. Moreover, we have
  $ M = {x in M(CC): overline(x) = x} $
  and $overline(overline(x)) = x$ for any
  $x in M(CC)$.] <pr:complex-conjugation-on-complexification>

In conclusion notice that $(M times N)^RR = M^RR times N^RR$ for any complex
affine varieties $M$ and $N$.

=== Forms of Vector Spaces and Algebras <ss:forms-of-vector-spaces-algebras>
Let $V$ be a vector space or algebra (not necessarily commutative or
associative) over an arbitrary field $K$ and $k$ a subfield of $K$. One says
that a $k$-subspace (resp. $k$-subalgebra) $V_0 subset V$ is a _$k$-form_ of the
space (resp. algebra) $V$ if the identity embedding $V_0 subset V$ extends to an
#source(108)isomorphism $V_0 times.o_k K arrow.r.tilde V$, i.e. a basis of $V_0$
over $k$ is a basis of $V$ over $K$. A subspace $U subset V$ is _defined over
$k$ (with respect to $V_0$)_ if it is generated by vectors of $V_0$. In this
case $U_0 = U inter V_0$ is a $k$-form of $U$ and $V_0\/U_0$ is a $k$-form of
$V\/U$.

For instance $k[X_1, ..., X_n]$ is a $k$-form of $K[X_1, ..., X_n]$. More
generally, let $M = M_0 (K)$ be an affine variety over $K$ obtained by a field
extension from an affine variety $M_0$ over $k$. Assuming $M_0$ embedded in the
$n$-dimensional affine space we deduce from
Problem~@pr:field-extension-zariski-closure that $I(M) = K I(M_0)$ and therefore
$k[M_0] = k[X_1, ..., X_n]\/I(M_0)$ is a $k$-form of
$K[M] = K[X_1, ..., X_n]\/I(M)$.

A linear map $phi: U -> V$ of vector spaces with distinguished $k$-forms $U_0$,
$V_0$ is _defined over $k$_ if $phi(U_0) subset V_0$. Clearly, the kernel and
the image of such a map are defined over $k$.

If $K$ is the Galois extension of $k$ then it is convenient to describe the
$k$-forms in terms of the Galois group action. In particular, this is so in the
only important for us case $K = CC$, $k = RR$ when the Galois group is generated
by the complex conjugation. We will only consider this case and instead of
“$RR$-form” we will say “#idx("real form of an algebra")_real form_”.

A real form $V_0$ of a complex vector space (resp. algebra) $V$ defines an
involutive antilinear automorphism $tau$ of this space (resp. algebra)---the
complex conjugation with respect to $V_0$---so that
$V_0 = {v in V: tau(v) = v}$.

#problem[Conversely, let $tau$ be an involutive antilinear automorphism of a
  complex vector space (resp. algebra) $V$. Then the set $V_0$ of the fixed
  points of $tau$ is a real form of the space (resp. algebra)
  $V$.] <pr:antilinear-involution-real-form>

#problem[A subspace $U subset V$ is defined over $RR$ if and only if
  $tau(U) = U$.] <pr:real-subspace-conjugation-invariant>

#problem[A linear map of complex vector spaces with fixed real forms is defined
  over $RR$ if and only if it commutes with the complex
  conjugation.] <pr:real-map-commutes-conjugation>

=== Real Forms of Complex Algebraic Varieties <ss:real-forms-of-varieties>
A #idx("real form of an algebraic variety")_real form_ of a complex affine
variety $M$ is its closed real subvariety $M_0$ such that the identity embedding
$M_0 subset M$ extends to an isomorphism
$ M_0 (CC) arrow.r.tilde M. $ <eq:real-form-variety-isomorphism>

Therefore the passage to a real form of an algebraic variety is an operation
inverse to the complexification. However, unlike the complexification and the
realification, this operation is not uniquely defined and does not always exist.

The complex conjugation on $M_0 (CC)$ is transported onto $M$ via
@eq:real-form-variety-isomorphism. The involutive antiholomorphic automorphism
$tau$ of $M$ obtained in this way is called the #idx(
  "complex conjugation",
)_complex conjugation (with respect to $M_0$)_. Clearly
$M_0 = {x in M: tau(x) = x}$.

With certain reservations the converse statement, similar to
Problem~@pr:antilinear-involution-real-form, holds.

#theorem[Let $tau$ be an involutive antiholomorphic automorphism of an
  irreducible complex affine variety $M$. If the set $M_0$ of its fixed points
  contains at least one simple point then $M_0$ is a real form of
  $M$.] <th:antiholomorphic-involution-real-form>

#proof[#source(109)For any $f in CC[M]$ set
  $ f^tau (x) = overline(f(tau(x))) wide (x in M). $
  The map $f |-> f^tau$ is an involutive antilinear automorphism of $CC[M]$. By
  Problem~@pr:antilinear-involution-real-form
  $ CC[M]_0 = {f in CC[M]: f^tau = f}, $
  is a real form of $CC[M]$. Let $CC[M]_0 = RR[x_1, ..., x_n]$ and let
  $f_1, ..., f_m in RR[X_1, ..., X_n]$ be generators of the ideal of relations
  between $x_1, ..., x_n$. Suppose that $M$ is embedded into the complex affine
  space $AA^n$ so that $x_1, ..., x_n$ are the coordinate functions. Then $tau$
  is just a coordinate-wise complex conjugation and $M_0$ is the set of real
  points of $M$. The ideal $I(M)$ is generated by the polynomials
  $f_1, ..., f_m$. By Theorem~@th:dimension-jacobian-rank
  $rk lr(display((partial(f_1, ..., f_m))/(partial(X_1, ..., X_n))) |)_M
  = r = n - d$, where $d = dim M$.

  Let $x in M_0$ be a simple point of $M$. Without loss of generality we may
  assume that $display((D(f_1, ..., f_r))/(D(X_1, ..., X_r))) != 0$ at $x$. Then
  by Problem~@pr:local-equations-at-simple-point there exists a neighbourhood
  $U$ of $x$ in a real topology of $AA^n$ such that $M inter U$ is defined by
  the equations $f_i (x) = 0$, $i = 1, ..., r$. On the other hand, if $U$ is
  sufficiently small then the real solutions of these equations in $U$
  constitute a $d$-dimensional real analytic subvariety. Therefore
  $dim M_0 = dim M_0 (CC) = d$. Since $M_0 (CC) subset M$ and $M$ is
  irreducible, $M_0 (CC) = M$ (Problem~@pr:equal-dimension-closed-subvariety),
  as required.]

#exercises[
  #exercise[Any $(n - 1)$-dimensional irreducible algebraic variety in $AA^n$
    (resp. in $PP^n$) can be defined by a single (resp. homogeneous)
    equation.] <exc:hypersurface-single-equation>

  #exercise[Any nontrivial (resp. homogeneous) equation defines in $AA^n$ (resp.
    in $PP^n$) a variety of dimension $n - 1$.] <exc:hypersurface-dimension>

  #exercise[Let $char K != 2$. The line $X_1 = 1$, $X_2 = 0$ in $AA^3$ cannot be
    singled out of the surface $X_1^2 + X_2 X_3 = 1$ by a single
    equation.] <exc:line-in-quadric-not-hypersurface>

  #exercise[Let $f: M -> N$ be a dominant morphism of irreducible algebraic
    varieties. Then $dim N <= dim M$.] <exc:dominant-morphism-dimension-bound>

  #exercise[If, under the conditions of
    Exercise~@exc:dominant-morphism-dimension-bound, $dim N = dim M$ then there
    exists a nonempty open subset $N_0 subset N$ such that any point of $N_0$
    has only a finite number of preimages.] <exc:equal-dimension-finite-fibres>

  #exercise[In Theorem~@th:irreducible-chains-stabilize it is impossible not to
    require irreducibility of $N_k$.] <exc:chain-condition-needs-irreducibility>

  #exercise[$PP^n$ satisfies the ascending chain condition for irreducible
    quasiprojective algebraic varieties (see
    @ss:direct-product-quasiprojective).]
  <exc:projective-space-ascending-chains>

  #exercise[If $char K = 0$ and an irreducible algebraic variety $M subset AA^n$
    is singled out by the equations $f_i (x) = 0$ for $i = 1, ..., m$, then
    $rk J <= n - dim M$ (see Theorem~@th:dimension-jacobian-rank). Give an
    example (one can do it even for $n = m = 1$) when
    $rk J < n - dim M$.] <exc:jacobian-rank-strict-inequality>

  #exercise[#source(110)The derivations $partial\/partial X_i$ constitute a
    basis of the space
    $D(K(X_1, ..., X_n), K(X_1, ..., X_n))$.] <exc:partial-derivatives-basis>

  #exercise[Let $M subset AA^2$ be defined by the equation $X_1^2 + X_2^2 = 1$.
    Find a basis of the space $D(K(M), K(M))$.] <exc:circle-derivations-basis>

  #exercise[Under the notation of the proof of
    Theorem~@th:simple-points-analytic-subvariety the variety $M$ is an
    irreducible component of the variety
    $M'$.] <exc:component-of-subsystem-variety>

  #exercise[Under the notation of Theorem~@th:simple-points-analytic-subvariety
    let $x$ be a simple point of $M$. For any tangent vector
    $xi in T_x (M^"reg")$ put $partial_xi$ for the derivation along $xi$. Then
    the map $xi |-> partial_xi$ is an isomorphism of $T_x (M)$ onto
    $D_x (K[M], K)$, where $K = CC$ or
    $RR$.] <exc:tangent-vectors-as-derivations>

  In
  Exercises~@exc:derivation-restriction-surjective–@exc:zero-derivatives-constant-function
  we assume $char K = 0$.

  #exercise[Let $A$ and $B$ be subalgebras of the field $L$ that contains $K$,
    such that $A subset B$ and $B$ is finitely generated over $A$. Then the
    restriction map $D(B, L) -> D(A, L)$ is an
    epimorphism.] <exc:derivation-restriction-surjective>

  #exercise[Let $f: x |-> (f_1 (x), ..., f_m (x))$ be a morphism of an
    irreducible algebraic variety $M$ into $AA^m$. Further, let
    ${partial_1, ..., partial_k}$ be a basis of the space $D(K(M), K(M))$.
    Consider the matrix $(partial_j f_i)$ with entries from $K(M)$. Suppose that
    $rk(partial_j f_i) = l$. Then
    $dim f(M) = l$.] <exc:image-dimension-jacobian-rank>

  #exercise[If $f_1, ..., f_n in K(X_1, ..., X_n)$ are such that
    $display((D(f_1, ..., f_n))/(D(X_1, ..., X_n))) != 0$ then these functions
    are algebraically independent.] <exc:jacobian-criterion-independence>

  #exercise[Let $M subset AA^n$ be an irreducible algebraic variety and
    $f in K(AA^n)$. If $(partial f\/partial X_i)|_M = 0$ for $i = 1, ..., n$,
    then $f|_M = "const"$.] <exc:zero-derivatives-constant-function>

  The _Poincaré series_ of a nonnegatively graded vector space $V$ with finite
  dimensional grading subspaces $V_k$ is the formal power series
  $ P_V (t) = sum_(k >= 0) (dim V_k) t^k. $
  Clearly, if $U subset V$ is a homogeneous subspace then
  $ P_(V\/U) (t) = P_V (t) - P_U (t). $

  If $A$ is a graded algebra then a _graded $A$-module_ is an $A$-module $M$
  graded as a vector space so that $A_k M_l subset M_(k+l)$ for any
  $k, l in ZZ$.

  #exercise[Let $A = K[U_0, U_1, ..., U_n]$ and $M$ a finitely generated graded
    $A$-module. Then $P_M (t) = p(t)\/(1 - t)^(k+1)$, where $p$ is a polynomial
    with integer coefficients and $k <= n$. (Hint: prove by induction in $n$
    with the kernel of the multiplication by $U_n$ considered as a graded
    $K[U_0, U_1, ..., U_(n-1)]$-module).] <exc:poincare-series-graded-module>

  #exercise[Let $P(t) = sum_(k >= 0) a_k t^k$ be a formal power series with
    rational coefficients. It may be presented in the form
    $P(t) = p(t)\/(1 - t)^(d+1)$, where $p$ is a polynomial and $p(1) != 0$, if
    and only if $a_k = f(k)$ for sufficiently large $k$, where $f$ is a
    polynomial of degree $d$.] <exc:rational-series-polynomial-coefficients>

  #exercise[Let $M subset PP^n$ be a $d$-dimensional algebraic variety and
    $A = K[M]^"pr"$. Then $P_A (t) = p(t)\/(1 - t)^(d+1)$, where $p$ is a
    polynomial with integer coefficients and
    $p(1) != 0$.] <exc:poincare-series-projective-variety>

  #exercise[#source(111)The same as in
    Exercise~@exc:poincare-series-projective-variety but with $K[M]^"pr"$
    replaced by any graded algebra of the form $K[U_0, U_1, ..., U_n]\/I$, where
    $I$ is a homogeneous ideal whose set of zeros is
    $M$.] <exc:poincare-series-homogeneous-ideal>

  #exercise[Let $M subset PP^n$ be an irreducible algebraic variety and
    $M_1 = {x in M: p(x) = 0}$, where $p in K[M]^"pr"$ is a nonzero homogeneous
    element of positive degree. Then
    $dim M_1 = dim M - 1$.] <exc:hypersurface-section-dimension>

  #exercise[The dimension of an irreducible algebraic variety equals $d$ if and
    only if the maximum of the dimensions of its proper closed subvarieties
    equals $d - 1$.] <exc:dimension-via-proper-subvarieties>

  #exercise[Let $M$ be an irreducible algebraic variety in a complex affine
    space and $overline(M)$ its complex conjugate. There is an isomorphism
    $M^RR (CC) arrow.r.tilde M times overline(M)$ which to any $x in M^RR$
    assigns $(x, overline(x)) in M times overline(M)$.]
  <exc:realification-complexification-variety>

  #exercise[Let $M$ be an irreducible complex affine variety. Prove that
    $(M^RR)^"reg" = M^"reg"$.] <exc:realification-simple-points>
]

#hints[
  #hint[@pr:transcendence-basis-from-generators][Apply
    Problem~@pr:generated-by-algebraic-is-algebraic.]

  #hint[@pr:transcendence-basis-fraction-field][Let $B subset A$ be a subalgebra
    generated by a given transcendence basis. It suffices to verify that if
    $a in A$, where $a != 0$, then $a^(-1) in Q A$ is algebraic over $B$. Let
    $b_0 + b_1 a + dots.c + b_m a^m = 0$, where $b_i in B$ and $b_0 != 0$. Then
    $a^(-1) = -b_0^(-1) (b_1 + b_2 a + dots.c + b_m a^(m-1))$, i.e.
    $a^(-1) in Q B[a]$. Next, apply
    Problem~@pr:generated-by-algebraic-is-algebraic.]

  #hint[@pr:subvariety-dimension-bound][Reduce to the case when $M$ and $N$ are
    irreducible and $M$ is an affine variety. Next, make use of the fact that if
    $M$ is an irreducible affine variety then $dim M = trdeg K[M]$.]

  #hint[@pr:equal-dimension-closed-subvariety][Reduce to the case when $M$ is an
    affine variety. Then there is a homomorphism $sigma: K[M] -> K[N]$. We must
    prove that its kernel is zero. Let ${f_1, ..., f_k}$ be a transcendence
    basis of $K[N]$ and $overline(f)_i$, where $i = 1, ..., k$, are elements of
    $K[M]$ such that $sigma(overline(f)_i) = f_i$. Then
    ${overline(f)_1, ..., overline(f)_k}$ is a transcendence basis of $K[M]$.
    Put $A = K[overline(f)_1, ..., overline(f)_k]$ and let $f in Ker sigma$,
    where $f != 0$. Then $f$ is algebraic over $A$, i.e. there are
    $a_0, a_1, ..., a_m in A$, where $a_0 != 0$, such that
    $a_0 + a_1 f + dots.c + a_m f^m = 0$. Applying $sigma$ to this equality we
    get $sigma(a_0) = 0$ which is impossible because of algebraic independence
    of $f_1, ..., f_k$.]

  #hint[@pr:derivation-extends-to-fractions][It suffices to put
    $partial(a\/b) = (partial(a) b - a partial(b))\/b^2$.]

  #hint[@pr:derivation-extends-algebraically][Reduce to the case $B = A[u]$. If
    $f$ is a minimal polynomial of $u$ over $A$ then $f'(u) != 0$ and
    $partial u$ is determined from the linear equation
    $f'(u) partial u + f^partial (u) = 0$, where $f^partial$ is the polynomial
    obtained from $f$ by applying $partial$
    coefficient-wise.] <hint:derivation-extends-algebraically>

  #hint[@pr:derivation-space-dimension-trdeg][Follows from
    Problems~@pr:polynomial-derivation-by-generators and
    @pr:derivation-extends-algebraically.]

  #hint[@pr:prove-dimension-jacobian-rank][First prove that if $tilde(partial)$
    is a $pi$-derivation of $K[X_1, ..., X_n]$ into $K(M)$ which carries $X_i$
    into $lambda_i$ then
    $
      tilde(partial)(f)
      = sum_(1 <= i <= n) lambda_i lr((partial f)/(partial X_i) |)_M
    $
    for any polynomial $f in K[X_1, ..., X_n]$.]

  #hint[@pr:point-derivations-jacobian-rank][To each derivation
    $partial in D_x (K[M], K)$ assign the derivation
    $tilde(partial) = partial dot pi in D_x (K[X_1, ..., X_n], K)$, where $pi$
    is the restriction homomorphism onto $M$. The map
    $partial |-> tilde(partial)$ is an isomorphism of the space $D_x (K[M], K)$
    onto the space #source(112)of $phi_x$-derivations of $K[X_1, ..., X_n]$ into
    $K$ that vanish on $I(M)$. The derivation
    $tilde(partial) in D_x (K[X_1, ..., X_n], K)$ is defined by the numbers
    $lambda_i = tilde(partial) X_i$ and it vanishes on $I(M)$ if and only if
    $
      sum_j lambda_j (partial f_i)/(partial X_j) (x) = 0
      quad "for" quad i = 1, ..., m.
    $
    Hence, these derivations form the space of dimension $n - rk J(x)$.]

  #hint[@pr:point-derivation-extends-local][Proved similarly to
    Problem~@pr:derivation-extends-to-fractions.]

  #hint[@pr:simple-points-nonempty-open][By
    Problem~@pr:open-affine-contains-finite-set and
    Problem~@pr:simple-points-of-open-subvariety the proof reduces to the affine
    case for which the statement follows from the first definition of a simple
    point.]

  #hint[@pr:nonsingular-stratification][Take $M^"reg"$ to be one of the required
    subvarieties.]

  #hint[@pr:jacobian-rows-linear-dependence][Consider the decomposition with
    respect to the last column of each minor of order $r + 1$ of the matrix
    $display((partial(f_1, ..., f_m))/(partial(X_1, ..., X_n)))$ bordering
    $Delta$.]

  #hint[@pr:local-equations-at-simple-point][The implicit function theorem
    implies that in a neighbourhood $U$ of the point $x$ (in the real topology
    of $AA^n$) the equations of the variety $M'$ can be written in the form
    $ X_i = phi_i (X_(r+1), ..., X_n) quad "for" quad i = 1, ..., r $
    where $phi_i$ are smooth functions and the point $(X_(r+1), ..., X_n)$ runs
    over an open (in the real topology) set $V subset AA^(n-r)$. We may assume
    that $Delta != 0$ everywhere on $U$ and $V$ is pathwise connected. Let us
    prove that $M' inter U = M inter U$. Let $x = (X_1^0, ..., X_n^0)$. Consider
    a smooth path $X_i = X_i (t)$, where $i = r + 1, ..., n$, in $V$ satisfying
    $X_i (0) = X_i^0$. The corresponding smooth path $x(t)$ on $M'$ satisfies
    $x(0) = x$. Problem~@pr:jacobian-rows-linear-dependence implies that along
    $x(t)$ we have
    $
      (d f_i)/(d t) = sum_(1 <= k <= m) psi_(i k) (t) f_k
      quad "for" quad i = 1, ..., m
    $
    where $psi_(i k)$ are certain smooth functions. Since $f_i (x(0)) = 0$ for
    $i = 1, ..., m$, then $f_i (x(t)) = 0$ for any $t$ i.e. $x(t) in M$.]

  #hint[@pr:prove-nonsingular-analytic-structure][The uniqueness is obvious. It
    suffices to prove the existence for the affine varieties (cf.
    Problems~@pr:open-affine-contains-finite-set and
    @pr:simple-points-of-open-subvariety) in which case it follows from
    Problem~@pr:affine-analytic-structure-conditions.]

  #hint[@pr:realification-doubles-dimension][Compare the complex and the real
    analytic structure on $M = M^RR$ described in
    Problem~@pr:analytic-stratification.]

  #hint[@pr:antilinear-involution-real-form][If $V$ is considered as a real
    vector space then $tau$ is its involutive linear transformation. The space
    $V$ decomposes over $RR$ into the direct sum of eigensubspaces $V_0$ and
    $V_1$ of this transformation corresponding to the eigenvalues $1$ and $-1$
    respectively. Since $tau$ is antilinear over $CC$, then $V_1 = i V_0$,
    hence, $V_0$ is a real form of $V$.]

  #hint[@pr:real-subspace-conjugation-invariant][See
    Problem~@pr:real-subspace-iff-conjugation-stable.]
]
