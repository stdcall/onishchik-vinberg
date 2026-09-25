// Chapter 3, § 2. Commutative and Solvable Algebraic Groups. Printed pages
// 110-122; page 110 opens with the end of § 1 and page 122 ends with the
// beginning of § 3.
#import "main-defs.typ": *
#import "statements.typ": *

== Commutative and Solvable Algebraic Groups
<sec:commutative-solvable-algebraic-groups>

In this section, except @ss:jordan-decomposition-linear-operator, we assume that
$char K = 0$.

=== The Jordan Decomposition of a Linear Operator
<ss:jordan-decomposition-linear-operator>
Let $V$ be a finite-dimensional vector space. For any linear operator
$A in upright(L)(V)$ and $lambda in K$ consider the _eigenspace_
$ V_lambda (A) = {v in V: (A - lambda E) v = 0} $
and ambient _root subspace_
$ V^lambda (A) = {v in V: (A - lambda E)^m v = 0 "for some" m} $
The subspaces $V_lambda (A)$ and $V^lambda (A)$ are invariant with respect to
any linear operator commuting with $A$. As it is known,
$ V = plus.o.big_lambda V^lambda (A). $

A linear operator $A in upright(L)(V)$ is called #idx(
  "Operator",
  "semisimple",
)_semisimple_ if it satisfies any of the following equivalent conditions:

1) in some basis $A$ is expressed by a diagonal matrix;

2) $V = plus.o.big_lambda V_lambda (A)$;

3) $V^lambda (A) = V_lambda (A)$ for any $lambda in K$.

#problem[Let $A in upright(L)(V)$ be a semisimple linear operator and
  $U subset V$ a subspace invariant with respect to $A$. Then

  1) $A|_U$ is semisimple;

  2) there exists an invariant subspace complementary to
  $U$.] <pr:semisimple-operator-invariant-subspace>

#problem[Any family of commuting semisimple linear operators can be
  simultaneously reduced to the diagonal
  form.] <pr:commuting-semisimple-diagonalizable>

#source(126)In particular, this implies that the _sum and the product of
commuting semisimple operators are semisimple operators._

A linear operator $A in upright(L)(V)$ is called #idx(
  "Operator",
  "nilpotent",
)_nilpotent_ (resp. #idx("Operator", "unipotent")_unipotent_) if $A^m = 0$
(resp. $(A - E)^m = 0$) for some $m$. This is equivalent to the fact that
$A^n = 0$ (resp. $(A - E)^n = 0$), where $n = dim V$.

Clearly, the _sum of commuting nilpotent operators is a nilpotent operator. The
product of commuting unipotent operators is a unipotent operator._

If $A$ is both semisimple and nilpotent (resp. unipotent) then $A = 0$ (resp.
$A = E$).

Let $A in upright(L)(V)$ be an arbitrary linear operator. The semisimple
operator $A_s$ defined by the condition
$ V_lambda (A_s) = V^lambda (A) wide "for any" lambda in K $
i.e. acting on each root subspace $V^lambda (A)$ of $A$ as multiplication by
$lambda$, is called the _semisimple part_ of $A$. The definition of root
subspaces implies that $A_n = A - A_s$ is nilpotent; it is called the _nilpotent
part_ of $A$. If $A$ is invertible then $A_u = A A_s^(-1) = E + A_n A_s^(-1)$ is
unipotent; it is called the _unipotent part_ of $A$. The operators $A_s$, $A_n$
and $A_u$ commute with each other and with any operator commuting with $A$.

The decomposition $A = A_s + A_n$ (resp. $A = A_s A_u$) is called the _additive_
(resp. _multiplicative_) #idx("Jordan decomposition")_Jordan decomposition_ of
$A$. The following problem gives its axiomatic characterization.

#problem[The additive (resp. multiplicative) Jordan decomposition of a linear
  operator $A$ is its unique decomposition into the sum (resp. product) of
  commuting semisimple and nilpotent (resp. unipotent) linear
  operators.] <pr:jordan-decomposition-uniqueness>

=== Commutative Unipotent Algebraic Linear Groups
<ss:commutative-unipotent-linear-groups>
Let $X$ be a nilpotent operator. For any formal power series
$ f(x) = sum_(k >= 0) a_k x^k wide (a_k in K) $
set
$ f(X) = sum_(k >= 0) a_k X^k $
(this sum is finite, actually). Clearly,

1) $f(X) - a_0 E$ is nilpotent;

2) $f(A X A^(-1)) = A f(X) A^(-1)$ for any invertible linear operator $A$.

In particular, set
$
  exp X = sum_(k >= 0) 1/(k!) X^k, \
  log(E + X) = sum_(k >= 1) (-1)^(k-1)/k X^k.
$
#source(127)Since any unipotent operator is of the form $E + X$, where $X$ is a
nilpotent operator, the (nilpotent) operator $log A$ is defined for any
unipotent $A$.

Let $upright(L)_n (V)$ (resp. $upright(L)_u (V)$) be the set of all nilpotent
(resp. unipotent) operators in $V$. Clearly, $upright(L)_n (V)$ and
$upright(L)_u (V)$ are algebraic varieties in $upright(L)(V)$.

