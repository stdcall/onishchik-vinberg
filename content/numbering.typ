// The book's numbering: the counters of the numbered objects, where they
// restart, the book's exceptions, and the number of an object at its place.
// statements.typ sets the objects, main-defs.typ prints the references to
// them (`show ref`), book-style.typ restarts the counters at the headings
// and numbers the displayed formulas.
//
// Schemes, as in the book (Preface):
// - problems (pr), theorems (th), lemmas (lem), propositions (prop),
//   exercises (exc) and formulas (eq) are counted inside each section (§),
//   each by its own counter; Chapter 6 has no sections and counts as § 1
//   (`sectionless-chapters`), the introduction of another chapter is in no
//   section.
// - examples (exm), the paragraphs "Example 5." and the list items "5)"
//   alike, are counted inside each subsection (n°).
// - corollaries (cor) are counted after their theorem or proposition,
//   "Corollary 2 of Theorem 3"; a theorem's only corollary is unnumbered,
//   "Corollary.". A lemma does not start a new group: the corollaries after
//   a lemma in a proof belong to the theorem.
// - tables (tab), the figure (fig) and the bibliography (bib) are counted
//   through the book.
// - the formulas of the Reference Chapter are numbered (F1), (F2), …, the
//   items stated in words and the displays together.
// - hints are numbered by their problems.
// Exceptions of the book, each explicit: `examples-through-section`,
// `formula-skips` and `formula-tags` below; the restatement "Theorem 4′."
// takes its number from Theorem 4, `#theorem(prime:
// [@th:coset-conjugacy-by-normalizer])`, and is not counted; the second list
// of examples in one subsection, numbered from 1 again, starts with
// `#eg-restart` (statements.typ).
//
// The label of an object is a stable semantic name that says what the
// object is, `<th:classical-real-forms>`, written at the object in the
// chapter file; it holds no number. The printed number is always counted,
// so a statement inserted in a section renumbers the following ones and
// every reference to them, while the labels stay.

// Chapter 6 has no sections: the whole chapter counts as § 1.
#let sectionless-chapters = (6,)

// (chapter, section, subsection) at a location. The introduction of a
// chapter, before its § 1, is in no section (0), so that a reference from
// there prints the section, "1.4–3.7"; in Chapter 6 it is § 1.
#let place-key(location) = {
  let numbers = counter(heading).at(location)
  let chapter = numbers.at(0, default: 0)
  let section = numbers.at(1, default: 0)
  let subsection = numbers.at(2, default: 0)
  if chapter in sectionless-chapters { section = 1 }
  (chapter, section, subsection)
}

// The Reference Chapter has no number; its heading counter continues as
// chapter 7 (70-reference-chapter.typ).
#let reference-chapter = 7

// Heading level inside which each family is counted: 2, a section (§); 3, a
// subsection (n°); 0, the whole book. The printed number of an object is its
// place down to that level and its own number: (1, 2, 16), Problem 16 of
// Chapter 1, § 2.
#let family-depth = (
  pr: 2,
  th: 2,
  lem: 2,
  prop: 2,
  exc: 2,
  eq: 2,
  exm: 3,
  cor: 2,
  tab: 0,
  fig: 0,
  bib: 0,
)

// Chapter 4, § 1 numbers its examples through the section: Examples 1)–3)
// in 1°, Examples 4–8 in 5°.
#let examples-through-section = ((4, 1),)

// The book has no formula (10) in Chapter 4, § 4: (9) is followed by (11).
#let formula-skips = ("eq:affine-coxeter-relations": 1)

// Displays tagged with a letter instead of a number; they are not counted.
// The diagram (F) of Chapter 1, § 3 defines covering maps.
#let formula-tags = ("eq:covering-lifting-property": "F")

// One counter per family. It restarts at every numbered heading of its level
// or above (`restart-counters`); the corollaries restart at every theorem and
// proposition.
#let family-counter(family) = counter("numbered:" + family)
// Examples counted through the section, for `examples-through-section`.
#let section-examples = counter("numbered:exm-section")

