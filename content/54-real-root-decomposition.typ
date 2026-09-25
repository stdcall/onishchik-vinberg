// Chapter 5, § 4. Real Root Decomposition. Printed pages 268-281; § 4
// begins below the § 3 hints on page 268, whose file carries its
// source-page anchor. Chapter 6 begins on page 282.
#import "main-defs.typ": *
#import "statements.typ": *
#import "diagrams/dynkin.typ": bond, dynkin, gap, pair, v

== Real Root Decomposition <sec:real-root-decomposition>

In this section we consider the root decomposition of a real semisimple Lie
algebra with respect to a maximal subalgebra expressed in the adjoint
representation by diagonal matrices. The study of the corresponding root system
enables us to assign to a real semisimple Lie algebra the so-called Satake
diagram which can be considered as a generalization of the Dynkin diagram.
Satake diagrams can be used in the classification of real semisimple Lie
algebras which we carried out in §~@sec:real-forms-complex-semisimple by another
method (cf. [@bib:Araki1962]). Another application of a real root decomposition
is Iwasawa's theorem generalizing the classical Gram-Schmidt orthogonalization
method.

=== Maximal $RR$-Diagonalizable Subalgebras
<ss:maximal-r-diagonalizable-subalgebras>
Let $frak(g)$ be a real Lie algebra. A subalgebra $frak(a) subset frak(g)$ is
called #idx("subalgebra", "ℝ-diagonalizable")_$RR$-diagonalizable_ if there is a
basis in $frak(g)$ with respect to which all operators $ad x$ $(x in frak(a))$
are expressed by diagonal matrices. In this case we have a decomposition
#source(284)
$ frak(g) = frak(g)_0 plus.o plus.o.big_(lambda in Delta) frak(g)_lambda, $
<eq:real-root-decomposition>
where $Delta$ is a finite set of non-zero elements of $frak(a)^*$ and
$frak(g)_lambda quad (lambda in Delta union {0})$ denotes the non-zero subspace
${x in frak(g): [a, x] = lambda(a) x quad (a in frak(a))}$. The set $Delta$ is
called the #idx("root system")_root system of $frak(g)$ with respect to
$frak(a)$_ and the decomposition~@eq:real-root-decomposition is called the #idx(
  "root decomposition",
)_root decomposition._ As in the complex case, for any
$lambda, mu in Delta union {0}$ we have
$
  [frak(g)_lambda, frak(g)_mu] cases(
    subset frak(g)_(lambda + mu) & quad "if" lambda + mu in Delta union {0}\,,
    = 0 & quad "otherwise"
  )
$
In particular, $frak(g)_0$ is a subalgebra of $frak(g)$ (the centralizer of
$frak(a)$).

Now suppose that $frak(g)$ is semisimple. Clearly, any $RR$-diagonalizable
subalgebra $frak(a) subset frak(g)$ is commutative. If $x in frak(a)$ and
$alpha(x) = 0$ for all $alpha in Delta$ then $x in frak(z)(frak(g))$ and
therefore $x = 0$. This makes it obvious that $Delta$ generates the space
$frak(a)^*$.

#problem[Any $RR$-diagonalizable subalgebra $frak(a)$ of a real semisimple Lie
  algebra $frak(g)$ is contained in some Cartan subspace $frak(p)$. Conversely,
  if $frak(p)$ is a Cartan subspace of $frak(g)$ then any subalgebra of
  $frak(g)$ contained in $frak(p)$ is
  $RR$-diagonalizable.] <pr:r-diagonalizable-in-cartan-subspace>

Let $frak(a)$ be a maximal diagonalizable subalgebra of a semisimple Lie algebra
$frak(g)$. By Problem~@pr:r-diagonalizable-in-cartan-subspace there exists a
Cartan decomposition
$ frak(g) = frak(k) plus.o frak(p), $ <eq:cartan-decomposition-adapted>
such that $frak(a) subset frak(p)$ and $frak(a)$ is maximal among the
subalgebras of $frak(g)$ contained in $frak(p)$.

#problem[Any subalgebra $frak(a)$ of $frak(g)$ contained in $frak(p)$ and
  maximal among such subalgebras is a maximal $RR$-diagonalizable subalgebra of
  $frak(g)$. The centralizer $frak(g)_0$ of such a subalgebra is of the form
  $ frak(g)_0 = frak(m) plus.o frak(a), $ <eq:centralizer-m-plus-a>
  where $frak(m) = frak(g)_0 inter frak(k)$.] <pr:maximal-in-p-r-diagonalizable>

Let $Sigma subset frak(a)^*$ be the root system associated to a maximal
diagonalizable subalgebra $frak(a)$. Notice that $Sigma != emptyset$ if and only
if $frak(a) != 0$. Any $alpha in Sigma$ determines the hyperplane
$P_alpha = Ker alpha$ in $frak(a)$. The elements of the non-empty open set
$ frak(a)_"reg" = frak(a) without union.big_(alpha in Sigma) P_alpha $
are called #idx("Element", "regular")_regular._

#problem[The centralizer of any regular element of $frak(a)$ coincides with
  $frak(g)_0$.] <pr:centralizer-real-regular-element>

#theorem[Let $K$ be the maximal compact subgroup of $Int frak(g)$ corresponding
  to the subalgebra $frak(k)$ of the
  decomposition~@eq:cartan-decomposition-adapted. Any two maximal subalgebras of
  $frak(p)$ are transformed into each other by an element of $K$. Any two
  maximal $RR$-diagonalizable subalgebras of $frak(g)$ are
  conjugate.] <th:conjugacy-maximal-r-diagonalizable>

#source(285)The second statement of
Theorem~@th:conjugacy-maximal-r-diagonalizable reduces to the first one with the
help of Problem~@pr:r-diagonalizable-in-cartan-subspace and
Theorem~@th:cartan-decomposition-existence-conjugacy. It suffices to prove the
first statement.

#problem[Deduce the first statement of
  Theorem~@th:conjugacy-maximal-r-diagonalizable from the following
  lemma.] <pr:k-conjugacy-in-p-reduction>

#lemma[Under the assumptions of Theorem~@th:conjugacy-maximal-r-diagonalizable,
  for any $x, y in frak(p)$ there exists $k in K$ such that
  $[k(x), y] = 0$.] <lem:k-conjugate-commuting-in-p>

#proof[On $K$, consider the smooth function $phi(k) = (x, k(y))$. Since $K$ is
  compact, $phi$ possesses a minimum point, $k_0$. Then for any $z in frak(k)$
  the function
  $ tilde(phi)(t) = phi(k_0 exp(t ad z)) $
  assumes its minimum at $t = 0$. Therefore
  $
    0 & = tilde(phi)'(0) = (x, k_0 ([z, y])) = (k_0^(-1) (x), [z, y]) \
      & = -([k_0^(-1) (x), y], z),
  $
  implying $[k_0^(-1) (x), y] = 0$.]

The dimension of a maximal $RR$-diagonalizable subalgebra $frak(a)$ of a real
semisimple Lie algebra $frak(g)$ (independent by
Theorem~@th:conjugacy-maximal-r-diagonalizable of the choice of $frak(a)$) is
called the #idx("rank", "real")_real rank_ of $frak(g)$ and is denoted by
$rk_RR frak(g)$.