#problem[The maps
  $
    exp: upright(L)_n (V) -> upright(L)_u (V), wide
    log: upright(L)_u (V) -> upright(L)_n (V)
  $
  are morphisms inverse to each other.] <pr:exp-log-nilpotent-unipotent>

#problem[1) If nilpotent operators $X$, $Y$ commute then
  $ exp(X + Y) = exp X dot exp Y. $

  2) If unipotent operators $A$, $B$ commute then
  $ log A B = log A + log B $] <pr:exp-log-commuting-operators>

#theorem[The minimal algebraic linear group $G(A)$ containing a unipotent linear
  operator $A$ consists of all (unipotent) linear operators of the form
  $ A^t = exp(t log A) wide (t in K) $
  and
  $ K -> G(A), wide t |-> A^t, $
  is an algebraic group isomorphism provided
  $A != E$.] <th:unipotent-closure-additive-group>

#problem[Prove this theorem.] <pr:prove-unipotent-closure-additive-group>

#corollary[Any invertible linear operator $A$ of finite order, i.e. such that
  $A^m = E$ for some positive integer $m$, is
  semisimple.] <cor:finite-order-operator-semisimple>

#proof[We have $A^m = A_s^m A_u^m = E$ implying $A_u^m = E$, but due to
  Theorem~@th:unipotent-closure-additive-group it is only possible if
  $A_u = E$.]

An algebraic linear group is called #idx(
  "algebraic group",
  "unipotent",
)_unipotent_ if all its operators are unipotent.

#corollary[Any unipotent algebraic linear group $G$ is
  irreducible.] <cor:unipotent-group-irreducible>

#proof[For any $A in G$ the subgroup $G(A) subset G$ is irreducible by
  Theorem~@th:unipotent-closure-additive-group. Therefore
  $A in G(A) subset G^0$.]

Problems~@pr:exp-log-nilpotent-unipotent and @pr:exp-log-commuting-operators and
Theorem~@th:unipotent-closure-additive-group imply the following description of
commutative unipotent groups.

#theorem[Let $G subset GL(V)$ be a commutative unipotent algebraic linear group.
  Then $frak(g) = log G subset upright(L)(V)$ is a subspace consisting of
  commuting nilpotent linear #source(128)operators and $exp: frak(g) -> G$ is an
  isomorphism of the vector group $frak(g)$ onto $G$. Conversely, if
  $frak(g) subset upright(L)(V)$ is a subspace consisting of commuting nilpotent
  linear operators then $G = exp frak(g) subset GL(V)$ is a commutative
  unipotent algebraic linear group.] <th:commutative-unipotent-vector-group>

A similar description can be obtained for arbitrary unipotent groups the
difference being that $exp$ is an isomorphism of not algebraic groups but only
of algebraic varieties. In @ss:unipotent-algebraic-linear-groups we will give
such a description for $K = CC$ and see that $frak(g) = log G$ is nothing but
the tangent algebra of $G$.

=== Algebraic Tori and Quasitori <ss:algebraic-tori-quasitori>
An algebraic group isomorphic to the direct product of $n$ copies of $K^*$ is
called the #idx("Torus", "algebraic")_$n$-dimensional algebraic torus._ The
adjective "algebraic" is applied here to distinguish algebraic tori from the
tori in the sense of Lie group theory. In the context of the algebraic group
theory over an algebraically closed field we will usually skip this adjective.

Together with the tori it is useful to consider algebraic groups which are
direct products of a torus and a commutative finite group; we will call them
#idx("Quasi-torus")_(algebraic) quasitori._ Note that irreducible quasitori are
just tori.

#problem[In any quasitorus the elements of finite order form a dense
  subset.] <pr:quasitorus-finite-order-dense>

#theorem[Under any linear representation of a quasitorus its elements are mapped
  into semisimple operators which are simultaneously
  diagonalizable.] <th:quasitorus-diagonalizable>

#proof[If we confine ourselves to the elements of finite order then the
  statement of the theorem follows from
  Corollary~@cor:finite-order-operator-semisimple of
  Theorem~@th:unipotent-closure-additive-group and
  Problem~@pr:commuting-semisimple-diagonalizable\; but
  Problem~@pr:quasitorus-finite-order-dense implies that the basis which
  diagonalizes operators corresponding to elements of finite order also
  diagonalizes all the operators of the representation.]

This theorem means that any linear representation of a quasitorus is a sum of
one-dimensional representations. Now describe one-dimensional representations,
or _characters_, of tori.

#theorem[Any character $chi$ of the torus $(K^*)^n$ is of the form
  $
    chi(x_1, ..., x_n) = x_1^(k_1) ... x_n^(k_n), quad "where" quad
    k_1, ..., k_n in ZZ.
  $] <th:torus-characters-monomials>

#problem[Prove this theorem.] <pr:prove-torus-characters-monomials>

Let $T$ be an $n$-dimensional algebraic torus.

#problem[The characters of $T$ form a basis of $K[T]$ (as of vector space over
  $K$).] <pr:torus-characters-basis-coordinate-ring>

