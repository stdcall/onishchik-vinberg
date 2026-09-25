// Chapter 4, § 4. Automorphisms. Printed pages 202-220. The section opens
// page 202 (the Hints of § 3 end on page 201); Chapter 5 begins on page
// 221.
#import "main-defs.typ": *
#import "statements.typ": *

// The algebra of derivations, fraktur "der" as in the book; the subgroup
// "Aut Π with a hat" of automorphisms lifted from the Dynkin diagram; the
// caret of B^ (the space of affine functions on an affine space B).
#let hAut = math.op($hat(upright("Aut"))$)
#let caret = sym.hat

== Automorphisms <sec:semisimple-algebra-automorphisms>

#source(217)In this section we study automorphisms of the complex semisimple Lie
algebras. First we prove that the group of outer automorphisms (see
@ss:automorphisms-and-derivations[°]) of a semisimple Lie algebra is isomorphic
to the group of automorphisms of its Dynkin diagram. We then study semisimple
automorphisms of a semisimple Lie algebra $frak(g)$ up to conjugacy in
$Aut frak(g)$. The main result is an explicit description of classes of
semisimple automorphisms whose eigenvalues are of absolute value 1. This
description, involving the affine Dynkin diagrams, is due (in case of periodic
automorphisms) to V.G.~Kac, but its proof presented in this book essentially
differs from the original one (for an exposition of the latter see
[@bib:Helgason1978]) and goes back to the well-known paper by F.R.~Gantmacher
[@bib:Gantmacher1939a]. Especially important for us is the description of
classes of involutive automorphisms since it will be used in
Ch.~@ch:real-semisimple-groups in the classification of real simple Lie
algebras. At the end of the section we consider semisimple automorphisms of
simply connected semisimple Lie groups and we prove that the set of fixed points
of such an automorphism is connected. All Lie groups and Lie algebras are
defined over $CC$; $(dot, dot)$ denotes the Cartan scalar product on a
semisimple Lie algebra.

=== The Group of Outer Automorphisms <ss:outer-automorphism-group>
Let $frak(g)$ be a semisimple Lie algebra. In this section we calculate the
group $Aut frak(g)\/Int frak(g)$ of its outer automorphisms (see
@ss:automorphisms-and-derivations[°]). As it is known, $Aut frak(g)$ is a linear
algebraic group whose tangent algebra is the algebra of derivations
$der frak(g)$. The ideal $ad frak(g) subset der frak(g)$ is isomorphic to
$frak(g)$ and therefore is algebraic. Clearly, the corresponding connected
algebraic normal subgroup of $Aut frak(g)$ coincides with $Int frak(g)$.

Let $frak(h)$ be a maximal diagonalizable subalgebra in $frak(g)$. Let
$Delta_frak(g)$ be the root system with respect to $frak(h)$ and
$Pi subset Delta_frak(g)$ a base. Each automorphism $theta in Aut frak(g)$ is
the differential $d Theta$ of an automorphism $Theta$ of the connected algebraic
group $G$ with the tangent algebra $frak(g)$ (e.g. of the automorphism
$Theta(a) = theta a theta^(-1)$ of $G = Int frak(g)$). Applying
Problem~@pr:automorphisms-act-on-weights-roots we see that if
$theta(frak(h)) = frak(h)$ then $theta(frak(h)(RR)) = frak(h)(RR)$ and
$attach(theta, tl: t)(Delta_frak(g)) = Delta_frak(g)$. Since $theta$ preserves
the Cartan scalar product, $attach(theta, tl: t) in Aut Delta_frak(g)$. Now
consider the subgroup
$
  Aut(frak(g), frak(h), Pi) = {theta in Aut frak(g): theta(frak(h)) =
    frak(h), attach(theta, tl: t)(Pi) = Pi}.
$
Assigning to an automorphism $theta in Aut(frak(g), frak(h), Pi)$ the
automorphism $(attach(theta, tl: t)|Pi)^(-1) in Aut Pi$ we get a homomorphism
$ eta: Aut(frak(g), frak(h), Pi) -> Aut Pi. $

Let us prove that $eta$ is surjective. For this fix a canonical system of
generators ${h_alpha, e_alpha, e_(-alpha) quad (alpha in Pi)}$ of $frak(g)$
associated with $frak(h)$ and $Pi$ (see @ss:uniqueness-theorems[°]). By
Theorem~@th:cartan-matrix-determines-algebra for any $tau in Aut Pi$ there
exists a unique automorphism $hat(tau) in Aut(frak(g), frak(h), Pi)$ such that
$
  hat(tau)(h_alpha) = h_(tau^(-1)(alpha)), wide
  hat(tau)(e_alpha) = e_(tau^(-1)(alpha)), wide
  hat(tau)(e_(-alpha)) = e_(-tau^(-1)(alpha)) quad (alpha in Pi).
$ <eq:diagram-automorphism-lift>
#source(218)Clearly, the map $zeta: tau |-> hat(tau)$ is a homomorphism of
$Aut Pi$ into $Aut(frak(g), frak(h), Pi)$ such that $eta zeta = id$. We see that
$eta$ isomorphically maps the subgroup
$hAut Pi = Im zeta subset Aut(frak(g), frak(h), Pi)$ onto $Aut Pi$. It is also
clear that
$ Aut(frak(g), frak(h), Pi) = Ker eta times.r hAut Pi. $

Denote by $H = exp ad frak(h)$ the maximal torus of $Int frak(g)$ corresponding
to $ad frak(h) tilde.eq frak(h)$. Clearly, $H subset Ker eta$.

#problem[$Ker eta = Aut(frak(g), frak(h), Pi) inter Int frak(g) = H$, therefore
  $Aut(frak(g), frak(h), Pi) = H times.r hAut Pi$.]
<pr:inner-base-stabilizer-is-torus>

Now we extend $eta$ to a homomorphism of the whole group $Aut frak(g)$ onto
$Aut Pi$ (the extended homomorphism will be denoted by the same letter $eta$).

#problem[$Aut frak(g) = Aut(frak(g), frak(h), Pi) dot Int frak(g)$.]
<pr:automorphisms-stabilizer-times-inner>

Problems~@pr:inner-base-stabilizer-is-torus and
@pr:automorphisms-stabilizer-times-inner imply

#theorem[$Aut frak(g) = Int frak(g) times.r hAut Pi$. In particular,
  $Aut frak(g)\/Int frak(g) tilde.eq Aut Pi$. The corresponding homomorphism
  $eta: Aut frak(g) -> Aut Pi$ coincides with
  $eta: theta |-> (attach(theta, tl: t)|Pi)^(-1)$ on
  $Aut(frak(g), frak(h), Pi)$.] <th:outer-automorphisms-dynkin-diagram>

#problem(corollary: true)[The group $Int frak(g)$ coincides with the identity
  component of $Aut frak(g)$ and the different connected components of
  $Aut frak(g)$ are the sets $eta^(-1) (tau) = (Int frak(g)) hat(tau)$ for
  different $tau in Aut Pi$. The Lie algebra $der frak(g)$ coincides with
  $ad frak(g)$.] <pr:inner-automorphisms-identity-component>

=== Semisimple Automorphisms <ss:semisimple-automorphisms>
Let $theta$ be an automorphism of a semisimple Lie algebra $frak(g)$ which is a
semisimple linear transformation, $frak(g)(lambda) subset frak(g)$ the
eigenspace of $theta$ corresponding to $lambda in CC^*$. Then
$ frak(g) = plus.o.big_(lambda in CC^*) frak(g)(lambda). $

#problem[$[frak(g)(lambda), frak(g)(mu)] subset frak(g)(lambda mu)$ for any
  $lambda, mu in CC^*$. In particular,
  $frak(g)(1) = {x in frak(g): theta(x) = x}$ is a subalgebra of
  $frak(g)$.] <pr:automorphism-eigenspace-grading>

Denote $frak(g)(1)$ by $frak(g)^theta$.

#problem[$(frak(g)(lambda), frak(g)(mu)) = 0$ for any $lambda, mu$ such that
  $lambda mu != 1$. The scalar product is non-degenerate on
  $frak(g)(lambda) + frak(g)(1\/lambda)$ for any
  $lambda in CC^*$.] <pr:automorphism-eigenspace-pairing>

#theorem[If $frak(g) != 0$ is a semisimple Lie algebra and
  $theta in Aut frak(g)$ is a semisimple automorphism then
  $frak(g)^theta != 0$.] <th:fixed-subalgebra-nonzero>

Proof of this theorem is an immediate corollary of the following
Problems~@pr:nilpotent-element-in-ad-image–@pr:first-nonzero-eigenspace-nilpotent.

#problem[Any nilpotent element $x in frak(g)$ presents in the form $x = [x, y]$,
  where $y in frak(g)$.] <pr:nilpotent-element-in-ad-image>

#problem[If $frak(g)^theta = 0$ then $frak(g)(lambda)$ does not contain non-zero
  nilpotent elements for any
  $lambda in CC^*$.] <pr:no-fixed-points-no-nilpotents>

#problem[#source(219)If $lambda in CC^*$ is not a root of 1 then
  $frak(g)(lambda)$ consists of nilpotent elements. If all eigenvalues of
  $theta$ are roots of 1 then, clearly, $theta^m = e$ for certain positive
  integer $m$ so that all eigenvalues are of the form $epsilon^l$, where
  $epsilon = e^(2 pi i\/m)$.] <pr:non-root-unity-eigenspace-nilpotent>

#problem[If $theta^m = e$ and $frak(g)(epsilon^l) = 0$ for $0 <= l < k < m$ then
  $frak(g)(epsilon^k)$ consists of nilpotent
  elements.] <pr:first-nonzero-eigenspace-nilpotent>

#problem[The subalgebra $frak(g)^theta$ is a reductive algebraic subalgebra of
  $frak(g)$.] <pr:fixed-subalgebra-reductive>

Our aim is the classification of semisimple automorphisms up to conjugacy in
$Aut frak(g)$. The first step in this direction is the proof of the fact that
any semisimple automorphism $theta$ is conjugate to an element of
$Aut(frak(g), frak(h), Pi)$ where $frak(h)$ and $Pi$ are defined in
@ss:outer-automorphism-group. For this we make use of $frak(g)^theta$. Let
$frak(t)$ be a maximal diagonalizable subalgebra of $frak(g)^theta$ and
$frak(z)(frak(t))$ its centralizer in $frak(g)$.

#problem[The subalgebra $frak(z)(frak(t))$ is invariant with respect to $theta$
  and is a maximal diagonalizable subalgebra of
  $frak(g)$.] <pr:fixed-toral-centralizer-cartan>

#problem[In $frak(t)$, there exists an element regular with respect to
  $frak(h)_1 = frak(z)(frak(t))$. There exists a system of simple roots $Pi_1$
  of $frak(g)$ with respect to $frak(h)_1$ such that
  $attach(theta, tl: t)(Pi_1) = Pi_1$.] <pr:automorphism-invariant-base>

#problem[There exists $a in Int frak(g)$ such that
  $a theta a^(-1) in H hat(tau) subset Aut(frak(g), frak(h), Pi)$, where
  $tau = eta(theta)$.] <pr:conjugate-into-torus-coset>

Therefore it suffices to consider automorphisms taken from cosets
$H hat(tau) = hat(tau) H$, where $tau$ are different elements of $Aut Pi$.
Denote by $T_tau$ the subtorus of $H$ which is the identity component of the
subgroup $Z(hat(tau)) = {h in H: hat(tau) h hat(tau)^(-1) = h}$. Clearly,
$T_tau = exp(ad frak(t)_tau)$, where
$frak(t)_tau = frak(h)^hat(tau) = frak(h) inter frak(g)^hat(tau)$. Now we wish
to show that any element of $hat(tau) H$ is conjugate to an element of the
subset $hat(tau) T_tau$.

#problem[The subspace $Im(attach(tau, tl: t) - e) subset frak(h)$ coincides with
  $frak(t)_tau^perp$. The torus $H$ locally splits into the direct product of
  tori: $H = T_tau H_1$, where
  $H_1 = {hat(tau)^(-1) h hat(tau) h^(-1): h in H}$.]
