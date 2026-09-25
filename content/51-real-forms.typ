// Chapter 5, § 1. Real Forms of Complex Semisimple Lie Groups and Algebras.
// Printed pages 221-237; page 221 begins with the chapter opening
// (50-real-semisimple.typ), § 2 begins at the top of page 238.
#import "main-defs.typ": *
#import "statements.typ": *

== Real Forms of Complex Semisimple Lie Groups and Algebras
<sec:real-forms-complex-semisimple>

The main goal of this section is to classify real semisimple Lie algebras. After
we discuss some general properties of real forms of complex semisimple Lie
groups and algebras we reduce the classification to the listing (up to
conjugacy) of the involutive automorphisms of complex simple Lie algebras. The
latter problem is easily solved by methods of
@sec:semisimple-algebra-automorphisms.

=== Real Structures and Real Forms <ss:real-structures-and-forms>
Recall (see @ss:forms-of-vector-spaces-algebras) that the real forms of a
complex Lie algebra $frak(g)$ are in a one-to-one correspondence with the
involutive antilinear automorphisms of this algebra. Namely, to each real form
$frak(h) subset frak(g)$ associated is the complex conjugation
$sigma: frak(g) -> frak(g)$ with respect to $frak(h)$ and to each involutive
antilinear automorphism $sigma: frak(g) -> frak(g)$ associated is the real form
$frak(g)^sigma = {x in frak(g): sigma(x) = x}$ of $frak(g)$. Therefore, the
involutive antilinear automorphisms of a complex Lie algebra $frak(g)$ will be
called #idx("structure", "real")_real structures_ on $frak(g)$.

#problem[If $sigma$ is a real structure on a complex Lie algebra $frak(g)$ and
  $phi in Aut frak(g)$, then $phi sigma phi^(-1)$ is also a real structure and
  $frak(g)^(phi sigma phi^(-1)) = phi(frak(g)^sigma)$. Let $sigma'$ be another
  real structure, then the real forms $frak(g)^sigma$ and $frak(g)^(sigma')$ are
  isomorphic if and only if $frak(g)^(sigma') = phi(frak(g)^sigma)$ or,
  equivalently, $sigma' = phi sigma phi^(-1)$ for some
  $phi in Aut frak(g)$.] <pr:isomorphic-real-forms-conjugate>

Let $G$ be a complex Lie group, $H$ its real Lie subgroup (i.e. a Lie subgroup
of $G$ considered as a real Lie group). The subgroup $H$ is a #idx(
  "real form of a Lie group",
)_real form_ of $G$ if

a) #source(237)its tangent algebra $frak(h)$ is a real form of $frak(g)$;

b) $H$ has a nonempty intersection with any connected component of $G$.

Theorem~@th:identity-component-normal implies that b) is equivalent to the
identity
$ G = H G^0. $ <eq:real-form-meets-all-components>

#problem[If $G$ is a complex algebraic group then its real form $H$ in the sense
  of @ss:complex-real-algebraic-groups is also its real form in the sense of the
  above definition.] <pr:algebraic-and-lie-real-forms>

#problem[If $H$ is a real form of a complex Lie group $G$ then the center $Z(H)$
  of $H$ coincides with $H inter Z(G)$.] <pr:center-of-real-form>

A #idx("structure", "real")_real structure_ on a complex Lie group $G$ is an
involutive differentiable in a real sense homomorphism $S: G -> G$, such that
$d S$ is a real structure on the tangent algebra $frak(g)$ of $G$. For instance,
the complex conjugation of a complex algebraic group $G$ with respect to its
real form (or, which is the same, an involutive antiholomorphic automorphism of
$G$) is a real structure on $G$. If $S$ is a real structure on a connected
complex Lie group $G$ then by Problem~@pr:automorphism-fixed-point-subgroup the
subgroup $G^S$ is a real form of $G$ and its tangent algebra coincides with
$frak(g)^(d S)$. For algebraic groups the similar fact was proved in
Ch.~@ch:algebraic-groups (Problem~@pr:group-real-form-from-involution).

In what follows an involutive antiholomorphic automorphism of an algebraic group
will be called an #idx("algebraic group structure")_algebraic real structure_
and a real form in the sense of the theory of algebraic groups will be called an
#idx("algebraic group", "real form")_algebraic real form._

#example[Let $T = (CC^*)^n$ be the $n$-dimensional algebraic torus. The
  algebraic real structure
  $(z_1, ..., z_n) |-> (overline(z)_1, ..., overline(z)_n)$ determines the real
  form $(RR^*)^n$ of $T$. Its tangent algebra is the real form
  $frak(t)(RR) = RR^n$ of $frak(t) = CC^n$ considered in
  @ss:rational-structure-torus-algebra.] <exm:split-real-torus>

#example[The algebraic real structure
  $(z_1, ..., z_n) |-> (overline(z)_1^(-1), ..., overline(z)_n^(-1))$
  determines the real form
  $TT^n = {(z_1, ..., z_n): abs(z_1) = dots.c = abs(z_n) = 1}$ of $T$ with the
  tangent algebra $i RR^n subset CC^n$.] <exm:compact-real-torus>

#example[The algebraic real structure $A |-> overline(A)$ on $GL_n (CC)$
  determines the real forms $GL_n (RR) subset GL_n (CC)$ and
  $frak("gl")_n (RR) subset frak("gl")_n (CC)$. The same example can be given in
  a coordinate-free form. Let $V$ be a finite-dimensional vector space over
  $RR$. Then on the group $GL(V(CC))$ a real structure $S$ is defined by the
  formula
  $
    S(A)(v) = overline(A(overline(v))) wide (v in V(CC)).
  $ <eq:real-structure-from-real-space>
  The corresponding real form is the subgroup of the group of linear
  transformations defined over $RR$, naturally identified with $GL(V)$. The Lie
  algebra $frak("gl")(V)$ is embedded into $frak("gl")(V(CC))$ as the real form
  tangent to $GL(V)$.] <exm:real-general-linear-form>

#example[If $V$ is a finite-dimensional algebra over $RR$ then an
  antiholomorphic automorphism $S$ defined by @eq:real-structure-from-real-space
  transforms the group $Aut(V(CC))$ into itself and determines an algebraic real
  structure there. The corresponding real form is $Aut V$. Passing to tangent
  algebras we get the real form $der V$ of $der (V(CC))$ (see
  Example~@exm:derivations-as-tangent-algebra[] in
  @ss:tangent-algebra-of-stabilizer).]
<exm:real-form-of-algebra-automorphisms>

#source(238)Example~@exm:real-form-of-algebra-automorphisms enables us to
generalize one of important properties of complex semisimple Lie algebras to
real ones.

#problem[If $frak(g)$ is a real semisimple Lie algebra then
  $der frak(g) = ad frak(g)$ and
  $Int frak(g) = (Aut frak(g))^0$.] <pr:real-semisimple-derivations-inner>

As we have seen in @ss:algebraic-group-definitions, any real algebraic group $G$
is embedded as a real form in a complex algebraic group $G(CC)$. The following
example shows that for the Lie groups (even semisimple ones) the similar
statement fails.

#example[Considering the natural transitive action of $SL_2 (RR)$ in
  $RR^2 without {0}$ and applying
  Theorem~@th:homotopy-sequence-homogeneous-space it is easy to show that
  $pi_1 (SL_2 (RR)) tilde.eq pi_1 (RR^2 without {0}) tilde.eq ZZ$. Let
  $G = tilde(SL)_2 (RR)$ be the simply connected covering for $SL_2 (RR)$. Then
  $G$ cannot be embedded as a real form in any complex Lie group $hat(G)$. In
  fact, let $f: G -> hat(G)$ be such an embedding. We may assume that the
  tangent algebra of $hat(G)$ is $frak("sl")_2 (CC)$ and $d f$ is the natural
  embedding $frak("sl")_2 (RR) -> frak("sl")_2 (CC)$. The group $hat(G)$ is
  connected and its simply connected covering is $SL_2 (CC)$. Therefore $f$ is
  covered by the injective homomorphism $hat(f): G -> SL_2 (CC)$ such that
  $d hat(f) = d f$. Clearly, $hat(f)(G) = SL_2 (RR)$ which leads to
  contradiction.] <exm:sl2r-cover-not-real-form>

The fact proved also implies that $tilde(SL)_2 (RR)$ does not admit any real
algebraic group structure and cannot even be isomorphic to the identity
component of an irreducible real algebraic group. Since any semisimple linear
Lie algebra is algebraic (Problem~@pr:center-orthogonal-to-derived) the group
$tilde(SL)_2 (RR)$ does not admit a faithful linear representation.

Now consider the realification of complex Lie algebras. Let $frak(g)$ be a
complex Lie algebra and $frak(g)^RR$ the same algebra considered as an algebra
over $RR$.

In the Lie algebra $frak(g)^RR$ the multiplication by $i$ is defined:
$ I x = i x wide (x in frak(g)^RR). $
It is a linear transformation over $RR$ such that
$ I^2 = -E, $ <eq:complex-structure-square>
$
  I[x, y] = [x, I y] wide (x, y in frak(g)^RR).
