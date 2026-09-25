// Reference Chapter, opening. Printed page 289.
#import "main-defs.typ": *
#import "statements.typ": *

#source(304)
#heading(numbering: none)[Reference Chapter] <ch:reference>
// The Reference Chapter has no number but its sections are numbered; the
// counter continues as chapter 7 (`reference-chapter`, main-defs.typ) so
// that its labels do not collide with Chapter 6 (which counts as § 1 in
// references) and its formulas are numbered (F1), (F2), ...
#counter(heading).update((reference-chapter,))