<pr:torus-splitting-fixed-subtorus>

#problem[For any $theta in hat(tau) H$ there exists $h in H$ such that
  $h theta h^(-1) in hat(tau) T_tau$. In particular, $hat(tau) H$ consists of
  semisimple automorphisms.] <pr:coset-conjugate-into-fixed-subtorus>

Problems~@pr:conjugate-into-torus-coset and
@pr:coset-conjugate-into-fixed-subtorus imply

#theorem[Any semisimple automorphism $theta in Aut frak(g)$ is conjugate to an
  automorphism from the set $hat(tau) T_tau$, where $tau = eta(theta)$,
  $T_tau = exp(ad frak(h)^hat(tau))$.]
<th:semisimple-automorphism-normal-form>

#problem[If automorphisms $a_1, a_2 in Aut frak(g)$ are conjugate in
  $Aut frak(g)$ then $eta(a_1)$, $eta(a_2)$ are conjugate in $Aut Pi$.
  Conversely, if $tau_2 = sigma tau_1 sigma^(-1)$, where
  $tau_1, tau_2, sigma in Aut Pi$, then
  $hat(tau)_2 T_(tau_2) = hat(sigma)(hat(tau)_1 T_(tau_1)) hat(sigma)^(-1)$.]
<pr:conjugacy-reduces-to-diagram-class>

Theorem~@th:semisimple-automorphism-normal-form and
Problem~@pr:conjugacy-reduces-to-diagram-class imply that the problem of
classification of semisimple automorphisms of $frak(g)$ up to conjugacy reduces
to the following two problems:

a) find the conjugacy classes of $Aut Pi$;

b) for some representatives $tau$ of various conjugacy classes of $Aut Pi$
classify the elements of $hat(tau) T_tau$ up to conjugacy in $Aut frak(g)$.

#source(220)Problem a) belongs to the theory of finite groups. We will only
consider this problem for simple Lie algebras $frak(g)$, when it is trivial.
Most of this section is devoted to the solving of Problem b).

Let again $tau in Aut Pi$. Consider the automorphism $hat(tau)$ and the subspace
$frak(t)_tau = frak(h)^hat(tau)$. Let $r: frak(h)^* -> frak(t)_tau^*$ be the
restriction map. Clearly,
$r(Delta_frak(g) (frak(h)) union {0}) = Delta(frak(t)_tau) union {0}$.

#problem[$dim frak(t)_tau$ equals the number of orbits of the cyclic group
  $chevron.l tau chevron.r$ in $Pi$. For $alpha, beta in Pi$ we have
  $r(alpha) = r(beta)$ if and only if $alpha$ and $beta$ belong to the same
  orbit. If $alpha in Delta_frak(g) (frak(h))$ and $r(alpha) in r(Pi)$ then
  $alpha in Pi$. The different elements of $Pi_0 = r(Pi)$ form a basis of
  $frak(t)_tau^*$ and each element of $r(Delta_frak(g))$, the set coinciding
  with $Delta(frak(t)_tau)$, is expressed in terms of elements of $Pi_0$ with
  integer coefficients of the same sign. The centralizer $frak(z)(frak(t)_tau)$
  coincides with $frak(h)$. For any $theta in hat(tau) H$ the subalgebra
  $frak(t)_tau$ is a maximal diagonalizable subalgebra of
  $frak(g)^theta$.] <pr:root-restriction-to-fixed-cartan>

#problem[Let automorphisms $theta_1, theta_2 in hat(tau) T_tau$ be conjugate in
  $Aut frak(g)$, i.e. $theta_2 = g theta_1 g^(-1)$ for some $g in Aut frak(g)$.
  The automorphism $g$ can be chosen so that $g(frak(t)_tau) = frak(t)_tau$,
  $g hat(tau) g^(-1) in hat(tau) T_tau$.]
<pr:conjugator-preserves-fixed-cartan>

In $Aut frak(g)$, consider the subgroup
$S_tau = chevron.l hat(tau) chevron.r T_tau$. Clearly,
$S_tau = chevron.l hat(tau) chevron.r times T_tau$. Therefore $S_tau$ is a
quasitorus in $Aut frak(g)$ and $S_tau^0 = T_tau$ (see
@ss:algebraic-tori-quasitori[°]). Let $N_tau$ be the subgroup of the normalizer
$N(S_tau)$ of $S_tau$ in $Aut frak(g)$ consisting of $g in N(S_tau)$ such that
$a(g)$ transforms $hat(tau) T_tau$ into itself, i.e. induces the identity
automorphism of $S_tau\/T_tau$. Let $Omega_tau$ be the group of automorphisms
$omega(g)$ of $S_tau$ induced by the automorphisms $a(g)$ for $g in N_tau$.
Problem~@pr:conjugator-preserves-fixed-cartan implies

#theorem[Two automorphisms $theta_1, theta_2 in hat(tau) T_tau$ are conjugate in
  $Aut frak(g)$ if and only if $theta_2 = omega(theta_1)$ for some
  $omega in Omega_tau$.] <th:coset-conjugacy-by-normalizer>

To describe the orbits of the group $Omega_tau$ on the set $hat(tau) T_tau$ it
is convenient to go over to the simply connected covering space $frak(a)$ of the
manifold $hat(tau) T_tau$, which is an affine space with the associated vector
space $frak(t)_tau$. Here, instead of $Omega_tau$, the group of transformations
of $frak(a)$ covering the transformations from $Omega_tau$ is to be considered.
This group turns out to be very close to the group of affine transformations
generated by reflections with respect to some affine hyperplanes. These
hyperplanes correspond to some affine functions on $frak(a)$, which will be
called affine roots of the pair $(frak(g), tau)$. The following two subsections
are concerned with the construction of affine roots and the corresponding root
decomposition.

=== Characters and Automorphisms of Quasi-Tori
<ss:quasi-torus-characters-automorphisms>
Consider an algebraic quasi-torus of the form
$ S = chevron.l a chevron.r times T, $
where $T = S^0$ is a torus and $a$ an element of order $k$. Let $frak(t)$ be the
tangent algebra of the groups $T$ and $S$. As we have seen in
@ss:rational-structure-torus-algebra[°], any character $chi$ of $T$ is uniquely
determined by its differential $d_e chi in frak(t)^*$. We want to show that any
character of the quasi-torus $S$ is determined by a family of affine functions
on an affine space with the associated vector space $frak(t)$.

#source(221)Denote $A = a T$ and let $pi: frak(a) -> A$ be a covering with the
simply connected covering space $frak(a)$. Observe that $frak(t)$ may be
considered as the simply connected covering space of $T$, the covering
$cal(E): frak(t) -> T$ being defined as $cal(E)(x) = exp(2 pi i x)$. Let
$mu: T times A -> A$ be the natural simply transitive action of the group $T$ on
$A$, i.e. $mu(t, b) = b t$. Fix a point $tilde(a) in frak(a)$, such that
$pi(tilde(a)) = a$. By the property~@eq:covering-lifting-property of simply
connected coverings (see @ss:simply-connected-covering-groups[°]) there exists a
unique differentiable map $tilde(mu): frak(t) times frak(a) -> frak(a)$ covering
$mu$ and such that $tilde(mu)(0, tilde(a)) = tilde(a)$.

#problem[The map $tilde(mu)$ is a simply transitive action of the group
  $frak(t)$ on $frak(a)$ and thus defines on $frak(a)$ a structure of an affine
  space with the associated vector space $frak(t)$. The action $tilde(mu)$ does
  not depend on the choice of a point $tilde(a)$ such that
  $pi(tilde(a)) = a$.] <pr:covering-space-affine-structure>

Denote by $t_x: frak(a) -> frak(a)$ the translation by $x in frak(t)$, i.e. set
$ t_x (y) = tilde(mu)(x, y) wide (x in frak(t), y in frak(a)). $

A character $lambda in cal(X)(S)$ is uniquely determined by its values on $A$.
In fact, if $lambda|A$ is known, then so is $lambda(a) in CC^*$ and for any
$t in T$ we know $lambda(t) = lambda(a t) lambda(a)^(-1)$. Consider the covering
$cal(E): CC -> CC^*$ defined by the formula $cal(E)(z) = exp(2 pi i z)$. By the
property~@eq:covering-lifting-property of simply connected covering spaces there
exists a differentiable function $tilde(lambda): frak(a) -> CC$ covering
$lambda$. This function is uniquely determined by its value
$tilde(lambda)(tilde(a))$ which is chosen up to an arbitrary integer summand.

#problem[Any function $tilde(lambda)$ covering $lambda in cal(X)(S)$ is an
  affine function with the linear part $d lambda in frak(t)^*$ and
  $tilde(lambda)(tilde(a)) in 1/k ZZ$. Conversely, an affine function
  $xi: frak(a) -> CC$ such that $xi(tilde(a)) in 1/k ZZ$ whose linear part is
  the differential of a character of $T$ covers some character of the
  quasi-torus $S$.] <pr:quasi-torus-character-affine-lift>

Set
$
  frak(a)(RR) = {y in frak(a): tilde(lambda)(y) in RR "for any"
    lambda in cal(X)(S)}.
$

#problem[We have $frak(a)(RR) = {t_x (tilde(a)): x in frak(t)(RR)}$. Thus
  $frak(a)(RR)$ is a real affine space with the associated vector space
  $frak(t)(RR)$. Each function $tilde(lambda)$ covering $lambda in cal(X)(S)$ is
  completely determined by its restriction to
  $frak(a)(RR)$.] <pr:real-form-of-covering-space>

Therefore, to each character $lambda in cal(X)(S)$ we have assigned a family of
real affine functions on $frak(a)(RR)$, any two of them differing by an integer
summand. Any of these functions $tilde(lambda)$ completely determines $lambda$.

Similar considerations may be applied to the automorphisms of the quasi-torus
$S$ transforming $A$ into itself, i.e. identical on $S\/T$. An automorphism
$phi$ of this sort is uniquely determined by its restriction to $A$. Moreover,
the transformation $phi|A$ admits a covering $tilde(phi): frak(a) -> frak(a)$,
which is uniquely determined by its value $tilde(phi)(tilde(a)) = z$. The
element $z in frak(a)$ may be an arbitrary element satisfying $pi(z) = phi(a)$.

#problem[Any covering transformation $tilde(phi): frak(a) -> frak(a)$ is affine
  and has $d_e phi$ as its linear part. The transformation $tilde(phi)$ maps
  $frak(a)(RR)$ onto itself and is uniquely determined by its restriction to
  $frak(a)(RR)$.] <pr:quasi-torus-automorphism-affine-lift>

=== Affine Root Decomposition <ss:affine-root-decomposition>
#source(222)Now we consider the quasi-torus
$S_tau = chevron.l hat(tau) chevron.r times T_tau$, where $tau$ is a fixed
automorphism of a system of simple roots $Pi$ (see
@ss:semisimple-automorphisms). The tangent algebra of $S_tau$ is
$ad frak(t)_tau$. It is convenient to identify it with $frak(t)_tau$ with the
help of the isomorphism $ad$. Thus in our case $frak(t) = frak(t)_tau$. We also
have $A = hat(tau) T_tau$, $a = hat(tau)$.

For any affine space $B$ over a field $k$ denote by $B^caret$ the vector space
of all affine functions $B -> k$. Clearly, $dim B^caret = dim B + 1$. If
$phi: B_1 -> B_2$ is an affine map of affine spaces then the formula
$ (attach(phi, tl: t)(alpha))(x) = alpha(phi(x)) $
determines a linear map $attach(phi, tl: t): B_2^caret -> B_1^caret$.

