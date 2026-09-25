// Source anchors, numbered objects, cross-references, index marks and
// editorial notes. Chapter files import from here and from statements.typ.
//
// Numbering follows the book (the schemes and exceptions: numbering.typ).
// Every number is counted: headings by Typst's heading counter, statements
// and formulas by the counters of numbering.typ. A numbered object carries
// a stable semantic label written at the object (`<th:classical-real-forms>`,
// `<eq:homomorphism-path-equation>`, `<ss:virtual-lie-subgroups>`); it holds
// no number. References are Typst's own, `@th:classical-real-forms`, and
// print the counted number (`reference-rules` below). Works of the
// bibliography are cited by their keys in references.bib, `@bib:Borel1956`,
// and the printed number comes from the list.

#import "numbering.typ": (
  numbered-record, place-key, record-number, reference-chapter,
)

// Editorial notes are switched off with `--input editorial-notes=off`.
#let editorial-notes = sys.inputs.at("editorial-notes", default: "on") != "off"

// Pages of the source edition are counted from its first leaf, the title
// page; the page printed as 1 (Chapter 1) is its page 16, so from Chapter 1
// on the printed page number is the page less 15.
#let printed-offset = 15

// Page `n` of the source edition begins here. The anchor prints nothing and
// sets no label (labels are written at their objects, not made by helpers);
// the lint checks that the anchors follow the pages in order, and its report
// of unresolved references names the page a reference stands on.
#let source(n, printed: none) = context {
  let printed = if printed == none { str(n - printed-offset) } else {
    printed
  }
  [#metadata((
    kind: "source",
    file-page: n,
    printed-page: printed,
    position: here().position(),
  ))]
}

// Numbers are semibold; words around them keep the text weight and colour.
// Upright also inside the italic text of a theorem, as printed.
#let number-text(body) = text(weight: "semibold", style: "normal", body)

// The book's rule for the numbers in references (Preface): the leading
// numbers that the target shares with the place of the reference are
// dropped, so Problem 16 of Chapter 1, § 2 is "16" inside that section and
// "2.16" elsewhere in Chapter 1.
#let relative-number(key, here-key) = {
  let limit = calc.min(key.len() - 1, here-key.len())
  let common = 0
  while common < limit and key.at(common) == here-key.at(common) {
    common += 1
  }
  key.slice(common).join(".")
}

// References are Typst's own: `@pr:homomorphism-commutes-translations`,
// `@eq:homomorphism-path-equation`, `@ss:virtual-lie-subgroups`,
// `@bib:Borel1956`, the label of the object. The words stay in the text,
// "Problem @pr:homomorphism-commutes-translations", and the reference prints
// the object's counted number by the book's rule (`relative-number`, from
// the counted number of the place), so a renumbered object prints its new
// number. Formulas are printed in parentheses, "(17)", a letter tag in
// italic, "(F)"; subsections of the same section with the degree sign,
// "6°"; corollaries by their own number, "Corollary
// @cor:connected-virtual-subgroup-by-algebra of Theorem
// @th:virtual-subgroups-inclusion"; works of the bibliography by the number
// of their entry, the brackets being in the text: "[@bib:Serre1965,
// @bib:Serre1966]". Two forms of the book take a supplement:
// `@exm:simple-roots-of-classical-algebras[]` is the object's own number, as
// in "Example 2 of 2°"; `@ss:orbits-and-stabilizers[°]` keeps the degree
// sign of "1.5°". Any other supplement is a descriptive caption,
// `@eq:trace-form[the Killing form]`: the caption is the link, in the text's
// weight, and may break between lines. Inside a formula a reference is
// written `#[@eq:trace-form]` (math has no `@` syntax).
//
// Every reference is an `@` reference, so that the editor goes to the label
// of the target: a label passed as an argument (`#ref(<…>)`, `#link(<…>)`)
// is not followed by Tinymist. A long range that does not fit a line of the
// source stays `@a–@b` on a line of its own (the lint allows it).
//
// A reference whose target is missing (in the list of corrections) prints
// "?", semibold, without a link, and is recorded as
// unresolved: a label holds no number to print. The lint lists such
// references in the draft stage (`stage: draft` in config/project.json) and
// fails on them in the final stage, the complete book (rule T014).
// The layout itself never fails on them: during Typst's first layout pass no
// target is known yet, and an assertion there would cost the passes the
// document needs to settle.
// The printed form of a reference (`reference-rules`); `caption`: the
// supplement is a descriptive caption.
#let reference-body(it, caption) = context {
  let target = str(it.target)
  let prefix = target.split(":").first()
  let here-key = place-key(here()).map(str)
  let record = if it.element != none { numbered-record(it.target) }
  let number = if record != none { record-number(record) }
  let pending = number == none
  let printed = if pending { "?" } else if (
    prefix in ("bib", "cor") or it.supplement == []
  ) { str(number.last()) } else {
    relative-number(number.map(str), here-key)
  }
  let body = if caption { it.supplement } else if prefix == "eq" {
    let letter = printed.match(regex("^[A-Z]$")) != none
    text(style: "normal")[(#number-text(
        if letter { emph(printed) } else { printed },
      ))]
  } else if (
    prefix == "ss"
      and not pending
      and (
        not printed.contains(".") or it.supplement == [°]
      )
  ) { number-text(printed + "°") } else { number-text(printed) }
  // A link leads to the head of the object, its record; a formula is its
  // own target.
  let destination = if pending { none } else if (
    it.element.func() == math.equation
  ) { it.element.location() } else { record.location() }
  // The printed number is recorded for the checks (checks/tests).
  metadata((
    kind: "cross-reference",
    target: target,
    resolved: not pending,
    printed: printed,
    position: here().position(),
    target-position: if not pending { destination.position() },
  ))
  if pending { body } else { link(destination, body) }
}