$ <eq:complex-structure-bracket>
In general, given a real Lie algebra $frak(g)$ we call a #idx(
  "structure",
  "complex",
)_complex structure on it_ a linear transformation of $frak(g)$ satisfying
@eq:complex-structure-square and @eq:complex-structure-bracket.

#problem[Given a real Lie algebra $frak(g)$ with a complex structure $I$ we make
  $frak(g)$ into a Lie algebra $tilde(frak(g))$ over $CC$ such that
  $tilde(frak(g))^RR = frak(g)$ by setting
  $
    (a + b i) x = a x + b I x wide (a, b in RR, x in frak(g)).
  $] <pr:complex-structure-gives-complex-algebra>

Notice that if $I$ is a complex structure on $frak(g)$, then so is $-I$.
Therefore from each complex Lie algebra $frak(g)$ over $CC$ we may construct
another Lie algebra over $CC$ obtained from $frak(g)$ by reversing the sign of
the complex structure; this Lie algebra #source(239)will be denoted by
$overline(frak(g))$. Clearly, $frak(g)^RR = overline(frak(g))^RR$. A
homomorphism $frak(g) -> overline(frak(g))$ is nothing but an antilinear
endomorphism of $frak(g)$. Therefore $frak(g) tilde.eq overline(frak(g))$ if and
only if $frak(g)$ admits an antilinear automorphism. In particular, if $frak(g)$
possesses a real form then $frak(g) tilde.eq overline(frak(g))$.

#problem[Let $frak(g)$ be a complex semisimple Lie algebra and
  ${h_i, e_i, f_i thick (i = 1, ..., l)}$ its canonical system of generators.
  Then the real subalgebra $frak(h) subset frak(g)$ generated by $h_i$, $e_i$,
  $f_i$ is a real form of $frak(g)$. The corresponding real structure on
  $frak(g)$ transforms each of $h_i$, $e_i$, $f_i$ into itself. Therefore, any
  semisimple complex Lie algebra $frak(g)$ is isomorphic to
  $overline(frak(g))$.] <pr:normal-real-form-construction>

A real form $frak(h)$ of a semisimple complex Lie algebra $frak(g)$ constructed
in Problem~@pr:normal-real-form-construction is called a #idx(
  "real form",
  "normal",
)_normal_ one. By Theorem~@th:cartan-matrix-determines-algebra any two normal
forms (constructed from different canonical systems of generators) are
isomorphic.

For any complex Lie algebra $frak(g)$ the complex Lie algebra
$frak(g)^"dbl" = frak(g) plus.o overline(frak(g))$ will be called the #idx(
  "double (of a Lie algebra)",
)_double_ of $frak(g)$.

#problem[The transformation $sigma: frak(g)^"dbl" -> frak(g)^"dbl"$ defined by
  the formula $sigma(x, y) = (y, x)$ is a real structure on $frak(g)^"dbl"$ and
  the map $(x, x) |-> x$ is an isomorphism of $(frak(g)^"dbl")^sigma$ onto
  $frak(g)^RR$. Therefore $frak(g)^RR (CC) tilde.eq frak(g)^"dbl"$. Under this
  isomorphism $frak(g)$ and $overline(frak(g))$ are sent into the eigenspaces of
  the operator $I$ (extended by linearity to $frak(g)^RR (CC)$) corresponding to
  the eigenvalues $i$ and $-i$
  respectively.] <pr:complexified-realification-is-double>

#problem[If $frak(g)$ is a semisimple complex Lie algebra then
  $frak(g)^RR (CC) tilde.equiv frak(g) plus.o frak(g)$. If $frak(h)$ is another
  semisimple complex Lie algebra and $frak(g)^RR tilde.equiv frak(h)^RR$ then
  $frak(g) tilde.equiv frak(h)$.] <pr:realification-determines-algebra>

#problem[Let $(dot, dot)$ be the Cartan scalar product in a complex Lie algebra
  $frak(g)$. Then the Cartan scalar product in $frak(g)^RR$ is of the form
  $(x, y)^RR = 2 Re(x, y)$. If $frak(h)$ is a real form of $frak(g)$ then the
  restriction of $(dot, dot)$ onto $frak(h)$ coincides with the Cartan scalar
  product in $frak(h)$. For any antilinear automorphism $gamma$ of $frak(g)$ we
  have
  $
    (gamma(x), gamma(y)) = overline((x, y)) wide (x, y in frak(g)).
  $] <pr:killing-form-realification-real-form>

As it was proved in @ss:complexification-lie-algebras, a real Lie algebra is
semisimple if and only if so is its complexification. Now let us investigate the
relation between simple non-commutative Lie algebras over $RR$ and $CC$.

#problem[If $frak(g)$ is a non-commutative simple Lie algebra over $CC$ then any
  real form of $frak(g)$ is simple and the Lie algebra $frak(g)^RR$ is
  simple.] <pr:simple-complex-real-forms-simple>

#problem[If $frak(g)$ is a simple real Lie algebra then either $frak(g)(CC)$ is
  simple or $frak(g)$ admits a complex
  structure.] <pr:simple-real-complexification-dichotomy>

Problems~@pr:simple-complex-real-forms-simple and
@pr:simple-real-complexification-dichotomy imply

#theorem[A non-commutative real Lie algebra is simple if and only if it is
  isomorphic to either algebra $frak(g)^RR$, where $frak(g)$ is a simple complex
  Lie algebra, or to a real form of a simple complex Lie
  algebra.] <th:simple-real-algebras-two-types>

Theorem~@th:simple-real-algebras-two-types and
Problem~@pr:realification-determines-algebra imply that the classification of
simple real Lie algebras reduces to the classification of simple complex Lie
algebras obtained in @sec:existence-uniqueness-theorems and to the
classification of non-isomorphic real forms of each of them.

=== Real Forms of Classical Lie Groups and Algebras
<ss:real-forms-classical-groups>
#source(240)In this subsection we specify several real forms of classical
complex Lie groups $GL_n (CC)$, $SL_n (CC)$, $upright(O)_n (CC)$, $SO_n (CC)$,
$Sp_n (CC)$ and their tangent algebras. Actually, as we will see in
@ss:classification-real-simple, the real forms listed here exhaust up to an
isomorphism all real forms of the classical complex Lie algebras. It is easy to
observe that all real structures and real forms of classical groups listed below
are algebraic.

Recall (see Example~@exm:real-general-linear-form[] of
@ss:real-structures-and-forms) that $GL_n (RR)$ is a real form of $GL_n (CC)$
and $frak("gl")_n (RR)$ is a real form of $frak("gl")_n (CC)$. The corresponding
real structure on $GL_n (CC)$ is the complex conjugation: $S(A) = overline(A)$.

#example[The complex conjugation $A |-> overline(A)$ transforms each of the
  groups $SL_n (CC)$, $upright(O)_n (CC)$, $SO_n (CC)$, $Sp_n (CC)$ into itself
  and determines real structures in them. Therefore the following real forms of
  the classical groups are defined:
  $
    SL_n (RR) subset SL_n (CC), upright(O)_n subset upright(O)_n (CC),
    SO_n subset SO_n (CC), Sp_n (RR) subset Sp_n (CC)
  $
  The corresponding real forms of the Lie algebras are:
  $
    frak("sl")_n (RR) subset frak("sl")_n (CC),
    frak("so")_n subset frak("so")_n (CC),
    frak("sp")_n (RR) subset frak("sp")_n (CC).
  $] <exm:conjugation-real-forms-classical>

The following series of examples has to do with quadratic forms. In
@ss:connectedness-lie-groups[°] the pseudoorthogonal group
$upright(O)_(k, l) subset GL_(k+l) (RR)$ of signature $(k, l)$ preserving the
quadratic form
$
  x_1^2 + dots.c + x_k^2 - x_(k+1)^2 - dots.c - x_(k+l)^2,
$ <eq:indefinite-quadratic-form>
and the special pseudoorthogonal group $SO_(k, l)$ had been defined.

Let $I_(k, l) = mat(E_k, 0; 0, -E_l)$ be the matrix of the
form~@eq:indefinite-quadratic-form and let $L_(k, l) = mat(E_k, 0; 0, i E_l)$.
Then $L_(k, l)^2 = I_(k, l)$.

#example[The transformation $S(A) = I_(k, l) overline(A) I_(k, l)$ is a real
  structure on the complex Lie groups $G = upright(O)_(k+l) (CC)$,
  $SO_(k+l) (CC)$, the corresponding real forms $G^S$ coincide with
  $L_(k, l) upright(O)_(k, l) L_(k, l)$ and $L_(k, l) SO_(k, l) L_(k, l)^(-1)$
  respectively. The corresponding real form
  $L_(k, l) frak("so")_(k, l) L_(k, l)^(-1)$ of $frak("so")_(k+l) (CC)$ consists
  of the matrices of the form
  $ mat(X, i Y; -i Y^T, Z) $
  where $X$, $Y$, $Z$ are real matrices, $X$ and $Z$ of sizes $k times k$ and
  $l times l$ respectively, $X^T = -X$,
  $Z^T = -Z$.] <exm:pseudo-orthogonal-real-forms>

