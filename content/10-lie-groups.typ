// Chapter 1, opening text. Printed page 1.
#import "main-defs.typ": *
#import "statements.typ": *

= Lie Groups <ch:lie-groups>

#source(16)Here the notions of the differentiable (smooth) manifold,
differentiable (smooth) map, direct product of differentiable manifolds, tangent
space and the differential of a map (the tangent map) are assumed to be known.
Several other notions and theorems on differentiable manifolds will be recalled
in the sequel.

The ground field $K$ is either $RR$ or $CC$.

Unless otherwise stated, the differentiability of functions of real variables is
to be understood in such a way that in every case there are as many derivatives
as needed. The differentiability of manifolds and maps is understood
accordingly. The differentiability of functions of complex variables is,
clearly, equivalent to their analyticity.

The Jacobi matrix of a system of differentiable functions $f_1, ..., f_m$ of
variables $x_1, ..., x_n$ is denoted by
$display((partial(f_1, ..., f_m))/(partial(x_1, ..., x_n)))$. For $m = n$ its
determinant (Jacobian) is denoted by
$display((D(f_1, ..., f_n))/(D(x_1, ..., x_n)))$.

The tangent space to a manifold $X$ at a point $x$ is denoted by $T_x (X)$. The
differential of a map $f: X -> Y$ at a point $x$ is a linear map
$T_x (X) -> T_(f(x)) (Y)$ denoted by $d_x f$. When it is not misleading we omit
the index and write $T(X)$ instead of $T_x (X)$.

We assume that every differentiable manifold has a countable base. In particular
this is so in all the cases when a manifold arises as a result of some
construction which starts with a manifold possessing a countable base, e.g. as a
submanifold, quotient manifold, covering manifold, direct product of manifolds.