#problem[$rk_RR frak(g) = 0$ if and only if $frak(g)$ is
  compact.] <pr:real-rank-zero-iff-compact>

#problem[If a real semisimple Lie algebra $frak(g)$ splits into the direct sum
  of ideals $frak(g) = frak(g)_1 plus.o frak(g)_2$ then the maximal
  $RR$-diagonalizable subalgebras $frak(a)$ of $frak(g)$ are of the form
  $frak(a) = frak(a)_1 plus.o frak(a)_2$, where $frak(a)_i$ $(i = 1, 2)$ is an
  arbitrary maximal $RR$-diagonalizable subalgebra of $frak(g)_i$. In
  particular,
  $ rk_RR frak(g) = rk_RR frak(g)_1 + rk_RR frak(g)_2. $
  Under the natural identification of $frak(a)^*$ with
  $frak(a)_1^* plus.o frak(a)_2^*$ the root system $Sigma$ of $frak(g)$ with
  respect to $frak(a)$ is identified with $Sigma_1 union Sigma_2$, where
  $Sigma_i subset frak(a)_i^*$ is the root system of $frak(g)_i$ with respect to
  $frak(a)_i$ $(i = 1, 2)$.] <pr:real-rank-of-direct-sum>

=== Real Root Systems <ss:real-root-systems>
Let $frak(g)$ be a real semisimple Lie algebra with a fixed
decomposition~@eq:cartan-decomposition-adapted, $frak(a) subset frak(g)$ a
maximal $RR$-diagonalizable subalgebra of $frak(g)$, $Sigma$ the corresponding
root system. Problem~@pr:real-rank-zero-iff-compact implies that
$Sigma != emptyset$ if and only if $frak(g)$ is non-compact. By
Problem~@pr:cartan-compact-form-correspondence $frak(a)$ is a Euclidean space
with respect to the Cartan scalar product in $frak(g)$. Let us naturally
transport the scalar product from $frak(a)$ to $frak(a)^*$. Our next aim is to
prove the following theorem.

#theorem[The root system $Sigma subset frak(a)^*$ of a semisimple Lie algebra
  $frak(g)$ with respect to a maximal $RR$-diagonalizable subalgebra $frak(a)$
  is a root system in the sense of §~@sec:root-systems (not necessarily
  reduced).] <th:real-roots-form-root-system>

#source(286)Proof is close to the proof of the similar fact for complex Lie
algebras (see @ss:three-dimensional-subalgebras[°]). For any $alpha in Sigma$
denote by $h_alpha$ the element of $frak(a)$ uniquely determined by the
following property:
$
  gamma(h_alpha) = chevron.l gamma|alpha chevron.r wide "for any" wide
  gamma in frak(a)^*.
$

#problem[Let $theta$ be an automorphism of $frak(g)$ transforming $frak(a)$ into
  itself. Then $attach(theta, tl: t)(Sigma) = Sigma$,
  $theta(frak(g)_alpha) = frak(g)_(attach(theta, tl: t)^(-1) (alpha))$
  $(alpha in Sigma union {0})$,
  $theta(h_alpha) = h_(attach(theta, tl: t)^(-1) (alpha))$
  $(alpha in Sigma)$.] <pr:automorphism-permutes-real-roots>

Apply Problem~@pr:automorphism-permutes-real-roots to the involutive
automorphism $theta$ of $frak(g)$ defined by the formula
$ theta(x + y) = x - y wide (x in frak(k), y in frak(p)). $
Since $theta|frak(a) = -id$, we see that $-Sigma = Sigma$ and
$theta(frak(g)_alpha) = frak(g)_(-alpha)$ $(alpha in Sigma union {0})$.

#problem[For any $x in frak(g)_alpha$, where $alpha in Sigma$, we have
  $ [x, theta(x)] = (alpha, alpha)\/2 (x, theta(x)) h_alpha $
  and $(x, theta(x)) < 0$ if $x != 0$.] <pr:bracket-x-with-theta-x>

Fix $alpha in Sigma$ and a non-zero $x in frak(g)_alpha$.
Problem~@pr:bracket-x-with-theta-x easily implies the existence of a $c in RR$,
$c != 0$, such that $x_alpha = c x in frak(g)_alpha$ and
$y_alpha = -c theta(x) in frak(g)_(-alpha)$ satisfy
$[x_alpha, y_alpha] = h_alpha$.

As follows from Problem~@pr:maximal-in-p-r-diagonalizable, the maximal
commutative subalgebras $frak(h)$ of $frak(g)$ containing $frak(a)$ are of the
form $frak(h) = frak(h)^+ plus.o frak(a)$, where $frak(h)^+$ is any maximal
commutative subalgebra of $frak(m)$. Now pass to the complexification
$frak(g)(CC)$ of $frak(g)$ and consider its commutative subalgebra
$ frak(t) = frak(h)(CC) = frak(h)^+ (CC) plus.o frak(a)(CC). $
Let us extend $theta$ to $frak(g)(CC)$ by linearity. Denote by $sigma$ the
complex conjugation in $frak(g)(CC)$ with respect to $frak(g)$.

#problem[The subalgebra $frak(t)$ is maximal diagonalizable in $frak(g)(CC)$ and
  invariant with respect to $sigma$ and $theta$. The subalgebras
  $frak(t)^- = frak(a)(CC)$ and $frak(t)^+ = frak(h)^+ (CC)$ are algebraic and
  diagonalizable in $frak(g)(CC)$ and $frak(t)^+$ is a maximal diagonalizable
  subalgebra of the reductive algebraic subalgebra $frak(m)(CC)$. We have
  $ frak(t)(RR) = (i frak(h)^+) plus.o frak(a). $ <eq:split-cartan-real-part>
  Under the natural identification $frak(a)^* = frak(t)^- (RR)^*$ the root
  system $Sigma$ is identified with the root system $Delta(frak(t)^-)$ of
  $frak(g)(CC)$ with respect to
  $frak(t)^-$.] <pr:maximally-split-cartan-subalgebra>

Consider the homomorphism $phi_alpha: frak(s l)_2 (CC) -> frak(g)(CC)$ defined
by the formulas
$
  phi_alpha (bold(e)) = x_alpha, wide
  phi_alpha (bold(f)) = y_alpha, wide
  phi_alpha (bold(h)) = h_alpha.
$

#problem[$phi_alpha$ is an injective Lie algebra homomorphism over $CC$ such
  that $phi_alpha (frak(s l)_2 (RR)) subset frak(g)$,
  $phi_alpha (frak(s o)_2) subset frak(k)$.] <pr:real-root-sl2-embedding>

#source(287)Denote by $F_alpha$ a Lie group homomorphism
$SL_2 (CC) -> Int(frak(g)(CC))$ such that $d F_alpha = (ad) phi_alpha$.
Problem~@pr:real-root-sl2-embedding implies that
$F_alpha (SL_2 (RR)) subset Int frak(g)$ ($Int frak(g)$ is naturally embedded
into $Int frak(g)(CC)$, see Example~@exm:real-form-of-algebra-automorphisms[] of
@ss:real-structures-and-forms[°]). If $K$ is the maximal compact subgroup of
$Int frak(g)$ corresponding to $frak(k)$ then $F_alpha (SO_2) subset K$. In
particular, $n_alpha = F_alpha (mat(0, 1; -1, 0)) in K$.