The #idx("Group", "pseudounitary")_pseudounitary group of signature
$(k, l)$_ is the group $upright(U)_(k, l)$ of all linear transformations of
$CC^(k+l)$ preserving the pseudohermitian quadratic form
$
  abs(z_1)^2 + dots.c + abs(z_k)^2 - abs(z_(k+1))^2 - dots.c - abs(z_(k+l))^2.
$
#source(241)In particular, $upright(U)_n = upright(U)_(n, 0)$ is the group of
#idx("matrix", "unitary")_unitary_ matrices (or the #idx(
  "Group",
  "unitary",
)_unitary_ group). The groups
$SU_(k, l) = upright(U)_(k, l) inter SL_(k+l) (CC)$ and $SU_n = SU_(n, 0)$ are
called #idx("Group", "special (pseudo) unitary")_special pseudounitary_ and
_special unitary_ groups. The corresponding tangent algebras will be denoted by
$frak(u)_(k, l)$, $frak(u)_n$, $frak("su")_(k, l)$, $frak("su")_n$.

#example[The transformation $S(A) = I_(k, l) overline(A)^(T-1) I_(k, l)$ defines
  a real structure on the complex groups $G = GL_(k+l) (CC)$, $SL_(k+l) (CC)$,
  the corresponding real forms $G^S$ coincide with $upright(U)_(k, l)$ and
  $SU_(k, l)$ respectively. To these real forms of Lie groups correspond the
  real forms $frak(u)_(k, l) subset frak("gl")_(k+l) (CC)$ and
  $frak("su")_(k, l) subset frak("sl")_(k+l) (CC)$ consisting of the matrices of
  the form
  $ mat(X, Y; overline(Y)^T, Z), $
  where $overline(X)^T = -X$, $overline(Z)^T = -Z$, $X$ and $Z$ of sizes
  $k times k$ and $l times l$ respectively, and for $frak("su")_(k, l)$
  additionally satisfying $tr X + tr Z = 0$.] <exm:pseudo-unitary-real-forms>

Finally, the last group of examples results from the existence of a quaternionic
structure in $CC^(2m)$. Consider the right quaternion vector space $HH^m$ over
the quaternion field $HH$. Its linear transformations are identified with
$m times m$ matrices over $HH$. Let $GL_m (HH)$ be the group of invertible
quaternion matrices. Its tangent algebra is the Lie algebra $frak("gl")_m (HH)$
of all quaternion matrices.

Consider $CC$ as a subfield of $HH$ generated by 1, $i$. Each vector $q in HH^m$
uniquely presents in the form $q = z + j w$, where $z, w in CC^m$. The
correspondence $q |-> (z, w)$ is an isomorphism $HH^m -> CC^(2m)$ of vector
spaces over $CC$ that maps $q j$ into $(-overline(w), overline(z))$. Therefore
$frak("gl")_m (HH)$ is identified by this isomorphism with a subalgebra of
$frak("gl")_(2m) (CC)$ consisting of all transformations commuting with the
antilinear transformation $J: CC^(2m) -> CC^(2m)$ given by
$J(z, w) = (-overline(w), overline(z))$. Notice that $J = S_m tau$, where $tau$
is the standard complex conjugation in $CC^(2m)$ and
$S_m = mat(0, -E_m; E_m, 0)$.

#example[The transformation $S(A) = J A J^(-1) = -S_m overline(A) S_m$
  determines a real structure on the complex Lie groups $G = GL_(2m) (CC)$,
  $SL_(2m) (CC)$, $SO_(2m) (CC)$. The corresponding real form of $GL_(2m) (CC)$
  is identified with $GL_m (HH)$. The real forms $G^S$ of the groups
  $G = SL_(2m) (CC)$, $SO_(2m) (CC)$ are denoted by $SL_m (HH)$,
  $upright(U)_m^* (HH)$ respectively. The latter notation is chosen since
  $upright(U)_m^* (HH)$ is identified with the subgroup of $GL_m (HH)$
  consisting of all linear transformations $C$ of $HH^m$ preserving the
  skew-Hermitian quadratic form
  $ sum_(1 <= r <= m) overline(q)_r j q_r, $
  i.e. satisfying $overline(C)^T (j E) C = j E$. The tangent algebras of
  $SL_m (HH)$, $upright(U)_m^* (HH)$ are denoted by $frak("sl")_m (HH)$,
  $frak(u)_m^* (HH)$. These Lie algebras are real forms of
  $frak("sl")_(2m) (CC)$, $frak("so")_(2m) (CC)$. The Lie algebras
  $frak("gl")_m (HH)$, $frak("sl")_m (HH)$, $frak(u)_m^* (HH)$ are subalgebras
  of $frak("gl")_(2m) (CC)$ consisting of matrices of the form
  $ mat(X, Y; -overline(Y), overline(X)), $
  #source(242)where $X, Y in frak("gl")_m (CC)$, such that
  $tr X + tr overline(X) = 0$ for $frak("sl")_m (HH)$ and $X^T = -X$,
  $Y^T = overline(Y)$ for $frak(u)_m^* (HH)$.] <exm:quaternionic-real-forms>

In $GL_(k+l) (HH)$, consider the subgroup $Sp_(k, l)$ consisting of the
transformations preserving the Hermitian quadratic form
$
  abs(q_1)^2 + dots.c + abs(q_k)^2 - abs(q_(k+1))^2 - dots.c - abs(q_(k+l))^2.
$
<eq:quaternionic-hermitian-form>
Under the isomorphism $HH^(k+l) -> CC^(2(k+l))$ described above the
form~@eq:quaternionic-hermitian-form is mapped into the Hermitian quadratic form
$
  sum_(1 <= i <= k) abs(z_i)^2 - sum_(k+1 <= j <= k+l) abs(z_j)^2
  + sum_(1 <= i <= k) abs(w_i)^2 - sum_(k+1 <= j <= k+l) abs(w_j)^2.
$ <eq:quaternionic-form-complex-coordinates>
Therefore $Sp_(k, l)$ is identified with a subgroup of $GL_(2(k+l)) (CC)$
consisting of the matrices $A$ such that
$ A = -S_(k+l) overline(A) S_(k+l), overline(A)^T K_(k, l) A = K_(k, l), $
where $K_(k, l) = mat(I_(k, l), 0; 0, I_(k, l))$ is the matrix of the
form~@eq:quaternionic-form-complex-coordinates. These conditions imply that
$A(K_(k, l) S_(k+l)) A^T = K_(k, l) S_(k+l)$, i.e. $Sp_(k, l)$ is contained in
the complex symplectic group preserving the form with the matrix
$K_(k, l) S_(k+l)$. Setting $M_(k, l) = mat(L_(k, l), 0; 0, L_(k, l))$ (see
Example~@exm:pseudo-orthogonal-real-forms) we see that the group
$M_(k, l) Sp_(k, l) M_(k, l)^(-1)$ is contained in the standard symplectic group
$Sp_(2(k+l)) (CC)$ and coincides with the subgroup of all elements of the
symplectic group preserving @eq:quaternionic-form-complex-coordinates.

#example[The transformation $S(A) = K_(k, l) overline(A)^(T-1) K_(k, l)$ is a
  real structure on $G = Sp_(2(k+l)) (CC)$ and
  $G^S = M_(k, l) Sp_(k, l) M_(k, l)^(-1)$. In what follows we will identify the
  subgroup $G^S$ with $Sp_(k, l)$. The corresponding real form
  $frak("sp")_(k, l) subset frak("sp")_(2(k+l)) (CC)$ consists of the matrices
  of the form
  $
    bordered(

      , k, l, k, l;
      k, X_11, X_12, X_13, X_14;
      l, overline(X)_12^T, X_22, X_14^T, X_24;
      k, -overline(X)_13, overline(X)_14, overline(X)_11, -overline(X)_12;
      l, overline(X)_14^T, -overline(X)_24, -X_12^T, overline(X)_22
    )
  $
  where $overline(X)_11^T = -X_11$, $overline(X)_22^T = -X_22$, $X_13^T = X_13$,
  $X_24^T = X_24$.] <exm:quaternionic-pseudo-unitary-forms>

In particular, the group $Sp_(m, 0)$ coincides with the group
$Sp_m = GL_m (HH) inter upright(U)_(2m)$ of unitary quaternion matrices (see
Exercise~@exc:quaternionic-unitary-group) and its tangent algebra
$frak("sp")_(m, 0)$ coincides with the Lie algebra
$frak("sp")_m = frak("gl")_m (HH) inter frak(u)_(2m)$ (here $M_(k, l) = E$).

=== The Compact Real Form <ss:compact-real-form>
In this section we will show that each connected semisimple complex Lie group
has a compact real form. This will enable us to #source(243)establish a
one-to-one correspondence between the reductive complex algebraic groups and
compact real Lie groups.

