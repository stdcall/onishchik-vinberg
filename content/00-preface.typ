// Preface and The Translator's Preface. Printed pages V-IX.
#import "main-defs.typ": *
#import "statements.typ": *

#source(3, printed: "V")
#heading(numbering: none, outlined: false, bookmarked: true)[Preface]

This book is based on the notes of the authors' seminar on algebraic and Lie
groups held at the Department of Mechanics and Mathematics of Moscow University
in 1967/68. Our guiding idea was to present in the most economic way the theory
of semisimple Lie groups on the basis of the theory of algebraic groups. Our
main sources were A.~Borel's paper [@bib:Borel1956], C.~Chevalley's seminar
[@bib:Chevalley1956], seminar "Sophus Lie" [@bib:SophusLie1955] and monographs
by C.~Chevalley [@bib:Chevalley1946], N.~Jacobson [@bib:Jacobson1962] and
J-P.~Serre [@bib:Serre1965, @bib:Serre1966].

In preparing this book we have completely rearranged these notes and added two
new chapters: "Lie groups" and "Real semisimple Lie groups". Several traditional
topics of Lie algebra theory, however, are left entirely disregarded, e.g.
universal enveloping algebras, characters of linear representations and
(co)homology of Lie algebras.

A distinctive feature of this book is that almost all the material is presented
as a sequence of problems, as it had been in the first draft of the seminar's
notes. We believe that solving these problems may help the reader to feel the
seminar's atmosphere and master the theory. Nevertheless, all the non-trivial
ideas, and sometimes solutions, are contained in hints given at the end of each
section. The proofs of certain theorems, which we consider more difficult, are
given directly in the main text. The book also contains exercises, the majority
of which are an essential complement to the main contents.

As a rule, the generally accepted terminology and notation is used.
Nevertheless, two essential deviations should be mentioned. Firstly, we use the
phrase tangent algebra of a Lie group for the Lie algebra associated with this
group, with a view to emphasizing the construction of this Lie algebra as the
tangent vector space to the Lie group. Secondly, in contrast to some monographs
and textbooks, we call a Lie subgroup of a Lie group any of its subgroups which
is an embedded (and necessarily closed) submanifold, while an immersed
submanifold endowed with the structure of a Lie group is called a virtual Lie
subgroup.

The reader is required to have linear algebra, the basics of group and ring
theory and topology (including the notion of fundamental group) and to be
acquainted with the main concepts of the theory of differentiable manifolds.

Numbering of subsections, formulas, theorems, etc. is performed inside each
section and sections are numbered inside a chapter. In references we generally
use triple numbering: for instance, Problem 2.3.17 refers to Problem 17 of §~3,
Chapter 2. However, we skip the number of a chapter (or a section) in references
inside of it. The last chapter is not divided into sections but in references is
considered consisting of one section: §~1.

#source(4, printed: "VI")In compiling the first draft of seminar's notes we
enjoyed the help provided by E.M.~Andreyev, V.G.~Kac, B.N.~Kimelfeld and
A.C.~Tolpygo. In computing the decompositions of products of irreducible
representations (Table~@tab:tensor-product-decompositions) B.N.~Kimelfeld,
B.O.~Makarevich, V.L.~Popov and A.G.~Elashvili took part. Besides, we would like
to point out that certain nice proofs were the result of seminar's workout.

We are grateful to D.A.~Leites thanks to whose insistence and help this book has
been written.

