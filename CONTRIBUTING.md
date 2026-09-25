# Building and changing the edition

## Build

Install Typst 0.15.1, Typstyle 0.15.1, Tinymist 0.15.8, Python 3.14, uv and
just (the Typst tool versions and their Linux builds are pinned in
`config/project.json`). The fonts and their licences are in `assets/fonts`;
CeTZ 0.5.2 is fetched by Typst on the first build.

```sh
uv sync --locked
just build           # build/onishchik-vinberg.pdf
just corrections     # build/onishchik-vinberg.corrections.pdf
just build-no-notes  # build/onishchik-vinberg.no-notes.pdf
just check           # format, lint, tests, all three PDFs, links
just fmt             # format the Typst sources in place
just check-sage      # exact checks of the mathematics (needs Sage)
just check-lean      # Lean checks (needs elan; see Checks)
just check-prose     # advisory prose check (needs harper-cli)
```

`build/` receives only the finished PDFs; raw PDFs, reports and the build
state go to the cache (`cache` in `config/project.json`,
`~/.cache/onishchik-vinberg`). `just clean` removes both. Machine settings
such as `LEAN_MATHLIB` may be kept in a local `.env` file, which `just`
reads and Git ignores.

In VS Code open this folder: Tinymist previews the book from
`content/main.typ`. With `tinymist.projectResolution: "lockDatabase"` (set
in `.vscode/settings.json`; with this folder inside a larger workspace, set
it there) a chapter opened in the editor uses `content/main.typ` as its main
file, as registered in `tinymist.lock`; `just check` creates this file,
which is local and not in Git. Typstyle formats on save with the settings
`just fmt` uses. The build task of `.vscode/tasks.json` exports with
Tinymist and validates the result like `just build`.

## Pull requests

`main` is protected: every change goes through a pull request, merged by
squash after the `check` and `lean` jobs of the workflow "PDF and checks"
have passed. `git config core.hooksPath .githooks` enables a local hook that
refuses a direct push to `main`. Every commit on `main` publishes a release
`main-<commit>` with the book, the list of corrections and `SHA256SUMS`.

## Sources

- `content/main.typ` gives the order of the book. The text is one file per
  section, `content/CS-slug.typ` (C the chapter, S the section:
  `12-tangent-algebra.typ`); `C0-slug.typ` holds a chapter's heading and
  introduction, Chapter 6 (no sections) is `60-levi-decomposition.typ`,
  the Reference Chapter is `70-`–`76-`, the bibliography
  `80-bibliography.typ`, the subject index `90-index.typ`; the front matter
  is in `frontmatter/`, the drawings in `diagrams/`.
- A chapter file starts with a comment naming its part and printed pages
  and imports `main-defs.typ`, `statements.typ` and the drawings it uses;
  the text follows as plain markup, and `main.typ` includes the file,
  `#include "12-tangent-algebra.typ"`.
- Style lives in the style files: `book-style.typ` (page, type, headings,
  formulas, tables), `statements.typ` (theorems, problems, exercises,
  hints, tables, figures), `numbering.typ` (the counters and the book's
  exceptions), `main-defs.typ` (references, notation, index marks,
  editorial notes). Chapter files carry no layout: no `set`/`show` rules,
  manual spacing, breaks, joiners, boxes or `lr(size: …)` (lint T040;
  the documented exceptions are in `config/lint.json`). A layout problem is
  solved once in a style file, after reading the Typst documentation.
- Prose lines are at most 80 columns; Typstyle wraps them (`just fmt`).
- `#source(N)` marks where page N of the source edition begins (pages
  counted from the title page; from Chapter 1 on the printed page is
  N − 15). It prints nothing. Put it inline, before a word: right after
  `#source(N)` a `(` or `[` would be read as part of the call (escape the
  bracket of a citation, `#source(58)\[@bib:Rokhlin1984\]`); after a
  heading, at the start of the first paragraph. The lint checks that the
  anchors are unique and in order (T015) and that none splits a sentence
  (T044).

## Headings, numbering and labels

Headings are Typst headings without numbers, with the label at the end of
the line: `= Lie Groups <ch:lie-groups>`, `== Tangent Algebra
<sec:lie-group-tangent-algebra>`, `=== Virtual Lie Subgroups
<ss:virtual-lie-subgroups>`; a long heading has its label alone on the next
line. The style numbers them (Chapter 1, § 1., 1°.). A subsection heading
stands on its own line, not run in with the text as in the book.