A finite-dimensional Lie algebra $frak(g)$ over $RR$ is called #idx(
  "Lie algebra",
  "compact",
)_compact_ if there exists a positive definite invariant scalar product in
$frak(g)$. Clearly, any subalgebra of a compact Lie algebra is compact.

#problem[The tangent algebra of any compact Lie group is
  compact.] <pr:compact-group-compact-algebra>

#problem[The Cartan scalar product on a compact Lie algebra is always negative
  semi-definite. A real Lie algebra is semisimple compact if and only if its
  Cartan scalar product is negative
  definite.] <pr:compact-algebra-killing-form-negative>

#problem[For a compact Lie algebra $frak(g)$ the derived algebra $frak(g)'$ is
  semisimple and $frak(g) = frak(g)' plus.o frak(z)(frak(g))$.]
<pr:compact-algebra-reductive-splitting>

#problem[For any compact Lie algebra $frak(g)$ there exists a connected compact
  Lie group $G$ with the tangent algebra $frak(g)$. If $frak(g)$ is semisimple
  then we may take $G = Int frak(g)$.] <pr:compact-algebra-has-compact-group>

Now let $frak(g)$ be an arbitrary complex Lie algebra, $sigma$ a real structure
on $frak(g)$. Define the Hermitian form on $frak(g)$ by setting
$ h_sigma (x, y) = -(x, sigma(y)), $ <eq:hermitian-form-of-real-structure>
where $(dot, dot)$ is the Cartan scalar product.

#problem[The form $h_sigma$ is invariant with respect to $ad frak(g)^sigma$,
  i.e.
  $
    h_sigma ([z, x], y) + h_sigma (x, [z, y]) = 0 wide
    (x, y in frak(g), z in frak(g)^sigma).
  $
  The restriction of the form $-h_sigma$ onto $frak(g)^sigma$ coincides with the
  Cartan scalar product in $frak(g)^sigma$.] <pr:hermitian-form-invariance>

#problem[If $gamma in Aut frak(g)$ is an automorphism commuting with $sigma$
  then
  $
    h_sigma (gamma x, gamma y) = h_sigma (x, y) wide (x, y in frak(g)).
  $] <pr:hermitian-form-automorphism-invariance>

Now assume that $G$ is a connected complex semisimple Lie group, $frak(g)$ its
tangent algebra, $S$ a real structure on $G$ such that $sigma = d S$.

#problem[The following conditions are equivalent:

  a) $G^S$ is compact;

  b) the Lie algebra $frak(g)^sigma$ is compact;

  c) the Hermitian form $h_sigma$ is positive
  definite.] <pr:compactness-criteria-real-form>

Fix a maximal torus $T subset G$ and a base ${alpha_1, ..., alpha_l}$ of the
root system $Delta_G$ with respect to $T$. Consider the canonical system of
generators ${h_i, e_i, f_i: i = 1, ..., l}$ of $frak(g)$ defined in
@ss:uniqueness-theorems. As it is known, ${-alpha_1, ..., -alpha_l}$ is also a
base. The system ${-h_i, -f_i, -e_i: i = 1, ..., l}$ is the canonical system of
generators associated with this base. By
Theorem~@th:cartan-matrix-determines-algebra there exists a unique automorphism
$mu$ of $frak(g)$ such that
#source(244)
$
  mu(h_i) = -h_i, quad mu(e_i) = -f_i, quad mu(f_i) = -e_i wide
  (i = 1, ..., l).
$
We have $mu^2 = id$.

#problem[There exists a unique antilinear automorphism $sigma$ of $frak(g)$ such
  that
  $
    sigma(h_i) = -h_i, quad sigma(e_i) = -f_i, quad sigma(f_i) = -e_i wide
    (i = 1, ..., l).
  $
  This automorphism is involutive, i.e. $sigma$ is a real structure on
  $frak(g)$.] <pr:compact-real-structure-on-generators>

#problem[There exists a real structure $S$ on $G$ such that
  $d S = sigma$.] <pr:compact-structure-lifts-to-group>

#problem[The subspaces $frak(g)_alpha$, $frak(g)_beta$
  $(alpha, beta in Delta_G, alpha != beta)$ are orthogonal with respect to
  $h_sigma$. The subspace $frak(t)$ is orthogonal to any $frak(g)_alpha$,
  $alpha in Delta_G$.] <pr:root-spaces-hermitian-orthogonal>

#problem[The Hermitian form $h_sigma$ is positive definite on $frak(t)$ and on
  any $frak(g)_(alpha_i)$
  $(i = 1, ..., l)$.] <pr:hermitian-form-positive-simple-roots>

Let $G^((i)) = G^((alpha_i))$ be the simple three-dimensional (complex) subgroup
of $G$ corresponding to a simple root $alpha_i$. It is the image of $SL_2 (CC)$
under the homomorphism $F_i = F_(alpha_i)$ (see
@ss:three-dimensional-subalgebras[°]).

#problem[We have $F_i (overline(g)^(T-1)) = S(F_i (g))$
  $(g in SL_2 (CC))$.] <pr:compact-structure-on-sl2-subgroups>

#problem[Each element of the Weyl group of $G$ with respect to $T$ is induced by
  an element of $N(T) inter G^S$.] <pr:weyl-group-in-compact-form>

#problem[The Hermitian form $h_sigma$ is positive definite on
  $frak(g)$.] <pr:hermitian-form-positive-definite>

Problems~@pr:compactness-criteria-real-form,
@pr:compact-structure-lifts-to-group and @pr:hermitian-form-positive-definite
imply the following.

#theorem[Any connected semisimple complex Lie group $G$ has a compact real form.
  The tangent algebra of this form is a compact real form of the tangent algebra
  $frak(g)$ of $G$.] <th:compact-real-form-exists>

#problem[A compact Lie algebra admitting a complex structure is
  commutative.] <pr:compact-complex-structure-commutative>

#problem[A complex Lie algebra is simple if and only if it has a simple compact
  real form.] <pr:simple-iff-compact-form-simple>

As it will be shown in @ss:real-forms-involutive-automorphisms, a compact real
form of a semisimple complex Lie algebra is unique up to an inner automorphism
of this algebra.

_Example._ The following real forms of classical groups and their tangent
algebras are compact: $upright(U)_n subset GL_n (CC)$, $SU_n subset SL_n (CC)$,
$upright(O)_n subset upright(O)_n (CC)$, $SO_n subset SO_n (CC)$,
$Sp_n subset Sp_(2n) (CC)$; $frak(u)_n subset frak("gl")_n (CC)$,
$frak("su")_n subset frak("sl")_n (CC)$,
$frak("so")_n subset frak("so")_n (CC)$,
$frak("sp")_n subset frak("sp")_(2n) (CC)$.

=== Real Forms and Involutive Automorphisms
<ss:real-forms-involutive-automorphisms>
Let $frak(g)$ be a complex Lie algebra. Consider the problem of classifying the
real forms of $frak(g)$ up to an isomorphism. By
Problem~@pr:isomorphic-real-forms-conjugate the classes of isomorphic real forms
are in one-to-one correspondence with the involutive antilinear automorphisms
considered up to conjugacy in $Aut frak(g)$. In this section we will show that
for a semisimple Lie algebra $frak(g)$ the antilinear automorphisms in this
classification can be replaced by the linear ones.

#source(245)Let $sigma$ and $tau$ be two real structures on a Lie algebra
$frak(g)$. The real forms $frak(g)^sigma$ and $frak(g)^tau$ are said to be #idx(
  "real forms compatible",
)_compatible_ if $sigma tau = tau sigma$.

#problem[The following conditions are equivalent: \
  a) $frak(g)^sigma$ and $frak(g)^tau$ are compatible; \
  b) $tau(frak(g)^sigma) = frak(g)^sigma$; \
  c) $sigma(frak(g)^tau) = frak(g)^tau$;

  $
    "d)" thick frak(g)^sigma = frak(g)^sigma inter frak(g)^tau
    plus.o frak(g)^sigma inter (i frak(g)^tau);
  $ <eq:compatible-first-form-splitting>
  $
    "e)" thick frak(g)^tau = frak(g)^tau inter frak(g)^sigma
    plus.o frak(g)^tau inter (i frak(g)^sigma);
  $ <eq:compatible-second-form-splitting>

  f) the automorphism $theta = sigma tau$ of $frak(g)$ is
  involutive.] <pr:compatible-real-forms-criteria>

Notice that if $sigma$ and $tau$ are compatible then $theta$ transforms
$frak(g)^sigma$ and $frak(g)^tau$ into themselves, hence
$theta|frak(g)^sigma = tau|frak(g)^sigma$ and
$theta|frak(g)^tau = sigma|frak(g)^tau$. Clearly,
@eq:compatible-first-form-splitting and @eq:compatible-second-form-splitting
coincide with the decompositions of $frak(g)^sigma$ and $frak(g)^tau$ into the
eigenspaces of $theta$ corresponding to the eigenvalues 1 and $-1$.