// Called by the heading show rules of book-style.typ at a numbered heading.
#let restart-counters(level) = {
  for (family, depth) in family-depth {
    if depth >= level { family-counter(family).update(0) }
  }
  if level <= 2 { section-examples.update(0) }
}

// A corollary's own number, or `none` for the only corollary of its
// theorem: `(parent, n)`, where `parent` is the record of the theorem or
// proposition the corollary follows.
#let corollary-place(location) = {
  let starts = ("th", "prop")
  let parent = query(selector(<numbered>).before(location))
    .rev()
    .find(it => it.value.at("family", default: none) in starts)
  if parent == none { return (none, none) }
  let group = 0
  for it in query(selector(<numbered>).after(parent.location())) {
    let family = it.value.at("family", default: none)
    if family in starts and it.location() != parent.location() { break }
    if family == "cor" and it.value.kind == "numbered" { group += 1 }
  }
  if group < 2 { return (parent, none) }
  (parent, family-counter("cor").at(location).first())
}

// The record of the object with this label: the metadata its head leaves
// (`record`; headings: book-style.typ). An alias (`#as-corollary`,
// statements.typ) names the record of its family just before it, the
// second role of the statement it follows. `none` if there is no such
// object.
#let numbered-record(target) = {
  if query(target).len() != 1 { return none }
  let record = query(selector(<numbered>).within(target)).at(0, default: none)
  if record != none and record.value.kind == "alias" {
    let family = record.value.family
    record = query(selector(<numbered>).before(record.location()))
      .rev()
      .find(it => (
        it.value.kind == "numbered"
          and it.value.at("family", default: none) == family
      ))
  }
  record
}

// The full number of the object of `family` at `location` (its record, or
// the head that sets it): (1, 2, 16); (4, 4, "4′") for a primed theorem;
// (1, 3, "F") for a letter tag; (7, 1, "F12") in the Reference Chapter;
// (5, 3, 2, 4) for Corollary 4 of Theorem 2 of Chapter 5, § 3; `none` for an
// unnumbered corollary. Counted from the counters at the place, so that the
// references need no other layout pass than the heads. `prime` is the name
// of the label of the statement restated (statements.typ reads it from the
// reference `prime: [@th:…]`), `tag` a letter tag.
#let object-number(family, location, prime: none, tag: none) = {
  let scope = place-key(location).slice(0, family-depth.at(family))
  // The number of a statement from its record (a theorem or proposition).
  let statement-number(record) = object-number(
    record.value.family,
    record.location(),
    prime: record.value.at("prime", default: none),
  )
  if family == "cor" {
    let (parent, n) = corollary-place(location)
    if n == none { return none }
    return (..statement-number(parent), n)
  }
  if tag != none { return (..scope, tag) }
  if prime != none {
    let base = numbered-record(label(prime))
    let number = if base == none { (..scope, "?") } else {
      statement-number(base)
    }
    return (..number.slice(0, -1), str(number.last()) + "′")
  }
  let n = family-counter(family).at(location).first()
  if family == "exm" and scope.slice(0, 2) in examples-through-section {
    n = section-examples.at(location).first()
  }
  let own = if family == "eq" and scope.first() == reference-chapter {
    "F" + str(n)
  } else { n }
  (..scope, own)
}

// The full number of the object of a record: a statement, a formula, a
// table, an entry of the bibliography, a heading; a hint has the number of
// its problem.
#let record-number(record) = {
  let value = record.value
  if value.kind == "hint" { return value.number }
  if value.family == "heading" {
    return place-key(record.location()).slice(0, value.level)
  }
  object-number(
    value.family,
    record.location(),
    prime: value.at("prime", default: none),
    tag: value.at("tag", default: none),
  )
}

// The record of a numbered object, left at its head: `(kind: "numbered",
// family, number)` with the shared label <numbered>; `flags` are those of
// `object-number`. The object's own label is on the object (`#theorem[…]
// <th:classical-real-forms>`, a display, an alias of a second role).
// `number` is for the checks; references count the number from the
// record's place (`record-number`).
#let record(family, ..flags) = context [#metadata((
  kind: "numbered",
  family: family,
  ..flags.named(),
  number: object-number(family, here(), ..flags.named()),
))<numbered>]