#problem[The automorphism $n_alpha$ transforms $frak(a)$ into itself and induces
  in $frak(a)$ the orthogonal reflection $r_alpha$ with respect to
  $P_alpha$.] <pr:real-reflection-realized-in-k>

#proof(head: [_Proof of Theorem_~@th:real-roots-form-root-system.])[Let
  $alpha in Sigma$. Denote also by $r_alpha$ the orthogonal reflection in
  $frak(a)^*$ with respect to the hyperplane
  $L_alpha = {gamma in frak(a)^*: (alpha, gamma) = 0}$ (this reflection
  coincides with $attach(r, tl: t, br: alpha)$).
  Problems~@pr:real-reflection-realized-in-k and
  @pr:automorphism-permutes-real-roots imply that $r_alpha (Sigma) = Sigma$ (cf.
  Theorem~@th:weights-invariant-under-reflections). Further,
  $h_alpha in frak(t)^- (ZZ)$ implying
  $chevron.l beta|alpha chevron.r = beta(h_alpha) in ZZ$ for all $beta in Sigma$
  (cf. Problem~@pr:coroot-in-integral-lattice).]

Now consider the relation between $Sigma = Delta(frak(t)^-)$ and the root system
$Delta(frak(t)) = Delta$ of the Lie algebra $frak(g)(CC)$ with respect to
$frak(t)$. Clearly, the restriction map
$rho: frak(t)(RR)^* -> frak(t)^- (RR)^* = frak(a)^*$ transforms $Delta$ into
$Sigma union {0}$. Set
$
  Delta_0 = {alpha in Delta: rho(alpha) = 0}, wide
  Delta_1 = Delta without Delta_0.
$

#problem[The map $rho: Delta_(frak(g)(CC)) union {0} -> Sigma union {0}$ is
  surjective. We have
  $
    frak(m)(CC) = frak(t)^+ plus.o plus.o.big_(alpha in Delta_0)
    frak(g)(CC)_alpha, wide
    frak(g)_lambda (CC) = plus.o.big_(rho(alpha) = lambda) frak(g)(CC)_alpha
    wide (lambda in Sigma).
  $
  In particular, $Delta_0$ is the root system of the semisimple Lie algebra
  $frak(m)(CC)'$ with respect to
  $frak(t) inter frak(m)(CC)'$.] <pr:restriction-of-roots-surjective>

Since $theta(frak(t)) = frak(t)$, Problem~@pr:automorphisms-act-on-weights-roots
implies that $attach(theta, tl: t)(Delta) = Delta$.

#problem[$Ker rho = {gamma in frak(t)^*: attach(theta, tl: t)(gamma) =
    gamma}$. In particular,
  $Delta_0 = {alpha in Delta: attach(theta, tl: t)(alpha) = alpha}$.]
<pr:restriction-kernel-theta-fixed>

Set
$
  attach(sigma, tl: t)(gamma)(x) = overline(gamma(sigma(x))) wide
  (gamma in frak(t)^*, x in frak(t)).
$
Then $attach(sigma, tl: t)(gamma) in frak(t)^*$. Therefore an antilinear
transformation $attach(sigma, tl: t): frak(t)^* -> frak(t)^*$ is defined.

#problem[The transformations $sigma$ and $attach(sigma, tl: t)$ send
  $frak(t)(RR)$ and $frak(t)(RR)^*$ into themselves and coincide on these
  subspaces with $-theta$ and $-(attach(theta, tl: t))$ respectively. We have
  $sigma(frak(g)(CC)_alpha) = frak(g)(CC)_(attach(sigma, tl: t)(alpha)) =
  frak(g)(CC)_(-(attach(theta, tl: t)(alpha)))$ for all
  $alpha in Delta$.] <pr:conjugation-equals-minus-theta>

=== Satake Diagram <ss:satake-diagram>
We retain the notation of @ss:real-root-systems. In $frak(t)(RR)$, choose a
basis $v_1, ..., v_l$ such that $v_1, ..., v_r$ is a basis of $frak(a)$ and
consider the lexicographic orderings with respect to these bases in
$frak(t)(RR)^*$ and $frak(a)^*$ (see @ss:weyl-chambers-and-simple-roots[°]).
Then $rho(lambda) > 0$ implies $lambda > 0$ for $lambda in frak(t)(RR)^*$.
Denote by $Delta^+, Sigma^+$ (resp. $Delta^-, Sigma^-$) the sets of positive
(negative) roots with respect to these orderings. Set
$Delta_i^plus.minus = Delta_i inter Delta^plus.minus$ $(i = 0, 1)$.

#problem[$rho(Delta_1^plus.minus) = Sigma^plus.minus$,
  $attach(theta, tl: t)(Delta_1^plus.minus) = Delta_1^minus.plus$,
  $attach(sigma, tl: t)(Delta_1^plus.minus) = Delta_1^plus.minus$. Let
  $Pi subset Delta^+$ and $Theta subset Sigma^+$ be bases. Set
  $Pi_i = Delta_i inter Pi$
  $(i = 0, 1)$.] <pr:restriction-preserves-positivity>

#problem[#source(288)$Pi_0$ is a base of $Delta_0$ and
  $rho(Pi_1) supset Theta$.] <pr:restriction-of-simple-roots>

Actually, as we will show, $rho(Pi_1) = Theta$.

Let us prove the following important statement.

#lemma[There exists an involutive transformation $omega: Pi_1 -> Pi_1$ such that
  for any $alpha in Pi_1$ we have
  $
    attach(theta, tl: t)(alpha) = -omega(alpha) - sum_(gamma in Pi_0)
    c_(alpha gamma) gamma,
  $
  where $c_(alpha gamma)$ are non-negative integers.] <lem:satake-involution>

#problem[Let $C$ be a square matrix with non-negative integer entries such that
  $C^2 = E$. Then $C$ is the matrix corresponding to an involutive permutation
  of elements of the basis.] <pr:nonnegative-involutive-matrix>

#problem[Prove Lemma~@lem:satake-involution.] <pr:prove-satake-involution>

#problem[For $alpha, beta in Pi_1$ we have $rho(alpha) = rho(beta)$ if and only
  if $alpha = beta$ or $alpha = omega(beta)$. The system $rho(Pi_1)$ is linearly
  independent and therefore coincides with
  $Theta$.] <pr:restricted-simple-roots-form-base>

Lemma~@lem:satake-involution enables us to assign to any real semisimple Lie
algebra $frak(g)$ the #idx("Satake diagram")_Satake diagram_ obtained from the
Dynkin diagram of the complex Lie algebra $frak(g)(CC)$ as follows: the vertices
corresponding to the roots from $Pi_0$ are blackened and the pairs of different
roots from $Pi_1$ transformed into each other by an involution $omega$ are
joined by arrows.

#problem[$rk frak(g)(CC) = rk_RR frak(g) + abs(Pi_0) + s$, where $s$ is the
  number of arrows on the Satake diagram.] <pr:rank-from-satake-diagram>