No number is written anywhere: every numbered object is counted, and a
reference prints the counted number of its target. The schemes, as in the
book, are described at the top of `content/numbering.typ`: problems,
theorems, lemmas, propositions, exercises and formulas are counted in each
section (§) by their own counters, Chapter 6 counting as § 1; examples in
each subsection (n°), the paragraphs "Example 5." and the items "5)"
together; corollaries after their theorem or proposition ("Corollary 2 of
Theorem 3"), a single corollary unnumbered; tables, figures and the
bibliography through the book; the formulas of the Reference Chapter
(F1), (F2), …, the items stated in words and the displays together; a hint
has the number of its problem. The book's exceptions are explicit in
`numbering.typ`: `examples-through-section` (Chapter 4, § 1),
`formula-skips` (no formula (10) in Chapter 4, § 4), `formula-tags` (the
letter tag (F) in Chapter 1, § 3), the restatement "Theorem 4′." and the
second list of examples restarted with `#eg-restart` (Chapter 1, § 1, 3°).

A label is a stable semantic name of the object, not its number:
`th:classical-real-forms`, `eq:number-of-roots`, `pr:prove-<theorem>` for
a problem "prove this theorem"; lowercase words and digits joined by
hyphens (lint T010). It stands literally right after the object in the
chapter file, never as a helper's argument or computed inside a helper;
every numbered object has one (T012). A new object gets a new name; an
inserted statement renumbers the following ones and every reference to
them, and the labels stay.

| In the book | In the source |
| --- | --- |
| Problem 16. … | `#problem[…] <pr:homomorphism-commutes-translations>`; "Problem 20 (Corollary)." `#problem(corollary: true)[…]`; unnumbered "Problem." `#problem(numbered: false)[…]`; `title: […]` for a title |
| Problem 8 (Corollary 2). | `#problem(corollary: true)[…] <pr:cartan-k-theta-fixed-points>`, on the next line `#as-corollary <cor:cartan-k-theta-fixed-points>` |
| Corollary 2 (Problem 28). | `#corollary(problem: true)[…] <cor:semisimple-group-complete-reducibility>`, on the next line `#as-problem <pr:semisimple-group-complete-reducibility>` |
| Theorem 4. / Theorem 4′. | `#theorem[…] <th:coset-conjugacy-by-normalizer>` (`title: […]`) / `#theorem(prime: [@th:coset-conjugacy-by-normalizer])[…] <th:coset-conjugacy-on-covering-space>` |
| Lemma 2. / Lemma. | `#lemma[…] <lem:polar-map-gl-diffeomorphism>` / `#lemma(numbered: false)[…]`; likewise `#proposition` |
| Corollary 2. / Corollary. | `#corollary[…] <cor:connected-virtual-subgroup-by-algebra>` / `#corollary[…]` without a label when the theorem has only one |
| Proof. … □ | `#proof[…]` (every proof ends with □); `head: [_Proof of Theorem_~@th:…]` or `head: none`; an argument interleaved with problems ends with `#qed-mark` |
| Examples. 1) … 2) … | `_Examples._ #eg <exm:vector-subspace-lie-subgroup> …`, the next item a new paragraph `#eg <exm:circle-lie-subgroup> …` |
| Example 5. … | `#example[…] <exm:roots-of-sl-n>` |
| Exercises 1) … | `#exercises[#exercise[…] <exc:differentiable-inversion-automatic> …]` |
| Hints to Problems 3. … / 1, 2. … | `#hints[#hint[@pr:lie-subgroup-local-criterion][…] …]` / `#hint[@pr:direct-product-lie-groups, @pr:lie-subgroup-is-lie-group][…]`; a hint referred to (also from `checks/lean-proofs.json`) carries `<hint:…>` after its body, named after its problem |
| formula (17) | `$ … $ <eq:homomorphism-path-equation>` |
| (F1) The number of roots … | `#formula-item[The number of roots …] <eq:number-of-roots>` |
| Table 5. … | `#table-section[Decomposition of Tensor Products …] <tab:tensor-product-decompositions>`, then the body as one or more `#book-table(columns: …, head: (…), ..cells)`; a part printed sideways inside `#sideways(…)` |
| Fig. 1 | `#book-figure(drawing) <fig:rank-one-two-root-systems>` |
| EVI, FII (real forms) | `#real-form("EVI")` |
| 34. Borel, A.: … | `#bib-item[printed text] <bib:Borel1956>` in `80-bibliography.typ` |

A problem with a hint links to it, and the hint's number links back; the
check of the built PDF verifies both directions.

## References

