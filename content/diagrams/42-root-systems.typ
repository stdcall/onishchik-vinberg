// Fig. 1 of Chapter 4, § 2 (page 154): the root systems of rank 1 and 2 in
// CeTZ. Every root is drawn from its length and direction, so the angles
// and the ratios of lengths are exact. The printed figure gives only the
// unit length, the centres of the seven pictures and the sides of the
// labels (in millimetres of the printed page; the canvas enlarges them
// with our larger type).
#import "@preview/cetz:0.5.2"

// A root of `length` (in units of the shortest root) at `angle`. Its `label`
// is set by the arrowhead (by the tip with `tip: true`); `at` is the side of
// the label that faces it.
#let root(length, angle, label: none, at: "south", tip: false) = (
  length: length,
  angle: angle,
  label: label,
  at: at,
  tip: tip,
)

// The roots ±v of each vector v; the labels go with v.
#let pairs(..roots) = {
  roots.pos().map(r => (r, root(r.length, r.angle + 180deg))).flatten()
}

#let rank-two-root-systems = cetz.canvas(length: 1.2mm, {
  import cetz.draw: *
  let unit = 6.2
  let head = 2.8
  set-style(
    stroke: 0.5pt,
    line: (mark: (end: "triangle", fill: black, length: head, width: 1.1)),
    content: (padding: 1),
  )

  // One picture: the roots drawn from `centre`, a tick at the origin of a
  // line, the name of the system to the right of its farthest root.
  let system(centre, name, roots, tick: false, name-at: none) = group({
    set-origin(centre)
    for r in roots {
      let end = r.length * unit
      line((0, 0), (r.angle, end))
      if r.label != none {
        let at = if r.tip { end } else { end - head / 2 }
        content((r.angle, at), r.label, anchor: r.at)
      }
    }
    if tick {
      line((0, -0.8), (0, 0.8), mark: none)
    }
    let reach = calc.max(..roots.map(r => r.length * calc.cos(r.angle)))
    let place = if name-at == none { (reach * unit + 3.5, 4.3) } else {
      name-at
    }
    content(place, name, anchor: "west")
  })

  let (s2, s3) = (calc.sqrt(2), calc.sqrt(3))

  system(
    (20.2, -9.5),
    $A_1$,
    tick: true,
    (
      root(1, 0deg, label: $alpha$),
      root(1, 180deg, label: $-alpha$),
    ),
  )
  system(
    (68.9, -9.5),
    $B C_1$,
    tick: true,
    (
      root(1, 0deg, label: $alpha$),
      root(2, 0deg, label: $2 alpha$),
      root(1, 180deg, label: $-alpha$),
      root(2, 180deg, label: $-2 alpha$),
    ),
  )
  system((14.7, -22.1), $A_1 + A_1$, name-at: (6.4, 7.8), pairs(
    root(1, 0deg, label: $alpha_1$),
    root(1, 90deg, label: $alpha_2$, at: "east"),
  ))
  system((45.4, -22.1), $A_2$, pairs(
    root(1, 0deg, label: $alpha_1$),
    root(1, 60deg),
    root(1, 120deg, label: $alpha_2$, at: "east"),
  ))
  system((76.3, -22.1), $B_2$, pairs(
    root(1, 0deg, label: $alpha_2$, tip: true),
    root(1, 90deg),
    root(s2, 45deg),
    root(s2, 135deg, label: $alpha_1$, at: "north-east"),
  ))
  system((27.4, -40.4), $G_2$, pairs(
    root(1, 0deg, label: $alpha_1$, at: "west", tip: true),
    root(1, 60deg),
    root(1, 120deg),
    root(s3, 30deg),
    root(s3, 90deg),
    root(s3, 150deg, label: $alpha_2$, at: "north"),
  ))
  system((63.2, -40.4), $B C_2$, pairs(
    root(s2, 0deg, label: $alpha_1$),
    root(s2, 90deg),
    root(1, 45deg),
    root(2, 45deg),
    root(1, 135deg, label: $alpha_2$, at: "east"),
    root(2, 135deg, label: $2 alpha_2$, at: "east"),
  ))
})