#problem[Let $frak(g)_1$, $frak(g)_2$ be real semisimple Lie algebras. Then the
  Satake diagram of $frak(g)_1 plus.o frak(g)_2$ is the disjoint union of the
  Satake diagrams of $frak(g)_1$ and
  $frak(g)_2$.] <pr:satake-diagram-of-direct-sum>

#problem[A real semisimple Lie algebra is simple if and only if its Satake
  diagram is connected.] <pr:simple-iff-satake-connected>

#example[The Satake diagram of a semisimple compact Lie algebra $frak(g)$ is
  obtained from the Dynkin diagram of $frak(g)(CC)$ by blackening all vertices.
  Any semisimple Lie algebra over $RR$, all vertices of whose Satake diagram are
  black, is compact.] <exm:satake-diagram-compact>

#example[Let $frak(g)$ be a semisimple complex Lie algebra. Then the Satake
  diagram of $frak(g)^RR$ is obtained from the Dynkin diagram of $frak(g)$ by
  doubling and joining the corresponding vertices of the two diagrams by arrows.
  For instance, the Satake diagram of $frak(s l)_(l+1) (CC)^RR$ contains $2 l$
  vertices and is of the form
  $
    #dynkin(
      (
        a1: v(0, 1),
        a2: v(1, 1),
        a3: v(3, 1),
        a4: v(4, 1),
        b1: v(0, 0),
        b2: v(1, 0),
        b3: v(3, 0),
        b4: v(4, 0),
      ),
      (
        bond("a1", "a2", 1),
        gap("a2", "a3"),
        bond("a3", "a4", 1),
        bond("b1", "b2", 1),
        gap("b2", "b3"),
        bond("b3", "b4", 1),
        pair("a1", "b1"),
        pair("a2", "b2"),
        pair("a3", "b3"),
        pair("a4", "b4"),
      ),
    )
  $
  #source(289)In fact, consider a compact real form $frak(u) subset frak(g)$. If
  $frak(h)^+$ is a maximal commutative subalgebra of $frak(u)$ then
  $frak(h) = frak(h)^+ (CC)$ is a maximal diagonalizable subalgebra of $frak(g)$
  and $frak(a) = I frak(h)^+$ is a maximal $RR$-diagonalizable subalgebra of
  $frak(g)^RR$. Furthermore, $frak(g)^RR (CC)$ is identified with
  $frak(g) plus.o frak(g)$ and the maximal diagonalizable subalgebra
  $frak(t) = frak(h)(CC)$ of this algebra with $frak(h) plus.o frak(h)$.
  Moreover, $sigma(x, y) = (overline(y), overline(x))$ $(x, y in frak(g))$,
  where $z |-> overline(z)$ $(z in frak(g))$ is the complex conjugation with
  respect to $frak(u)$ (see Problem~@pr:realification-determines-algebra). The
  root system $Delta$ of $frak(g)^RR (CC)$ with respect to $frak(t)$ is of the
  form $Delta = Delta_frak(g) union attach(sigma, tl: t)(Delta_frak(g))$, where
  $Delta_frak(g)$ is the root system of $frak(g)$ with respect to $frak(h)$.
  Similarly, $Pi = Pi_frak(g) union attach(sigma, tl: t)(Pi_frak(g))$, where
  $Pi_frak(g) subset Delta_frak(g)$, $Pi subset Delta$ are bases, and
  $omega = attach(sigma, tl: t)$.] <exm:satake-diagram-complex-as-real>

As is clear from Problem~@pr:simple-iff-satake-connected,
Examples~@exm:satake-diagram-compact and @exm:satake-diagram-complex-as-real, to
list the Satake diagrams of semisimple Lie algebras $frak(g)$ over $RR$ we may
confine ourselves to the case when $frak(g)$ is a non-compact real form of a
simple Lie algebra $frak(g)(CC)$. The Satake diagrams of all such Lie algebras
$frak(g)$ are listed in Table~@tab:real-simple-lie-algebras, which also contains
the Dynkin diagrams of the corresponding root systems $Sigma$, the types of
these systems and dimensions of root subspaces $m_lambda = dim frak(g)_lambda$
$(lambda in Sigma)$. This Table quite easily implies

#theorem[Two semisimple Lie algebras over $RR$ are isomorphic if and only if so
  are (in the natural sense) their Satake
  diagrams.] <th:satake-diagram-determines-algebra>

=== Split Semisimple Lie Algebras <ss:split-semisimple-algebras>
A real semisimple Lie algebra is called #idx("Lie algebra", "split")_split_ if
any of its maximal $RR$-diagonalizable subalgebras is a maximal commutative
subalgebra.

#problem[The following conditions are equivalent: $frak(g)$ is split;
  $frak(a)(CC)$ is a maximal diagonalizable subalgebra of $frak(g)(CC)$ for any
  maximal $RR$-diagonalizable subalgebra $frak(a)$ of $frak(g)$;
  $rk_RR frak(g) = rk frak(g)(CC)$; the Satake diagram of $frak(g)$ has neither
  black vertices nor arrows.] <pr:split-equivalent-conditions>

If $frak(g)$ is split then under the notation of @ss:real-root-systems we have
$frak(m) = 0$, $Delta = Sigma$, $frak(g)(CC)_alpha = frak(g)_alpha (CC)$ for all
$alpha in Delta$. Therefore, $dim frak(g)_alpha = 1$ for all $alpha in Delta$.

#problem[Any ideal of a split semisimple Lie algebra is split. The direct sum of
  two split Lie algebras is split.] <pr:split-ideals-and-sums>

#theorem[Any semisimple Lie algebra $frak(g)$ over $CC$ has a unique up to an
  isomorphism split real form $frak(s)$ which is simple if and only if so is
  $frak(g)$.] <th:unique-split-real-form>

#problem[Let $frak(g)$ be a semisimple complex Lie algebra. The normal real form
  of $frak(g)$ associated with an arbitrary canonical system of generators (see
  Problem~@pr:normal-real-form-construction) is split. Conversely, any split
  real form of $frak(g)$ is normal with respect to a canonical system of
  generators.] <pr:normal-real-form-is-split>

The first statement of Theorem~@th:unique-split-real-form follows from
Problem~@pr:normal-real-form-is-split and
Theorem~@th:cartan-matrix-determines-algebra. If $frak(s)$ is simple then by
Theorem~@th:simple-real-algebras-two-types so is $frak(g)$ since a complex Lie
algebra considered as a real one is not split (see
Example~@exm:satake-diagram-complex-as-real[] of @ss:satake-diagram).

_Example._ Simple split Lie algebras over $RR$ are $frak(s l)_n (RR)$
$(n >= 2)$, $frak(s o)_(k, k+1)$ $(k >= 1)$, $frak(s o)_(k, k)$ $(k >= 3)$,
$frak(s p)_n (RR)$ $(n >= 2)$, #real-form("EI"), #real-form("EV"), #real-form(
  "EVIII",
), #real-form("FI"), #real-form("G"). This is clear: look at the values of the
real rank listed in Table~@tab:real-simple-lie-algebras.

=== Iwasawa Decomposition <ss:iwasawa-decomposition>
#source(290)Let again $frak(g) = frak(k) plus.o frak(p)$ be a Cartan
decomposition of a real semisimple Lie algebra, $frak(a) subset frak(g)$ a
maximal $RR$-diagonalizable subalgebra, $Sigma$ the root system with respect to
$frak(a)$. In $Sigma$, choose a system of simple roots $Theta$ and denote by
$Sigma^+ subset Sigma$ the corresponding subsystem of positive roots. Set
$ frak(n) = plus.o.big_(lambda in Sigma^+) frak(g)_lambda. $