Let $cal(X)(T)$ be the character group of $T$.
Theorem~@th:torus-characters-monomials implies that this is a free commutative
group of rank $n$. A duality between $T$ and $cal(X)(T)$ holds, see
Exercise~@exc:torus-character-double-dual. One of the manifestations of this
duality is that a representation of $T$ in the form of the direct product of $n$
copies of $K^*$ is equivalent to the choice of a basis of $cal(X)(T)$. More
precisely the following statement holds.

#problem[#source(129)Let $(epsilon_1, ..., epsilon_n)$ be a basis of
  $cal(X)(T)$. Then the map
  $
    epsilon: T -> (K^*)^n, wide
    x |-> (epsilon_1 (x), ..., epsilon_n (x)),
  $
  is an isomorphism. Any isomorphism $epsilon: T arrow.r.tilde (K^*)^n$ is
  obtained in this way.] <pr:character-basis-torus-isomorphism>

Another manifestation of the mentioned duality is the following description of
the algebraic subgroups of $T$.

#theorem[There is a one-to-one correspondence between algebraic subgroups of an
  $n$-dimensional torus $T$ and subgroups of $cal(X)(T)$, which to a subgroup
  $Gamma subset cal(X)(T)$ assigns the subgroup
  $ T^Gamma = {x in T: chi(x) = 1 "for all" chi in Gamma} subset T. $
  Let $c_1, ..., c_m$ ($m <= n$) be nonzero invariant factors of $Gamma$ (as of
  a subgroup of the free commutative group $cal(X)(T)$). There exists an
  isomorphism $epsilon: T arrow.r.tilde (K^*)^n$ such that
  $
    epsilon(T^Gamma) = {(x_1, ..., x_n) in (K^*)^n:
      x_1^(c_1) = dots.c = x_m^(c_m) = 1}
  $ <eq:torus-subgroup-normal-form>] <th:algebraic-subgroups-of-torus>

#proof[Let $S subset T$ be an algebraic subgroup. By Chevalley's theorem
  (Theorem~@th:chevalley-line-stabilizer) there exists a linear representation
  of $T$ whose kernel is $S$. Let $chi_1, ..., chi_q$ be the weights of this
  representation. Then
  $ S = {x in T: chi_1 (x) = dots.c = chi_q (x) = 1} = T^Gamma, $
  where $Gamma subset cal(X)(T)$ is a subgroup generated by $chi_1, ..., chi_q$.

  Further, let $Gamma subset cal(X)(T)$ be any subgroup and $c_1, ..., c_m$
  ($m <= n$) its nonzero invariant factors. There exists a basis
  $(epsilon_1, ..., epsilon_n)$ of $cal(X)(T)$ such that
  $Gamma = chevron.l c_1 epsilon_1, ..., c_m epsilon_m chevron.r$. We have
  $
    T^Gamma = {x in T: epsilon_1 (x)^(c_1) = dots.c = epsilon_m (x)^(c_m)
      = 1}
  $
  and if $epsilon: T arrow.r.tilde (K^*)^n$ is an isomorphism corresponding to
  the basis $(epsilon_1, ..., epsilon_n)$ then the subgroup $epsilon(T^Gamma)$
  is singled out in $(K^*)^n$ exactly by @eq:torus-subgroup-normal-form.

  To complete the proof of the theorem it remains to show that $Gamma$ consists
  of all characters whose value on $T^Gamma$ is 1. Let
  $chi = k_1 epsilon_1 + dots.c + k_n epsilon_n$ be such a character.
  Considering the values of $chi$ on the elements $x in T^Gamma$ all the
  coordinates $epsilon_1 (x), ..., epsilon_n (x)$ of which except one are equal
  to 1 we easily deduce from the above description that
  $k_(m+1) = dots.c = k_n = 0$, while $k_1, ..., k_m$ are divisible by
  $c_1, ..., c_m$ respectively. But this means that $chi in Gamma$.]

#corollary[Any algebraic subgroup of a torus is a quasitorus.]

Notice two more corollaries of Theorem~@th:algebraic-subgroups-of-torus.

#problem[The character group of a torus is generated by weights of any faithful
  linear representation.] <pr:faithful-weights-generate-characters>

#problem[#source(130)Any torus has elements which are not contained in any of
  its proper algebraic subgroups.] <pr:torus-generating-element>

=== The Jordan Decomposition in an Algebraic Group
<ss:jordan-decomposition-algebraic-group>
In this subsection we will prove the following theorems:

#theorem[An algebraic linear group $G subset GL(V)$ contains together with any
  linear operator $A$ the operators $A_s$ and
  $A_u$.] <th:jordan-parts-in-algebraic-group>

#theorem[Let $R: G -> GL(U)$ be a linear representation of an algebraic group
  $G$. If $A in G$ is semisimple (resp. unipotent) then so is
  $R(A)$.] <th:semisimple-unipotent-preserved>

In general terms the reason why this is true might be explained as follows:

1) the semisimple elements of an algebraic linear group are linked to its
algebraic subgroups isomorphic to $K^*$ or to its finite subgroups and the
unipotent elements are linked to the subgroups isomorphic to $K$;

2) the groups $K^*$ and $K$ do not admit nontrivial homomorphisms into each
other and thanks to this they do not "intermix".