References are Typst's own, `@label`, inside a formula `#[@eq:…]`; their
form is set once by the `show ref` rule of `main-defs.typ`. The word stays
in the text, tied to the reference with `~` as in LaTeX:
`Problem~@pr:homomorphism-commutes-translations`, `Theorem~@th:…`,
`Exercise~@exc:…`, `Example~@exm:…`, `Corollary~@cor:… of Theorem~@th:…`,
`Chapter~@ch:complex-semisimple-lie-groups`, `§~@sec:compact-linear-groups`,
`Table~@tab:…`, `Fig.~@fig:…`, `Hint to Problem~@hint:…`. A formula prints
with its parentheses, `@eq:homomorphism-path-equation` → "(17)"; a
subsection of the same section with the degree sign,
`@ss:homomorphism-uniqueness` → "6°". The number is shortened by the rule
of the Preface relative to the place of the reference ("16" in the same
section, "2.16" elsewhere in the chapter, "1.2.16" in another chapter), and
only the number is set in semibold. Two forms of the book take a
supplement: `@exm:simple-roots-of-classical-algebras[]` gives the object's
own number ("Example 2 of @ss:…"), `@ss:orbits-and-stabilizers[°]` keeps
the degree sign ("1.5°"); any other supplement is a descriptive caption,
`@eq:trace-form[the Killing form]`. A range uses the en dash,
`@pr:first–@pr:last`; a range too long for a line stands on a line of its
own (the lint allows it). String wrappers (`#pr(16)`, `#eqref(17)`) and
labels passed as arguments (`#ref(<…>)`, `#link(<…>)`, `#hint(<…>)`) are
errors (T018): the editor follows only `@` references to their targets.
Literal numbers of objects of the book are errors too (T030–T033); a
number of another work ("Theorem 3.2 of [@bib:Serre1965]") is listed with
its reason in `config/lint.json`.

A reference whose target is missing prints "?" without a link; in the
final stage (`stage` in `config/project.json`) it fails the lint and the
build. A semicolon right after an embedded call is swallowed by the code:
write `#idx("x")\;` (T041).

## Bibliography

`references.bib` holds the book's bibliography as BibLaTeX, one entry per
item of the printed list, keyed by the first author's surname and the year
(`Borel1956`; `a`, `b`, `c` for one author and year in the order of the
list); the group of the list is `keywords = {group-N}`, translations and
further parts are in `addendum`. `content/80-bibliography.typ` sets the
printed list, `#bib-item[…] <bib:Key>` in the printed order; its number is
counted, and `[@bib:Borel1956]` prints "[34]", `[@bib:Serre1965,
@bib:Serre1966]` "[16, 17]", `[@bib:Bourbaki1968, Ch. 1]` a place in the
cited work. The tests compare the keys of the database, the list and the
citations.

`editorial.bib` holds the printed literature of the editorial notes; it is
not printed as a list, and a note cites a work in full,
`#cite(<Knapp2002>, form: "full")`.

## Notation

- ℝ ℂ ℤ ℚ ℍ 𝕋 𝔸 ℙ are `RR CC ZZ QQ HH TT AA PP`; fraktur `frak(g)`; the
  bold letters of the book are upright, `bold(E)` of `main-defs.typ`.
- Upright names from `main-defs.typ`: `GL SL PGL PSL SO SU Sp GA Spin`
  (groups), `Ad ad Aut Int Der der Diff Ker Im rk codim Hom End Lie Sq Id Gr
  trdeg char diag Re rad Rad` (`Re` is "Re", not ℜ; `rad` is the fraktur
  radical of an algebra, `Rad` the upright radical of a group), besides
  Typst's `det tr dim exp`. `id` is italic, as in the book's list of
  symbols. Other upright letters are written `upright(O)_n (K)`.
- ⋊ `times.r` (⋉ `times.l`) for semidirect products of groups, ⨮
  `plus.o.r` (⨭ `plus.o.l`) for semidirect sums of algebras, ⊕ `plus.o`,
  ⊗ `times.o`, ∘ `compose`, ≅ `tilde.equiv` and ≃ `tilde.eq` as printed,
  ∖ `without`, ⟨S⟩ `chevron.l S chevron.r`, ᵗφ `attach(phi, tl: t)`,
  `wide` instead of `qquad`, `ratio` in homogeneous coordinates
  `(U_0 ratio U_1)`. Write `>=`, `<=` and capital Greek `Delta`, `Pi`: the
  style slants the inequalities and sets capital Greek variables in italic,
  as the book does; the colon of `f: X -> Y` is set as punctuation.
- A subscript before a parenthesis is separated by a space, `T_x (X)`,
  `GL_n (K)` (T020); a primed function `phi'_X`, a primed index `phi_(X')`
  (T023). A condition after an expression in a formula is preceded by
  `quad`: `$ a(g): x |-> g x g^(-1), quad "where" quad x in G. $`,
  `$B_l, quad l >= 2$`.