#problem[The subspace $frak(n)$ is a unipotent algebraic subalgebra of
  $frak(g)$. We have $[frak(a), frak(n)] subset frak(n)$ so that
  $frak(d) = frak(a) plus.o frak(n)$ is a solvable algebraic subalgebra of
  $frak(g)$.] <pr:positive-root-spaces-unipotent>

#theorem[The following decompositions into direct sums of subalgebras take
  place:
  $frak(g) = frak(k) plus.o frak(a) plus.o frak(n) = frak(k) plus.o frak(d)$.]
<th:iwasawa-decomposition-algebra>

#problem[Prove this theorem.] <pr:prove-iwasawa-algebra>

We want to construct decompositions of a connected semisimple Lie group into
products of its Lie subgroups corresponding to the decompositions of
Theorem~@th:iwasawa-decomposition-algebra. Let $G$ be a connected semisimple Lie
group with the tangent algebra $frak(g)$. As is shown in
§~@sec:cartan-decomposition, there exists a connected Lie subgroup $K subset G$
with the tangent algebra $frak(k)$. If $G$ has a finite center then $K$ is a
maximal compact subgroup of $G$.

#problem[In $G$, there exist simply connected Lie subgroups $A$, $N$, $D$ with
  the tangent algebras $frak(a)$, $frak(n)$, $frak(d)$ respectively and
  $D = A times.l N$.] <pr:iwasawa-subgroups-simply-connected>

#problem[In $frak(g)$, there exists a basis by means of which all elements
  $ad x$ $(x in frak(d))$ and $Ad g$ $(g in D)$ are expressed by upper
  triangular matrices (for $Ad g$, $g in D$, with positive diagonal entries) and
  $D inter K = {e}$.] <pr:iwasawa-group-d-triangular>

#problem[Prove the following theorem:] <pr:prove-iwasawa-group>

#theorem[Let $G$ be a connected semisimple Lie group and $K$, $A$, $N$, $D$ its
  connected Lie subgroups defined above. Then the maps
  $ K times A times N -> G, wide (k, a, n) |-> k a n $
  and
  $ K times D -> G, wide (k, d) |-> k d $
  are diffeomorphisms. In particular,
  $G = K A N = K D$.] <th:iwasawa-decomposition-group>

The decompositions of $frak(g)$ and $G$ described in
Theorems~@th:iwasawa-decomposition-algebra and @th:iwasawa-decomposition-group
are called the #idx("Iwasawa decomposition")_Iwasawa decompositions._

Now we will characterize the subalgebra $frak(d) subset frak(g)$ and the
subgroup $D subset G$ without incorporating the root decomposition.

Let $frak(g)$ be a real Lie algebra. A subalgebra $frak(c) subset frak(g)$ is
called #idx("subalgebra", "triangular")_triangular_ if in a basis of $frak(g)$
all operators $ad x$ $(x in frak(c))$ are expressed by upper triangular
matrices. Let $G$ be a Lie group with the tangent algebra $frak(g)$. A subgroup
$C subset G$ is called #idx(
  "subgroup",
  "triangular",
)_triangular_ #source(291)if there is a basis in $frak(g)$ with respect to which
all operators $Ad g$ $(g in C)$ are expressed by upper triangular matrices.

#problem[A connected virtual Lie subgroup of $G$ is triangular if and only if
  its tangent subalgebra of $frak(g)$ is triangular. A maximal connected
  triangular subgroup is a Lie subgroup of $G$; its tangent algebra is a maximal
  triangular subalgebra of $frak(g)$. Any maximal triangular subalgebra of
  $frak(g)$ is tangent to a maximal connected triangular subgroup of
  $G$.] <pr:triangular-subgroups-and-subalgebras>

#problem[Let $G$ be a connected semisimple Lie group, $frak(g)$ its tangent
  algebra. The subgroup $D subset G$ and the subalgebra $frak(d) subset frak(g)$
  defined in Problems~@pr:positive-root-spaces-unipotent and
  @pr:iwasawa-subgroups-simply-connected are a maximal connected triangular
  subgroup and a maximal triangular subalgebra,
  respectively.] <pr:iwasawa-d-maximal-triangular>

_Example._ Let $G = SL_n (RR)$, $frak(g) = frak(s l)_n (RR)$. Under an
appropriate choice of a base in $Sigma = Delta_(frak(s l)_n (CC))$ the
subalgebra $frak(d)$ defined in Problem~@pr:positive-root-spaces-unipotent is
the subalgebra of all upper triangular traceless matrices, $D$ is the subgroup
of all upper triangular matrices with determinant 1 and positive diagonal
entries. The group $K$ coincides with $SO_n$.
Theorem~@th:iwasawa-decomposition-group easily follows in this case from the
classical theorem on the reducing of a positive definite quadratic form to the
normal form with the help of a triangular change of basis.

Concluding this section we prove the following theorem which is a real analogue
of Theorem~@th:borel-conjugate-quotient-projective on conjugacy of Borel
subgroups.

#theorem[The maximal connected triangular subgroups (maximal triangular
  subalgebras) of a connected semisimple real Lie group (semisimple Lie algebra
  over $RR$) are conjugate.] <th:conjugacy-maximal-triangular>

Proof is based on the following fixed point lemma.

#lemma[Let $V$ be a finite-dimensional vector space, $X$ its linear
  transformation whose characteristic roots are all real. For any point
  $p in upright(P)(V)$ there exists the limit
  $ p_0 = lim_(t -> oo) (exp t X)(p) in upright(P)(V). $
  The point $p_0$ is stable with respect to the group
  ${exp t X: t in RR}$.] <lem:projective-limit-fixed-point>

#proof[Express $X$ by a triangular matrix in a basis of $V$. The diagonal
  entries of this matrix are the eigenvalues $lambda_1, ..., lambda_r$ of $X$
  (multiplicities counted). The entries of the matrix $exp t X$ are functions in
  $t$ of the form
  $ sum_(1 <= i <= r) Q_i (t) e^(lambda_i t), $
  where $Q_i$ are polynomials. The coordinates of the vector $(exp t X) v$,
  where $v in V$ is a non-zero vector such that $chevron.l v chevron.r = p$, are
  of the same form. Let $Lambda$ be the maximal of the numbers $lambda_i$ among
  the coordinates of this vector and $M$ the highest of the degrees of the
  corresponding polynomials $Q_i$. Then
  $(exp t X) v = t^M e^(Lambda t) (v_0 + epsilon(t))$, #source(292)where
  $v_0 != 0$ and $epsilon(t) -> 0$ as $t -> oo$. Clearly,
  $chevron.l v_0 chevron.r = lim_(t -> oo) (exp t X)(p)$ and
  $p_0 = chevron.l v_0 chevron.r$ is fixed under $exp t X$ $(t in RR)$.]