_Example._ All real forms of the classical groups $GL_n (CC)$, $SL_n (CC)$,
$upright(O)_n (CC)$, $SO_n (CC)$, $Sp_(2n) (CC)$ listed in
@ss:real-forms-classical-groups are compatible with their compact real forms
$upright(U)_n$, $SU_n$, $upright(O)_n$, $SO_n$, $Sp_n$, respectively.

#problem[Two compact real forms of a semisimple complex Lie algebra are
  compatible if and only if they
  coincide.] <pr:compatible-compact-forms-coincide>

Our next goal is to prove the following.

#theorem[Any two compact real forms of a semisimple Lie algebra $frak(g)$ over
  $CC$ are conjugate. Any real form of $frak(g)$ is compatible with a compact
  form. If a real form $frak(h)$ is compatible with two compact real forms
  $frak(u)_1$ and $frak(u)_2$, then there exists an automorphism
  $phi in Int frak(g)$, such that $phi(frak(u)_1) = frak(u)_2$ and
  $phi(frak(h)) = frak(h)$.] <th:compact-forms-conjugacy-compatibility>

Let us fix a compact form $frak(u)$ existing thanks to
Theorem~@th:compact-real-form-exists and let $tau$ be the corresponding
structure on $frak(g)$. Let $sigma$ be an arbitrary real structure on $frak(g)$.
We wish to show that the real forms $frak(g)^sigma$ and $frak(u)$ can be made
compatible by applying an inner automorphism of $frak(g)$ to one of these forms.

Consider the automorphism $theta = sigma tau$ and a positive definite Hermitian
form $h_tau$ on $frak(g)$ defined by @eq:hermitian-form-of-real-structure.

#problem[The operator $theta$ is self-adjoint with respect to the form $h_tau$,
  i.e. $h_tau (theta x, y) = h_tau (x, theta y)$
  $(x, y in frak(g))$.] <pr:real-structures-product-self-adjoint>

This implies that $p = theta^2$ is a positive definite self-adjoint operator.

#problem[Let $bold(E)$ be a finite-dimensional Euclidean or Hermitian space,
  $S(bold(E))$ the space of all its self-adjoint linear operators and
  $P(bold(E)) subset S(bold(E))$ the open set of positive definite operators.
  Then $exp$ bijectively maps $S(bold(E))$ onto
  $P(bold(E))$.] <pr:exp-self-adjoint-to-positive>

Let $log = exp^(-1): P(bold(E)) -> S(bold(E))$. For $p in P(bold(E))$ and
$t in RR$ set $p^t = exp(t log p)$.

#problem[If $G subset GL(bold(E))$ is a real algebraic group and
  $p in G inter P(bold(E))$, then $p^t in G$ for all $t in RR$ and $log p$
  belongs to the tangent algebra $frak(g)$ of $G$. Therefore, $exp$ bijectively
  maps $frak(g) inter S(bold(E))$ onto
  $G inter P(bold(E))$.] <pr:algebraic-group-real-powers>

Applying Problem~@pr:algebraic-group-real-powers to the element $p = theta^2$ of
$Aut frak(g)$ we get a one-parameter subgroup $p^t$ $(t in RR)$ in $Aut frak(g)$
consisting of positive definite self-adjoint (with respect to $h_tau$) operators
such that $p^1 = p$. By Corollary of
Theorem~@th:outer-automorphisms-dynkin-diagram $p^t in Int frak(g)$.

#problem[#source(246)We have $sigma p^t sigma = tau p^t tau = p^(-t)$.]
<pr:real-structures-invert-powers>

#problem[The automorphism $phi = p^(1\/4)$ satisfies
  $sigma(phi tau phi^(-1)) = (phi tau phi^(-1)) sigma$. Therefore
  $frak(g)^sigma$ is compatible with the compact real form $phi(frak(u))$. If a
  real structure $psi$ on $frak(g)$ commutes with $sigma$ and $tau$ then $psi$
  commutes with $phi$ as well.] <pr:quarter-power-makes-compatible>

Problems~@pr:compatible-real-forms-criteria and
@pr:quarter-power-makes-compatible immediately imply
Theorem~@th:compact-forms-conjugacy-compatibility.

Theorems~@th:compact-real-form-exists, @th:compact-forms-conjugacy-compatibility
and Problem~@pr:simple-iff-compact-form-simple imply

#corollary[The map $frak(g) |-> frak(g)(CC)$ determines the bijection between
  the classes of isomorphic compact semisimple Lie algebras and the classes of
  isomorphic complex semisimple Lie algebras assigning to a simple compact Lie
  algebra a simple complex Lie algebra and vice versa.]

Theorem~@th:compact-forms-conjugacy-compatibility enables us to establish a
correspondence between the real forms of a semisimple complex Lie algebra
$frak(g)$ and its involutive automorphisms. Namely, let $sigma$ be a real
structure on $frak(g)$. By Theorem~@th:compact-forms-conjugacy-compatibility
there exists a compact real structure $tau$ commuting with $sigma$. Then
$theta = sigma tau$ is an involutive automorphism of $frak(g)$. If $tau_1$ is
another compact real structure commuting with $sigma$, then, as easily follows
from Theorem~@th:compact-forms-conjugacy-compatibility, the automorphisms
$theta$ and $theta_1 = sigma tau_1$ are conjugate in $Aut frak(g)$. Therefore
there is a map assigning to each real structure (or a real form) in $frak(g)$ a
class of conjugate involutive automorphisms of $frak(g)$.

#theorem[The constructed map defines a bijection of the set of isomorphism
  classes of real forms of $frak(g)$ onto the set of classes of conjugate
  involutive automorphisms of $frak(g)$.] <th:real-forms-involutions-bijection>

To prove this theorem let $theta$ be an involutive automorphism of $frak(g)$.
Making use of Theorem~@th:compact-real-form-exists choose a compact real
structure $tau$ on $frak(g)$. Then $q = (theta tau)^2$ is an automorphism of
$frak(g)$.

#problem[The automorphism $q$ is a positive definite self-adjoint operator with
  respect to the Hermitian form
  $h_tau$.] <pr:involution-compact-product-positive>

#problem[There exists a compact real structure $tau_1$ commuting with $theta$.
  This structure is determined up to conjugacy by an automorphism of $frak(g)$
  commuting with $theta$.] <pr:compact-structure-commuting-involution>

As it follows from Problem~@pr:compact-structure-commuting-involution,
$theta = sigma tau_1$, where $sigma$ is a real structure commuting with $tau_1$.
This makes transparent the surjectivity of the map constructed above.

It is clear that two real structures which are conjugate by an automorphism
define the same class of involutive automorphisms. Let us prove that the
converse is also true. Let $sigma_i$ $(i = 1, 2)$ be two real structures,
$tau_i$ a compact real structure commuting with $sigma_i$,
$theta_i = sigma_i tau_i$. Let $theta_2 = phi theta_1 phi^(-1)$, where
$phi in Aut frak(g)$. Since $tau_1$ and $tau_2$ are conjugate, we may assume
that $tau_1 = tau_2 = tau$. Then the structures $tau$ and $phi^(-1) tau phi$
commute with $theta_1$. By Problem~@pr:compact-structure-commuting-involution
$phi^(-1) tau phi = psi tau psi^(-1)$, where $psi in Aut frak(g)$ and
$psi theta_1 = theta_1 psi$. Clearly, $sigma_2 = omega sigma_1 omega^(-1)$ for
$omega = phi psi$. Theorem~@th:real-forms-involutions-bijection is
proved.#qed-mark

It is useful to indicate an explicit construction of the real form $frak(h)$ of
$frak(g)$ corresponding to an involutive automorphism $theta in Aut frak(g)$.
For this it is convenient to fix a compact real form $frak(u)$ of $frak(g)$.
Problem~@pr:compact-structure-commuting-involution implies that replacing
$theta$ by a conjugate #source(247)automorphism we may assume that
$theta(frak(u)) = frak(u)$. Let
$ frak(u) = frak(u)(1) plus.o frak(u)(-1) $
be the decomposition of $frak(u)$ into the eigenspaces of $theta$ corresponding
to the eigenvalues 1 and $-1$.

#problem[The real form $frak(h)$ of $frak(g)$ corresponding to the class of
  $theta$ by Theorem~@th:real-forms-involutions-bijection is of the form
  $
    frak(h) = frak(u)(1) plus.o i frak(u)(-1).
  $ <eq:real-form-from-involution>
  In particular, to the identity automorphism $theta = id$ the class of compact
  real forms of $frak(g)$ corresponds.] <pr:real-form-of-involution-explicit>