#let reference-rules(body) = {
  show ref: it => {
    let caption = it.supplement not in (auto, none, [], [°])
    let shown = reference-body(it, caption)
    if caption { shown } else { box(shown) }
  }
  body
}

// Subject index mark, placed where the term is introduced. The arguments
// are the path of the entry in the index of the book: `#idx("Element",
// "nilpotent", "(of an algebraic Lie algebra)")` is printed under
// "Element" as "—, — (of an algebraic Lie algebra)". The index is built
// from these marks, so its page numbers follow our pagination.
#let idx(..path) = {
  assert(path.named().len() == 0 and path.pos().len() > 0)
  [#metadata((kind: "index-mark", path: path.pos()))<index-mark>]
}

// Editorial note: a footnote with its own mark, "*1", "*2", ..., kept out
// of the authors' footnote numbering and signed by the helper.
#let editorial-note-counter = counter("editorial-note")
#let ed-note(body) = if editorial-notes {
  editorial-note-counter.step()
  context {
    let mark = "*" + str(editorial-note-counter.get().first())
    footnote(numbering: _ => mark)[#body~— _Ed._]
    counter(footnote).update(n => n - 1)
  }
}

// The literature of the editorial notes (editorial.bib) is not printed as a
// list: a note cites a work in full, `#cite(<Geck2003>, form: "full")`. The
// book places this hidden bibliography at its end (main.typ).
#let editorial-bibliography = [
  #show bibliography: none
  #bibliography("../editorial.bib", style: "chicago-notes")
]

// Centre a long limit under a sum without widening the operator (mathclap).
#let mathclap(body) = context {
  let content = $script(body)$
  let width = measure(content).width
  box(width: 0pt, inset: (left: -width / 2, right: -width / 2), content)
}

// Names of groups are upright symbols, not operators: "GL_n (CC)^RR" must
// not get the thin space an operator takes before an ordinary atom.
#let group-name(name) = math.class("normal", math.upright(name))
#let GL = group-name("GL")
#let SL = group-name("SL")
#let PGL = group-name("PGL")
#let PSL = group-name("PSL")
#let SO = group-name("SO")
#let SU = group-name("SU")
#let Sp = group-name("Sp")
#let GA = group-name("GA")
#let Spin = group-name("Spin")

// Upright operator names of the book.
#let Ad = math.op("Ad")
#let ad = math.op("ad")
#let Aut = math.op("Aut")
#let Int = math.op("Int")
#let Der = math.op("Der")
#let Diff = math.op("Diff")
#let Ker = math.op("Ker")
#let Im = math.op("Im")
#let rk = math.op("rk")
#let codim = math.op("codim")
#let Hom = math.op("Hom")
#let End = math.op("End")
#let Lie = math.op("Lie")
#let Sq = math.op("Sq")
#let Id = math.op("Id")
#let Gr = math.op("Gr")
// Bold letters of the book are upright (the Euclidean space E, the space F
// of a root system); Typst's `bold` keeps Latin letters italic.
#let bold(body) = math.upright(math.bold(body))
// The radical: fraktur "rad" of a Lie algebra, upright "Rad" of a group.
#let rad = math.op(math.frak("rad"))
// The derivation algebra, fraktur "der" (der 𝔤, der V).
#let der = math.op(math.frak("der"))
#let Rad = math.op("Rad")
#let trdeg = math.op("tr. deg")
#let diag = math.op("diag")
// Real part: Typst's own `Re` is the symbol ℜ; the book writes "Re".
#let Re = math.op("Re")
#let char = math.op("char")
// The book sets the identity map in italic ("p × id", Commonly Used
// Symbols); Typst's own `id` is upright.
#let id = math.op(math.italic("id"))

// A block matrix with the sizes of its blocks printed above the columns and
// at the left of the rows, as plain TeX's \bordermatrix. The first row and
// the first column of the arguments are the labels:
// `bordered(, p, q; p, X_1, Y; q, Y^T, X_2)`.
#let bordered(..rows) = context {
  let (top, ..body) = rows.pos()
  let labels = body.map(row => row.first())
  let cells = body.map(row => row.slice(1))
  let width(it) = measure(math.equation(it)).width
  let matrix = math.mat(..cells)
  let bare = width(math.mat(delim: none, ..cells))
  // The row labels are the first column of a matrix that repeats the rows
  // hidden, so that each label gets the height of its row; the matrix is set
  // over the hidden copy, the labels stand 0.9em before its parenthesis.
  let side = math.mat(
    delim: none,
    ..labels.zip(cells).map(((label, row)) => (label, ..row.map(hide))),
  )
  let back = h(0.4em - bare)
  // The column labels are centred over the columns, between the widths of
  // the parentheses.
  let over((j, label)) = {
    let column = calc.max(..cells.map(row => width(row.at(j))))
    box(width: column, align(center, math.equation(label)))
  }
  let head = math.mat(delim: none, top.slice(1).enumerate().map(over))
  let paren = h((width(matrix) - bare) / 2)
  $#side #back limits(#matrix)^(#paren #head #paren)$
}