Let $Psi subset cal(X)(S)$ be the set of all weights of the identity
representation of $S$ in $frak(g)$. Then
$ frak(g) = plus.o.big_(lambda in Psi) frak(g)^lambda, $
where $frak(g)^lambda != 0$ is the weight subspace corresponding to $lambda$.
The affine functions $tilde(lambda) in frak(a)(RR)^caret$ corresponding to the
weights $lambda in Psi$ will be called #idx("root", "affine")_affine roots_ of
the pair $(frak(g), tau)$; the set of all affine roots will be denoted by
$Delta^tau subset frak(a)(RR)^caret$. Since the affine root $tilde(lambda)$
covering a weight $lambda$ is completely determined by its linear part
$alpha = d lambda$ and the number $s = tilde(lambda)(tilde(a))$, we write
$tilde(lambda) = (alpha, s)$. Clearly, here
$alpha in Delta(frak(t)_tau) union {0}$ is a weight of the identity
representation of $Int(frak(g))$ with respect to $T_tau$ and $s in 1/k ZZ$,
where $k$ is the order of $tau$. We will write
$frak(g)^tilde(lambda) = frak(g)^lambda$. If $(alpha, s) in Delta^tau$ then
$(alpha, s + m) in Delta^tau$ for any $m in ZZ$ and
$frak(g)^((alpha, s)) = frak(g)^((alpha, s + m))$. We have
$frak(g) = sum_(xi in Delta^tau) frak(g)^xi$.

#problem[$Delta^tau$ generates
  $frak(a)(RR)^caret$.] <pr:affine-roots-span-affine-functions>

#problem[If $xi = (alpha, s) in Delta^tau$ then
  $frak(g)^xi = frak(g)_alpha inter frak(g)(epsilon^s)$, where $frak(g)_alpha$
  is the root subspace corresponding to $alpha in Phi_ad$ and
  $frak(g)(epsilon^s)$ is the eigenspace of $hat(tau)$ with
  $epsilon = e^(2 pi i\/k)$. Furthermore,
  $
    frak(g)(epsilon^s) = sum_(xi = (alpha, s)) frak(g)^xi, wide
    frak(g)_alpha = sum_(xi = (alpha, s)) frak(g)^xi
  $] <pr:affine-root-space-intersection>

#problem[For any $xi, eta in Delta^tau$ we have
  $
    [frak(g)^xi, frak(g)^eta] cases(
      subset frak(g)^(xi + eta) quad & "if" xi + eta in Delta^tau",",
      = 0 & "otherwise.",
    )
  $] <pr:affine-root-spaces-bracket>

The roots with zero linear parts are called #idx(
  "root",
  "affine",
  "imaginary",
)_imaginary_ and the other roots are called #idx(
  "root",
  "affine",
  "real",
)_real_ ones. Denote the sets of imaginary and real roots by $Delta_"im"^tau$
and $Delta_"re"^tau$ respectively. Problem~@pr:affine-root-space-intersection
implies that
$ frak(h) = sum_(xi in Delta_"im"^tau) frak(g)^xi $

#source(223)It turns out that the real roots have a number of properties similar
to the usual properties of roots and weights. To prove this we will make use of
some three-dimensional subalgebras of $frak(g)$ as in
@ss:three-dimensional-subalgebras[°]. For any $xi = (alpha, s)$,
$eta = (beta, t) in Delta^tau$ write $(xi, eta) = (alpha, beta)$,
$chevron.l xi|eta chevron.r = chevron.l alpha|beta chevron.r$. If
$xi in Delta_"re"^tau$ then the element $h_alpha in frak(t)_tau (RR)$ determined
by @eq:coroot-h-lambda will also be denoted by $h_xi$.

#problem[For any $xi in Delta^tau$ we have $-xi in Delta^tau$. If
  $xi in Delta_"re"^tau$ then
  $[frak(g)^xi, frak(g)^(-xi)] = chevron.l h_xi chevron.r$.]
<pr:opposite-affine-root-bracket>

Let $e_xi in frak(g)^xi$, $e_(-xi) in frak(g)^(-xi)$ be elements such that
$[e_xi, e_(-xi)] = h_xi$. Then the map $psi_xi: frak(s l)_2 (CC) -> frak(g)$
defined by the formulas
$
  psi_xi (bold(e)) = e_xi, wide psi_xi (bold(f)) = e_(-xi), wide
  psi_xi (bold(h)) = h_xi
$
is an isomorphism of $frak(s l)_2 (CC)$ onto the subalgebra
$chevron.l e_xi, e_(-xi), h_xi chevron.r subset frak(g)$.

Let $xi in Delta_"re"^tau$, $eta in Delta^tau$. The set
${zeta in Delta^tau: zeta = eta + l xi quad (l in ZZ)}$ is called the #idx(
  "ξ-string",
)_$xi$-string of roots through $eta$._

#problem[Let $xi in Delta_"re"^tau$. Then the $xi$-string of roots through
  $eta in Delta^tau$ is of the form ${eta + l xi quad (-p <= l <= q)}$, where
  $p, q >= 0$ and $p - q = chevron.l eta|xi chevron.r$. If $(eta, xi) < 0$ then
  $eta + xi in Delta^tau$, and if $(eta, xi) > 0$ then
  $eta - xi in Delta^tau$.] <pr:affine-root-strings>

#problem[For any $xi in Delta_"re"^tau$ we have $dim frak(g)^xi = 1$. If
  $xi in Delta_"re"^tau$, $c in RR$ then $c xi in Delta^tau$ if and only if
  $c = -1, 0, 1$.] <pr:real-affine-root-multiplicity-one>

#problem[Under the notation of Problem~@pr:affine-root-strings we have
  $(ad e_xi)^(p+q) frak(g)^(eta - p xi) != 0$. If $xi in Delta_"re"^tau$ and
  $eta, eta + xi in Delta^tau$ then $[frak(g)^xi, frak(g)^eta] != 0$ and if
  $xi + eta in Delta_"re"^tau$ then
  $[frak(g)^xi, frak(g)^eta] = frak(g)^(xi + eta)$.]
<pr:affine-root-spaces-bracket-nonzero>

In $frak(g)$, consider the reductive algebraic subalgebra
$frak(g)^hat(tau) = frak(g)(1)$. By Problem~@pr:root-restriction-to-fixed-cartan
$frak(t)_tau = frak(g)^((0, 0))$ is a maximal diagonalizable subalgebra of
$frak(g)^hat(tau)$. Problem~@pr:affine-root-space-intersection implies that
$
  frak(g)^hat(tau) = plus.o.big_(xi = (alpha, 0)) frak(g)^xi
$ <eq:fixed-subalgebra-root-decomposition>

#problem[The subalgebra $frak(g)^hat(tau)$ has the zero centralizer in $frak(g)$
  and, in particular, is semisimple. The system $Pi_0 = r(Pi)$ is its system of
  simple roots with respect to $frak(t)_tau$. The root system
  $Delta_(frak(g)^hat(tau))$ coincides with the set of $alpha in frak(t)(RR)^*$
  such that
  $(alpha, 0) in Delta_"re"^tau$.] <pr:diagram-fixed-subalgebra-semisimple>

A root $xi = (alpha, s) in Delta^tau$ is called #idx(
  "root",
  "affine",
  "positive",
)_positive_ if either $s = 0$ and $alpha$ belongs to the set
$Delta_(frak(g)^hat(tau))^+$ of positive (with respect to $Pi_0$) roots of
$frak(g)^hat(tau)$ or $s > 0$. If $Delta^(tau +)$ is the set of all positive
roots then $Delta^tau = Delta^(tau +) union {0} union (-Delta^(tau +))$. A
positive root is called #idx("root", "affine", "simple")_simple_ if it does not
split into the sum of two positive roots. Let $Pi^tau subset Delta^(tau +)$ be
the system of simple roots. Clearly, $(alpha, 0) in Pi^tau$ if $alpha in Pi_0$.
If $xi, eta in Pi^tau$ and $xi != eta$ then $xi - eta in.not Delta^tau$.

Problem~@pr:automorphism-eigenspace-grading applied to $theta = hat(tau)$
implies that for any $s = m\/k$, where $m in ZZ$, the adjoint representation of
$frak(g)^hat(tau)$ in $frak(g)$ transforms the eigenspace $frak(g)(epsilon^s)$
of $hat(tau)$ into itself. The corresponding representation of
$frak(g)^hat(tau)$ in $frak(g)(epsilon^s)$ will be denoted by $ad_s$. Clearly,
$(alpha, s) in Delta^tau <=> alpha in Phi_(ad_s)$. Now we will establish the
relationship between simple roots and lowest weights of the representations
$ad_s$. (See @ss:classifying-irreducible-representations[°].)

#problem[The lowest weights of all representations $ad_s$ are
  non-zero.] <pr:eigenspace-lowest-weights-nonzero>

#problem[#source(224)If $(alpha, s) in Pi^tau$ and $s > 0$ then $alpha$ is a
  lowest weight of the representation $ad_s$. In particular,
  $Pi^tau subset Delta_"re"^tau$. If $alpha$ is a lowest weight of $ad_s$, then
  $(alpha - alpha', s) in.not Delta^tau$ for all
  $alpha' in Delta_(frak(g)^hat(tau))^+$. If, moreover,
  $(beta, t) in.not Delta^tau$ for all $beta != 0$ and $0 < t < s$ then
  $gamma = (alpha, s) in Pi^tau$ and $e_gamma$ is the corresponding lowest
  vector.] <pr:simple-affine-roots-lowest-weights>

#problem[Any $xi in Delta^(tau +)$ presents in the form
  $xi = sum_(gamma in Pi^tau) k_gamma gamma$, where $k_gamma$ are non-negative
  integers.] <pr:positive-affine-roots-simple-sums>

=== Affine Weyl Group <ss:affine-weyl-group>
Let again $frak(a)$ be the complex affine space covering the manifold
$A = hat(tau) T_tau$, $frak(a)(RR)$ its real form defined in
@ss:quasi-torus-characters-automorphisms. Notice that the associated vector
space $frak(t)_tau (RR)$ is a Euclidean space with respect to the Cartan scalar
product on $frak(g)$. So $frak(a)(RR)$ is an affine Euclidean space. Denote by
$I(frak(a)(RR))$ its group of motions.

Let $tilde(Omega)_tau$ be the set of all affine transformations $tilde(omega)$
of $frak(a)$ covering the transformations $omega|A$, where $omega in Omega_tau$.
By Problem~@pr:quasi-torus-automorphism-affine-lift we may identify
$tilde(Omega)_tau$ with the corresponding set of transformations of
$frak(a)(RR)$.

#problem[The set $tilde(Omega)_tau$ is a subgroup of $I(frak(a)(RR))$. The
  natural homomorphism $tilde(Omega)_tau -> Omega_tau$ is surjective and its
  kernel is ${t_x: x in frak(t)_tau (ZZ)}$.] <pr:lifted-group-motions-kernel>

#problem[For any $w in tilde(Omega)_tau$ we have
  $attach(w, tl: t)(Delta^tau) = Delta^tau$. If $w = tilde(omega(g))$, where
  $g in N_tau$, then $g(frak(g)^xi) = frak(g)^(attach(w, tl: t)^(-1)(xi))
  quad (xi in Delta^tau)$.]
<pr:lifted-group-permutes-affine-roots>

The definition of $tilde(Omega)_tau$ easily implies that
Theorem~@th:coset-conjugacy-by-normalizer can be reformulated as follows:

#theorem(prime: [@th:coset-conjugacy-by-normalizer])[The automorphisms
  $theta_1 = pi(y_1)$, $theta_2 = pi(y_2)$, where $y_1, y_2 in frak(a)$, are
  conjugate in $Aut frak(g)$ if and only if $y_2 = w(y_1)$ for some
  $w in tilde(Omega)_tau$.] <th:coset-conjugacy-on-covering-space>

Each real root $xi in Delta_"re"^tau$ determines the hyperplane
$P_xi = {y in frak(a)(RR): xi(y) = 0}$ in $frak(a)(RR)$. The connected
components of the set
$frak(a)(RR) without union.big_(xi in Delta_"re"^tau) P_xi$ will be called #idx(
  "chamber",
)_chambers._ Clearly, the chambers are open convex sets in $frak(a)(RR)$.
Problem~@pr:lifted-group-permutes-affine-roots implies that $tilde(Omega)_tau$
permutes the hyperplanes $P_xi$ and chambers. Let us show that it acts
transitively on the set of all chambers. To this end denote by $r_xi$ the
orthogonal reflection with respect to the hyperplane $P_xi$, where
$xi in Delta_"re"^tau$, and prove that $r_xi in tilde(Omega)_tau$.