=== Involutive Automorphisms of Complex Simple Lie Algebras
<ss:involutions-of-simple-algebras>
Here we describe the classes of conjugate involutive automorphisms of complex
simple Lie algebras with the help of the method of
@sec:semisimple-algebra-automorphisms. Let $frak(g)$ be a non-commutative
complex simple Lie algebra of type $L_n$. It suffices to consider non-identical
involutive automorphisms $theta in Aut frak(g)$, i.e. automorphisms $theta$ of
order 2. By Theorem~@th:kac-diagram-classification and
Problem~@pr:finite-order-kac-labels the classes of conjugate in $Aut frak(g)$
automorphisms of order 2 are in one-to-one correspondence with the considered up
to an isomorphism Kac diagrams of types $L_n^((k))$ whose numerical labels $u_j$
are of the form $u_j = s_j\/2$, where $s_j$ $(j = 0, 1, ..., l)$ are
non-negative integers, relatively prime and satisfying
$ k sum_(0 <= j <= l) n_j s_j = 2. $ <eq:order-two-kac-condition>
Here $n_0, n_1, ..., n_l$ are relatively prime positive integers listed in
Table~@tab:affine-dynkin-diagrams. It follows from @eq:order-two-kac-condition
that $k = 1$ or 2.

#problem[Kac diagrams satisfying @eq:order-two-kac-condition belong to one of
  the following three types:

  I) $k = 1$; $u_i = 0$ for all $i$ except some $i = p$; $u_p = 1\/2$;
  $n_p = 2$;

  II) $k = 1$; $u_i = 0$ for all $i$ except some $i = p, q$, $p != q$;
  $u_p = u_q = 1\/2$; $n_p = n_q = 1$;

  III) $k = 2$; $u_i = 0$ for all $i$ except some $i = p$; $u_p = 1\/2$;
  $n_p = 1$.] <pr:involution-kac-diagram-types>

In case II we may assume that $q = 0$ if we consider Kac diagrams up to an
isomorphism.

Making use of Problem~@pr:involution-kac-diagram-types and
Table~@tab:affine-dynkin-diagrams it is not difficult to list all up to
isomorphism Kac diagrams satisfying @eq:order-two-kac-condition. The results are
given in Table~@tab:involutive-automorphisms (in case II we assume that
$q = 0$). Problem~@pr:fixed-subalgebra-from-kac-diagram helps also to determine
the type of the corresponding subalgebras $frak(g)^theta$ (note that
$frak(g)^theta$ is semisimple in cases I and III and has a one-dimensional
center in case II).

#problem[Let $theta_1$, $theta_2$ be involutive automorphisms of a simple
  noncommutative Lie algebra $frak(g)$ over $CC$. Then
  $frak(g)^(theta_1) tilde.equiv frak(g)^(theta_2)$ if and only if $theta_1$ and
  $theta_2$ are conjugate in
  $Aut frak(g)$.] <pr:involution-determined-by-fixed-algebra>

#source(248)As an application, let us explicitly describe the classes of
conjugate involutive automorphisms of simple classical complex Lie algebras. We
make use of notation of @ss:real-forms-classical-groups.

#theorem[The following automorphisms $theta$ of simple classical complex Lie
  algebras $frak(g)$ form the complete system of representatives of classes of
  conjugate involutive automorphisms (for $theta != id$ the type of the
  corresponding Kac diagram is indicated, see
  Problem~@pr:involution-determined-by-fixed-algebra):

  #grid(
    columns: (auto, auto, 1fr),
    column-gutter: (0.5em, 1.5em),
    row-gutter: 0.65em,
    [1)], [$frak(g) = frak("sl")_n (CC)$, $n >= 3$], [],
    [], [a) $theta(X) = -X^T$], [III],
    [], [b) $theta(X) = -Ad S_m (X^T)$, $n = 2m$], [III],
    [],
    [c) $theta = Ad I_(p, n-p)$ $(p = 0, 1, ..., [n\/2])$],
    [II for $p > 0$],

    [2)], [$frak(g) = frak("so")_n (CC)$, $n = 3 "or" n >= 5$], [],
    [],
    [a) $theta = Ad I_(p, n-p)$ $(p = 0, 1, ..., [n\/2])$],
    [I and III for $p != 0, 2, n - 2$; II for $p = 2, n - 2$],

    [], [b) $theta = Ad S_m$, $n = 2m != 8$], [II],
    [3)], [$frak(g) = frak("sp")_n (CC)$, $n = 2m >= 2$], [],
    [], [a) $theta = Ad S_m$], [II],
    [], [b) $theta = Ad K_(p, m-p)$ $(p = 0, 1, ..., [m\/2])$], [I for $p > 0$],
  )] <th:classical-algebra-involutions>

#problem[Prove this theorem.] <pr:prove-classical-involutions>

=== Classification of Real Simple Lie Algebras <ss:classification-real-simple>
The results of @ss:real-forms-involutive-automorphisms and
@ss:involutions-of-simple-algebras enable us to list up to an isomorphism all
real forms of non-commutative complex simple Lie algebras. For the classical Lie
algebras this list is given by the following theorem.

#theorem[Any real form of a classical simple complex Lie algebra $frak(g)$ is
  isomorphic to exactly one of the following real forms
  $frak(h) subset frak(g)$:

  #grid(
    columns: 2,
    column-gutter: 0.5em,
    row-gutter: 0.65em,
    [1)],
    [$frak(g) = frak("sl")_n (CC)$, $n >= 3$#ed-note[The book has $n >= 2$ in 1)
        and admits $n = 8$ in 2) b), here and in
        Theorem~@th:classical-algebra-involutions. The list would then contain
        isomorphic algebras: $frak("sl")_2 (RR) tilde.eq frak("su")_(1, 1)$,
        $frak("sl")_1 (HH) tilde.eq frak("su")_2$ and
        $frak(u)_4^* (HH) tilde.eq frak("so")_(2, 6)$
        (Exercise~@exc:real-classical-low-rank-isomorphisms);
        $frak("sl")_2 (CC) tilde.eq frak("sp")_2 (CC)$ is covered by 3). See
        #cite(<Knapp2002>, form: "full"), Theorem 6.105 and the remarks after
        it.]],

    [], [a) $frak(h) = frak("sl")_n (RR)$],
    [], [b) $frak(h) = frak("sl")_m (HH)$, $n = 2m$],
    [], [c) $frak(h) = frak("su")_(p, n-p)$ $(p = 0, 1, ..., [n\/2])$],
    [2)], [$frak(g) = frak("so")_n (CC)$, $n = 3 "or" n >= 5$],
    [], [a) $frak(h) = frak("so")_(p, n-p)$ $(p = 0, 1, ..., [n\/2])$],
    [], [b) $frak(h) = frak(u)_m^* (HH)$, $n = 2m != 8$],
    [3)], [$frak(g) = frak("sp")_n (CC)$, $n = 2m >= 2$],
    [], [a) $frak(h) = frak("sp")_n (RR)$, $n = 2m$],
    [], [b) $frak(h) = frak("sp")_(p, m-p)$ $(p = 0, 1, ..., [m\/2])$.],
  )] <th:classical-real-forms>

#problem[Prove this theorem.] <pr:prove-classical-real-forms>

Noncompact real forms of the exceptional simple complex Lie algebras are listed
in Tables~@tab:involutive-automorphisms and @tab:real-simple-lie-algebras.

Theorems~@th:simple-real-algebras-two-types, @th:classical-real-forms and
Problem~@pr:realification-determines-algebra imply the following final result of
classification of real simple Lie algebras.

#theorem[Non-commutative real simple Lie algebras are exhausted up to an
  isomorphism by the real forms $frak(h)$ listed in
  Theorem~@th:classical-real-forms, by the real forms #source(249)of the
  exceptional simple complex Lie algebras and by the Lie algebras $frak(g)^RR$,
  where $frak(g)$ are different non-commutative complex simple Lie
  algebras.] <th:real-simple-algebras-classification>

Notice that Theorem~@th:real-simple-algebras-classification completely solves
the classification problem for an arbitrary semisimple Lie algebra over $RR$
since by Theorem~@th:semisimple-sum-of-simple-ideals any semisimple Lie algebra
uniquely decomposes into the direct sum of non-commutative simple algebras.

