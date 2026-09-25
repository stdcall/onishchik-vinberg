// The whole book in reading order.
#set document(
  title: "Lie Groups and Algebraic Groups",
  author: ("A. L. Onishchik", "E. B. Vinberg"),
  date: none,
)
#import "book-style.typ": book-style
#import "frontmatter/cover.typ": cover
#cover()
#show: book-style

// Front matter in capital roman numerals, as printed. The half-title
// (I-II) is not reproduced; the title page is III.
#set page(numbering: "I")
#counter(page).update(3)
#import "frontmatter/title.typ": title-page
#title-page()
#import "frontmatter/publication.typ": publication-page
#publication-page()
#include "00-preface.typ"
#heading(level: 1, numbering: none, outlined: false)[Contents]
#outline(title: none, depth: 3)
#include "frontmatter/symbols.typ"

#set page(numbering: "1")
#counter(page).update(1)
#include "10-lie-groups.typ"
#include "11-background.typ"
#include "12-tangent-algebra.typ"
#include "13-connectedness.typ"
#include "14-derived-algebra.typ"
#include "20-algebraic-varieties.typ"
#include "21-affine-varieties.typ"
#include "22-projective-varieties.typ"
#include "23-dimension.typ"
#include "30-algebraic-groups.typ"
#include "31-background.typ"
#include "32-commutative-solvable.typ"
#include "33-tangent-algebra.typ"
#include "34-compact-linear-groups.typ"
#include "40-complex-semisimple.typ"
#include "41-preliminaries.typ"
#include "42-root-systems.typ"
#include "42-root-systems-2.typ"
#include "43-existence-uniqueness.typ"
#include "44-automorphisms.typ"
#include "50-real-semisimple.typ"
#include "51-real-forms.typ"
#include "52-compact-reductive.typ"
#include "53-cartan-decomposition.typ"
#include "54-real-root-decomposition.typ"
#include "60-levi-decomposition.typ"
#include "70-reference-chapter.typ"
#include "71-useful-formulae.typ"
#include "72-tables-1-4.typ"
#include "73-table-5.typ"
#include "74-tables-6-7.typ"
#include "75-table-8.typ"
#include "76-tables-9-10.typ"
#include "80-bibliography.typ"
#include "90-index.typ"
#import "main-defs.typ": editorial-bibliography
#editorial-bibliography