#source(5, printed: "VII")
#heading(
  numbering: none,
  outlined: false,
  bookmarked: true,
)[The Translator's Preface]

In my 20 years of work in mathematics, I have never met a Soviet mathematician
_personally involved_ in any aspect of representation theory who would not refer
to the rotaprint notes of the _Seminar on algebraic groups and Lie groups_
conducted by A.~Onishchik and E.~Vinberg with the participation of A.~Elashvili,
V.~Kac, B.~Kimelfeld, and A.~Tolpygo. The notes had been published in 1969 by
Moscow University in a meager number of 200 copies.

Ten years later A.~Onishchik and E.~Vinberg rewrote the notes and considerably
enlarged them. This is a translation of the enlarged version of the notes; its
abridged variant was issued in Russian in 1988.

The reader might wonder why one should have the book: why not Bourbaki's book,
or S.~Helgason's, or one of the excellent (text) books, say, by J.~Humphreys or
C.~Jantzen. Here are some important reasons why:

-- Nowhere are the basics of the Lie group theory so clearly and concisely
expressed.

-- This is the only book where the theory of semisimple Lie groups is based
systematically on the technique of algebraic groups (an idea that goes back to
Chevalley and is partly realized in his 3 volumes on the theory of Lie groups
(1946, 1951, 1955)).

-- Nowhere is the theory of real semisimple finite-dimensional Lie groups (their
classification and representation theory included) expressed with such lucidity
and in such detail.

-- The unconventional style---the book is written as a string of
problems---makes it useful as a reference to physicists (or anyone else too lazy
to bother with the proof when a formulation suffices) whereas those interested
in proofs will find either complete solutions or hints which should be ample
help. (They were ample for some #emph[school]boys, bright boys I must admit, at
a specialized mathematical school in Moscow.)

-- The reference chapter contains tables invaluable for anybody who actually has
to compute something pertaining to representations, e.g. the table of
decompositions into irreducible components of tensor products of some common
representations, which is really unique.

The authors managed to display in a surprisingly small space a quite large range
of topics, including correspondence between Lie groups and Lie algebras,
elements of algebraic geometry and of algebraic group theory over fields of real
and complex numbers, basic facts of the theory of semisimple Lie groups (real
and complex; their local and global classification included) and their
representations, and Levi-Malcev theorems for Lie groups and algebraic groups.

#source(6, printed: "VIII")There is nothing comparable to this book by the
broadness of scope in the literature on the group theory or Lie algebra theory.

At the same time, the book is self-contained indeed since only the very basics
of algebra, calculus and smooth manifold theory are really needed to understand
it. It is this feature that makes it compare favourably with the books mentioned
above.

On the other hand, as far as algebraic groups are concerned, it cannot replace
treatises like those by Humphreys or Jantzen, especially over fields of prime
characteristic. Nevertheless, this book might serve better for the _first_
acquaintance with these topics.

The algebraic groups, however, though vital in the approach adopted, are not the
main characters of the book while the theory of Lie groups is. Still, the
viewpoint of algebraic group theory enabled the authors to simplify some proofs
of important theorems. Other novelties include:

-- _Malcev closure_ which enabled the authors to give a new proof of existence
of an embedded (here: virtual) Lie subgroup with given tangent algebra;

-- a proof of the fixed point theorem for compact groups of affine
transformations that does not refer to integration over the group and
corollaries of this theorem, such as Weyl's theorem on unitarity of a compact
linear group and the algebraicity of compact linear groups;

-- a generalization of V.~Kac's classification of periodic automorphisms based
on ideas different from those put forward by Kac originally;

-- a simple proof of É.~Cartan's theorem on the conjugacy of the maximal compact
subgroups, that does not require any Riemannian geometry.

Lastly, I believe that some further reading on the rapidly developing
generalization of the topic of the book should be recommended, including:

_(Twisted) loop algebras and, more generally, Kac-Moody algebras_:

V.~Kac: Infinite-dimensional Lie algebras, 2nd ed. Cambridge Univ. Press,
Cambridge, 1983;

V.~Kac, A.~Raina: Bombay lectures on highest weight representations of infinite
dimensional Lie algebras, Adv. Series in Math. Phys. 2, World Sci., Singapore,
1987;

A.~Pressley, G.~Segal: Loop groups. Clarendon Press. Oxford, 1986.

_Lie superalgebras and stringy Lie (super) algebras_:

V.~Kac: Lie superalgebras. Adv. Math. 26, 1977, 8--96.

M.~Scheunert: The theory of Lie superalgebras. An introduction. LN in Math.
\#716, Springer, Berlin, 1979.

D.~Leites (ed): Seminar on supermanifolds, vols. 1 and 3. Kluwer,
Dordrecht, 1990.

Finally, I wish to contribute one more problem to this compendium of problems.
The importance of Table~@tab:tensor-product-decompositions has been rapidly
increasing of late, in particular with the introduction of new ideas and
problems in theoretical physics by V.~Drinfeld ("quantum groups", quadratic
algebras, etc.). The time and ingenuity-consuming task of acquiring similar data
should be solved once and for all:

#problem(numbered: false)[#source(7, printed: "IX")Write a program for a
  computer to calculate data similar to those of
  Table~@tab:tensor-product-decompositions, e.g.
  $S^n (R(Lambda)) times.o Lambda^m (R(M))$, etc., together with an _explicit_
  expression for the highest (lowest) weight vectors of the irreducible
  components of the tensor product in terms of the vectors from the initial
  spaces-factors#footnote[As far as I know, some _partial_ results in this area
    were obtained recently in Montreal and at Moscow University.].]

I am sure that the reader will enjoy the book and treasure it as does everybody
I know, who was lucky enough to get a copy in Russian.

#grid(
  columns: (1fr, auto),
  [Petrozavodsk---Moscow---Stockholm, 1979--89], [Dimitry Leites],
)