Using Lemma~@lem:projective-limit-fixed-point we will prove that the connected
triangular linear group in $V$ over $RR$ has a fixed point in any invariant
closed subset of the flag variety $upright(F)(V)$. For this we need the
embedding $j$ of $upright(F)(V)$ into the projective space constructed in
@ss:flag-varieties[°]. Recall that this embedding is of the form
$
  upright(F)(V) & -> Gr_1 (V) times dots.c times Gr_n (V)
                  -> upright(P)(V) times upright(P)(Lambda^2 V) times dots.c
                  times upright(P)(Lambda^n V) \
                & -> upright(P)(
                    V times.o Lambda^2 V times.o dots.c times.o Lambda^n V
                  ),
$
where the last arrow is described in @ss:direct-product-quasiprojective[°] (here
$n = dim V$).

#problem[The embedding $j: upright(F)(V) -> upright(P)(W)$, where
  $W = V times.o Lambda^2 V times.o dots.c times.o Lambda^n V$, constructed in
  @ss:flag-varieties[°] has the following property: $j(g f) = R(g) j(f)$
  $(g in GL(V), f in upright(F)(V))$, where $R: GL(V) -> GL(W)$ is the natural
  representation.] <pr:plucker-flag-embedding-equivariant>

#problem[Let $upright(F)$ be the flag variety of a finite-dimensional vector
  space $V$ over $RR$ and $C subset GL(V)$ a connected virtual Lie subgroup with
  a fixed point in $upright(F)$. Then any non-empty closed $C$-invariant subset
  $Omega subset upright(F)$ contains a point fixed under
  $C$.] <pr:triangular-group-fixed-flag>

#problem[Prove Theorem~@th:conjugacy-maximal-triangular.]
<pr:prove-conjugacy-maximal-triangular>

#exercises[
  Let $G$ be an irreducible semisimple real algebraic group, $frak(g)$ its
  tangent algebra. An algebraic torus $T subset G(CC)$ is called #idx(
    "Torus",
    "algebraic",
    "split",
  )_split_ if in a basis of $frak(g)(CC)$ contained in $frak(g)$ all elements of
  the torus $Ad T$ are expressed by diagonal matrices.

  #exercise[An algebraic torus $T subset G(CC)$ is split if and only if
    $frak(t) = frak(a)(CC)$, where $frak(a)$ is an $RR$-diagonalizable
    subalgebra of $frak(g)$.] <exc:split-torus-criterion>

  #exercise[The maximal split tori in $G(CC)$ are conjugate with respect to the
    inner automorphisms generated by the elements of
    $G^0$.] <exc:maximal-split-tori-conjugate>

  #exercise[$frak(g)$ is split if and only if $G(CC)$ has a split maximal
    torus.] <exc:split-algebra-split-maximal-torus>

  Let $frak(a)$ be a subalgebra of the real Lie algebra $frak(g)$ and
  $rho: frak(g) -> frak(g l)(V)$ a real linear representation. The subalgebra
  $frak(a)$ is called #idx(
    "subalgebra",
    "ρ-diagonalizable",
  )_$rho$-diagonalizable_ (or #idx(
    "subalgebra",
    "ρ-triangular",
  )_$rho$-triangular_) if all $rho(x)$ $(x in frak(a))$ are expressed by
  diagonal (triangular) matrices in a basis of $V$.

  #exercise[Let $frak(g)$ be a semisimple real Lie algebra. Any
    $RR$-diagonalizable (i.e. ad-diagonalizable) subalgebra of $frak(g)$ is
    $rho$-diagonalizable for any linear representation $rho$. Conversely, if
    $frak(a) subset frak(g)$ is a $rho$-diagonalizable subalgebra for some
    faithful representation $rho$ then $frak(a)$ is
    $RR$-diagonalizable.] <exc:rho-diagonalizable-subalgebras>

  #exercise[Any triangular subalgebra of a semisimple real Lie algebra $frak(g)$
    is $rho$-triangular for any linear representation of $frak(g)$. Conversely,
    if the subalgebra $frak(c) subset frak(g)$ is $rho$-triangular for some
    faithful representation $rho$ of $frak(g)$ then $frak(c)$ is
    triangular.] <exc:rho-triangular-subalgebras>

  #exercise[Under the notation of @ss:real-root-systems denote by
    $W subset GL(frak(a))$ the Weyl group of the root system $Sigma$ (see
    @ss:weyl-group[°]). Set
    #source(293)
    $
      N_K (frak(a)) & = {k in K: k(frak(a)) = frak(a)}, \
      Z_K (frak(a)) & = {k in K: k(x) = x wide "for any" wide x in frak(a)}.
    $
    Then $N_K (frak(a))$ and $Z_K (frak(a))$ are Lie subgroups of $K$ with the
    tangent algebras isomorphic to $frak(m)$. The correspondence
    $k |-> k|frak(a)$ is the surjective homomorphism of $N_K (frak(a))$ onto $W$
    with the kernel $Z_K (frak(a))$, whence
    $ W tilde.eq N_K (frak(a))\/Z_K (frak(a)). $] <exc:restricted-weyl-group>

  #exercise[Let, under the same notation, $dim frak(g)_lambda = 1$ for all
    $lambda in Sigma$ and let $frak(g)$ have no compact ideals. Then $frak(g)$
    is split.] <exc:one-dimensional-root-spaces-split>

  #exercise[In a complex semisimple Lie algebra $frak(g)$ with a maximal
    diagonalizable subalgebra $frak(h)$ there exists a unique up to a conjugacy
    in $Aut frak(g)$ involutive automorphism $theta$ such that $theta(x) = -x$
    for all $x in frak(h)$. The corresponding automorphism
    $eta(theta) in Aut Pi$ coincides with the automorphism $theta$ of
    Exercise~@exc:opposition-involution. The correspondence established in
    Theorem~@th:real-forms-involutions-bijection assigns to $theta$ the class of
    the normal real form of $frak(g)$.] <exc:chevalley-involution-normal-form>

  #exercise[For the classical Lie algebras $frak(g)$ the automorphism $theta$ of
    Exercise~@exc:chevalley-involution-normal-form is conjugate to the following
    automorphism (under notation of @ss:real-forms-classical-groups[°]):
    $
      & theta: X -> -X^T      && quad "for" quad
                                 frak(g) = frak(s l)_n (CC), n >= 2; \
      & theta = Ad I_(n, n+1) && quad "for" quad
                                 frak(g) = frak(s o)_(2n+1) (CC), n >= 1; \
      & theta = Ad I_(n, n)   && quad "for" quad
                                 frak(g) = frak(s o)_(2n) (CC), n >= 2; \
      & theta = Ad S_n        && quad "for" quad
                                 frak(g) = frak(s p)_n (CC), n >= 2.
    $] <exc:chevalley-involution-classical>

  A subalgebra $frak(p)$ of a real semisimple Lie algebra $frak(g)$ is called
  #idx("subalgebra", "parabolic")_parabolic_ if $frak(p)(CC)$ is a parabolic
  subalgebra of $frak(g)(CC)$ (see Exercises to §~@sec:root-systems). Let, under
  the notation of @ss:satake-diagram, $M$ be a subset of a base
  $Theta subset Sigma^+$. Denote by $Sigma^((M))$ the subset of $Sigma$
  consisting of all positive roots and those negative roots which can be
  linearly expressed in terms of $M$.

  #exercise[For any $M subset Theta$ the system $Sigma^((M))$ is
    closed.] <exc:real-parabolic-root-subset-closed>

  #exercise[The subalgebra
    $frak(p)^((M)) = frak(g)_0 plus.o plus.o.big_(alpha in Sigma^((M)))
    frak(g)_alpha$ of $frak(g)$ is parabolic.] <exc:real-standard-parabolic>

  #exercise[Any parabolic subalgebra of $frak(g)$ is conjugate to exactly one of
    the $frak(p)^((M))$.] <exc:real-parabolic-classification>

  #exercise[Prove Theorem~@th:compact-maximal-tori-conjugate by the method used
    in the proof of Theorem~@th:conjugacy-maximal-r-diagonalizable of this
    section.] <exc:maximal-tori-conjugacy-variational>

  #exercise[Let $rho: frak(g) -> frak(g l)(V)$ be a finite-dimensional
    irreducible linear representation of a split real semisimple Lie algebra
    $frak(g)$ over $RR$. Then the complex representation
    $rho(CC): frak(g)(CC) -> frak(g l)(V(CC))$ is irreducible and
    $rho |-> rho(CC)$ is a one-to-one correspondence between the classes of
    equivalent real irreducible representations of $frak(g)$ and the classes of
    complex irreducible representations of $frak(g)(CC)$. Similar statement
    holds for arbitrary finite-dimensional
    representations.] <exc:split-algebra-real-representations>
]