Consider the homomorphism
$phi_xi = (ad) dot psi_xi: frak(s l)_2 (CC) -> ad frak(g)$ (see
Problem~@pr:opposite-affine-root-bracket) and denote by
$Phi_xi: SL_2 (CC) -> Int frak(g)$ the Lie group homomorphism such that
$d Phi_xi = phi_xi$. Let $n_xi = Phi_xi (mat(0, 1; -1, 0)) in Int frak(g)$.

#problem[We have $n_xi (frak(t)_tau) = frak(t)_tau$. If $xi = (alpha, s)$ then
  $n_xi|frak(t)(RR)$ coincides with the reflection $r_alpha$ with respect to the
  hyperplane $Ker alpha$.] <pr:affine-sl2-element-induces-reflection>

#problem[If $xi = (alpha, s)$ then
  $
    n_xi hat(tau) n_xi^(-1) = hat(tau) cal(E)(-s h_xi).
  $ <eq:reflection-twists-diagram-lift>]
<pr:sl2-element-conjugates-diagram-lift>

Therefore $n_xi in N_tau$. The reflection $r_xi$ covers the transformation
$omega(n_xi)$ and therefore belongs to $tilde(Omega)_tau$.

Let $W_tau$ be the subgroup of $tilde(Omega)_tau$ generated by the reflections
$r_xi$ for all $xi in Delta_"re"^tau$. The group $W_tau$ is called the #idx(
  "Weyl group",
  "affine",
)_affine Weyl group_ associated with $tau in Aut Pi$.

#source(225)Now we will establish certain properties of the affine Weyl groups
similar to those of the Weyl groups (see @ss:weyl-group[°]). In precisely the
same way as for the Weyl chambers we define the notion of a #idx(
  "chamber",
  "wall of",
)#idx("Wall of a chamber")_wall of a chamber._

#problem[The walls of any chamber are of the form $P_xi$, where
  $xi in Delta_"re"^tau$. Conversely, any hyperplane $P_xi$,
  $xi in Delta_"re"^tau$, is a wall of a chamber.] <pr:affine-chamber-walls>

#theorem[$W_tau$ acts simply transitively on the set of all chambers. If $D_0$
  is a fixed chamber and $P_(xi_1), ..., P_(xi_s)$, where
  $xi_1, ..., xi_s in Delta_"re"^tau$, are its walls then the reflections
  $r_(xi_1), ..., r_(xi_s)$ generate the group
  $W_tau$.] <th:affine-weyl-simply-transitive>

#theorem[The closure $overline(D)$ of any chamber $D$ is a fundamental set for
  the group $W_tau$, i.e. intersects each orbit of this group at a single
  point.] <th:affine-chamber-fundamental-domain>

#problem[Let $y_1, y_2 in overline(D)$, where $D$ is a chamber, and let
  $w in tilde(Omega)_tau$ be such that $y_2 = w(y_1)$. Then $w$ can be chosen so
  that $w(D) = D$.] <pr:conjugating-motion-preserves-chamber>

Now, show that the system of simple roots $Pi^tau$ defined in
@ss:affine-root-decomposition determines a chamber $D_0$ in the same way as any
system of simple roots of a usual root system determines a certain Weyl chamber
(see @ss:weyl-chambers-and-simple-roots[°]). Set
$
  D_0 = {y in frak(a)(RR): gamma(y) > 0 "for all" gamma in Pi^tau}.
$ <eq:fundamental-affine-chamber>

Let us prove that $D_0 != emptyset$. From
formula~@eq:fixed-subalgebra-root-decomposition we see that the correspondence
$alpha |-> (alpha, 0)$ is a bijection of the root system
$Delta_(frak(g)^hat(tau))$ of $frak(g)^hat(tau)$ with respect to $frak(t)_tau$
onto the subset of affine roots of the form $(alpha, 0)$, $alpha != 0$. The
bijection $x |-> t_x (tilde(a))$ of the space $frak(t)_tau (RR)$ onto
$frak(a)(RR)$ maps the hyperplane $P_alpha = Ker alpha$ onto $P_((alpha, 0))$
and the Weyl chamber
${x in frak(t)_tau (RR): alpha(x) > 0 "for all" alpha in Pi_0}$ onto an open
cone $C_0 subset frak(a)(RR)$ with vertex $tilde(a)$. Clearly,
$D_0 supset U inter C_0 != emptyset$ for a small neighbourhood $U$ of
$tilde(a)$.

Our arguments also imply that the Weyl group $W(frak(g)^hat(tau))$ of
$frak(g)^hat(tau)$ is identified with the subgroup of $W_tau$ generated by the
reflections of the form $r_((alpha, 0))$, $(alpha, 0) in Delta_"re"^tau$.

#problem[The set $D_0$ defined by @eq:fundamental-affine-chamber is a chamber.
  We have
  $
    overline(D)_0 = {y in frak(a)(RR): gamma(y) >= 0 "for all"
      gamma in Pi^tau}.
  $] <pr:simple-affine-roots-define-chamber>

The chamber $D_0$ defined by formula~@eq:fundamental-affine-chamber will be
called the #idx(
  "chamber",
  "fundamental",
)_fundamental chamber._ Clearly, any element $x in frak(t)_tau$ is uniquely
expressed in the form $x = u + i v$, where $u, v in frak(t)_tau (RR)$. We will
write $u = Re x$, $v = Im x$. Any $y in frak(a)$ is uniquely expressed in the
form $y = t_(i v) (z)$, where $v in frak(t)_tau (RR)$, $z in frak(a)(RR)$. We
write $z = Re y$.

An automorphism $theta in hat(tau) T_tau$ will be called #idx(
  "automorphism of a Lie algebra",
  "canonical",
)_canonical_ if $theta = pi(y)$ where $y in frak(a)$ and
$Re y in overline(D)_0$. Theorems~@th:coset-conjugacy-on-covering-space,
@th:affine-chamber-fundamental-domain and
Problem~@pr:conjugating-motion-preserves-chamber imply

#theorem[Any automorphism from $hat(tau) T_tau$ is conjugate to a canonical
  automorphism. If canonical automorphisms $theta_1 = pi(y_1)$ and
  $theta_2 = pi(y_2)$, where $y_i in frak(a)$,
  $Re y_i in overline(D)_0 quad (i = 1, 2)$, are conjugate then there exists a
  motion $w in tilde(Omega)_tau$ mapping $D_0$ onto itself such that
  $w(Re y_1) = Re y_2$.] <th:canonical-automorphism-conjugacy>

Let us consider the case $tau = id$. In this case $frak(a)(RR)$ coincides with
the Euclidean vector space $frak(h)(RR)$ considered as an affine Euclidean
space. The system of real #source(226)roots is of the form
$
  Delta_"re"^id = {(alpha, s): alpha in Delta_frak(g), s in ZZ}.
$
We will denote the group $W_id$ by $tilde(W)$. It contains the Weyl group $W$ of
the root system $Delta_frak(g)$ as a subgroup.

#problem[$r_((alpha, s)) r_alpha = t_(-s h_alpha)$ for any
  $alpha in Delta_frak(g)$ and
  $s in ZZ$.] <pr:affine-reflection-product-translation>

#problem[The group $tilde(W)$ splits into the semidirect product
  $tilde(W) = Q^or times.r W$ (here $Q^or$ is identified with the corresponding
  group of parallel translations in the space
  $frak(h)(RR)$).] <pr:affine-weyl-semidirect-coroots>

#problem[Let $tau = id$ and let $D$ be an arbitrary chamber. Then the set
  $overline(D) inter Q^or$ consists of a single
  point.] <pr:chamber-meets-coroot-lattice-once>

=== Affine Roots of a Simple Lie Algebra <ss:affine-roots-of-simple-algebra>
In this subsection we assume that $frak(g)$ is simple and we find an explicit
form of the system of simple roots $Pi^tau$ and the fundamental chamber for all
$tau in Aut Pi$.

#problem[For any $tau in Aut Pi$ the algebra $frak(g)^hat(tau)$ is
  simple.] <pr:diagram-fixed-subalgebra-simple>

The groups $Aut Pi$ of all simple Lie algebras are listed in
Table~@tab:centers-outer-automorphisms. This list shows that a non-trivial
automorphism $tau in Aut Pi$ exists only when $frak(g)$ is a Lie algebra of type
$A_n quad (n >= 2)$, $D_n$ or $E_6$. For all these algebras except $D_4$ there
exists a unique automorphism $tau != id$ of order 2. If $frak(g) = D_4$ then in
$Aut Pi tilde.eq S_3$ there exist, beside ${id}$, two classes of conjugate
elements containing all elements of order 2 and 3 respectively. Thus $k$ can
only equal 1, 2, 3.

#problem[The set $Delta_"im"^tau$ is the cyclic subgroup of $frak(a)(RR)^caret$
  generated by the root $(0, 1\/k)$.] <pr:imaginary-affine-roots-cyclic>

Let $Pi^tau subset Delta^tau$ be the system of simple roots defined in
@ss:affine-root-decomposition. Problem~@pr:affine-root-strings implies that
$(xi, eta) <= 0$ for any $xi, eta in Pi^tau$, $xi != eta$. Therefore the linear
parts of the roots of $Pi^tau$ (non-zero by
Problem~@pr:simple-affine-roots-lowest-weights) are different and constitute
non-acute angles. Let $Psi subset Delta(frak(t)_tau)$ be the system of linear
parts of affine simple roots.

#problem[Let $Pi_0 = {alpha_1, ..., alpha_l}$. The system of simple roots
  $Pi^tau$ is of the form $Pi^tau = {gamma_0, gamma_1, ..., gamma_l}$, where
  $gamma_j = (alpha_j, 0) quad (j = 1, ..., l)$, $gamma_0 = (alpha_0, 1\/k)$,
  $alpha_0$ is the (unique) lowest weight of the representation $ad_(1\/k)$. The
  system $Psi = {alpha_0, alpha_1, ..., alpha_l}$ is indecomposable. The system
  $Pi^tau$ is linearly independent and forms a basis of $frak(a)(RR)^caret$. If
  $tau = id$ then $alpha_0$ is the lowest root and $Psi = tilde(Pi)$ is the
  extended system of simple roots of
  $frak(g)$.] <pr:simple-affine-roots-description>

#problem[
  $
    alpha_0 = - sum_(1 <= j <= l) n_j alpha_j,
  $ <eq:affine-lowest-weight-expansion>
  where $n_j$ are positive integers. If we set $n_0 = 1$ then
  $
    sum_(0 <= j <= l) n_j gamma_j = (0, 1\/k).
  $ <eq:simple-affine-roots-null-relation>]
<pr:affine-marks-positive-integers>

#problem[#source(227)The matrix $A$ of $Psi$ with the elements
  $a_(i j) = chevron.l alpha_i|alpha_j chevron.r$ is an indecomposable affine
  Cartan matrix.] <pr:affine-cartan-matrix-of-automorphism>

Recall that all indecomposable affine Cartan matrices were listed in
@ss:classification-root-systems[°]. Now we will find the affine Dynkin diagrams
corresponding to the automorphisms $tau in Aut Pi$. It suffices to choose a
representative of each conjugacy class of elements of $Aut Pi$.

#problem[To the above mentioned automorphisms $tau in Aut Pi$ the affine Dynkin
  diagrams denoted in Table~@tab:affine-dynkin-diagrams by $L_n^((k))$, where
  $L_n$ is the type of a simple Lie algebra $frak(g)$ and $k$ is the order of
  $tau$ correspond. Thereby, to the identity automorphism of the system of
  simple roots of $L_n$ the extended Dynkin diagram $L_n^((1))$
  corresponds.] <pr:affine-diagram-of-automorphism-class>

