// Title page. Printed page III (unnumbered).
//
// The layout follows the printed page: distances are measured on it in
// units of 1/300 inch (px) and enlarged by 1.2, the ratio of this edition's
// type to the book's (12 to 10 pt), as are the type sizes. The head of the
// page (authors, title, translator) is measured from the top of the type
// area, the imprint from its foot, and the blank middle of the page takes up
// the difference.
#import "../main-defs.typ": source
#import "springer-emblem.typ": springer-emblem

// 1/300 inch of the printed page, enlarged to this edition.
#let px = 1.2 * 25.4mm / 300

// A line centred on the type area with its baseline `y` below the top of
// the type area, or, with `from-bottom`, `y` above its foot.
#let centred-at(y, from-bottom: false, body) = place(
  if from-bottom { bottom + center } else { top + center },
  dy: if from-bottom { -y } else { y },
  text(top-edge: "baseline", bottom-edge: "baseline", body),
)

// The emblem in its thin frame, as printed. The frame is broken where the
// knight's head and the foot of the emblem cross it. Units are 1/600 inch
// of the printed page, with the origin at the top left corner of the
// frame (the centres of its lines); the emblem's ink box starts 41.5 units
// to the right of the frame and 6.3 units above it.
#let framed-emblem = context {
  let u = px / 2
  let ink = text.fill
  let stroke = (thickness: 4 * u, paint: ink, cap: "square")
  let segment(x0, y0, x1, y1) = place(top + left, line(
    start: (x0 * u, y0 * u),
    end: (x1 * u, y1 * u),
    stroke: stroke,
  ))
  box(width: 420 * u, height: 604 * u, {
    place(top + left, dx: 41.5 * u, dy: -6.3 * u, springer-emblem(
      636 * u,
      ink: ink,
    ))
    segment(0, 0, 0, 604)
    segment(420, 0, 420, 604)
    segment(0, 0, 161.5, 0)
    segment(245.5, 0, 420, 0)
    segment(0, 604, 122.5, 604)
    segment(287.5, 604, 420, 604)
  })
}

#let title-page() = page(header: none, footer: none)[
  #set par(first-line-indent: 0pt, justify: false)
  #source(1, printed: "III")

  // Printed page: the type area begins at 159 px; the author line has its
  // baseline at 283.5 px, the title lines at 629.5 and 764 px, the
  // translator's lines at 1150.5 and 1202.5 px. The names are 52 px apart.
  #centred-at((283.5 - 159) * px, text(size: 23pt)[
    A. L. Onishchik#h(0.65em)E. B. Vinberg
  ])
  #centred-at((629.5 - 159) * px)[
    #set par(leading: (764 - 629.5) * px)
    #text(size: 38.8pt)[Lie Groups\ and Algebraic Groups]
  ]
  #centred-at((1150.5 - 159) * px)[
    #set par(leading: (1202.5 - 1150.5) * px)
    #text(size: 13pt)[Translated from the Russian\ by D. A. Leites]
  ]

  // Printed page: the imprint lines have their baselines at 2353.5, 2421.5
  // and 2488.5 px, the last one set here on the foot of the type area; the
  // bottom line of the frame is at 2264.1 px.
  #place(bottom + center, dy: -(2488.5 - 2264.1) * px, framed-emblem)
  #centred-at(0pt, from-bottom: true)[
    #set par(leading: (2421.5 - 2353.5) * px)
    #text(size: 18pt)[
      Springer-Verlag\
      Berlin Heidelberg New York\
      London Paris Tokyo Hong Kong
    ]
  ]
]
