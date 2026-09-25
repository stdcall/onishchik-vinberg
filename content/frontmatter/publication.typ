// Publication page. Printed page IV (unnumbered).
//
// Text as printed. The upper blocks are in the text size, the cataloguing
// data, the copyright notice and the printer's lines in the small size of
// the book (7 to its 10 pt, here 8.5 pt); gaps follow the printed page.
#import "../main-defs.typ": source

#let small = text.with(size: 8.5pt)

#let publication-page() = page(header: none, footer: none)[
  #set par(first-line-indent: 0pt, justify: false, spacing: 1.4em)
  #set align(center)
  #source(2, printed: "IV")
  #v(4mm)

  Arkadij L. Onishchik\
  Department of Mathematics, Yaroslavl University\
  150000 Yaroslavl, USSR

  Ernest B. Vinberg\
  Chair of Algebra, Moscow University\
  119899 Moscow, USSR

  #v(1.4em)
  Title of the Russian edition:\
  _Seminar po gruppam Li i algebraicheskim gruppam,_\
  Publisher Nauka, Moscow 1988

  #v(1.4em)
  This volume is part of the _Springer Series in Soviet Mathematics_\
  Advisers: L.D. Faddeev (Leningrad), R.V. Gamkrelidze (Moscow)

  #v(1fr)
  Mathematics Subject Classification (1980): 22EXX, 17BXX, 20GXX, 81-XX

  #grid(
    columns: 2,
    column-gutter: 3em,
    row-gutter: 0.65em,
    align: left,
    [ISBN-13:978-3-642-74336-8], [e-ISBN-13:978-3-642-74334-4],
    [DOI: 10.1007/978-3-642-74334-4],
  )

  #v(0.6em)
  #small[
    #set par(spacing: 0.68em)
    Library of Congress Cataloging-in-Publication Data\
    Vinberg, Ė.B. (Ėrnest Borisovich)\
    [Seminar po gruppam Li i algebraicheskim gruppam. English]\
    Lie groups and algebraic groups/A.L. Onishchik, E.B. Vinberg; translated
    from the Russian by D.A. Leites.\
    p. cm.---(Springer series in Soviet mathematics)\
    Translation of: Seminar po gruppam Li i algebraicheskim gruppam.\
    Includes bibliographical references.\
    ISBN-13:978-3-642-74336-8 (alk. paper)\
    1\. Lie groups---Congresses. 2. Linear algebraic groups---Congresses.\
    I. Onishchik, A.L. II. Title. III. Series.\
    QA387.V5613 1990 512′.55---dc20 89-21693

    #v(0.6em)
    #align(left, par(justify: true)[
      This work is subject to copyright. All rights are reserved, whether the
      whole or part of the material is concerned, specifically the rights of
      translation, reprinting, reuse of illustrations, recitation, broadcasting,
      reproduction on microfilms or in other ways, and storage in data banks.
      Duplication of this publication or parts thereof is only permitted under
      the provisions of the German Copyright Law of September 9, 1965, in its
      current version, and a copyright fee must always be paid. Violations fall
      under the prosecution act of the German Copyright Law.
    ])

    © Springer-Verlag Berlin Heidelberg 1990\
    Softcover reprint of the hardcover 1st edition 1990

    #v(1.6em)
    Typesetting: Asco Trade Typesetting Ltd., Hong Kong\
    2141/3140-543210---Printed on acid-free paper
  ]
]