#exercises[
  #exercise[Let $G = PSL_2 (CC) times SL_2 (CC)$, where
    $PSL_2 (CC) = SL_2 (CC)\/{E, -E}$, and $H$ be the subgroup of $G$ consisting
    of the pairs $(pi(X), overline(X))$, where $pi: SL_2 (CC) -> PSL_2 (CC)$ is
    the natural projection. Then $H$ is a real form of $G$ which is not of the
    form $G^S$, where $S$ is a real structure in $G$ (and not even an open
    subgroup of a group of the form $G^S$). In particular, $H$ is not an
    algebraic real form.] <exc:real-form-not-fixed-points>

  #exercise[Let $S$ be a real structure on a complex algebraic torus $T$. Then
    there exists an isomorphism $T tilde.eq (CC^*)^n$ such that in appropriate
    coordinates $S$ is expressed in the following form
    $
      S(z_1, ..., z_n) = (overline(z)_1, ..., overline(z)_p,
        overline(z)_(p+q+1), ..., overline(z)_(p+2q), overline(z)_(p+1),
        ..., overline(z)_(p+q), overline(z)_(p+2q+1)^(-1), ...,
        overline(z)_n^(-1)).
    $
    In particular, any real structure $S$ on $T$ is
    algebraic.] <exc:torus-real-structures>

  #exercise[Any real structure on a connected complex reductive algebraic group
    is algebraic.] <exc:reductive-real-structures-algebraic>

  #exercise[A real semisimple Lie group $G$ with a finite number of connected
    components admits a faithful linear representation if and only if $G$ admits
    an embedding as a real form in a complex Lie
    group.] <exc:linear-iff-real-form-embedding>

  #exercise[The groups $SL_2 (RR)$ and $PSL_2 (RR) = SL_2 (RR)\/{E, -E}$ are the
    only (up to an isomorphism) connected Lie groups with the tangent algebra
    $frak("sl")_2 (RR)$ admitting a faithful linear
    representation.] <exc:linear-groups-with-algebra-sl2r>

  #exercise[The center of $tilde(SL)_2 (RR)$ (see
    Example~@exm:sl2r-cover-not-real-form) is infinite and isomorphic to
    $ZZ$.] <exc:sl2r-universal-cover-center>

  #exercise[Let $G = (TT times tilde(SL)_2 (RR))\/chevron.l (t, z) chevron.r$,
    where $t in TT$, be an element of infinite order and $z$ a generator of
    $Z(tilde(SL)_2 (RR))$. Then the commutator group $G'$ is not a Lie subgroup
    of $G$.] <exc:sl2r-cover-commutator-not-lie>

  #exercise[Let $G$ be a Lie group, $frak(h)$ a semisimple subalgebra of its
    tangent algebra $frak(g)$. If $G$ is simply connected or if the simply
    connected Lie group with the tangent algebra $frak(h)$ has a finite center
    then there is a connected Lie subgroup $H$ of $G$ with the tangent algebra
    $frak(h)$.] <exc:semisimple-subalgebra-lie-subgroup>

  Let $frak(g)$ be a real semisimple Lie algebra. As follows from
  Example~@exm:real-form-of-algebra-automorphisms,
  formula~@eq:real-structure-from-real-space determined an algebraic real
  structure on the irreducible algebraic group $Int(frak(g)(CC))$. The
  corresponding algebraic real form
  $ Int(frak(g)(CC))(RR) = Int(frak(g)(CC)) inter Aut frak(g) $
  is called the group of #idx(
    "automorphism of a Lie algebra",
    "quasi-inner",
  )_quasi-inner automorphisms_ of $frak(g)$; denote it $op("Q Int") frak(g)$.
  Clearly, #source(250)$(op("Q Int") frak(g))^circle.small = Int frak(g)$. The
  group $Int frak(g)$ is an algebraic linear group (over $RR$) if and only if
  $Int frak(g) = op("Q Int") frak(g)$.

  #exercise[If $frak(g) = frak("sl")_n (RR)$, $(n >= 2)$ then
    $op("Q Int") frak(g)$ consists of two connected components for even $n$ and
    coincides with $Int frak(g)$ for odd
    $n$.] <exc:quasi-inner-automorphisms-sl-n>

  #exercise[If $frak(g) = frak("so")_(p, q)$, where $p > 0$, $q > 0$, then the
    number of connected components of $op("Q Int") frak(g)$ can be found from
    the following table:

    #table(
      columns: (1fr,) * 5,
      align: center + horizon,
      [$p + q$ \ odd],
      [$p, q$ even, \ $p != q$],
      [$p = q$ \ even],
      [$p, q$ odd, \ $p != q$],
      [$p = q$ \ odd],

      [2], [2], [4], [1], [2],
    )] <exc:quasi-inner-automorphisms-so-pq>

  #exercise[The connected simple Lie group
    $PSL_2 (RR) tilde.eq upright(O)_(1, 2)^0 tilde.eq Int frak("so")_(1, 2)$
    has no real algebraic group structure.] <exc:psl2r-not-real-algebraic>

  #exercise[The linear group $Int(frak("sl")_3 (RR))$ is algebraic (see
    Exercise~@exc:quasi-inner-automorphisms-sl-n). The adjoint representation
    $Ad: SL_3 (RR) -> Int(frak("sl")_3 (RR))$ is a polynomial isomorphism of Lie
    groups but it is not a real algebraic group
    isomorphism.] <exc:adjoint-sl3r-not-algebraic-isomorphism>

  #exercise[The real algebraic groups $SL_3 (RR)$ and $Int(frak("sl")_3 (RR))$
    are not isomorphic. Therefore on the connected simple Lie group $SL_3 (RR)$
    there are at least two non-isomorphic real algebraic group
    structures.] <exc:sl3r-two-algebraic-structures>

  #exercise[Let $frak(g)$ be a semisimple complex Lie algebra. A real form of
    $frak(g) plus.o frak(g)$ corresponding by
    Theorem~@th:real-forms-involutions-bijection to the automorphism
    $theta: (x, y) |-> (y, x)$ $(x, y in frak(g))$ is isomorphic to
    $frak(g)^RR$.] <exc:swap-involution-gives-realification>

  #exercise[There are the following isomorphisms between the classical real Lie
    algebras of different series (see @ss:real-forms-classical-groups):
    $
      frak("so")_3 & tilde.eq frak("su")_2 tilde.eq frak("sp")_1,
      & wide frak("so")_6 & tilde.eq frak("su")_4, \
      frak("so")_(1, 2) & tilde.eq frak("su")_(1, 1)
      tilde.eq frak("sl")_2 (RR) tilde.eq frak("sp")_2 (RR),
      & wide frak("so")_(1, 5) & tilde.eq frak("sl")_2 (HH), \
      frak("so")_4 & tilde.eq frak("su")_2 plus.o frak("su")_2,
      & wide frak("so")_(2, 4) & tilde.eq frak("su")_(2, 2), \
      frak("so")_(1, 3) & tilde.eq frak("sl")_2 (CC)^RR,
      & wide frak("so")_(3, 3) & tilde.eq frak("sl")_4 (RR), \
      frak("so")_(2, 2) & tilde.eq frak("sl")_2 (RR) plus.o frak("sl")_2 (RR),
      & wide frak(u)_2^* (HH)
      & tilde.eq frak("su")_2 plus.o frak("sl")_2 (RR), \
      frak("so")_5 & tilde.eq frak("sp")_2,
      & wide frak(u)_3^* (HH) & tilde.eq frak("su")_(1, 3), \
      frak("so")_(1, 4) & tilde.eq frak("sp")_(1, 1),
      & wide frak(u)_4^* (HH) & tilde.eq frak("so")_(2, 6). \
      frak("so")_(2, 3) & tilde.eq frak("sp")_4 (RR),
    $] <exc:real-classical-low-rank-isomorphisms>

  Let $frak(g)$ be a real Lie algebra, $rho: frak(g) -> frak("gl")(V)$ its
  finite-dimensional real linear representation. Then $rho$ extends to a complex
  representation $rho(CC): frak(g) -> frak("gl")(V(CC))$.

  #exercise[#source(251)If $rho$ is irreducible then $rho(CC)$ is irreducible if
    and only if there is no complex structure on $V$ (i.e. no operator $I$
    satisfying @eq:complex-structure-square) commuting with all $rho(x)$,
    $x in frak(g)$.] <exc:complexified-representation-irreducible>

  #exercise[If $rho$ is irreducible and complex, i.e. $V$ admits a complex
    structure $I$ commuting with $rho$, then
    $rho(CC) tilde.op rho + overline(rho)$ (as representations over $CC$), where
    $overline(rho)$ is the representation $rho$ considered in the space
    $overline(V)$ with the complex structure
    $-I$.] <exc:complex-type-representation-splits>
]

