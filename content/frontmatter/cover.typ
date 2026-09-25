// Cover reconstructed from an image of the cover of the 1990 softcover
// reprint (827 x 1252 px): the yellow field, the author line and the white
// rule, the title in heavy brown-red lettering, and the Springer emblem with
// "Springer-Verlag" at the foot. No raster image is embedded.
//
// Positions and sizes are measured off the image in its pixels and
// converted with one scale, the image width to the page width. The image
// has the proportions of the original trim, which is taller than this edition's
// page; so the elements at the head are measured from the top edge and
// those at the foot from the bottom edge, and the difference is taken up by
// the empty yellow field between them.
//
// The author line and the imprint are Helvetica; TeX Gyre Heros is its free
// clone. The title lettering is a condensed ultra-heavy grotesque with
// soft, slightly irregular edges, a single-storey "a" and "g" and a spurred
// "G". Of the free heavy rounded grotesques compared with the image (Rubik,
// Lilita One, Fredoka, Titan One, Asap Condensed and others) Londrina Solid
// Black is the closest in letterforms and proportions (x-height, stem
// weight, line lengths); it is a little narrower, which the tracking makes
// up.
#import "springer-emblem.typ": springer-emblem

#let page-width = 176mm
#let page-height = 250mm
// Image size in pixels and the length of one image pixel on this page.
#let image-width = 827
#let image-height = 1252
#let px = page-width / image-width

// Colours sampled from the image: the field, the dark ink of the author
// line, the emblem and the imprint (black over yellow), and the title.
#let field = rgb(240, 181, 1)
#let ink = rgb(60, 45, 2)
#let title-colour = rgb(137, 73, 63)

// Cap heights of the fonts, as fractions of the font size.
#let heros-cap = 0.729
#let londrina-cap = 0.722

// Place `body` with its first baseline at image pixel `y` from the top (or,
// with `from-bottom`, `y` measured from the top of the image but kept at the
// same distance from the bottom edge) and its left edge at pixel `x`.
#let at-baseline(x, y, from-bottom: false, body) = {
  let dy = if from-bottom {
    page-height - (image-height - y) * px
  } else { y * px }
  place(top + left, dx: x * px, dy: dy, text(
    top-edge: "baseline",
    bottom-edge: "baseline",
    body,
  ))
}

#let cover() = page(
  width: page-width,
  height: page-height,
  margin: 0pt,
  header: none,
  footer: none,
  numbering: none,
  fill: field,
)[
  #set text(font: "TeX Gyre Heros", lang: "en", fill: ink)
  #set par(first-line-indent: 0pt, justify: false)

  // Author line: cap height 36.5 px, baseline at 78.5 px, left edge at
  // 87 px, right edge at 686 px. The phototype is set tight: the initials
  // are close (ink gaps of 12-13 px after the points, a third of a word
  // space) and the letters slightly tracked in; the names are 28 px apart.
  #at-baseline(87, 78.5, text(
    size: 36.5 * px / heros-cap,
    spacing: 33%,
    tracking: -0.01em,
  )[A. L. Onishchik#h(23 * px)E. B. Vinberg])

  // White rule under the authors: centred at 117 px, 3.6 px thick, from the
  // left edge of the author line to the right edge of the cover.
  #place(top + left, dx: 87 * px, dy: 117.1 * px, line(
    length: page-width - 87 * px,
    stroke: 3.6 * px + white,
  ))

  // Title: cap height 88.5 px, baselines at 234.5, 346.5 and 456.5 px,
  // left edge of the ink at 84 px (the text origin is 1 px further left, by
  // the side bearing of the letters). The tracking brings the lines to their
  // printed lengths (512, 677 and 348 px).
  #at-baseline(83, 234.5)[
    #set par(leading: 111 * px)
    #text(
      font: "Londrina Solid",
      weight: "black",
      size: 88.5 * px / londrina-cap,
      tracking: 0.03em,
      fill: title-colour,
    )[Lie Groups\ and Algebraic\ Groups]
  ]

  // Emblem: ink box 86-146 px across, 1093-1206 px down.
  #place(
    top + left,
    dx: 86 * px,
    dy: page-height - (image-height - 1093) * px,
    springer-emblem(114 * px, ink: ink),
  )

  // Imprint: cap height 25.5 px, baseline at 1170.5 px, left edge at 172 px.
  #at-baseline(172, 1170.5, from-bottom: true, text(
    size: 25.5 * px / heros-cap,
  )[Springer-Verlag])
]