// The proof of Theorem 6 is interleaved with Problems 13-15: running text
// closed by the helper's square.
_Proof of Theorem_~@th:jordan-parts-in-algebraic-group. For any linear operator
$A in GL(V)$ denote by $G(A)$ the smallest algebraic linear group containing
$A$, i.e. the closure of the cyclic linear group generated by $A$.

If $A$ is unipotent then by Theorem~@th:unipotent-closure-additive-group $G(A)$
consists of unipotent operators and is isomorphic to $K$ except for the trivial
case $A = E$.

#problem[If $A$ is semisimple then $G(A)$ consists of semisimple operators and
  is a quasitorus.] <pr:semisimple-closure-quasitorus>

In general, $G(A)$ is contained in the smallest algebraic linear group
$G(A_s, A_u)$ containing $A_s$ and $A_u$. The continuity considerations imply
that $G(A_s, A_u)$ is commutative. Since $G(A_s)$ consists of semisimple
elements and $G(A_u)$ of unipotent ones, we have $G(A_s) inter G(A_u) = {E}$. It
follows,
$
  G(A) subset G(A_s, A_u) = G(A_s) times G(A_u).
$ <eq:closure-jordan-parts-product>

#problem[A quasitorus does not admit nontrivial homomorphisms into
  $K$.] <pr:quasitorus-to-additive-trivial>

#problem[$G(A) = G(A_s) times G(A_u)$.] <pr:closure-splits-jordan-parts>

This immediately implies Theorem~@th:jordan-parts-in-algebraic-group.#qed-mark

#proof(head: [_Proof of Theorem_~@th:semisimple-unipotent-preserved.])[First,
  note that for any $A in G$ we have $G(A) subset G$ and $R(G(A)) = G(R(A))$.

  If $A in G$ is semisimple then $G(A)$ is a quasitorus. Applying
  Theorem~@th:quasitorus-diagonalizable to $R|_(G(A))$ we see that $R(A)$ is
  semisimple.

  Now let $A in G$ be unipotent. Set $B = R(A)$. Suppose that $B != E$,
  otherwise we have nothing to prove. Then $G(A) tilde.eq K$ and
  $G(B) = R(G(A)) tilde.eq K$. By Problem~@pr:closure-splits-jordan-parts we
  have
  $ G(B) = G(B_s) times G(B_u), $
  #source(131)but since $G(B)$ does not contain elements of finite order
  different from the unit, $G(B) = G(B_u)$, i.e. $B$ is unipotent.]

An element $g$ of an algebraic group $G$ is #idx(
  "Element",
  "semisimple (of an algebraic group)",
)_semisimple_ (#idx("Element", "unipotent")_unipotent_) if for some faithful
(and therefore for any) linear representation $R$ of $G$ the operator $R(g)$ is
semisimple (unipotent).

Theorem~@th:jordan-parts-in-algebraic-group implies that any element $g$ of an
algebraic group $G$ presents as the product of commuting semisimple and
unipotent elements $g_s, g_u in G$. By
Problem~@pr:jordan-decomposition-uniqueness this decomposition is unique. The
elements $g_s$ and $g_u$ are called _semisimple_ and _unipotent parts_ of $g$
respectively and $g = g_s g_u$ the #idx(
  "Jordan decomposition in an algebraic group",
)_Jordan decomposition_ of $g$.

Theorem~@th:semisimple-unipotent-preserved implies that any algebraic group
homomorphism transforms the semisimple elements into semisimple ones and the
unipotent elements into unipotent ones.

#problem[Let $f: G -> H$ be an algebraic group homomorphism. For any semisimple
  (unipotent) element $h in f(G)$ its pre-image $f^(-1) (h)$ contains a
  semisimple (unipotent) element.] <pr:semisimple-unipotent-preimage>

Notice that the group $K^*$ and, more generally, any quasitorus consists only of
semisimple elements (Theorem~@th:quasitorus-diagonalizable). Conversely, the
group $K$ and, therefore, any vector group consists of unipotent elements only.

An algebraic group all elements of which are unipotent is called #idx(
  "algebraic group",
  "unipotent",
)_unipotent._ By Corollary~@cor:unipotent-group-irreducible of
Theorem~@th:unipotent-closure-additive-group any unipotent algebraic group is
irreducible.

=== The Structure of Commutative Algebraic Groups
<ss:structure-commutative-algebraic-groups>

#problem[Any commutative algebraic group consisting of semisimple elements is a
  quasitorus.] <pr:commutative-semisimple-is-quasitorus>

Since the converse is true, this problem gives a convenient characterization of
quasitori (and therefore tori).

#theorem[Any commutative algebraic group is a direct product of a quasitorus and
  a vector group.] <th:commutative-algebraic-group-structure>

#problem[Prove this theorem.] <pr:prove-commutative-algebraic-structure>

#corollary[Any irreducible commutative algebraic group is the direct product of
  a torus and a vector group.]

=== Borel's Theorem <ss:borel-theorem>
An algebraic group is called #idx("algebraic group", "solvable")_solvable_ if it
is solvable as an abstract group. An example of a solvable algebraic group is
the group $B_n (K)$ of invertible (upper) triangular $n times n$ matrices over
$K$ (see Example~@exm:triangular-group-solvable[] of
@ss:solvable-lie-groups[°]\; the arguments given there work for any field).