In Table~@tab:affine-dynkin-diagrams listed are also the numbers $n_j$ defined
in Problem~@pr:affine-marks-positive-integers. By
Problem~@pr:nonacute-system-positive-relation these numbers are uniquely
determined by $Psi$ as non-zero and non-negative relatively prime coefficients
of a $ZZ$-linear relation between the elements of this system.

Problem~@pr:affine-diagram-of-automorphism-class implies that any connected
affine Dynkin diagram corresponds to an automorphism $tau$ associated with a
simple Lie algebra. Therefore there is a bijection between the automorphisms of
the systems of simple roots of simple Lie algebras considered up to conjugacy
and the connected affine Dynkin diagrams.

#problem[The fundamental chamber $D_0$ is a simplex and under the notation of
  Problem~@pr:simple-affine-roots-description it is determined by the
  inequalities
  $ gamma_j (y) > 0 wide (j = 0, 1, ..., l). $
  The walls of $D_0$ are the hyperplanes
  $P_(gamma_j) quad (j = 0, 1, ..., l)$.] <pr:fundamental-chamber-is-simplex>

=== Classification of Unitary Automorphisms of Simple Lie Algebras
<ss:unitary-automorphisms-classification>
An automorphism $theta in Aut frak(g)$ is called #idx(
  "automorphism of a Lie algebra",
  "unitary",
)_unitary_ if $theta$ is semisimple and all its eigenvalues $mu$ satisfy
$abs(mu) = 1$. For instance, any automorphism of finite order is unitary. In
this section we will describe the classes of conjugate unitary automorphisms of
simple Lie algebras $frak(g)$. By
Theorem~@th:semisimple-automorphism-normal-form and
Problem~@pr:conjugacy-reduces-to-diagram-class it suffices to consider the
unitary automorphisms taken from the sets $hat(tau) T_tau$, where $tau$ runs
over the set of representatives of classes of conjugate elements of $Aut Pi$,
$Pi$ being a system of simple roots of $frak(g)$, and by
Theorem~@th:canonical-automorphism-conjugacy we may confine ourselves to
canonical automorphisms.

#problem[An automorphism $theta = pi(y)$, where $y in frak(a)$, is unitary if
  and only if $y in frak(a)(RR)$. In particular, the canonical unitary
  automorphisms are the automorphisms of the form $pi(y)$, where
  $y in overline(D)_0$.] <pr:unitary-automorphism-real-points>

Let $frak(g)$ be simple. Then by Problem~@pr:simple-affine-roots-description the
system of simple roots $Pi^tau subset Delta^tau$ is of the form
$Pi^tau = {gamma_0, gamma_1, ..., gamma_l}$, where
$
  gamma_0 = (alpha_0, 1\/k), wide gamma_j = (alpha_j, 0) wide
  (j = 1, ..., l)
$
#source(228)${alpha_1, ..., alpha_l} = Pi_0$ is a system of simple roots of
$frak(g)^hat(tau)$. An element $u in frak(a)(RR)$ is completely determined by
the real numbers $u_j = gamma_j (u) quad (j = 1, ..., l)$. Set
$u_0 = gamma_0 (u)$. By @eq:simple-affine-roots-null-relation we have
$ sum_(0 <= j <= l) n_j u_j = 1\/k. $ <eq:kac-labels-normalization>
Thanks to Problem~@pr:simple-affine-roots-define-chamber the condition
$u in overline(D)_0$ is expressed in the form
$ u_j >= 0 wide (j = 0, 1, ..., l). $ <eq:kac-labels-nonnegative>
Clearly, for any $u_j in RR quad (j = 0, 1, ..., l)$ satisfying
@eq:kac-labels-normalization and @eq:kac-labels-nonnegative there exists a
unique $u in frak(a)(RR)$ for which $gamma_j (u) = u_j quad (j = 0, 1, ..., l)$.

A connected affine Dynkin diagram whose vertices are endowed with real numerical
labels $u_j$ satisfying @eq:kac-labels-normalization and
@eq:kac-labels-nonnegative, where $k$ is the number corresponding to this
diagram, will be called a #idx("Kac diagram")_Kac diagram._ Clearly, the Kac
diagrams based on the affine Dynkin diagram corresponding to an automorphism
$tau in Aut Pi$ for a simple Lie algebra $frak(g)$ depict different elements of
$overline(D)_0 subset frak(a)(RR)$. Two Kac diagrams are called _isomorphic_ if
there is an isomorphism of the underlying affine Dynkin diagrams such that the
corresponding vertices are endowed with the same labels.

#problem[If $frak(g)$ is simple and canonical automorphisms $theta_1 = pi(y_1)$,
  $theta_2 = pi(y_2)$, where $Re y_1, Re y_2 in overline(D)_0$, are conjugate in
  $Aut frak(g)$, then $Re y_1$, $Re y_2$ are depicted by isomorphic Kac
  diagrams.] <pr:conjugacy-implies-isomorphic-kac>

Now we formulate the main result of this section.

#theorem[Let $frak(g)$ be simple. Then two unitary canonical automorphisms
  $pi(y_1)$ and $pi(y_2)$ are conjugate in $Aut frak(g)$ if and only if
  $y_1, y_2 in overline(D)_0$ are depicted by isomorphic Kac diagrams. Therefore
  there exists a bijective correspondence between the classes of conjugate
  unitary automorphisms of a simple Lie algebra of type $L_n$ and the classes of
  isomorphic Kac diagrams of types $L_n^((k))$ for all possible $k$. Under this
  correspondence with the classes of inner automorphisms associated are Kac
  diagrams of type $L_n^((1))$ and to the classes of outer automorphisms Kac
  diagrams of types $L_n^((2))$ and $L_n^((3))$
  correspond.] <th:kac-diagram-classification>

Proof is based on
Problems~@pr:diagram-symmetry-lifts-to-normalizer–@pr:chamber-symmetry-in-lifted-group.

#problem[Let $frak(g)$ be simple and let $zeta in Aut Psi$ be a linear
  transformation of $frak(t)_tau (RR)^*$. Then there exists an automorphism
  $n in N_tau$ of $frak(g)$ commuting with $hat(tau)$ such that
  $attach(n, tl: t) = zeta$ in
  $frak(t)_tau (RR)^*$.] <pr:diagram-symmetry-lifts-to-normalizer>

For any $alpha in Delta(frak(t)_tau)$ set $k_alpha = dim frak(g)_alpha$.
Problems~@pr:affine-root-space-intersection and
@pr:real-affine-root-multiplicity-one imply that $k_alpha$ equals the number of
residue classes $s + k ZZ in ZZ\/k ZZ$ such that $(alpha, s\/k) in Delta^tau$.
On the other hand, $k_alpha$ coincides with the number of
$beta in Delta_frak(g)$ such that $r(beta) = alpha$. If $alpha in Pi_0$, then
Problem~@pr:root-restriction-to-fixed-cartan implies that $k_alpha$ is the
length of the orbit with respect to $chevron.l tau chevron.r$ of any
$beta in Pi$ such that $r(beta) = alpha$. In particular, $k_alpha|k$. If
$frak(g)$ is simple then $k_alpha = 1$ or $k$ for any $alpha in Pi_0$.

#problem[Let $v in frak(t)_tau (RR)$ be a vector such that
  $alpha(v) in 1/k_alpha ZZ$ for all $alpha in Pi_0$. Then there exists
  $x in frak(h)$ orthogonal to $frak(t)_tau$ such that
  $v - x in frak(h)(ZZ)$.] <pr:fractional-vector-coweight-lift>

#problem[#source(229)Let $v in frak(t)_tau (RR)$ satisfy the conditions of
  Problem~@pr:fractional-vector-coweight-lift. Then $t_v = tilde(omega(h))$ for
  some $h in H inter N_tau$.] <pr:fractional-translation-in-lifted-group>

#problem[Let a motion $w in I(frak(a)(RR))$ be such that
  $attach(w, tl: t)(Pi^tau) = Pi^tau$. Then
  $w in tilde(Omega)_tau$.] <pr:chamber-symmetry-in-lifted-group>

#proof(head: [_Proof of Theorem_~@th:kac-diagram-classification.])[By
  Problem~@pr:conjugacy-implies-isomorphic-kac it remains to prove that if $y_1$
  and $y_2$ are depicted by isomorphic Kac diagrams then $pi(y_1)$ and $pi(y_2)$
  are conjugate. The isomorphism of the Kac diagrams determines an affine
  transformation $w$ of $frak(a)(RR)$ such that $y_2 = w(y_1)$ and
  $attach(w, tl: t)(Pi^tau) = Pi^tau$, and that the corresponding linear
  transformation $zeta$ belongs to $Aut Psi$. By
  Problem~@pr:diagram-symmetry-lifts-to-normalizer $zeta$ is an orthogonal
  transformation, hence $w$ is a motion. By
  Problem~@pr:chamber-symmetry-in-lifted-group $w in tilde(Omega)_tau$, and the
  theorem follows from Theorem~@th:coset-conjugacy-on-covering-space.]

A special class of unitary automorphisms is formed by the finite order
automorphisms.

#problem[Let $frak(g)$ be a simple Lie algebra, $m$ a positive integer. The
  order of a unitary canonical automorphism $theta in Aut frak(g)$ equals $m$ if
  and only if the numerical labels on the corresponding Kac diagram are of the
  form $u_j = s_j\/m$, where $s_j quad (j = 0, 1, ..., l)$ are non-negative
  relatively prime integers, such that
  $
    m = k sum_(0 <= j <= l) n_j s_j.
  $ <eq:automorphism-order-from-kac-labels>] <pr:finite-order-kac-labels>

Problem~@pr:finite-order-kac-labels implies that the Kac diagram corresponding
to a periodic automorphism is completely determined by the underlying affine
Dynkin diagram and a set of relatively prime non-negative integers
$s_0, s_1, ..., s_l$. If we want to classify automorphisms of order $m$ they
should satisfy condition~@eq:automorphism-order-from-kac-labels.

=== Fixed Points of Semisimple Automorphisms of a Simply Connected Group
<ss:fixed-points-simply-connected-group>
Let $G$ be a simply connected semisimple complex Lie group. Recall (see
@ss:automorphisms-and-derivations[°]) that the group $Aut G$ of automorphisms of
$G$ is naturally isomorphic to the group $Aut frak(g)$ of automorphisms of its
tangent algebra. By Corollary of Theorem~@th:complex-semisimple-group-linear,
$G$ is an algebraic group and by
Theorem~@th:perfect-group-homomorphisms-polynomial any automorphism of $G$ is
polynomial. An automorphism $Theta$ of $G$ is called #idx(
  "automorphism of a Lie group",
  "semisimple",
)_semisimple_ if so is the corresponding automorphism
$theta = d Theta in Aut frak(g)$.

The aim of this subsection is to prove that the algebraic subgroup
$G^Theta subset G$ consisting of the fixed points of a semisimple automorphism
$Theta in Aut G$ is connected. By Problem~@pr:automorphism-fixed-point-subgroup
the tangent algebra of this subgroup coincides with $frak(g)^theta$. Applying
Theorem~@th:fixed-subalgebra-nonzero and Problem~@pr:fixed-subalgebra-reductive
we see that $G^Theta$ is reductive and of positive dimension if $G != {e}$.

#theorem[If $Theta$ is a semisimple automorphism of a simply connected
  semisimple Lie group $G$ then $G^Theta$ is
  connected.] <th:fixed-subgroup-connected>

Let $g$ be a semisimple element of $G$. Then the inner automorphism $a(g)$ is
semisimple so that the subgroup $Z(g) = G^(a(g))$ is reductive. By
Corollary~@cor:semisimple-element-in-torus of
Theorem~@th:borel-subgroups-cover-group there exists a maximal torus $H$ of $G$
such that $g in H subset Z(g)^0$. An #source(230)element $g$ is called #idx(
  "Element",
  "regular",
)_regular_ if $H = Z(g)^0$ and #idx("Element", "singular")_singular_ otherwise.
Clearly, the regularity (or singularity) of an element is preserved under the
action of any automorphism of $G$. In particular, two conjugate semisimple
elements of $G$ are either simultaneously regular or simultaneously singular.
Therefore in order to describe the set of singular elements it suffices to
describe singular elements belonging to a fixed maximal torus.