#hints[
  #hint[@pr:r-diagonalizable-in-cartan-subspace][#source(294)Clearly, the
    algebraic closure $frak(a)^a subset frak(g)$ is also an $RR$-diagonalizable
    subalgebra. Therefore we may assume that $frak(a)$ is an algebraic
    subalgebra. Obviously, $frak(a)(CC)$ is a diagonalizable subalgebra of
    $frak(g)(CC)$, whence $frak(a)$ is a reductive algebraic subalgebra. The
    inclusion $frak(a) subset frak(p)$ follows now from
    Theorem~@th:reductive-subalgebra-canonical-embedding. Conversely, any
    subalgebra $frak(a) subset frak(p)$ is commutative and $ad x$ is
    diagonalizable for any $x in frak(a)$ (see
    Problems~@pr:cartan-automorphism-criterion and
    @pr:ad-symmetric-on-cartan-subspace) implying that $frak(a)$ is an
    $RR$-diagonalizable subalgebra.]

  #hint[@pr:maximal-in-p-r-diagonalizable][First prove that $frak(g)_0$ is of
    the form~@eq:centralizer-m-plus-a.]

  #hint[@pr:k-conjugacy-in-p-reduction][Apply
    Lemma~@lem:k-conjugate-commuting-in-p to the regular elements of two maximal
    subalgebras of $frak(p)$ and use
    Problems~@pr:centralizer-real-regular-element and
    @pr:maximal-in-p-r-diagonalizable.]

  #hint[@pr:maximally-split-cartan-subalgebra][The subalgebra $frak(t)$ is a
    maximal commutative subalgebra of $frak(g)(CC)$ and consists of semisimple
    elements. Therefore $frak(t)$ is a maximal diagonalizable subalgebra. Let
    $T$ be the corresponding maximal torus of $H = Int frak(g)(CC)$, $Theta$ the
    automorphism of $H$ defined by the formula $Theta(g) = theta g theta^(-1)$
    $(g in H)$. Then $Theta(T) = T$. The subalgebras $frak(t)^-$ and $frak(t)^+$
    are tangent to the algebraic subgroups $T^- = {g in T: Theta(g)^(-1) = g}$
    and $T^+ = {g in T: Theta(g) = g}$ respectively.
    Formula~@eq:split-cartan-real-part follows from the fact that
    $frak(h)^+ plus.o (i frak(a))$ belongs to the compact real form
    $frak(k) plus.o (i frak(p))$ of $frak(g)(CC)$ and therefore the differential
    $d chi$ of any character $chi in cal(X)(T)$ has only purely imaginary values
    of $frak(h)^+ plus.o (i frak(a))$.]

  #hint[@pr:real-reflection-realized-in-k][Is similar to
    Problem~@pr:n-alpha-induces-reflection.]

  #hint[@pr:prove-satake-involution][
    Problem~@pr:restriction-preserves-positivity implies that for any
    $alpha in Pi_1$ we have
    $
      attach(theta, tl: t)(alpha) = -sum_(beta in Pi_1) c_(alpha beta) beta
      - sum_(gamma in Pi_0) c_(alpha gamma) gamma,
    $
    where $c_(alpha beta)$, $c_(alpha gamma)$ are non-negative integers. Verify
    that $(c_(alpha beta))_(alpha, beta in Pi_1)^2 = E$ and apply
    Problem~@pr:nonnegative-involutive-matrix to the matrix
    $C = (c_(alpha beta))$.]

  #hint[@pr:restricted-simple-roots-form-base][Make use of
    Lemma~@lem:satake-involution and
    Problem~@pr:restriction-kernel-theta-fixed.]

  #hint[@pr:simple-iff-satake-connected][Let the Satake diagram of $frak(g)$ be
    not connected and $Delta = Delta' union Delta''$ the corresponding
    decomposition of the root system of $frak(g)(CC)$ into the union of
    non-empty disjoint subsystems. Then $Delta' inter Pi_1$ and
    $Delta'' inter Pi_1$ are $omega$-invariant. With the help of
    Problem~@pr:conjugation-equals-minus-theta we deduce from here that
    $attach(sigma, tl: t)(Delta') = Delta'$,
    $attach(sigma, tl: t)(Delta'') = Delta''$. Therefore, the ideals $frak(h)'$,
    $frak(h)''$ of $frak(g)(CC)$ corresponding to $Delta'$ and $Delta''$ (see
    Problem~@pr:orthogonal-roots-split-algebra) are $sigma$-invariant implying
    $frak(g) = frak(h)'^sigma plus.o frak(h)''^sigma$.]

  #hint[@pr:normal-real-form-is-split][Let $frak(s)$ be a split real form of
    $frak(g)$, $frak(a)$ a maximal $RR$-diagonalizable subalgebra of $frak(s)$.
    By Problem~@pr:split-equivalent-conditions $frak(t) = frak(a)(CC)$ is a
    maximal diagonalizable subalgebra of $frak(g)$ and $frak(a) = frak(t)(RR)$
    by Problem~@pr:maximally-split-cartan-subalgebra. Let $Pi$ be a system of
    simple roots of the root system $Sigma = Delta_frak(g)$. Then the elements
    $h_alpha, x_alpha, y_alpha$ $(alpha in Pi)$ of $frak(s)$ constructed in
    @ss:real-root-systems form a canonical system of generators of $frak(g)$.
    Clearly, $frak(s)$ coincides with the subalgebra generated by these elements
    over $RR$.]

  #hint[@pr:prove-iwasawa-algebra][Make use of @eq:real-root-decomposition,
    @eq:centralizer-m-plus-a and the inclusion
    $frak(g)_(-lambda) subset frak(k) + frak(g)_lambda$.]

  #hint[@pr:iwasawa-subgroups-simply-connected][First, let
    $G = Int frak(g) = (Aut frak(g))^0$. The unipotent subalgebra
    $frak(n) subset frak(g)$ determines a connected unipotent algebraic subgroup
    $N subset G$ and $exp: frak(n) -> N$ is a diffeomorphism. The algebraic
    subalgebra $frak(a)$ determines the commutative algebraic #source(
      295,
    )subgroup $tilde(A) subset Aut frak(g)$ and
    $A = tilde(A)^0 = exp frak(a) subset G$. Since $frak(a)$ is an
    $RR$-diagonalizable subalgebra, $A tilde.eq RR^l$, where
    $l = rk_RR frak(g)$. In an arbitrary connected semisimple Lie group $G$ with
    tangent algebra $frak(g)$, consider the Lie subgroups
    $hat(A) = (Ad^(-1) A)^0$ and $hat(N) = (Ad^(-1) N)^0$. The simple
    connectedness of $A$ and $N$ implies that $hat(A)$ and $hat(N)$ are simply
    connected and $hat(A) inter Z(G) = hat(N) inter Z(G) = {e}$. If
    $g in hat(A) inter hat(N)$ then $Ad g in A inter N$ implying $g in Z(G)$ and
    $g = e$. Clearly, $hat(A)$ normalizes $hat(N)$ so that
    $hat(A) hat(N) = hat(A) times.l hat(N)$ is a Lie subgroup of $G$.]

  #hint[@pr:iwasawa-group-d-triangular][Consider the ascending filtration of
    $frak(g)$ by the subspaces
    $frak(g)(lambda) = sum_(mu >= lambda) frak(g)_mu$
    $(lambda in Sigma union {0})$, where $>=$ is the partial ordering determined
    by $Theta$. Complementing this filtration by the subspaces of missing
    dimensions we get a flag in $frak(g)$ invariant with respect to all $ad x$
    $(x in frak(d))$ and $Ad g$ $(g in D)$. If $g in D inter K$ then $Ad g$ is a
    diagonalizable operator with all eigenvalues equal to 1 so that $Ad g = E$
    and $g in Z(G)$. Since the group $Ad D = (Ad A) times.l (Ad N)$ is simply
    connected, $Z(G) inter D = {e}$ and $g = e$.]

  #hint[@pr:prove-iwasawa-group][Let $mu: K times D -> G$ be the map defined by
    the formula $mu(k, d) = k d$. Since $K inter D = {e}$, then $mu$ is
    injective. Theorem~@th:iwasawa-decomposition-algebra implies that the map
    $d_((e, e)) mu: frak(k) times frak(d) -> frak(g)$ sending $(x, y)$ into
    $x + y$ is injective. Therefore so is $d_((a, b)) mu$ for any $a in K$,
    $b in D$. In fact,
    $mu(l(a) u, r(b^(-1)) v) = l(a) r(b^(-1)) mu(u, v)$
    $(u in K, v in D)$, implying
    $(d_((a, b)) mu)(d_e l(a) times d_e r(b^(-1))) = (d_e l(a))(d_e r(b^(-1)))
    d_((e, e)) mu$. Therefore $mu$ is a diffeomorphism of $K times D$ on an open
    set $K D subset G$. In particular, $(Ad K)(Ad D)$ is open in
    $Int frak(g) = Ad G$. Since $Ad K$ is compact, the set $(Ad K)(Ad D)$ is
    closed in $Int frak(g)$, implying $Int frak(g) = (Ad K)(Ad D) = Ad(K D)$.
    Taking into account that $Z(G) subset K$ (by
    Corollary~@cor:group-center-in-k-center of
    Theorem~@th:cartan-decomposition-group) we deduce that $G = K D$.]

  #hint[@pr:triangular-subgroups-and-subalgebras][Let $upright(F)$ be the flag
    variety of the vector space $frak(g)$. Consider the $G$-action on
    $upright(F)$ defined by the adjoint representation $Ad$. A subgroup
    $C subset G$ (a subalgebra $frak(c) subset frak(g)$) is triangular if and
    only if $C subset G_f$ (resp. $frak(c) subset frak(g)_f$) for some
    $f in upright(F)$. By Theorem~@th:stabilizer-is-lie-subgroup $G_f$ is a Lie
    subgroup of $G$ with the tangent algebra $frak(g)_f$. This implies the first
    statement.

    Any maximal connected triangular subgroup coincides with $G_f^0$ for some
    $f in upright(F)$, hence is a Lie subgroup; similarly, any maximal
    triangular subalgebra coincides with $frak(g)_f$ for some $f in upright(F)$.
    This easily implies the other statements of the problem.]

  #hint[@pr:iwasawa-d-maximal-triangular][If $frak(c)$ is a triangular
    subalgebra containing $frak(d)$ then by
    Theorem~@th:iwasawa-decomposition-algebra
    $frak(c) = (frak(c) inter frak(k)) + frak(d)$. If
    $x in frak(c) inter frak(k)$ then $ad x$ is a semisimple (in $frak(g)(CC)$)
    operator with zero eigenvalues implying $ad x = 0$ and $x = 0$. Thus
    $frak(c) = frak(d)$.]

  #hint[@pr:triangular-group-fixed-flag][Let us carry out the induction in
    $dim C$. The existence of a $C$-invariant flag implies that $C$ is solvable.
    Therefore $C = C_1 C_0$, where $C_1$, $C_0$ are connected virtual Lie
    subgroups of $GL(V)$, $C_0$ is normal in $C$ and $dim C_1 = 1$,
    $dim C_0 = dim C - 1$ (Problem~@pr:solvable-algebra-semidirect-sum). By the
    inductive hypothesis we may assume that the closed set
    $Omega_0 = {f in Omega: g f = f "for all" g in C_0}$ is non-empty. The
    subgroup $C_1$ transforms $Omega_0$ into itself. It is clear from
    Problem~@pr:plucker-flag-embedding-equivariant that under the embedding
    $j: upright(F)(V) -> upright(P)(W)$ the group $C_1 = {exp t X: t in RR}$
    where $X in frak(g l)(V)$, is identified with the group of projective
    transformations ${exp t Y: t in RR}$, where $Y = (d R) X$. By hypothesis all
    characteristic roots of $X$ are real. Since $R$ is equivalent to a
    subrepresentation of a power $(Id)^s$ of the identity #source(
      296,
    )representation, so is $Y$. Lemma~@lem:projective-limit-fixed-point implies
    that there exists a flag $f_0 in Omega_0$ invariant with respect to $C_1$
    and therefore with respect to $C$.]

  #hint[@pr:prove-conjugacy-maximal-triangular][Consider the $G$-action on
    $upright(F)(frak(g))$ defined by the adjoint representation. Let $D$ be the
    maximal triangular subgroup of $G$ described in
    Problem~@pr:iwasawa-d-maximal-triangular and let
    $f_0 in upright(F)(frak(g))$ be a $D$-invariant flag. It follows from
    Theorem~@th:iwasawa-decomposition-group that the orbit
    $Omega = G f_0 subset upright(F)(frak(g))$ is compact. Now let $C$ be any
    maximal triangular subgroup of $G$. Applying
    Problem~@pr:triangular-group-fixed-flag to the linear group $Ad C$ we get
    the flag $f_1 in Omega$ invariant with respect to $C$. If $f_1 = g f_0$,
    where $g in G$, then $C = g D g^(-1)$.]
]
