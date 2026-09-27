// Fig. 1 of Chapter 4, § 2 (page 154): the root systems of rank 1 and 2 in
// CeTZ. Each system is given by its simple roots (Table 1, and their sums
// and doubles, dynkin.typ); its roots are their orbit under the simple
// reflections, checked against the axioms of a root system, and are drawn
// from the lengths of the simple roots and the angle between them. The
// printed figure gives only the view: the unit length (the shortest root),
// the centres of the seven pictures, the direction of α_1 and the side of
// α_2, and the sides of the labels (in millimetres of the printed page; the
// canvas enlarges them with our larger type).
#import "@preview/cetz:0.5.2"
#import "dynkin.typ": direct-sum, roots, system

// The label of the root with coefficients `k` over the simple roots, set by
// its arrowhead (by the tip with `tip: true`); `at` is the side of the label
// that faces it.
#let root-label(k, body, at: "south", tip: false) = (
  k: k,
  body: body,
  at: at,
  tip: tip,
)

#let rank-two-root-systems = cetz.canvas(length: 1.2mm, {
  import cetz.draw: *
  let unit = 6.2
  let head = 2.8
  set-style(
    stroke: 0.5pt,
    line: (mark: (end: "triangle", fill: black, length: head, width: 1.1)),
    content: (padding: 1),
  )

  // One picture: the roots of `s` drawn from `centre`, α_1 in the direction
  // `turn`, α_2 on the side `sense` of it (1 counterclockwise), a tick at
  // the origin of a line, the name of the system to the right of its
  // farthest root.
  let picture(
    centre,
    name,
    s,
    turn: 0deg,
    sense: 1,
    labels: (),
    tick: false,
    name-at: none,
  ) = group({
    set-origin(centre)
    let g = s.gram
    let n = g.len()
    let product(x, y) = range(n)
      .map(i => range(n).map(j => x.at(i) * y.at(j) * g.at(i).at(j)).sum())
      .sum()
    let found = roots(s)
    // The axioms: r_γ(β) = β - ⟨β|γ⟩γ is a root, ⟨β|γ⟩ is an integer.
    for beta in found {
      for gamma in found {
        let pairing = 2 * product(beta, gamma) / product(gamma, gamma)
        assert(
          calc.abs(pairing - calc.round(pairing)) < 1e-9,
          message: "⟨β|γ⟩ is not an integer",
        )
        let image = beta
          .zip(gamma)
          .map(((b, c)) => b - int(calc.round(pairing)) * c)
        assert(image in found, message: "Δ is not closed under reflections")
      }
    }
    // The simple roots in the plane, the shortest root `unit` long.
    let stretch = unit / calc.sqrt(calc.min(..found.map(k => product(k, k))))
    let directions = (turn,)
    if n == 2 {
      let cosine = g.at(0).at(1) / calc.sqrt(g.at(0).at(0) * g.at(1).at(1))
      directions.push(turn + sense * calc.acos(cosine))
    }
    let simple = directions
      .enumerate()
      .map(((i, a)) => {
        let length = calc.sqrt(g.at(i).at(i)) * stretch
        (length * calc.cos(a), length * calc.sin(a))
      })
    let point(k) = (0, 1).map(c => range(n)
      .map(i => k.at(i) * simple.at(i).at(c))
      .sum())
    for k in found {
      line((0, 0), point(k))
    }
    for l in labels {
      let (x, y) = point(l.k)
      let length = calc.sqrt(x * x + y * y)
      let at = if l.tip { 1 } else { 1 - head / 2 / length }
      content((x * at, y * at), l.body, anchor: l.at)
    }
    if tick {
      line((0, -0.8), (0, 0.8), mark: none)
    }
    let reach = calc.max(..found.map(k => point(k).at(0)))
    content(
      if name-at == none { (reach + 3.5, 4.3) } else { name-at },
      name,
      anchor: "west",
    )
  })

  picture(
    (20.2, -9.5),
    $A_1$,
    system("A", 1),
    tick: true,
    labels: (
      root-label((1,), $alpha$),
      root-label((-1,), $-alpha$),
    ),
  )
  picture(
    (68.9, -9.5),
    $B C_1$,
    system("BC", 1),
    tick: true,
    labels: (
      root-label((1,), $alpha$),
      root-label((2,), $2 alpha$),
      root-label((-1,), $-alpha$),
      root-label((-2,), $-2 alpha$),
    ),
  )
  picture(
    (14.7, -22.1),
    $A_1 + A_1$,
    direct-sum(system("A", 1), system("A", 1)),
    name-at: (6.4, 7.8),
    labels: (
      root-label((1, 0), $alpha_1$),
      root-label((0, 1), $alpha_2$, at: "east"),
    ),
  )
  picture(
    (45.4, -22.1),
    $A_2$,
    system("A", 2),
    labels: (
      root-label((1, 0), $alpha_1$),
      root-label((0, 1), $alpha_2$, at: "east"),
    ),
  )
  picture(
    (76.3, -22.1),
    $B_2$,
    system("B", 2),
    turn: 135deg,
    sense: -1,
    labels: (
      root-label((0, 1), $alpha_2$, tip: true),
      root-label((1, 0), $alpha_1$, at: "north-east"),
    ),
  )
  picture(
    (27.4, -40.4),
    $G_2$,
    system("G", 2),
    labels: (
      root-label((1, 0), $alpha_1$, at: "west", tip: true),
      root-label((0, 1), $alpha_2$, at: "north"),
    ),
  )
  picture(
    (63.2, -40.4),
    $B C_2$,
    system("BC", 2),
    labels: (
      root-label((1, 0), $alpha_1$),
      root-label((0, 1), $alpha_2$, at: "east"),
      root-label((0, 2), $2 alpha_2$, at: "east"),
    ),
  )
})