As above, consider the covering $cal(E): frak(h) -> H$ defined by the formula
$cal(E)(x) = exp(2 pi i x)$. Problem~@pr:torus-exponential-kernel and
Theorem~@th:simply-connected-iff-weight-lattice imply that $Ker cal(E)$
coincides with the lattice $Q^or$ generated by the dual root system
$Delta_frak(g)^or (frak(h))$. For any $alpha in Delta_frak(g)$ and $s in ZZ$
denote by $P_((alpha, s))$ the hyperplane in $frak(h)$ (not in $frak(h)(RR)$ as
in @ss:affine-weyl-group), defined by the equation $alpha(x) + s = 0$. Clearly,
$x in P_((alpha, s)) <=> Re x in P_((alpha, s))$ and
$Im x in P_((alpha, 0)) = P_alpha$.

#problem[An element $cal(E)(x)$, where $x in frak(h)$, is singular if and only
  if $x in P_((alpha, s))$ for some $alpha in Delta_frak(g)$ and
  $s in ZZ$.] <pr:singular-elements-affine-hyperplanes>

#proof(head: [_Proof of Theorem_~@th:fixed-subgroup-connected.])[By
  Theorem~@th:unipotent-closure-additive-group every unipotent element of an
  algebraic group belongs to its identity component. Thanks to the Jordan
  decomposition (Theorem~@th:jordan-parts-in-algebraic-group), it suffices to
  prove that every semisimple element $g in G^Theta$ belongs to $(G^Theta)^0$.

  First let $g$ be a regular element of $G$ and $H = Z(g)^0$ the unique maximal
  torus that contains it. Then $Theta(H) = H$. Consider $x in frak(h)$ such that
  $g = cal(E)(x)$. Problem~@pr:singular-elements-affine-hyperplanes implies that
  $Re x$ belongs to one of the chambers $D$ into which the space $frak(h)(RR)$
  is divided by the hyperplanes $P_((alpha, s))$. Since the boundary of every
  chamber contains an element of $Q^or$, we may assume that $0 in overline(D)$.
  The identities $cal(E)(theta(x)) = Theta(cal(E)(x)) = cal(E)(x)$ imply that
  $y = theta(x) - x in Q^or$. Clearly, $theta$ transforms $frak(h)(RR)$ into
  itself, permutes the hyperplanes $P_((alpha, s))$ and the chambers. Since
  $y = theta(Re x) - Re x$, the chamber $theta(D) = D + y$ contains on its
  boundary the points 0 and $y$ of the lattice $Q^or$.
  Problem~@pr:chamber-meets-coroot-lattice-once implies that $y = 0$. Therefore
  $x in frak(h)^theta$ and
  $g in cal(E)(frak(h)^theta) = (H^Theta)^0 subset (G^Theta)^0$.

  Now consider the general case. Set $U = Z(g)^0$. Then $Theta(U) = U$. A
  maximal torus of $U^Theta$ will be denoted by $S$.

  #problem[The group $H = (Z(g) inter Z(S))^0$ is a maximal torus of $G$
    containing $g$ and $S$.] <pr:common-maximal-torus-construction>

  Let us prove that the coset $g S subset H$ contains a regular element. Let all
  elements of this coset be singular. Choose $x in frak(h)$ such that
  $g = cal(E)(x)$. Then by Problem~@pr:singular-elements-affine-hyperplanes the
  plane $x + frak(s)$ is contained in one of the hyperplanes $P_((alpha, s))$.

  #problem[If $x + frak(s) subset P_((alpha, s))$ then
    $G^((alpha)) subset H$.] <pr:singular-coset-gives-sl2-subgroup>

  Since $G^((alpha))$ is a simple three-dimensional subgroup, this contradicts
  Problem~@pr:common-maximal-torus-construction. Therefore there exists
  $s_0 in S$ such that $g s_0$ is a regular element. Since $g s_0 in G^Theta$
  the above implies that $g s_0 in (G^Theta)^0$. Therefore $g in (G^Theta)^0$,
  too. Theorem~@th:fixed-subgroup-connected is proved.]

This proof is due essentially to A.~Borel. For another proof of this theorem (in
a somewhat more general setting) see [@bib:Steinberg1968].

Concluding, let us show how to calculate the subalgebra $frak(g)^theta$ for a
unitary canonical automorphism $theta$ of a simple Lie algebra $frak(g)$ with
the help of the Kac #source(231)diagram. Let $u_0, u_1, ..., u_l$ be the
numerical labels of the Kac diagram of $theta$ such that
$u_(i_1) = dots.c = u_(i_t) = 0$ and the other $u_j != 0$.

#problem[$dim Z(frak(g)^theta) = l - t$ and the derived algebra
  $(frak(g)^theta)'$ is a semisimple subalgebra of $frak(g)$ whose system of
  simple roots is ${alpha_(i_1), ..., alpha_(i_t)}$. The Dynkin diagram of
  $(frak(g)^theta)'$ is the part of the Dynkin diagram of the system
  $Psi = {alpha_0, alpha_1, ..., alpha_l}$ formed by the vertices with the
  numbers $i_1, ..., i_t$ and the edges that connect these
  vertices.] <pr:fixed-subalgebra-from-kac-diagram>

#exercises[
  In
  exercises~@exc:affine-weyl-stabilizer-reflections–@exc:coxeter-complex-covering
  the notation of subsections~@ss:semisimple-automorphisms–@ss:affine-weyl-group
  is used.

  #exercise[If $y in frak(a)(RR)$ is stable with respect to some $w in W_tau$
    then $w$ is the product of reflections with respect to the hyperplanes
    $P_xi$ passing through $y$.] <exc:affine-weyl-stabilizer-reflections>

  #exercise[The group $W_tau$ does not contain reflections with respect to the
    hyperplanes different from $P_xi$
    ($xi in Delta_"re"^tau$).] <exc:affine-weyl-only-root-reflections>

  In
  Exercises~@exc:affine-weyl-coxeter-relations–@exc:fundamental-group-on-special-nodes
  we assume that $frak(g)$ is simple and we use the notation of
  @ss:affine-roots-of-simple-algebra and
  @ss:unitary-automorphisms-classification. In particular,
  $Psi = {alpha_0, alpha_1, ..., alpha_l}$ and $A = (a_(i j))$ is the matrix of
  $Psi$. As it is known, the angle between $alpha_i$ and $alpha_j$ equals
  $theta_(i j) = pi(1 - 1\/n_(i j))$, where $n_(i i) = 1$,
  $n_(i j) = 2, 3, 4, 6, infinity$ $(i != j)$, if
  $m_(i j) = a_(i j) a_(j i) = 0, 1, 2, 3, 4$ respectively. Set
  $r_i = r_(gamma_i) quad (i = 0, 1, ..., l)$. By
  Theorem~@th:affine-weyl-simply-transitive and
  Problem~@pr:simple-affine-roots-description the $r_i$'s generate $W_tau$.

  #exercise[The generators $r_i quad (i = 0, 1, ..., l)$ of $W_tau$ satisfy the
    relations
    $ (r_i r_j)^(n_(i j)) = e $ <eq:affine-coxeter-relations>
    for any $i, j = 0, 1, ..., l$ such that
    $n_(i j) < infinity$.] <exc:affine-weyl-coxeter-relations>

  Consider the group $hat(W)$ with generators $hat(r)_i quad (i = 0, 1, ..., l)$
  and defining relations~@eq:affine-coxeter-relations with $r_i$ replaced by
  $hat(r)_i$. Denote by $phi$ the homomorphism of $hat(W)$ onto $W_tau$ sending
  $hat(r)_i$ in $r_i$. Consider an auxiliary topological space
  $X = (hat(W) times overline(D)_0)\/S$, where $hat(W)$ is assumed to be endowed
  with the discrete topology and $S$ is the equivalence relation defined by the
  formula
  $
    (w, x) limits(tilde.op)^S (w hat(r)_i, x) quad "if" quad r_i (x) = x
  $
  extended via transitivity. Determine the $hat(W)$-action on $X$ by setting
  $ w_1 (w, x) = (w_1 w, x) $
  and the map $pi: X -> frak(a)(RR)$ by setting
  $ pi((w, x)) = phi(w) x. $
  Finally, let $Y$ be the set of points of $frak(a)(RR)$ that belong to the
  intersections of no more than two hyperplanes $P_xi$ and set
  $X_0 = pi^(-1) (Y)$.

  #exercise[The space $X_0$ is pathwise connected and the map $pi: X_0 -> Y$ is
    a covering.] <exc:coxeter-complex-covering>

  #exercise[The map $pi$ is a homeomorphism and $phi$ is a group isomorphism.
    The relations~@eq:affine-coxeter-relations are defining relations for
    $W_tau$.] <exc:affine-weyl-coxeter-presentation>

  #exercise[#source(232)The vertices of $overline(D)_0$ are the points
    $tilde(a)$ and $t_(x_alpha\/(k n_alpha)) (tilde(a))$ $(alpha in Pi_0)$,
    where ${x_alpha}_(alpha in Pi_0)$ is the basis of the lattice
    $frak(t)_tau (ZZ)$ dual to $Pi_0$ and $n_alpha$ is the same as $n_i$ (see
    @eq:affine-lowest-weight-expansion).] <exc:fundamental-chamber-vertices>

  #exercise[The group $tilde(Omega)_tau$ coincides with the subgroup of motions
    $w in I(frak(a)(RR))$ such that $attach(w, tl: t)(Delta^tau) = Delta^tau$.]
  <exc:lifted-group-affine-root-symmetries>

  #exercise[Let $Lambda subset frak(t)_tau (RR)$ be the lattice consisting of
    $v in frak(t)_tau (RR)$ such that $alpha(v) in 1/k_alpha ZZ$ for all
    $alpha in Pi_0$ (see Problem~@pr:fractional-vector-coweight-lift). Let us
    identify $Lambda$ with the group of translations $t_v$ ($v in Lambda$) of
    $frak(a)(RR)$. Then $Lambda$ is a normal subgroup of $tilde(Omega)_tau$ and
    $tilde(Omega)_tau = Lambda times.r Omega_0$, where $Omega_0$ is the
    stabilizer of 0 in $tilde(Omega)_tau$, isomorphic to the group of orthogonal
    transformations of $frak(t)_tau (RR)$ induced by the automorphisms of
    $frak(g)$ commuting with $hat(tau)$.] <exc:lifted-group-semidirect-lattice>

  #exercise[We have $W_tau = Lambda_0 times.r W(frak(g)^hat(tau))$, where
    $Lambda_0 subset Lambda$ is the sublattice with the basis
    ${1/k_alpha h_((alpha, 0)): alpha in Pi_0}$.]
  <exc:twisted-affine-weyl-semidirect>

  #exercise[The elements $e_(gamma_i) quad (i = 0, 1, ..., l)$ generate the
    algebra $frak(g)$.] <exc:simple-affine-root-vectors-generate>

  #exercise[Let $theta$ be a unitary canonical automorphism of $frak(g)$, and
    $u_0, u_1, ..., u_l$ the corresponding numerical labels of the Kac diagram.
    Denote by $ad_s$ the adjoint representation of $frak(g)^theta$ in the
    eigenspace $frak(g)(e^(2 pi i s))$ of $theta$. Any $alpha_j in Psi$ is a
    lowest weight of $ad_(u_j)$. If $s_0$ is the minimal of $s > 0$ such that
    $frak(g)(e^(2 pi i s)) != 0$ then $s_0$ coincides with one of the $u_j$, the
    lowest weights of $ad_(s_0)$ are the $alpha_j$ such that $u_j = s_0$ and the
    lowest vectors are the $e_(gamma_j)$.] <exc:kac-labels-lowest-weights>

  In
  Exercises~@exc:affine-weyl-normalizer-coweights–@exc:fundamental-group-on-special-nodes
  we assume that $tau = id$. In this case $frak(t)_tau (RR)$ coincides with the
  Euclidean vector space $frak(h)(RR)$ considered as an affine space. The
  normalizer of $tilde(W) = W_id$ in $I(frak(h)(RR))$ is denoted by
  $N(tilde(W))$. The lattices in $frak(h)(RR)$ are identified with the
  corresponding groups of translations.

  #exercise[$tilde(W) = W times.l Q^or$,
    $N(tilde(W)) = Aut Delta_frak(g) times.l P^or = tilde(Omega)_id$.]
  <exc:affine-weyl-normalizer-coweights>

  #exercise[$N(tilde(W)) = Aut tilde(Pi) times.l tilde(W)$.]
  <exc:affine-weyl-normalizer-diagram>

  #exercise[The group $Aut tilde(Pi)$ coincides with the group of motions of
    $frak(h)(RR)$ transforming $overline(D)_0$ into
    itself.] <exc:extended-diagram-chamber-symmetries>

  #exercise[$Aut tilde(Pi) = Aut Pi times.l L$, where $L$ is a commutative
    normal subgroup isomorphic to
    $pi(Delta_frak(g)) tilde.eq pi_1 (Int frak(g))$.]
  <exc:extended-diagram-fundamental-group>

  #exercise[The group $pi(Delta_frak(g))$ acts simply transitively on the set
    ${alpha_i in tilde(Pi): n_i = 1}$. In particular, the number of elements of
    this set equals
    $abs(pi(Delta_frak(g)))$.] <exc:fundamental-group-on-special-nodes>
]

