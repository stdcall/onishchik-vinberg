# Checks kept with the edition

Independent checks of statements from Onishchik and Vinberg, *Lie Groups and
Algebraic Groups* (Springer, 1990). They supplement, and never replace,
reading the text against the printed book: none of them establishes that our
text matches the book.

* `tests/` — `just test` (and `just check`, and CI): the schema of
  `corrections.json`, the label forms, the bibliography (`references.bib`
  and the printed list of `content/80-bibliography.typ` have the same keys,
  surname and year, and groups; Typst reads the BibLaTeX; the numbers 1–56
  are counted in the printed order; every citation names an entry), the
  numbering (an inserted statement renumbers the following ones and every
  reference to them; the book's exceptions give the printed numbers), the
  passage labels of `lean-proofs.json`, and unit tests of the lint, the
  page-label, hint-link and index checks.
* `sage/` — `just check-sage` runs every `*.sage` and `*.py` here with
  `sage -python`, so each script is plain Python that imports `sage.all`
  (last run with SageMath 10.9). One script per chapter or topic, exact
  computations with the expected values written in the script next to the
  printed page they come from: the root systems, Cartan matrices and Weyl
  group orders of Chapter 4, the tables of the Reference Chapter
  (dimensions, exponents, real forms), and examples where the book computes
  something by hand. A printed value that fails stays in the script as a
  refuted check beside the corrected one. On demand only; CI has no Sage.
* `lean/` — a Lake project (Lean 4.35.0-rc2, mathlib pinned in
  `lakefile.toml`) with small formalizations of important bounded steps of
  the book, one file per claim; the header of each file names the place in
  the book, maps the book's notation and lists what is not covered.
  `lean-proofs.json` records each file's declarations, the claim and its
  limits, and the labels of the passages it checks (`passages`: the
  statements, formulas and hints, `pr:…`, `eq:…`, `hint:…`);
  `just check-lean` and `just test` fail if one of these labels is missing
  from `content/`. When such a passage or proof changes, review their
  correspondence.
  `just check-lean` (`lean/check_axioms.py`) compiles every file, rejects
  errors, warnings and `sorry`, and allows only the axioms propext,
  Classical.choice and Quot.sound. By default it runs in `checks/lean`
  after `lake build` there, as the `lean` job of CI does; with
  `LEAN_MATHLIB` (or `--mathlib`) set to a prebuilt mathlib checkout of the
  pinned commit it compiles there instead, building and fetching nothing.
* `harper-dictionary.txt` — vocabulary for `just check-prose` (Harper, also
  used by VS Code through `harper.workspaceDictPath`); `python3
  scripts/check_prose.py --update-dictionary` adds the identifiers from
  strings and labels. The prose check is advisory and never fails a build.

`corrections.json` at the top of the repository is the journal of the
corrections: for each entry the printed page and place, the printed reading,
the correction, the reason and how it was verified (`verified_by`: the
printed text and its context, the argument, a Sage script or Lean file of
this directory, or a book of the literature).
