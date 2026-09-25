// Page, type and heading design of the book. Chapter files carry no layout.
//
// Headings are ordinary Typst headings: `=` chapter, `==` section (§),
// `===` subsection (n°). The Exercises and Hints lists add unnumbered level-3
// headings. Chapter 6 has subsections without sections; the Reference
// Chapter (label <ch:reference>) prints no "Chapter" line.

#import "numbering.typ": place-key, restart-counters
#import "statements.typ": numbered-display
#import "main-defs.typ": reference-rules

// Headings carry their labels in the chapter files: `== Tangent Algebra
// <sec:lie-group-tangent-algebra>`, `=== Virtual Lie Subgroups
// <ss:virtual-lie-subgroups>` (Chapter 6: `<ss:malcev-theorem>`). A numbered
// heading leaves a record at its start, the target of references to it
// (main-defs.typ), and restarts the counters of the objects numbered inside it
// (numbering.typ).
#let heading-anchor(it) = {
  restart-counters(it.level)
  [#metadata((kind: "numbered", family: "heading", level: it.level))<numbered>]
}

// Running heads: chapter on versos, section on rectos, as in the book.
#let running-chapter = state("running-chapter", none)
#let running-section = state("running-section", none)

#let heading-number(it) = counter(heading).at(it.location())

// "§ 2. Tangent Algebra": a section's title in its heading and running head.
#let section-title(it) = [§ #heading-number(it).at(1). #it.body]

#let is-reference-chapter(it) = (
  it.has("label") and it.label == <ch:reference>
)

// Pages on which a chapter or an unnumbered front/back part begins carry no
// running head (a folio at the foot instead).
// (Physical pages: the page numbers of the front matter, V, VII, …, restart
// at 1 in Chapter 1 and would match pages of the text.)
#let opening-page() = {
  query(heading.where(level: 1))
    .map(it => it.location().page())
    .contains(here().page())
}

#let running-header = context {
  let number = counter(page).get().first()
  if opening-page() { return }
  let folio = counter(page).display()
  let head = text.with(size: 10pt)
  if calc.even(number) {
    let chapter = running-chapter.get()
    if chapter == none { return }
    grid(
      columns: (2em, 1fr, 2em),
      align: (left, center, right),
      head(folio), head(chapter), [],
    )
  } else {
    // As in the book, a recto on which a section begins, even at its foot,
    // is headed by that section.
    let beginning = query(heading.where(level: 2)).filter(it => (
      it.numbering != none and it.location().page() == here().page()
    ))
    let section = if beginning.len() > 0 {
      section-title(beginning.first())
    } else { running-section.get() }
    if section == none { section = running-chapter.get() }
    if section == none { return }
    grid(
      columns: (2em, 1fr, 2em),
      align: (left, center, right),
      [], head(section), head(folio),
    )
  }
}

#let running-footer = context {
  if opening-page() {
    align(center, text(size: 10pt, counter(page).display()))
  }
}