- A block matrix with the sizes of its blocks: `bordered(, p, q; p, X_1, Y;
  q, Y^T, X_2)`. Systems with a brace: `cases(…)`.
- Commutative diagrams: `#import "diagrams/cd.typ": ar, cd`, inside a
  display `$ #cd(…) $` (dotted arrows for rational maps, `shift:` for
  parallel arrows). Dynkin, extended, Kac and Satake diagrams:
  `diagrams/dynkin.typ` (`bond, dynkin, gap, pair, v`; described at the top
  of the file). Other drawings are CeTZ 0.5.2 in `content/diagrams/`, with
  the geometry derived from a few measured quantities and one style.

## Subject index

The index is built from marks `#idx("Element", "nilpotent (of an
algebra)")` placed right before the term where it is introduced (usually
the italic word); the arguments are the entry as printed, split at its
commas. Page numbers are computed from the marks, so the index follows the
layout. A new entry is a new mark in the text, never a line in a list.

## Corrections and editorial notes

A departure from the printed text (a misprint, a wrong sign, reference,
number or citation, the grammar of the translation, a false statement) is
corrected in the text minimally and in the authors' style, and recorded in
`corrections.json`: one entry per correction, in the order of the book,

```json
{
  "id": "C301",
  "printed_page": 185,
  "section": "Chapter 4, § 3",
  "place": "Chapter 4, § 3",
  "original": "… $v_emptyset$ …",
  "corrected": "… $hat(v)_emptyset$ …",
  "reason": "Lost hat: the basis vector of $hat(V)$ is $hat(v)_emptyset$.",
  "verified_by": "the printed text"
}
```

`printed_page` is the page of the book (a roman numeral in the front
matter); `section` groups the list of corrections and `place` names a
narrower place when there is one. `original`, `corrected` and `reason` are
Typst markup with formulas in `$…$`; since the list is a separate document,
they quote numbers as printed ("Problem 2.3.9", "[56]"), never as
references. `verified_by` says how the correction was established: the
printed text and its context, the argument, a script of `checks/sage` or a
file of `checks/lean`, or a book of the literature cited
bibliographically. `just corrections` typesets the list (without
`verified_by`), and the build checks that it prints every entry once.

A correction that a reader would not understand without a word (a
counterexample to the printed statement, data lost from a table) gets an
editorial note, `#ed-note[…]`: numbered "\*1", "\*2", …, signed "— Ed." by
the helper, citing printed literature from `editorial.bib`. A note says
what the book claimed, why it is wrong and where to read more; it does not
repeat the corrected text. `just build-no-notes` builds the edition without
the notes (`--input editorial-notes=off`).

## Checks

`just check` runs Typstyle, `tinymist lint`, the lint of
`scripts/lint_typst.py` (its rules are listed at the top of the file), the
unit tests of `checks/tests`, the Tinymist check of `scripts/check_lsp.py`
(every reference goes to the literal label of its target, also across
files, with `content/main.typ` as the main file; completion offers the
labels), and builds the three PDFs, checking the links, the problem–hint
links, the page labels and that every bookmark keeps the reader's zoom
(`/XYZ left top null`). Bottom gaps on pages are reported for review and do
not fail the build.

The mathematics is checked independently in `checks/` (see
`checks/README.md`):

- `checks/sage/` — exact Sage computations with the printed values written
  in the scripts, a refuted printed reading kept beside the corrected one;
  run on demand with `just check-sage`.
- `checks/lean/` — Lean formalizations of bounded steps of the book, listed
  in `checks/lean-proofs.json` with their declarations, the claim, its
  limits and the labels of the passages they check; `just check-lean` and
  `just test` fail if one of these labels is missing from `content/`. When
  such a passage or proof changes, review their correspondence. CI builds
  the project and runs the check; locally, with elan installed:

  ```sh
  cd checks/lean && lake exe cache get && lake build && cd ../..
  just check-lean
  ```

  or set `LEAN_MATHLIB` to a prebuilt mathlib checkout of the pinned commit.
  Only the axioms propext, Classical.choice and Quot.sound are allowed.
- `just check-prose` runs Harper over the prose of the sources with the
  dictionary `checks/harper-dictionary.txt` and the rules of
  `.vscode/settings.json` (British spelling). It is advisory.

A known limitation of the layout: a new paragraph that begins right after a
displayed formula is not indented, since Typst indents only a paragraph that
follows a paragraph; statements after a display are indented as in the
book.