For solvable algebraic groups an analogue of Lie's theorem (see @ss:lie-theorem)
holds. It can be proved in almost exactly the same way as Lie's theorem but we
will deduce it from a more general theorem whose proof is in a sense even
simpler.

The statement of Lie's theorem may be formulated as a fixed point theorem for an
action of the considered group in the projective space associated with the space
of the representation. Therefore Lie's theorem for algebraic groups is a
consequence of the following theorem.

#theorem(title: [#idx("Borel’s theorem")Borel's theorem])[#source(132)Any action
  of an irreducible solvable algebraic group $G$ on a projective algebraic
  variety $M$ possesses a fixed point.] <th:borel-fixed-point>

#proof[We will prove the theorem by induction in $dim G$. Suppose $dim G > 0$
  and assume that for groups whose dimension is less than $dim G$ the theorem
  holds. Let $G'$ be the commutator subgroup of $G$. By the inductive hypothesis
  $G'$ possesses fixed points on $M$. Let $N$ be the set of all these points. It
  is easy to see that $N$ is a closed subvariety. Since $G'$ is normal in $G$,
  then $N$ is $G$-invariant.

  By the corollary of Theorem~@th:stabilizer-orbit-algebraic there exists a
  closed orbit of the $G$-action on $N$. Let $O$ be such an orbit. We have
  $O = G\/G_y$ where $G_y$ is the stabilizer of some point $y in O$. Since
  $G_y supset G'$ and $G\/G'$ is commutative, $G_y$ is a normal subgroup and
  $G\/G_y$ is an irreducible algebraic group and therefore an irreducible affine
  variety. But $O$ is a projective variety. Therefore $O$ consists of one point
  (see @ss:quasiprojective-varieties) which is the fixed point for the
  $G$-action on $M$.]

#corollary(title: [Lie's theorem for algebraic groups])[Let $R: G -> GL(V)$ be a
  linear representation of an irreducible solvable algebraic group $G$. There
  exists a one-dimensional subspace $U subset V$ invariant with respect to
  $R(G)$.] <cor:lie-theorem-algebraic-groups>

This in its turn implies

#corollary[Under the conditions of Corollary~@cor:lie-theorem-algebraic-groups
  there exists a basis of $V$ in which all the operators $R(g)$, $g in G$, are
  expressed by (upper) triangular
  matrices.] <cor:solvable-group-triangular-form>

=== The Splitting of a Solvable Algebraic Group
<ss:splitting-solvable-algebraic-group>
Let $G$ be an irreducible solvable algebraic group.

#problem[The unipotent elements of $G$ form an algebraic normal subgroup $U$ in
  $G$ containing $G'$.] <pr:unipotent-elements-normal-subgroup>

This subgroup is called the #idx("Radical", "unipotent")_unipotent radical_ of
$G$.

#problem[$G\/U$ is a torus.] <pr:quotient-by-unipotent-radical-torus>

Actually a more precise statement holds.

#theorem[Any irreducible solvable algebraic group splits into the semidirect
  product of its unipotent radical and a
  torus.] <th:solvable-semidirect-unipotent-torus>

#proof[Under the above notation consider an element of the torus $G\/U$ which is
  not contained in any of its proper algebraic subgroups (see
  Problem~@pr:torus-generating-element). The pre-image of this element with
  respect to the canonical homomorphism $p: G -> G\/U$ contains a semisimple
  element (Problem~@pr:semisimple-unipotent-preimage), say $g$. Denote by $T$
  the minimal algebraic subgroup of $G$ containing $g$. It is a quasitorus
  (Problem~@pr:semisimple-closure-quasitorus). Therefore $T inter U = {e}$. On
  the other hand, from the choice of $g$ it is clear that $p(T) = G\/U$.
  Therefore
  $ G = U times.r T $ <eq:solvable-group-splitting>
  and $T tilde.eq G\/U$ is a torus.]

#source(133)_Example._ For $G = B_n (K)$ the unipotent radical $U$ is the
subgroup of unitriangular matrices and for $T$ we may take the group of
invertible diagonal matrices.

_Remarks_ about decomposition~@eq:solvable-group-splitting. Clearly, any
algebraic subgroup of $G$ containing $T$ is the semidirect product of a
unipotent subgroup contained in $U$, and $T$. In particular, this implies that
$T$ is a maximal torus in $G$, and any algebraic subgroup containing it is
irreducible.

#problem[The normalizer of $T$ in $G$ coincides with the centralizer of
  $T$.] <pr:solvable-torus-normalizer-centralizer>

=== Semisimple Elements of a Solvable Algebraic Group
<ss:semisimple-elements-solvable-group>

#theorem[Let $G$ be an irreducible solvable algebraic group and $T$ a torus
  complementary to its unipotent radical $U$. Then any semisimple element of $G$
  is conjugate to some element of $T$.] <th:solvable-semisimple-conjugate-torus>

#problem[Under the conditions of the theorem if $U != {e}$ then there exists a
  unipotent algebraic normal subgroup $U_1$ of $G$ of codimension 1 in
  $U$.] <pr:unipotent-normal-codimension-one>