#hints[
  #hint[@pr:inner-base-stabilizer-is-torus][It suffices to prove that
    $Ker eta subset H$. If $theta in Ker eta$, then $theta|frak(h) = e$,
    $theta e_alpha = c_alpha e_alpha$,
    $theta e_(-alpha) = c_alpha^(-1) e_(-alpha) quad (alpha in Pi)$, where
    $c_alpha in CC^*$. With the help of
    Theorem~@th:cartan-matrix-determines-algebra verify that
    $theta = exp(ad x)$, where $x in frak(h)$ is an element such that
    $alpha(x) = log c_alpha quad (alpha in Pi)$.]

  #hint[@pr:automorphisms-stabilizer-times-inner][Make use of the fact that
    $Int frak(g)$ acts transitively on the set of pairs
    $frak(h) subset frak(b)$, where $frak(h)$ is a maximal diagonalizable
    subalgebra and $frak(b)$ a Borel subalgebra of $frak(g)$.]

  #hint[@pr:inner-automorphisms-identity-component][If
    $(Aut frak(g))^0 != Int frak(g)$ then the algebraic group $(Aut frak(g))^0$
    is reducible since by Theorem~@th:outer-automorphisms-dynkin-diagram it is
    the union of a finite number of disjoint algebraic varieties: cosets modulo
    $Int frak(g)$. Concerning the last statement see
    @ss:automorphisms-and-derivations[°].]

  #hint[@pr:automorphism-eigenspace-pairing][#source(233)Make use of
    Problem~@pr:unipotent-ideal-orthogonal.]

  #hint[@pr:nilpotent-element-in-ad-image][If $x in frak(g)$ is nilpotent and
    $z in frak(z)(x)$ then $(ad x)(ad z)$ is nilpotent implying $(x, z) = 0$.
    The invariance and non-degeneracy of the scalar product imply that
    $frak(z)(x)^perp = Im(ad x)$ so that $x in Im(ad x)$.]

  #hint[@pr:no-fixed-points-no-nilpotents][If $x in frak(g)(lambda)$ is
    nilpotent then by Problem~@pr:nilpotent-element-in-ad-image $x = [x, y]$,
    where $y in frak(g)$. Taking Problem~@pr:automorphism-eigenspace-grading
    into account we may assume that $y in frak(g)(1)$. If $x != 0$ then
    $y != 0$.]

  #hint[@pr:first-nonzero-eigenspace-nilpotent][For a given integer $i$,
    $0 <= i < m$, select a positive integer $r$ such that
    $k(r - 1) < m - i <= k r$. Then $k r + i = m + t$, where $0 <= t < k$,
    implying $(ad x)^r|frak(g)(epsilon^i) = 0$.]

  #hint[@pr:fixed-subalgebra-reductive][Make use of
    Theorem~@th:semisimple-killing-nondegenerate and
    Problem~@pr:automorphism-eigenspace-pairing. To prove the algebraicity note
    that $ad(frak(g)^theta)$ is the tangent algebra of the algebraic subgroup
    ${g in Int frak(g): g theta = theta g}$.]

  #hint[@pr:fixed-toral-centralizer-cartan][Since $frak(z)(frak(t))$ is
    reductive (see Problem~@pr:zero-root-space-is-torus), it suffices to prove
    that $frak(z)(frak(t))' = 0$. Notice that
    $theta(frak(z)(frak(t))') = frak(z)(frak(t))'$ and apply
    Theorem~@th:fixed-subalgebra-nonzero and the equality
    $frak(z)(frak(t))^theta = frak(t)$.]

  #hint[@pr:automorphism-invariant-base][If $frak(t)$ consists of singular
    elements then $frak(t) subset Ker alpha$ for some root
    $alpha in Delta(frak(h)_1)$ contradicting
    Problem~@pr:fixed-toral-centralizer-cartan. Take for $Pi_1$ the system of
    simple roots corresponding to a Weyl chamber in $frak(h)_1$ intersecting
    with $frak(t)$.]

  #hint[@pr:conjugate-into-torus-coset][Take for $a$ an automorphism sending
    $frak(h)$ into $frak(h)_1$ and transforming the Weyl chambers corresponding
    to $Pi$ and $Pi_1$ one onto another (see
    Theorem~@th:weyl-group-simply-transitive).]

  #hint[@pr:torus-splitting-fixed-subtorus][Make use of the fact that
    $q: h |-> hat(tau)^(-1) h hat(tau) h^(-1)$ is an endomorphism of the torus
    $H$ and $d_e q = attach(tau, tl: t) - e$.]

  #hint[@pr:coset-conjugate-into-fixed-subtorus][Let $theta = hat(tau) h$, where
    $h in H$. Applying Problem~@pr:torus-splitting-fixed-subtorus and expressing
    $h$ in the form $h = t hat(tau)^(-1) h_1 hat(tau) h_1^(-1)
    = hat(tau)^(-1) h_1 hat(tau) t h_1^(-1)$, where $t in T_tau$, $h_1 in H$, we
    see that $h_1^(-1) theta h_1 in hat(tau) T_tau$.]

  #hint[@pr:root-restriction-to-fixed-cartan][Under the isomorphisms
    $frak(h)(RR)^* -> frak(h)(RR)$ and $frak(t)_tau (RR)^* -> frak(t)_tau (RR)$
    associated with the Cartan scalar product (see
    @ss:weight-and-root-decompositions[°]) the automorphism
    $tau: frak(h)(RR)^* -> frak(h)(RR)^*$ is identified with
    $hat(tau) = attach(tau, tl: t)^(-1)$ and $r$ with the averaging operator
    $pi = 1/k sum_(0 <= j <= k - 1) hat(tau)^j$, where $k$ is the order of
    $tau$. Clearly, the different elements $pi(u_beta) quad (beta in Pi)$ form a
    basis of $frak(t)_tau (RR)$. This implies the statements on
    $dim frak(t)_tau$ and $r(Pi)$. Since each $gamma in Delta_frak(g)$ is
    expressed in terms of $Pi$ with the coefficients of the same sign,
    $r(gamma)$ is expressed in terms of $Pi_0$ with the coefficients of the same
    sign. In particular, $r(gamma) != 0$ for all $gamma in Delta_frak(g)$.
    Therefore $frak(z)(frak(t)_tau) = frak(h)$ and
    $frak(z)(frak(t)_tau) inter frak(g)^theta = frak(t)_tau$ for any
    $theta in hat(tau) H$.] <hint:root-restriction-to-fixed-cartan>

  #hint[@pr:conjugator-preserves-fixed-cartan][Make use of the conjugacy of the
    maximal diagonalizable subalgebras of $frak(g)^(theta_2)$.]

  #hint[@pr:affine-roots-span-affine-functions][Follows from the fact that
    $Delta(frak(t)_tau)$ generates $frak(t)_tau (RR)^*$ (see
    @ss:weight-and-root-decompositions[°]) and that $(0, 1) in Delta^tau$.]

  #hint[@pr:opposite-affine-root-bracket][Similar to
    Problems~@pr:opposite-root-spaces-paired and
    @pr:bracket-of-opposite-root-vectors.]

  #hint[@pr:affine-root-strings][Similar to
    Problem~@pr:alpha-string-of-weights.]

  #hint[@pr:real-affine-root-multiplicity-one][Similar to the proof of
    Theorem~@th:root-spaces-one-dimensional.]

  #hint[@pr:affine-root-spaces-bracket-nonzero][Similar to
    Problems~@pr:root-vector-nonzero-on-string and @pr:bracket-of-root-spaces.]

  #hint[@pr:diagram-fixed-subalgebra-semisimple][The description of the root
    system $Delta_(frak(g)^hat(tau))$ given in the problem follows from
    @eq:fixed-subalgebra-root-decomposition. To prove that $Pi_0$ is a system of
    simple roots for $frak(g)^hat(tau)$, it suffices (thanks to
    Problem~@pr:root-restriction-to-fixed-cartan) to verify that
    $Pi_0 subset Delta_(frak(g)^hat(tau))$. But if $beta in Pi$ then
    $x = sum_(0 <= j <= k - 1) e_(tau^j beta) != 0$ and
    $x in frak(g)^((r(beta), 0))$ implying
    $r(beta) in Delta_(frak(g)^hat(tau))$. If $z in frak(z)(frak(g)^hat(tau))$
    then by Problem~@pr:root-restriction-to-fixed-cartan $z in frak(h)$, and
    $[z, x] = 0$ implies $beta(z) = 0$ for all $beta in Pi$, i.e. $z = 0$.]

  #hint[@pr:eigenspace-lowest-weights-nonzero][Let $x_0$ be a lowest vector of
    the representation $ad_s$ corresponding to the weight 0. Then
    $[e_alpha, x_0] = 0$ for all $alpha in Delta_(frak(g)^hat(tau))^+$. Indeed,
    if this is not so then the system of weights of the representation of the
    three-dimensional subalgebra
    $chevron.l h_alpha, e_alpha, e_(-alpha) chevron.r$ in the invariant subspace
    spanned by the vectors $(ad e_alpha)^m x_0$ (see #source(
      234,
    )@ss:uniqueness-theorems[°]) is not symmetric. Therefore $x_0$ belongs to
    the centralizer of $frak(g)^hat(tau)$ contradicting
    Problem~@pr:diagram-fixed-subalgebra-semisimple.]

  #hint[@pr:lifted-group-motions-kernel][Use the invariance of the Cartan scalar
    product with respect to all automorphisms.]

  #hint[@pr:affine-sl2-element-induces-reflection][Similar to
    Problem~@pr:n-alpha-induces-reflection.]

  #hint[@pr:sl2-element-conjugates-diagram-lift][Verify that
    $hat(tau) phi_xi (x) hat(tau)^(-1) = phi_xi (c x c^(-1))$ for all
    $x in frak(s l)_2 (CC)$, where $c = diag(e^(pi i s), e^(-pi i s))$. This
    implies that $hat(tau) Phi_xi (g) hat(tau)^(-1) = Phi_xi (c g c^(-1))$ for
    all $g in SL_2 (CC)$. Setting $g = mat(0, 1; -1, 0)$ we get
    @eq:reflection-twists-diagram-lift. Since $r_alpha$ is the linear part of
    the affine transformation $r_xi$, @eq:reflection-twists-diagram-lift
    implies, by Problems~@pr:quasi-torus-automorphism-affine-lift and
    @pr:affine-sl2-element-induces-reflection, that
    $pi(r_xi (y)) = n_xi pi(y) n_xi^(-1)$ for $y in frak(a)(RR)$.]

  #hint[@pr:affine-chamber-walls][Similar to Problems~@pr:walls-of-weyl-chamber
    and @pr:root-simple-for-some-chamber.]

  #hint[@pr:conjugating-motion-preserves-chamber][Use
    Theorems~@th:affine-weyl-simply-transitive and
    @th:affine-chamber-fundamental-domain.]

  #hint[@pr:simple-affine-roots-define-chamber][To prove that $D_0$ is a chamber
    make use of Problem~@pr:positive-affine-roots-simple-sums. The
    formula~@eq:fundamental-affine-chamber is proved similarly to the
    corresponding statement of Problem~@pr:walls-of-weyl-chamber.]

  #hint[@pr:chamber-meets-coroot-lattice-once][Make use of the inclusion
    $Q^or subset tilde(W)$ and Theorem~@th:affine-chamber-fundamental-domain.]

  #hint[@pr:diagram-fixed-subalgebra-simple][Identifying $r$ with the projection
    $pi: frak(h)(RR) -> frak(t)_tau (RR)$ (see Hint to
    Problem~@hint:root-restriction-to-fixed-cartan) it is easy to show that
    $(r(alpha), r(beta)) = 0$ for $alpha, beta in Pi$ if and only if the orbits
    of $alpha$ and $beta$ are orthogonal to each other. By
    Theorem~@th:simple-iff-base-indecomposable this implies the statement of the
    problem.]

  #hint[@pr:simple-affine-roots-description][By
    Problem~@pr:imaginary-affine-roots-cyclic, $frak(g)(epsilon) != 0$. If
    $alpha_0$ is a lowest weight of the representation $ad_(1\/k)$ then
    $gamma_0 = (alpha_0, 1\/k) in Pi^tau$
    (Problem~@pr:simple-affine-roots-lowest-weights). Since $Pi_0$ is
    indecomposable and $alpha_0 != 0$, we see that
    $Psi' = {alpha_0, alpha_1, ..., alpha_l}$ is indecomposable. By
    Problem~@pr:nonacute-system-positive-relation the indecomposable component
    of $Psi$ containing $Psi'$ coincides with $Psi'$ implying $Psi = Psi'$. The
    linear independence of $Pi^tau$ follows from
    Problem~@pr:positive-affine-roots-simple-sums and from the equality
    $dim frak(a)(RR)^caret = l + 1$.]

  #hint[@pr:affine-marks-positive-integers][
    Problem~@pr:root-restriction-to-fixed-cartan implies validity of the
    expression~@eq:affine-lowest-weight-expansion, where $n_j in ZZ$. Since
    $Psi$ is indecomposable, Problem~@pr:nonacute-system-positive-relation
    implies that $n_j > 0$ for all $j$.]

  #hint[@pr:affine-cartan-matrix-of-automorphism][The admissibility of $Psi$
    follows from Problem~@pr:affine-root-strings.]

  #hint[@pr:fundamental-chamber-is-simplex][Problem~@pr:walls-of-weyl-chamber
    implies that the $P_(gamma_j) quad (j = 1, ..., l)$ are the walls of the
    chamber $D_0$. Formula~@eq:affine-lowest-weight-expansion implies that
    $C_0 inter P_(gamma_0) != emptyset$. Therefore $P_(gamma_0)$ is also a wall
    of this chamber.]

  #hint[@pr:conjugacy-implies-isomorphic-kac][By
    Theorem~@th:canonical-automorphism-conjugacy there exists
    $w in tilde(Omega)_tau$ such that $w(Re y_1) = Re y_2$ and $w(D_0) = D_0$.
    Applying Problems~@pr:simple-affine-roots-description and
    @pr:real-affine-root-multiplicity-one we see that $w$ determines an
    automorphism of the Dynkin diagram of $Psi$ which is an isomorphism of our
    Kac diagrams.]

  #hint[@pr:diagram-symmetry-lifts-to-normalizer][Notice that
    $zeta(Pi_0) subset Delta_(frak(g)^hat(tau))$. In case $tau = id$ this is
    obvious since $Psi = tilde(Pi)$
    (Problem~@pr:simple-affine-roots-description). If $tau != id$ then
    $zeta = id$ except for the cases when $Psi$ is of the type
    $A_(2 l - 1)^((2))$ or $D_(l + 1)^((2))$ (see
    Table~@tab:affine-dynkin-diagrams). In the latter two cases the only
    nontrivial automorphism $zeta$ is the transposition of $alpha_0$ with one of
    the roots $alpha_i in Pi_0$. As is clear from
    Example~@exm:dual-extended-dynkin-diagrams[] in @ss:dynkin-diagrams[°], we
    have $alpha_0 in Delta_(frak(g)^hat(tau))$.
    Theorem~@th:root-system-determined-by-base implies that
    $zeta in Aut Delta_(frak(g)^hat(tau))$ and $zeta(Pi_0)$ is a base of
    $Delta_(frak(g)^hat(tau))$. Applying
    Theorem~@th:cartan-matrix-determines-algebra we get an automorphism
    $mu in Aut(frak(g)^hat(tau))$ transforming $frak(t)_tau$ into itself and
    such that $attach(mu, tl: t) = zeta$ on $frak(t)_tau^*$. In case $tau = id$
    the desired automorphism is $mu$. If $tau != id$ and $zeta != id$ then
    $frak(g)^hat(tau)$ is of the type $B_l$ or $C_l$ (see
    Table~@tab:involutive-automorphisms). By
    Theorem~@th:outer-automorphisms-dynkin-diagram all automorphisms of
    $frak(g)^hat(tau)$ are inner ones so that $mu$ extends to an automorphism of
    $frak(g)$ commuting with
    $hat(tau)$.] <hint:diagram-symmetry-lifts-to-normalizer>

  #hint[@pr:fractional-vector-coweight-lift][We have $frak(h)(ZZ) = Q^*$, where
    $Q$ is the root lattice in $frak(h)(RR)^*$. If ${z_beta: beta in Pi}$ is a
    #source(
      235,
    )basis of $frak(h)(ZZ)$ dual to $Pi$ then the elements
    $x_alpha = sum_(r(beta) = alpha) z_beta quad (alpha in Pi_0)$ form a basis
    of the lattice $frak(t)_tau (ZZ)$ dual to $Pi_0$. It is directly verified
    that $x_alpha\/k_alpha - z_beta in frak(t)_tau^perp$ if $alpha = r(beta)$.
    For each $alpha in Pi_0$ choose $beta in Pi$ such that $r(beta) = alpha$. If
    $v in frak(t)_tau (RR)$ satisfies the conditions of the problem it presents
    in the form $v = sum_(alpha in Pi_0) l_alpha (k_alpha)^(-1) x_alpha$, where
    $l_alpha in ZZ$, implying
    $v - sum_(alpha in Pi_0) l_alpha z_beta in frak(t)_tau^perp$.]

  #hint[@pr:fractional-translation-in-lifted-group][
    Problems~@pr:fractional-vector-coweight-lift and
    @pr:torus-splitting-fixed-subtorus imply that
    $v = attach(tau, tl: t) x - x + z$, where $x in frak(h)$,
    $z in frak(h)(ZZ)$. If $h = cal(E)(x) in H$ then
    $h hat(tau) h^(-1) = hat(tau) cal(E)(v)$, so that $h in N_tau$. It is easy
    to verify that $tilde(omega(h)) = t_v$.]

  #hint[@pr:chamber-symmetry-in-lifted-group][Let
    $s in upright(O)(frak(t)_tau (RR))$ be the linear part of $w$. Then
    $attach(s, tl: t) in Aut Psi$. By
    Problem~@pr:diagram-symmetry-lifts-to-normalizer $s$ extends to an
    automorphism (denoted by the same letter) belonging to $N_tau$ and commuting
    with $hat(tau)$. Express $w$ in the form $w = t_v sigma$, where
    $sigma(tilde(a)) = tilde(a)$ and $t_v (tilde(a)) = w(tilde(a))$. Clearly,
    $sigma$ covers the transformation $omega(s)$ so that
    $sigma in tilde(Omega)_tau$. To show that $t_v in tilde(Omega)_tau$ it
    suffices to verify that $v$ satisfies the conditions of
    Problem~@pr:fractional-translation-in-lifted-group. We may assume that
    $v != 0$. Then $attach(w, tl: t)(gamma_j) = gamma_0$ for some $j > 0$. We
    deduce from this that $alpha_j (v) = 1\/k$, $alpha_i (v) = 0$ for $i != j$.
    If $k = 1$ then the needed conditions are clearly satisfied. If $k > 1$ then
    $k = 2$ (see Hint to Problem~@hint:diagram-symmetry-lifts-to-normalizer).
    Since $attach(s, tl: t) alpha_j = alpha_0$ and since $s$ commutes with
    $hat(tau)$, we have
    $frak(g)_(alpha_j) inter frak(g)(-1) = s(frak(g)^(gamma_0)) != 0$. Therefore
    $(alpha_j, 1\/2) in Delta^tau$ implying $k_(alpha_j) = 2$, and $v$ satisfies
    the desired conditions.]

  #hint[@pr:finite-order-kac-labels][Apply the following statement, which is a
    consequence of Problem~@pr:quasi-torus-character-affine-lift: if
    $xi in Delta^tau$ and $xi = sum_(0 <= j <= l) k_j gamma_j$, where
    $k_j in ZZ$ then $theta|frak(g)^xi = c dot id$, where
    $c = e^(2 pi i sum_(0 <= j <= l) k_j u_j)$.
    Formula~@eq:automorphism-order-from-kac-labels follows from
    @eq:kac-labels-normalization.]

  #hint[@pr:singular-elements-affine-hyperplanes][Show that the tangent algebra
    of the subgroup $Z(cal(E)(x))$ coincides with
    $frak(h) plus.o plus.o.big_(alpha(x) in ZZ) frak(g)_alpha$.]
  <hint:singular-elements-affine-hyperplanes>

  #hint[@pr:common-maximal-torus-construction][Deduce from
    Problem~@pr:zero-root-space-is-torus and the fact that $Ad g$ is a
    semisimple automorphism of the Lie algebra $frak(g)$ that $H$ is reductive.
    Let $H = V Z_H$, where $V$ is a connected semisimple normal subgroup and
    $Z_H$ the identity component of the center of $H$. Then $S subset Z_H$.
    Clearly, $Theta(V) = V$. If $dim V > 0$ then $dim V^Theta > 0$
    (Theorem~@th:fixed-subalgebra-nonzero) contradicting the maximality of the
    torus $S$ in $U^Theta$. Therefore $H = Z_H$ is a torus. Making use of
    Problem~@pr:torus-with-commuting-semisimple we see that $g in H$ and $H$ is
    a maximal torus.]

  #hint[@pr:singular-coset-gives-sl2-subgroup][See hint to
    Problem~@hint:singular-elements-affine-hyperplanes.]

  #hint[@pr:fixed-subalgebra-from-kac-diagram][By
    Problem~@pr:fixed-subalgebra-reductive $frak(g)^theta$ is a reductive
    algebraic subalgebra and by Problem~@pr:root-restriction-to-fixed-cartan
    $frak(t)_tau$ is its maximal diagonalizable subalgebra. If $theta = pi(u)$,
    where $u in overline(D)_0$, then
    $frak(g)^theta = frak(t)_tau plus.o sum_(xi(u) in ZZ) frak(g)^xi
    = frak(t)_tau plus.o sum_(xi in Delta_1) frak(g)^xi$, where
    $Delta_1 = {xi in Delta^tau: xi(u) = 0}$. It is clear from
    @eq:kac-labels-nonnegative that $Delta_1$ consists of the roots expressed in
    terms of $gamma_(i_1), ..., gamma_(i_t)$ only. By
    @eq:kac-labels-normalization $t <= l$, hence
    ${alpha_(i_1), ..., alpha_(i_t)}$ is a linearly independent system. This
    implies that the linear parts of roots from $Delta_1$ constitute the root
    system for $frak(g)^theta$ and ${alpha_(i_1), ..., alpha_(i_t)}$ is its
    base.]
]
