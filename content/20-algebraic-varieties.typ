// Chapter 2, opening text. Printed page 59.
#import "main-defs.typ": *
#import "statements.typ": *

= Algebraic Varieties <ch:algebraic-varieties>

#source(74)The objects that occur in this chapter (vector spaces, algebras,
algebraic varieties, etc.) are considered over a fixed ground field $K$. In
subsections~@ss:homomorphism-extension-theorems–@ss:simple-points it is assumed
to be algebraically closed#footnote[In many cases this assumption is superfluous
  but we decided not to overburden our narrative with a perpetual change of
  scenery.]. Sometimes we require that it be of zero characteristic. The reader,
however, would not lose much by restricting himself to the cases $K = CC$ or
(where the algebraic closedness is not required) $K = RR$. Only these cases are
needed for future applications to the Lie group theory and we only consider more
general fields in order to elucidate the algebraic nature of the theory
discussed.

Denote by $AA^n$ (resp. $PP^n$) the $n$-dimensional affine (resp. projective)
space over $K$. The point of $AA^n$ with coordinates $X_1, ..., X_n$ is denoted
by $(X_1, ..., X_n)$. A point of $PP^n$ with homogeneous coordinates
$U_0, U_1, ..., U_n$ is denoted by $(U_0 ratio U_1 ratio ... ratio U_n)$.

Hereafter the word “algebra” means “commutative associative algebra with unit”
except the subsection~@ss:forms-of-vector-spaces-algebras where arbitrary
algebras are also considered. Subalgebras are supposed to contain unit,
homomorphisms to transform the unit into the unit.

$Q A$ stands for the full quotient algebra of an algebra $A$, i.e. the quotient
ring of $A$ with respect to the multiplicative system consisting of all elements
that are not zero divisors (see [@bib:Lang1965]), considered as an algebra over
the ground field. If, in particular, $A$ is an algebra without zero divisors
then $Q A$ is a field.

If $L_1, L_2, ...$ are some capitals then $A[L_1, L_2, ...]$ denotes the
polynomial algebra of $L_1, L_2, ...$ with coefficients in $A$.