// The book's head is the subject of the first sentence.
#proof(head: none)[_Proof of Theorem_~@th:solvable-semisimple-conjugate-torus
  will be carried out by induction in $dim U$. If $dim U = 0$ then $G = T$ and
  we have nothing to prove. Let $dim U = 1$ and $g = u t$ ($u in U, t in T$) a
  semisimple element. Consider two cases: when $u$ and $t$ commute and when they
  do not. In the first case the decomposition $g = t u$ is the Jordan
  decomposition of $g$; hence $u = e$ and $g in T$. In the other case the
  conjugacy class of $g$ coincides with $U g$. Indeed, since $G\/U$ is
  commutative, the conjugacy class $C(h)$ of any $h in U g$ is contained in
  $U g$. It is an irreducible subvariety as an orbit of $G$ and does not consist
  of one element $h$ since $u h u^(-1) != h$. Therefore, $C(h)$ is $U g$
  without, perhaps, a finite number of points; but since this takes place for
  any $h in U g$, then $C(h) = C(g) = U g$. In particular, $C(g) in.rev t$, as
  required.

  Now, let $dim U > 1$ and let the theorem hold for the groups whose unipotent
  radicals are of dimensions less than $dim U$. Let $U_1$ be an algebraic normal
  subgroup of $G$ satisfying conditions of
  Problem~@pr:unipotent-normal-codimension-one and $p: G -> G\/U_1$ the
  canonical homomorphism. Clearly, $G\/U_1$ is an irreducible solvable algebraic
  group with the one-dimensional unipotent radical $p(U) = U\/U_1$ and the
  complementary torus $p(T) tilde.eq T$. For any semisimple $g in G$ the element
  $p(g)$ is, by the above, conjugate in $G\/U_1$ to an element of $p(T)$. This
  means that in $G$ itself that element $g$ is conjugate to a (semisimple)
  element $g_1$ of $G_1 = U_1 T$. However, by the inductive hypothesis $g_1$ is
  conjugate in $G_1$ to some $t in T$. Therefore $g$ is conjugate in $G$ to
  $t$.]

#problem(corollary: true)[All maximal tori in a solvable algebraic group are
  conjugate to each other.] <pr:solvable-maximal-tori-conjugate>

Now we may state that _any maximal torus_ can be taken for $T$ in
@eq:solvable-group-splitting.

=== Borel Subgroups <ss:borel-subgroups>
While studying arbitrary (not necessarily solvable) algebraic groups it is
convenient to consider their maximal irreducible solvable algebraic subgroups.
Such subgroups are called #idx("Borel subgroup")_Borel subgroups_.

#source(134)For instance, by Lie's theorem any irreducible solvable algebraic
subgroup of $GL_n (K)$ is conjugate to a subgroup contained in $B_n (K)$.
Therefore $B_n (K)$ is a Borel subgroup of $GL_n (K)$ and any other Borel
subgroup is conjugate to this one.

#theorem[All Borel subgroups of an algebraic group $G$ are conjugate to each
  other. The quotient space of a complex algebraic group modulo a Borel subgroup
  is a projective algebraic variety.] <th:borel-conjugate-quotient-projective>

#proof[We may assume that $G$ is an algebraic linear group acting in a vector
  space $V$. The group $G$ naturally acts on the flag variety $upright(F)(V)$,
  see @ss:flag-varieties. Let $O$ be a closed orbit of this action. Since $O$ is
  a projective variety, then by Borel's theorem any Borel subgroup of $G$ has a
  fixed point in $O$, i.e. is contained in the stabilizer of a flag $F in O$. On
  the other hand, the stabilizer of any flag is solvable since in a basis of $V$
  compatible with this flag all the elements of this group are expressed by
  triangular matrices. Therefore the Borel subgroups of $G$ are irreducible
  components of the stabilizers of the points of $O$ and therefore are conjugate
  to each other.

  Let us prove the second statement of the theorem. Let $G$ be a complex
  algebraic group and $B$ its Borel subgroup. The quotient space $G\/B$ is a
  finite covering of the projective algebraic variety $O$, encountered in the
  above arguments, and therefore is compact and is also a projective algebraic
  variety.]

Actually, the second statement of the theorem holds over an arbitrary
algebraically closed field [@bib:Humphreys1987]. Moreover, if $G$ is irreducible
then the stabilizers of points of $O$ encountered in the proof are exactly the
Borel subgroups of $G$. For the complex algebraic groups this latter assertion
will be proved in §~@sec:root-systems.

#problem(corollary: true)[All the maximal tori of an algebraic group $G$ are
  conjugate to each other.] <pr:algebraic-maximal-tori-conjugate>