#let book-style(body) = {
  set page(
    width: 176mm,
    height: 250mm,
    margin: (x: 20mm, top: 22mm, bottom: 20mm),
    // Footnotes are numbered on each page from 1, as in the book (the Typst
    // documentation of `footnote`: reset the counter in the page header).
    header: counter(footnote).update(0) + running-header,
    footer: running-footer,
  )
  set text(
    font: "Libertinus Serif",
    size: 12pt,
    lang: "en",
    region: "gb",
    fill: rgb("202020"),
  )
  show link: set text(fill: rgb("202020"))
  // "$RR$-diagonalizable", "$(n-m)$-dimensional": a line may not break
  // between a formula and the hyphen of the word that it begins. Typst
  // allows that break; a word joiner before such a hyphen forbids it.
  show regex("^-\p{L}"): it => sym.wj + it
  // Nor at the en dash of a range ("Problems 6–9", "pp. 37–123"): the book
  // uses the en dash only between numbers and names, never as punctuation.
  show "–": it => sym.wj + it + sym.wj
  // Typst indents a paragraph that follows another paragraph. So text that
  // continues a sentence after a display stays flush left, as in the book;
  // statements are runs of paragraphs (statements.typ), so a problem, a
  // theorem and the paragraph after them are indented, as in the book.
  set par(
    justify: true,
    leading: 0.68em,
    first-line-indent: 1.25em,
    spacing: 1.1em,
  )
  set heading(numbering: (..n) => {
    let n = n.pos()
    if n.len() == 1 { "Chapter " + str(n.at(0)) + "." } else if n.len() == 2 {
      "§ " + str(n.at(1)) + "."
    } else { str(n.last()) + "°." }
  })

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    let numbered = it.numbering != none and not is-reference-chapter(it)
    let title = if numbered {
      [Chapter #heading-number(it).first(). #it.body]
    } else { it.body }
    running-chapter.update(title)
    running-section.update(none)
    set par(first-line-indent: 0pt, justify: false)
    if it.numbering != none { heading-anchor(it) }
    block(width: 100%, above: 18mm, below: 12mm, align(center, {
      if numbered {
        text(size: 17pt, weight: "regular")[Chapter #heading-number(it).first()]
        linebreak()
      }
      text(size: 17pt, weight: "regular", it.body)
    }))
  }

  show heading.where(level: 2): it => {
    set par(first-line-indent: 0pt, justify: false)
    if it.numbering == none {
      // Group titles of the Bibliography, bold as printed (the Contents
      // lists them in the weight of the other entries).
      block(width: 100%, above: 7mm, below: 4mm, sticky: true, strong(it.body))
    } else {
      running-section.update(section-title(it))
      heading-anchor(it)
      block(width: 100%, above: 10mm, below: 7mm, sticky: true, align(
        center,
        text(size: 15pt, weight: "regular", section-title(it)),
      ))
    }
  }

  show heading.where(level: 3): it => {
    set par(first-line-indent: 0pt, justify: false)
    if it.numbering == none and it.supplement == [Table] {
      // "Table 5. Decomposition of Tensor Products …" (statements.typ).
      block(width: 100%, above: 7mm, below: 3mm, sticky: true, strong(
        it.body,
      ))
    } else if it.numbering == none {
      // Exercises, Hints to Problems.
      block(width: 100%, above: 7mm, below: 4mm, sticky: true, align(
        center,
        strong(it.body),
      ))
    } else {
      heading-anchor(it)
      block(width: 100%, above: 6mm, below: 3mm, sticky: true, strong[
        #heading-number(it).last()°. #it.body
      ])
    }
  }

  // Contents: chapters with their § and n° entries, as in the book.
  show outline: set par(first-line-indent: 0pt)
  // An entry is never split between pages: a split one leaves an empty
  // piece of its link at the foot of the page.
  show outline.entry: set block(breakable: false)
  show outline.entry.where(level: 1): set block(above: 1.1em)
  show outline.entry: it => link(
    it.element.location(),
    it.indented(
      if it.element.numbering == none { none } else {
        let n = heading-number(it.element)
        if it.level == 1 {
          if is-reference-chapter(it.element) { none } else [
            Chapter #n.first().
          ]
        } else if it.level == 2 [§ #n.at(1).] else [#n.last()°.]
      },
      it.inner(),
    ),
  )

  // A labelled display, `$ ... $ <eq:homomorphism-path-equation>`, is numbered:
  // its counted number, "(17)", stands at the right margin (statements.typ,
  // `numbered-display`); unlabelled displays are unnumbered. The formula
  // counter is the book's own, not Typst's equation counter: a letter tag,
  // "(F)", is not counted, and the Reference Chapter counts its formulas stated
  // in words and its displays together.
  set math.equation(numbering: none, supplement: none)
  show math.equation: set text(font: "STIX Two Math")
  // The book sets "f: X -> Y" and "{z in CC^*: abs(z) = 1}" with the colon
  // as punctuation (LaTeX \colon), not as a relation spaced on both sides.
  // The book prints slanted inequality signs throughout, and capital Greek
  // variables in italic (Δ, Π, Λ), as Springer's mathematics of the period;
  // Typst sets them upright. ∑ and ∏ are other characters and stay upright.
  show math.equation: it => {
    show ":": math.class("punctuation", ":")
    show "≥": sym.gt.eq.slant
    show "≤": sym.lt.eq.slant
    show regex("[\u{0391}-\u{03A9}]"): math.italic
    it
  }
  // Matrices in running text keep the entries at text size, as printed.
  show math.mat: math.display
  // Systems under a brace often hold built-up fractions (formula (18) of
  // Chapter 1, § 2); the default row gap lets them touch.
  set math.cases(gap: 0.6em)

  // Tables of the Reference Chapter: ruled like the book's, set smaller
  // than the text as printed, entries not justified.
  set table(stroke: 0.5pt, inset: (x: 0.45em, y: 0.5em), align: horizon)
  // A row of a table stays on one page, as printed.
  set table.cell(breakable: false)
  show table: set text(size: 10pt)
  show table: set par(justify: false, first-line-indent: 0pt)
  // A display is not split by a page break, as in TeX: Typst's default for
  // block equations (documentation of `math.equation`). The tallest display
  // of the book is a third of the text area.
  //
  // A list of diagrams set as a display, `$ #grid(…) $` (the Dynkin diagrams
  // of Chapter 4, § 2), is the exception: a formula is laid out in one piece,
  // so a long list could not break and left the foot of a page blank. It is
  // set as its grid, centred like a display; a grid breaks between its rows.
  // (The equation's own style makes blocks unbreakable, so the grid is
  // allowed to break explicitly.)
  //
  // A display that is an item of a list, `$ "d)" quad … $` (Problem 28 of
  // Chapter 5, § 1), stands at the left margin with its label, like the
  // items around it, as printed.
  let list-item(body) = {
    let first = if body.func() == [].func() {
      body.children.find(it => it != [ ])
    } else { body }
    (
      first != none
        and first.func() == text
        and first.text.match(regex("^[a-z]\)$")) != none
    )
  }
  show math.equation.where(block: true): it => {
    if it.body.func() == grid and not it.has("label") {
      return {
        set block(breakable: true)
        align(center, it.body)
      }
    }
    set align(start) if list-item(it.body)
    let numbered = (
      it.numbering == none
        and it.has("label")
        and str(it.label).starts-with("eq:")
    )
    if numbered { numbered-display(it) } else { it }
  }

  // References print the counted numbers of their targets (main-defs.typ).
  show: reference-rules
  set footnote(numbering: "1")
  set footnote.entry(separator: line(length: 25%, stroke: 0.5pt))
  body
}