#hints[
  #hint[@pr:isomorphic-real-forms-conjugate][Notice that any isomorphism of real
    forms of a complex Lie algebra extends to an automorphism of this algebra.]

  #hint[@pr:algebraic-and-lie-real-forms][Make use of the identity
    $overline(H) = G$ (in Zariski topology) and the fact that the connected
    components of $G$ coincide with its irreducible components (see
    Theorem~@th:irreducible-complex-group-connected).]

  #hint[@pr:center-of-real-form][If $z in Z(H)$, then $Ad z = E$ in $frak(h)$
    and therefore in $frak(g) = frak(h)(CC)$. Next, apply
    Theorem~@th:homomorphism-determined-by-differential and
    formula~@eq:real-form-meets-all-components.]

  #hint[@pr:real-semisimple-derivations-inner][Make use of Corollary of
    Theorem~@th:outer-automorphisms-dynkin-diagram.]

  #hint[@pr:normal-real-form-construction][Show that there exists a unique
    antilinear automorphism of $hat(frak(g))$ (see @ss:uniqueness-theorems[°]),
    fixing $hat(h)_i$, $hat(e)_i$, $hat(f)_i$. Clearly, this automorphism maps
    $frak(m)$ into itself and therefore induces an antilinear automorphism
    $sigma$ of $frak(g)$ fixing $h_i$, $e_i$, $f_i$. Clearly, $sigma^2 = id$ and
    $frak(h) subset frak(g)^sigma$. Since the complex linear span of $frak(h)$
    coincides with $frak(g)$, we have $frak(h) = frak(g)^sigma$.]

  #hint[@pr:realification-determines-algebra][To prove the second statement make
    use of Theorem~@th:semisimple-sum-of-simple-ideals.]

  #hint[@pr:simple-complex-real-forms-simple][If $frak(a)$ is a non-zero ideal
    of $frak(g)^RR$, then the complex linear span of $frak(a)$ in $frak(g)$
    coincides with $frak(g)$. Therefore the ideal $frak(b) subset frak(g)^RR$
    complementary to $frak(a)$ must belong to the center of $frak(g)$ implying
    $frak(b) = 0$.]

  #hint[@pr:simple-real-complexification-dichotomy][Deduce from the simplicity
    of $frak(g)$ that if $frak(a) != 0$ is a proper ideal of $frak(g)(CC)$, then
    $frak(g)(CC) = frak(a) plus.o overline(frak(a))$. Next, define the
    transformation $I: frak(g) -> frak(g)$ by the formula
    $I x = i y - i overline(y)$ for $x = y + overline(y) in frak(g)$,
    $y in frak(a)$, and prove that $I$ is a complex structure on $frak(g)$.]

  #hint[@pr:compact-group-compact-algebra][Follows from
    Theorem~@th:compact-invariant-inner-product.]

  #hint[@pr:compact-algebra-killing-form-negative][Make use of the fact that in
    an orthonormal basis of a compact Lie algebra $frak(g)$ all operators $ad x$
    $(x in frak(g))$ are expressed by skew-symmetric matrices.]

  #hint[@pr:compact-algebra-reductive-splitting][
    Problem~@pr:center-orthogonal-to-derived implies that
    $frak(g) = frak(z)(frak(g)) plus.o frak(g)'$. With the help of
    Problem~@pr:orthogonal-of-ideal-is-ideal it is easy to deduce that any
    commutative ideal of $frak(g)$ is contained in $frak(z)(frak(g))$. This
    implies that $frak(g)'$ is semisimple (see
    Problem~@pr:semisimple-no-commutative-ideals).]

  #hint[@pr:compact-algebra-has-compact-group][Make use of
    Problem~@pr:real-semisimple-derivations-inner. The compactness of
    $Int frak(g)$ follows from its closedness in $Aut frak(g)$ and the
    compactness of $Aut frak(g)$ (thanks to
    Problem~@pr:compact-algebra-killing-form-negative).]

  #hint[@pr:compactness-criteria-real-form][The implication a) $=>$ b) follows
    from Problem~@pr:compact-group-compact-algebra, the equivalence b) $<=>$ c)
    from Problem~@pr:compact-algebra-killing-form-negative. To prove the
    implication c) $=>$ a) consider the finite-sheeted covering
    $Ad: G -> Ad G = hat(G)$. On $hat(G)$, a real structure
    $hat(S)(Ad g) = sigma(Ad g) sigma^(-1) = Ad S(g)$ is defined such that
    $Ad(G^S) = hat(G)^(hat(S))$. Therefore, the subgroup $Ad(G^S)$ is closed in
    $GL(frak(g))$. On the other hand, by
    Problem~@pr:hermitian-form-automorphism-invariance $Ad(G^S)$ is contained in
    the compact group of all operators unitary with respect to $h_sigma$. Hence
    $Ad(G^S)$ and $G^S$ are compact.]

  #hint[@pr:compact-real-structure-on-generators][#source(252)Set
    $sigma = sigma_0 mu = mu sigma_0$, where $sigma_0$ is the real structure
    determining the normal real form (see
    Problem~@pr:normal-real-form-construction).]

  #hint[@pr:compact-structure-lifts-to-group][By
    Theorem~@th:homomorphism-existence-simply-connected the statement holds if
    $G$ is simply connected. It follows from
    Problem~@pr:torus-finite-subgroups-lattices that $S$ acts as the identity on
    $Z(G)$. Therefore, a real structure with the differential $sigma$ is defined
    on any group of the form $G\/N$, where $N$ is a subgroup of $Z(G)$.]

  #hint[@pr:weyl-group-in-compact-form][It suffices to prove this for the
    generators $r_(alpha_i)$ $(i = 1, ..., l)$. But by
    Problem~@pr:n-alpha-induces-reflection $r_(alpha_i)$ is induced by the
    element $n_(alpha_i) = F_i (mat(0, 1; -1, 0)) in N(T)$. Since
    $mat(0, 1; -1, 0) in SU_2$, then $n_(alpha_i) in G^S$ by
    Problem~@pr:compact-structure-on-sl2-subgroups.]

  #hint[@pr:hermitian-form-positive-definite][By
    Theorem~@th:weyl-group-simply-transitive,
    Problems~@pr:automorphisms-act-on-weights-roots and
    @pr:weyl-group-in-compact-form any root subspace $frak(g)_alpha$ is
    transformed into the subspace $frak(g)_(alpha_i)$ corresponding to a simple
    root $alpha_i$ by an appropriate automorphism $Ad g$, where
    $g in N(T) inter G^S$. Therefore
    Problems~@pr:hermitian-form-positive-simple-roots and
    @pr:hermitian-form-automorphism-invariance imply that $h_sigma$ is positive
    definite on $frak(t)$ and on each subspace $frak(g)_alpha$. Then apply
    Problem~@pr:root-spaces-hermitian-orthogonal.]

  #hint[@pr:compact-complex-structure-commutative][The complex structure $I$
    transforms $frak(g)'$ into itself and induces there a self-adjoint linear
    transformation. If $frak(g)' != 0$ then this contradicts the fact that the
    characteristic roots of $I$ are $plus.minus i$.]

  #hint[@pr:compatible-compact-forms-coincide][Let $sigma$, $tau$ be real
    structures on $frak(g)$ defining its compatible compact real forms and
    $theta = sigma tau$. Problem~@pr:compactness-criteria-real-form implies that
    $(theta x, x) < 0$ for all nonzero $x in frak(g)^sigma$. It follows from
    Problem~@pr:compatible-real-forms-criteria that $theta x = x$
    $(x in frak(g)^sigma)$, whence $theta = id$ and
    $frak(g)^sigma = frak(g)^tau$.]

  #hint[@pr:exp-self-adjoint-to-positive][Let $X in S(bold(E))$ and
    $bold(E)
    = plus.o.big_(1 <= i <= tau) bold(E)_(lambda_i)$
    be the decomposition of $bold(E)$ into the orthogonal sum of eigenspaces
    with respect to $X$. Then $bold(E)_(lambda_i)$ is the eigenspace of $exp X$
    corresponding to the eigenvalue $e^(lambda_i) > 0$. Therefore,
    $exp X in P(bold(E))$. Conversely, if $A in P(bold(E))$ and
    $bold(E)
    = plus.o.big_(1 <= i <= j) tilde(bold(E))_(mu_i)$
    is the corresponding eigenspace decomposition then define
    $log A in S(bold(E))$ setting
    $(log A)|tilde(bold(E))_(mu_i) = (log mu_i) E$. It is easy to verify that
    the map $log: P(bold(E)) -> S(bold(E))$ is inverse to $exp$.]

  #hint[@pr:algebraic-group-real-powers][Let us prove that $p^t in G$ for all
    $t in RR$. Let us express the linear operators in $bold(E)$ by matrices in
    an orthonormal basis. We may assume that $log p$ is a diagonal matrix with
    the real diagonal elements $a_1$, ..., $a_n$. If $F$ is a polynomial
    function on the space of all the matrices vanishing on $G$ and $tilde(F)$
    the restriction of $F$ onto the subspace of diagonal matrices then
    $tilde(F)(e^(k a_1), ..., e^(k a_n)) = 0$ for all $k in ZZ$ since
    $p^k in G$. If $phi(t) = tilde(F)(e^(t a_1), ..., e^(t a_n))$ does not
    vanish identically then it is of the form $phi(t) = sum_i c_i e^(t b_i)$,
    where $c_i != 0$ and $b_1 > b_2 > dots.c$ are real numbers. Clearly, the
    absolute value of $c_1 e^(t b_1)$ for $t = k$ grows as $k -> oo$ faster than
    the absolute value of the sum of other terms. This leads to contradiction.]

  #hint[@pr:compact-structure-commuting-involution][Set
    $tau_1 = q^(1\/4) tau q^(-1\/4)$ (cf.
    Problem~@pr:quarter-power-makes-compatible). The proof of the second
    assertion is similar to that of the corresponding assertion of
    Theorem~@th:compact-forms-conjugacy-compatibility.]

  #hint[@pr:involution-determined-by-fixed-algebra][In one direction the
    statement is obvious, in the other direction it follows from the obtained
    classification (see Table~@tab:involutive-automorphisms).]

  #hint[@pr:prove-classical-involutions][Make use of
    Problem~@pr:involution-determined-by-fixed-algebra.]

  #hint[@pr:prove-classical-real-forms][Make use of
    Theorem~@th:real-forms-involutions-bijection, Example from
    @ss:real-forms-involutive-automorphisms and
    Theorem~@th:classical-algebra-involutions.]
]
