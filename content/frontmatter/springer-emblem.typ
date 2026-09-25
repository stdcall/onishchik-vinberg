// The Springer emblem of the cover and the title page: the knight above the
// oval with the S monogram. The drawing is a vector trace of the printed
// emblem (assets/springer-emblem.svg); its view box is the ink box, so
// `height` sets the height of the ink. The SVG is drawn in black; `ink`
// prints it in another colour, as on the yellow cover.
#let emblem-source = read("../../assets/springer-emblem.svg")

#let springer-emblem(height, ink: black) = image(
  bytes(emblem-source.replace(
    "fill=\"#000\"",
    "fill=\"" + ink.to-hex() + "\"",
  )),
  format: "svg",
  height: height,
  alt: "Springer emblem",
)