#exercises[
  #exercise[Let $A = E + X$ be a unipotent operator. The linear operator $A^t$
    can be defined, apart from the method proposed in
    subsection~@ss:commutative-unipotent-linear-groups, directly with the help
    of the binomial series:
    $
      A^t = sum_(k >= 0) (t(t - 1) ... (t - k + 1))/(k!) X^k
    $] <exc:unipotent-power-binomial-series>

  #exercise[Let $g$ be an element of an algebraic group $G$. If $g^m$ is
    semisimple for some positive integer $m$ then $g$ is
    semisimple.] <exc:semisimple-if-power-semisimple>

  #exercise[If an irreducible component of the unit of an algebraic group $G$ is
    a torus then all elements of $G$ are
    semisimple.] <exc:torus-identity-component-semisimple>

  #exercise[For each element $x$ of a torus $T$ denote by $delta_x$ the
    character of $cal(X)(T)$ defined by the formula $delta_x (chi) = chi(x)$.
    The map
    $ delta: T -> cal(X)(cal(X)(T)), wide x |-> delta_x, $
    is a group isomorphism.] <exc:torus-character-double-dual>

  #exercise[#source(135)There is a one-to-one correspondence between the tori
    homomorphisms $T_1 -> T_2$ and the group homomorphisms
    $cal(X)(T_2) -> cal(X)(T_1)$ which to any homomorphism $f: T_1 -> T_2$
    assigns the homomorphism $f^*: cal(X)(T_2) -> cal(X)(T_1)$ defined by the
    formula
    $
      (f^* chi)(x) = chi(f(x)) wide (chi in cal(X)(T_2), x in T_1).
    $] <exc:torus-homomorphisms-character-duality>

  #exercise[Generalize Exercises~@exc:torus-character-double-dual and
    @exc:torus-homomorphisms-character-duality and the first statement of
    Theorem~@th:algebraic-subgroups-of-torus to
    quasitori.] <exc:quasitori-character-duality>

  #exercise[The intersection of the kernels of all characters of an algebraic
    group is a normal algebraic subgroup and the corresponding quotient group is
    a quasitorus.] <exc:character-kernels-quotient-quasitorus>

  #exercise[Let a nondegenerate linear operator $A in GL(V)$ be expressed in a
    basis of $V$ by a diagonal matrix $diag(a_1, ..., a_n)$. Then $G(A)$
    consists of all invertible linear operators $B$ which in the same basis are
    expressed by the matrices of the form $diag(b_1, ..., b_n)$, where
    $b_1, ..., b_n$ satisfy all the relations of the form
    $x_1^(k_1) ... x_n^(k_n) = 1$ ($k_1, ..., k_n in ZZ$) which are satisfied by
    $a_1, ..., a_n$.] <exc:diagonal-closure-monomial-relations>

  #exercise[Any nontrivial irreducible solvable algebraic group splits into the
    semidirect product of an algebraic normal subgroup of codimension 1 and an
    algebraic subgroup isomorphic to $K^*$ or
    $K$.] <exc:solvable-codimension-one-splitting>

  #exercise[Any nontrivial irreducible algebraic group has a nontrivial Borel
    subgroup. (Hint: analyze the proof of
    Theorem~@th:borel-conjugate-quotient-projective.)]
  <exc:nontrivial-borel-subgroup-exists>

  #exercise[Any nontrivial irreducible algebraic group contains an algebraic
    subgroup isomorphic to $K^*$ or $K$. In particular, any one-dimensional
    irreducible algebraic group is isomorphic to $K^*$ or
    $K$.] <exc:one-dimensional-algebraic-groups>

  #exercise[The closure of any solvable subgroup of an algebraic group is a
    solvable subgroup.] <exc:solvable-subgroup-closure-solvable>

  #exercise[Any subgroup of an irreducible solvable algebraic group consisting
    of semisimple elements (in particular, any finite subgroup) is
    commutative.] <exc:semisimple-subgroup-commutative>

  #exercise[Give an example of a solvable finite linear group which cannot be
    expressed in any basis by triangular
    matrices.] <exc:finite-solvable-not-triangular>

  #exercise[Any commutative linear group is expressed in some basis by
    triangular matrices.] <exc:commutative-linear-triangular>

  #exercise[Give an example of a commutative finite subgroup in $PGL_2 (K)$, the
    quotient of $GL_2 (K)$ modulo its center, which is not contained in any
    Borel subgroup.] <exc:pgl2-commutative-outside-borel>

  #exercise[A commutative algebraic subgroup of an algebraic group is contained
    in some Borel subgroup if and only if so is the subgroup of its semisimple
    elements.] <exc:commutative-in-borel-criterion>
]

#hints[
  #hint[@pr:semisimple-operator-invariant-subspace][To prove the first statement
    make use of condition 3) in the definition of a semisimple operator; to
    prove the second one make use of condition 2).]

  #hint[@pr:commuting-semisimple-diagonalizable][By induction: consider the
    restrictions of operators of the given family onto eigensubspaces of any
    nonscalar of these operators.]

  #hint[@pr:jordan-decomposition-uniqueness][Let $A = B + C$, where $B$ is
    semisimple, $C$ nilpotent and $B C = C B$. For any #source(
      136,
    )$lambda in K$ the subspace $V_lambda (B)$ is invariant with respect to $C$
    and, since $C$ is nilpotent, we have
    $ V_lambda (B) subset V^lambda (A). $
    Since $V = plus.o.big_lambda V_lambda (B)$, then
    $V_lambda (B) = V^lambda (A)$ for any $lambda in K$, hence $B = A_s$. The
    multiplicative decomposition is treated similarly.]

  #hint[@pr:exp-log-nilpotent-unipotent][Consider the formal series
    $e(x) = exp x - 1$ and $l(x) = log(1 + x)$. Since the constant terms of
    these series vanish, we may well substitute one of them into another one. To
    solve the problem it suffices to show that
    $ l(e(x)) = x, wide e(l(x)) = x $ <eq:exp-log-series-inverse>
    For this make use of the fact that $e(x)$ and $l(x)$ have rational
    coefficients and define functions of a complex variable for which
    @eq:exp-log-series-inverse holds in the functional sense for sufficiently
    small $abs(x)$.]

  #hint[@pr:exp-log-commuting-operators][Similarly to the proof of
    Problem~@pr:exp-log-nilpotent-unipotent make use of formal series in two
    indeterminates.]

  #hint[@pr:prove-unipotent-closure-additive-group][The map $t |-> A^t$ is a
    homomorphism of $K$ onto an algebraic linear group $H$ containing $A$. If
    $A != E$ then the kernel of this homomorphism is a finite subgroup of $K$
    and therefore is the trivial group (recall that $char K = 0$!). Thus,
    $H tilde.equiv K$ and similar arguments show that $G(A) = H$.]

  #hint[@pr:prove-torus-characters-monomials][It suffices to prove that any
    character $chi$ of $K^*$ is of the form $chi(x) = x^k$, where $k in ZZ$. The
    simplest way to do this is to make use of the fact that a character $chi$ of
    $K^*$ is a polynomial in $x$ and $x^(-1)$ such that $chi(x) chi(x^(-1)) = 1$
    and $chi(1) = 1$.]

  #hint[@pr:torus-generating-element][These are the elements on which no
    nontrivial character takes the value 1. For instance, any element whose
    coordinates are different primes possesses this property.]

  #hint[@pr:semisimple-closure-quasitorus][Consider a basis in which $A$ is
    expressed by a diagonal matrix and make use of Corollary of
    Theorem~@th:algebraic-subgroups-of-torus.]

  #hint[@pr:quasitorus-to-additive-trivial][Make use of
    Problem~@pr:quasitorus-finite-order-dense.]

  #hint[@pr:closure-splits-jordan-parts][It suffices to prove that
    $G(A) supset G(A_u)$. Assume the contrary. Then $G(A) inter G(A_u) = {E}$,
    i.e. $G(A)$ has an isomorphic projection onto $G(A_s)$. Therefore $G(A)$ is
    a quasitorus. But then by Problem~@pr:quasitorus-to-additive-trivial it has
    the trivial projection onto $G(A_u)$ which is impossible.]

  #hint[@pr:semisimple-unipotent-preimage][Take any pre-image and consider its
    Jordan decomposition.]

  #hint[@pr:commutative-semisimple-is-quasitorus][Follows from
    Problem~@pr:commuting-semisimple-diagonalizable and Corollary of
    Theorem~@th:algebraic-subgroups-of-torus.]

  #hint[@pr:prove-commutative-algebraic-structure][Let $G$ be a commutative
    algebraic group. The Jordan decomposition implies that $G$ splits, as an
    abstract group, into the direct product of the subgroups $G_s$ consisting of
    semisimple elements, and $G_u$ consisting of unipotent elements. Let us
    prove that these subgroups are algebraic which implies the statement of the
    theorem with the help of Problem~@pr:commutative-semisimple-is-quasitorus
    and Theorem~@th:commutative-unipotent-vector-group.

    Assume that $G$ is an algebraic linear group acting in a vector space $V$.
    Then $G_u = G inter upright(L)_u (V)$ is an algebraic subgroup. Next, take a
    basis in which all the operators of $G_s$ are expressed by diagonal
    matrices. Equating to zero the nondiagonal elements of the matrix of
    $A in G$ in this basis we get a system of algebraic equations distinguishing
    $G_s$.]

  #hint[@pr:unipotent-elements-normal-subgroup][#source(137)Apply
    Corollary~@cor:solvable-group-triangular-form of
    Theorem~@th:borel-fixed-point to a faithful linear representation of $G$. In
    a basis in which the operators of the representation are expressed by
    triangular matrices the unipotent elements of $G$ are distinguished by the
    fact that all diagonal elements of the corresponding matrices are equal
    to 1.]

  #hint[@pr:quotient-by-unipotent-radical-torus][By
    Problem~@pr:commutative-semisimple-is-quasitorus it suffices to prove that
    $G\/U$ is commutative, consists of semisimple elements and is irreducible.
    The first follows from Problem~@pr:unipotent-elements-normal-subgroup, the
    second is proved with the help of Problem~@pr:semisimple-unipotent-preimage,
    the third is obvious.]

  #hint[@pr:unipotent-normal-codimension-one][Passing to $G\/U'$ we may reduce
    the proof to the case of a commutative $U$. In this case by
    Theorem~@th:commutative-unipotent-vector-group $U$ is a vector group and the
    action of the torus $T$ on it is linear. By
    Theorem~@th:quasitorus-diagonalizable $U$ splits into the direct product of
    one-dimensional subgroups normalized by $T$. For $U_1$ we may take the
    product of all these subgroups except any one of them.]

  #hint[@pr:solvable-maximal-tori-conjugate][Make use of
    Problem~@pr:torus-generating-element.]

  #hint[@pr:algebraic-maximal-tori-conjugate][Follows from
    Theorem~@th:borel-conjugate-quotient-projective and Corollary of
    Theorem~@th:solvable-semisimple-conjugate-torus.]
]
