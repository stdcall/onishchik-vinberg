// Dynkin, extended (affine), Kac and Satake diagrams of the book in CeTZ.
//
// A diagram is the Dynkin diagram of an admissible system of vectors
// (Chapter 4, § 2, 5°), drawn from its matrix a_ij = ⟨γ_i|γ_j⟩
// = 2(γ_i, γ_j)/(γ_j, γ_j): vertices i ≠ j are joined by an edge of
// multiplicity a_ij a_ji, and if |a_ij| < |a_ji| the edge points to i, the
// shorter vector. The systems are built from the data of the book:
//
// - `system(type, l)`: the simple roots of Table 1, in its coordinates and
//   with its scalar product, numbered as in the table ("BC" is the
//   non-reduced system of Fig. 1: the simple roots of B_l, 2α_l a root);
// - `affine(type, n, k: 1)`: the system of the affine diagram L_n^(k) of
//   Table 6, a base Π of a root system with the lowest root adjoined as
//   the vertex 0 (the numbering of Table 7): for k = 1 the lowest root
//   -δ; for A_(2l-1)^(2), D_(l+1)^(2), E_6^(2), D_4^(3) the lowest short
//   root of C_l, B_l, F_4, G_2 (Chapter 4, § 2, Example 4); for
//   A_(2l)^(2) the lowest root -2ε_1 of BC_l (Example 5);
// - `direct-sum(..s)`, `double(s)` (two copies exchanged by ω, the
//   Satake diagram of g^R), `join(s, t, i, j)` (a single bond between the
//   vertex i of s and j of t), `dual(s)` (the system Γ^∨: reversed arrows).
//
// The roots are the orbit of the simple roots under the simple reflections
// r_i(β) = β - ⟨β|α_i⟩α_i, in coordinates over the simple roots. The
// highest root found so is checked against δ of Table 1, and the
// coefficients of the linear relation of an affine system (the labels of
// Table 6) against its matrix.
//
// The call gives only the view: where each drawn vertex stands (grid units,
// x to the right, y upwards), whether it is black, its label and the side
// of the label ("above", "below", "left", "right" or a compass direction
// such as "north-west", clear of the edges at a branch vertex):
//
//   #dynkin(system("B", 5), (
//     "1": v(0, 0, label: $1$),
//     "2": v(1, 0, label: $2$),
//     "4": v(3, 0, label: $ell - 1$),
//     "5": v(4, 0, label: $ell$),
//   ))
//
// A series is drawn from one of its members, here B_5 for B_l, the
// smallest one in which each "- ··· -" hides a vertex. The vertices left
// out of the layout are the hidden ones; a gap is drawn between the two
// drawn vertices that a chain of hidden vertices and single bonds joins.
// The edges are never given. `marks: true` labels each vertex with its
// coefficient in the linear relation of an affine system (Table 6);
// `order: m` checks a Kac diagram of an automorphism of order m whose
// labels are 1/m at the black vertices (k Σ n_j s_j = m, Chapter 4, § 4);
// `omega: "symmetry"` makes ω of a Satake diagram the symmetry of the
// diagram (A_l, D_l, E_6, `double`), and the white vertices it exchanges
// are joined by double-headed arrows, arched over the vertices between
// them when these stand in one row.
#import "@preview/cetz:0.5.2"

// Vectors of the spaces of Table 1: arrays of coefficients over the basis.
#let unit-vector(n, i) = range(n).map(k => if k == i - 1 { 1 } else { 0 })
#let add(..vectors) = (
  vectors.pos().reduce((x, y) => x.zip(y).map(((a, b)) => a + b))
)
#let times(c, x) = x.map(a => c * a)
#let minus(x) = times(-1, x)
#let euclidean(x, y) = x.zip(y).map(((a, b)) => a * b).sum()
// ε_1, ..., ε_n with ε_1 + ... + ε_n = 0 and (ε_i, ε_i) = (n - 1)/n,
// (ε_i, ε_j) = -1/n: (Σ a_i ε_i, Σ b_j ε_j) = Σ a_i b_i - Σ a_i Σ b_j / n.
#let reduced(n) = (x, y) => euclidean(x, y) - x.sum() * y.sum() / n

// Table 1: the simple roots α_1, ..., α_l, the highest root δ and the
// scalar product; `symmetry` is the involutive automorphism of the diagram
// (i -> symmetry.at(i - 1)).
#let table-1(type, l) = {
  // α_i = ε_i - ε_(i+1) for i < count.
  let chain(e, count) = range(1, count).map(i => add(e(i), minus(e(i + 1))))
  if type == "A" {
    let e(i) = unit-vector(l + 1, i)
    (
      form: reduced(l + 1),
      simple: chain(e, l + 1),
      highest: add(e(1), minus(e(l + 1))),
      symmetry: range(1, l + 1).map(i => l + 1 - i),
    )
  } else if type in ("B", "BC", "C", "D") {
    let e(i) = unit-vector(l, i)
    let last = if type == "C" { times(2, e(l)) } else if type == "D" {
      add(e(l - 1), e(l))
    } else { e(l) }
    (
      form: euclidean,
      simple: chain(e, l) + (last,),
      // δ of B_l (l >= 2), C_l, D_l (l >= 3); BC_l is not in the table.
      highest: if type == "C" { times(2, e(1)) } else if (
        (type == "B" and l >= 2) or (type == "D" and l >= 3)
      ) { add(e(1), e(2)) },
      symmetry: if type == "D" { range(1, l - 1) + (l, l - 1) },
    )
  } else if type == "E" and l == 6 {
    // ε_1, ..., ε_6 as for A_5 and ε orthogonal to them, (ε, ε) = 1/2.
    let e(i) = unit-vector(7, i)
    (
      form: (x, y) => (
        reduced(6)(x.slice(0, 6), y.slice(0, 6)) + x.at(6) * y.at(6) / 2
      ),
      simple: chain(e, 6) + (add(e(4), e(5), e(6), e(7)),),
      highest: times(2, e(7)),
      symmetry: (5, 4, 3, 2, 1, 6),
    )
  } else if type == "E" and l == 7 {
    let e(i) = unit-vector(8, i)
    (
      form: reduced(8),
      simple: chain(e, 7) + (add(e(5), e(6), e(7), e(8)),),
      highest: add(minus(e(7)), e(8)),
    )
  } else if type == "E" and l == 8 {
    let e(i) = unit-vector(9, i)
    (
      form: reduced(9),
      simple: chain(e, 8) + (add(e(6), e(7), e(8)),),
      highest: add(e(1), minus(e(9))),
    )
  } else if type == "F" and l == 4 {
    let e(i) = unit-vector(4, i)
    (
      form: euclidean,
      simple: (
        times(1 / 2, add(e(1), minus(e(2)), minus(e(3)), minus(e(4)))),
        e(4),
        add(e(3), minus(e(4))),
        add(e(2), minus(e(3))),
      ),
      highest: add(e(1), e(2)),
    )
  } else if type == "G" and l == 2 {
    let e(i) = unit-vector(3, i)
    (
      form: reduced(3),
      simple: (minus(e(2)), add(e(2), minus(e(3)))),
      highest: add(e(1), minus(e(3))),
    )
  } else {
    panic("Table 1 has no system " + type + str(l))
  }
}

#let integral(x) = {
  assert(calc.abs(x - calc.round(x)) < 1e-9, message: "not an integer")
  int(calc.round(x))
}

// A system of vectors given by its Gram matrix: the matrix a_ij, checked to
// be that of an admissible system, and the checks of the optional data.
#let make(names, gram, symmetry: none, marks: none, ..data) = {
  let n = names.len()
  let matrix = range(n).map(i => range(n).map(j => integral(
    2 * gram.at(i).at(j) / gram.at(j).at(j),
  )))
  for i in range(n) {
    for j in range(n) {
      let (aij, aji) = (matrix.at(i).at(j), matrix.at(j).at(i))
      assert(
        i == j or (aij <= 0 and (aij == 0) == (aji == 0)),
        message: "not an admissible system",
      )
    }
  }
  if symmetry != none {
    assert(
      range(n).all(i => symmetry.at(symmetry.at(i)) == i),
      message: "the symmetry is not an involution",
    )
    assert(
      range(n).all(i => range(n).all(j => (
        matrix.at(symmetry.at(i)).at(symmetry.at(j)) == matrix.at(i).at(j)
      ))),
      message: "the symmetry is not an automorphism of the diagram",
    )
  }
  if marks != none {
    // Σ n_i γ_i = 0 gives Σ_i n_i a_ij = 0 for every j.
    assert(
      range(n).all(j => (
        range(n).map(i => marks.at(i) * matrix.at(i).at(j)).sum() == 0
      )),
      message: "the marks are not the linear relation of the system",
    )
  }
  (
    names: names,
    gram: gram,
    matrix: matrix,
    symmetry: symmetry,
    marks: marks,
    ..data.named(),
  )
}

// The system of the simple roots of Table 1.
#let system(type, l) = {
  let data = table-1(type, l)
  let simple = data.simple
  let symmetry = data.at("symmetry", default: none)
  make(
    range(1, simple.len() + 1).map(str),
    simple.map(x => simple.map(y => (data.form)(x, y))),
    symmetry: if symmetry != none { symmetry.map(i => i - 1) },
    vectors: simple,
    form: data.form,
    highest: data.highest,
    doubled: if type == "BC" { (l - 1,) } else { () },
  )
}

// The roots: the orbit of the simple roots (and of the doubled ones) under
// the simple reflections, in coordinates over the simple roots.
#let roots(s) = {
  let a = s.matrix
  let n = a.len()
  let simple(i, c) = range(n).map(k => if k == i { c } else { 0 })
  let queue = range(n).map(i => simple(i, 1))
  queue += s.at("doubled", default: ()).map(i => simple(i, 2))
  let found = (:)
  while queue.len() > 0 {
    let beta = queue.pop()
    let key = beta.map(str).join(",")
    if key not in found {
      found.insert(key, beta)
      for i in range(n) {
        // ⟨β|α_i⟩ = Σ_j k_j a_ji.
        let c = range(n).map(j => beta.at(j) * a.at(j).at(i)).sum()
        queue.push(range(n).map(j => beta.at(j) - if j == i { c } else { 0 }))
      }
    }
  }
  found.values()
}

// The lowest root (of the shortest ones with `short: true`).
#let lowest(s, short: false) = {
  let g = s.gram
  let n = g.len()
  let length(k) = range(n)
    .map(i => range(n).map(j => k.at(i) * k.at(j) * g.at(i).at(j)).sum())
    .sum()
  let found = roots(s)
  if short {
    let shortest = calc.min(..found.map(length))
    found = found.filter(k => length(k) < shortest + 1e-9)
  }
  let bottom = calc.min(..found.map(k => k.sum()))
  let lowest = found.filter(k => k.sum() == bottom)
  assert(lowest.len() == 1, message: "no unique lowest root")
  lowest.first()
}

// The base of `s` with the root `root` (over the simple roots) adjoined as
// the vertex 0; the linear relation is root - Σ k_i α_i = 0.
#let extend(s, root, k) = {
  let g = s.gram
  let n = g.len()
  let column = range(n).map(j => range(n)
    .map(i => root.at(i) * g.at(i).at(j))
    .sum())
  let square = range(n).map(j => root.at(j) * column.at(j)).sum()
  make(
    ("0",) + s.names,
    ((square,) + column,) + range(n).map(i => (column.at(i),) + g.at(i)),
    marks: (1,) + root.map(c => -c),
    k: k,
  )
}

// The twisted diagrams L_n^(k), k > 1: the base (type, rank) and whether the
// root adjoined to it is the lowest short one (Chapter 4, § 2, Examples 4
// and 5) or the lowest one.
#let twisted(type, n, k) = {
  let l = calc.div-euclid(n + 1, 2)
  if type == "A" and k == 2 and calc.even(n) { return ("BC", l, false) }
  if type == "A" and k == 2 { return ("C", l, true) }
  if type == "D" and k == 2 { return ("B", n - 1, true) }
  if type == "E" and n == 6 and k == 2 { return ("F", 4, true) }
  if type == "D" and n == 4 and k == 3 { return ("G", 2, true) }
  panic("no affine diagram " + type + str(n) + "^(" + str(k) + ")")
}

// The system of the affine diagram L_n^(k) of Table 6.
#let affine(type, n, k: 1) = {
  if k > 1 {
    let (base, l, short) = twisted(type, n, k)
    let s = system(base, l)
    return extend(s, lowest(s, short: short), k)
  }
  let s = system(type, n)
  let root = lowest(s)
  if s.highest != none {
    // The highest root -root and δ are one vector: |δ + root|² = 0.
    let difference = add(
      s.highest,
      ..s
        .vectors
        .zip(root)
        .map(((x, c)) => (
          times(c, x)
        )),
    )
    assert(
      (s.form)(difference, difference) < 1e-9,
      message: "δ of Table 1 is not the highest root of " + type + str(n),
    )
  }
  extend(s, root, k)
}

// The direct sum of systems, numbered one after another.
#let direct-sum(..systems) = {
  let parts = systems.pos()
  let n = parts.map(s => s.names.len()).sum()
  let gram = ()
  let before = 0
  for s in parts {
    let m = s.names.len()
    for row in s.gram {
      gram.push(
        range(before).map(_ => 0) + row + range(n - before - m).map(_ => 0),
      )
    }
    before += m
  }
  make(range(1, n + 1).map(str), gram)
}

// Two copies of a system, exchanged by the symmetry.
#let double(s) = {
  let m = s.names.len()
  let sum = direct-sum(s, s)
  make(
    sum.names,
    sum.gram,
    symmetry: range(2 * m).map(i => calc.rem(i + m, 2 * m)),
  )
}

// The systems s and t joined by a single bond between the vertex i of s and
// the vertex j of t (t rescaled so that the two vectors are equally long).
#let join(s, t, i, j) = {
  let (p, q) = (s.names.position(x => x == i), t.names.position(x => x == j))
  let (m, n) = (s.names.len(), t.names.len())
  let c = s.gram.at(p).at(p) / t.gram.at(q).at(q)
  let sum = direct-sum(s, make(t.names, t.gram.map(row => times(c, row))))
  let gram = sum.gram
  let bond = -s.gram.at(p).at(p) / 2
  gram.at(p).at(m + q) = bond
  gram.at(m + q).at(p) = bond
  make(sum.names, gram)
}

// The dual system Γ^∨, γ^∨ = 2γ/(γ, γ): its matrix is the transpose.
#let dual(s) = {
  let g = s.gram
  let n = g.len()
  make(
    s.names,
    range(n).map(i => range(n).map(j => (
      4 * g.at(i).at(j) / (g.at(i).at(i) * g.at(j).at(j))
    ))),
    symmetry: s.symmetry,
  )
}

// A drawn vertex: its place and its look.
#let v(x, y, black: false, label: none, at: "above") = (
  x: x,
  y: y,
  black: black,
  label: label,
  at: at,
)

// Where a label stands and which side of it faces the vertex.
#let label-sides = (
  above: ("north", "south"),
  below: ("south", "north"),
  left: ("west", "east"),
  right: ("east", "west"),
  north: ("north", "south"),
  south: ("south", "north"),
  east: ("east", "west"),
  west: ("west", "east"),
  north-west: ("north-west", "south-east"),
  north-east: ("north-east", "south-west"),
  south-west: ("south-west", "north-east"),
  south-east: ("south-east", "north-west"),
)

// The edges of the drawn part of the diagram of `s`: bonds, gaps and the
// arrows of ω.
#let edges(s, layout, omega) = {
  let (names, a) = (s.names, s.matrix)
  let n = names.len()
  let shown = names.map(name => name in layout)
  let black(i) = shown.at(i) and layout.at(names.at(i)).black
  let found = ()
  for i in range(n) {
    for j in range(i + 1, n) {
      let (aij, aji) = (a.at(i).at(j), a.at(j).at(i))
      if shown.at(i) and shown.at(j) and aij != 0 {
        // From the longer vector to the shorter one: to i if |a_ij| < |a_ji|.
        let (from, to) = if calc.abs(aij) < calc.abs(aji) { (j, i) } else {
          (i, j)
        }
        found.push((
          kind: "bond",
          a: names.at(from),
          b: names.at(to),
          n: aij * aji,
          to: if aij != aji { names.at(to) },
        ))
      }
    }
  }
  // Each chain of hidden vertices becomes a gap between its drawn ends.
  let seen = ()
  for start in range(n) {
    if not shown.at(start) and start not in seen {
      let chain = (start,)
      let k = 0
      while k < chain.len() {
        let i = chain.at(k)
        for j in range(n) {
          if (
            j != i and a.at(i).at(j) != 0 and not shown.at(j) and j not in chain
          ) {
            chain.push(j)
          }
        }
        k += 1
      }
      seen += chain
      for i in chain {
        let next = range(n).filter(j => j != i and a.at(i).at(j) != 0)
        assert(
          next.len() == 2 and next.all(j => a.at(i).at(j) * a.at(j).at(i) == 1),
          message: "a gap hides more than a chain of single bonds",
        )
      }
      let ends = range(n).filter(j => (
        shown.at(j) and chain.any(i => a.at(i).at(j) != 0)
      ))
      assert(ends.len() == 2, message: "a gap must join two drawn vertices")
      found.push((
        kind: "gap",
        a: names.at(ends.at(0)),
        b: names.at(ends.at(1)),
      ))
    }
  }
  if omega == "symmetry" {
    let sigma = s.symmetry
    assert(sigma != none, message: "the diagram has no symmetry")
    for i in range(n) {
      let j = sigma.at(i)
      if shown.at(i) and not black(i) and j != i {
        assert(shown.at(j), message: "ω(" + names.at(i) + ") is not drawn")
      }
      if shown.at(i) and shown.at(j) {
        assert(black(i) == black(j), message: "ω moves a black vertex")
        if i < j and not black(i) {
          found.push((kind: "pair", a: names.at(i), b: names.at(j)))
        }
      }
    }
  } else {
    assert(omega == none, message: "unknown ω")
  }
  found
}

#let dynkin(
  s,
  layout,
  omega: none,
  marks: false,
  order: none,
  unit: 7.5mm,
  radius: 0.85mm,
) = {
  for name in layout.keys() {
    assert(name in s.names, message: "no vertex " + name)
  }
  if order != none {
    // The hidden vertices of a series are white.
    let labelled = s
      .names
      .zip(s.marks)
      .filter(((name, _)) => (
        name in layout and layout.at(name).black
      ))
    assert(
      s.k * labelled.map(((_, mark)) => mark).sum(default: 0) == order,
      message: "not a Kac diagram of an automorphism of order " + str(order),
    )
  }
  let labels = if marks {
    s.names.zip(s.marks).map(((name, mark)) => (name, $#mark$)).to-dict()
  } else { (:) }
  let found = edges(s, layout, omega)
  cetz.canvas(length: 1mm, {
    import cetz.draw: *
    set-style(stroke: 0.5pt, content: (padding: 0.9))
    let u = unit / 1mm
    let r = radius / 1mm
    let at(name) = {
      let vertex = layout.at(name)
      (vertex.x * u, vertex.y * u)
    }
    // Direction, normal and length of the segment between two vertices.
    let frame(a, b) = {
      let (x1, y1) = at(a)
      let (x2, y2) = at(b)
      let length = calc.sqrt(calc.pow(x2 - x1, 2) + calc.pow(y2 - y1, 2))
      let d = ((x2 - x1) / length, (y2 - y1) / length)
      (from: (x1, y1), d: d, n: (-d.at(1), d.at(0)), length: length)
    }
    // Point at distance s along the segment, shifted by t along the normal.
    let along(f, s, t) = (
      f.from.at(0) + s * f.d.at(0) + t * f.n.at(0),
      f.from.at(1) + s * f.d.at(1) + t * f.n.at(1),
    )
    // Where a line at normal offset t meets the circle of a vertex.
    let inset(t) = calc.sqrt(calc.max(r * r - t * t, 0))
    // Arrowhead with its tip at distance `tip` along the segment, pointing
    // forwards, barbs `half` off the axis.
    let arrowhead(f, tip, half) = {
      let back = tip - 1.5
      line(along(f, back, half), along(f, tip, 0), along(f, back, -half))
    }

    for edge in found {
      let f = frame(edge.a, edge.b)
      if edge.kind == "bond" and edge.n <= 3 {
        let spacing = 0.42
        for i in range(edge.n) {
          let t = (i - (edge.n - 1) / 2) * spacing
          line(along(f, inset(t), t), along(f, f.length - inset(t), t))
        }
        if edge.to != none {
          // The arrowhead of a multiple bond touches the shorter root.
          arrowhead(f, f.length - r - 0.25, (edge.n - 1) / 2 * spacing + 0.75)
        }
      } else if edge.kind == "bond" {
        // The rank-one affine bond: four evenly spaced lines, the outer two
        // a third of the radius outside the vertices (after the book).
        let outer = 4 / 3 * r
        let inner = outer / 3
        let around(s) = arc-through(
          along(f, s, outer),
          along(f, s - outer, 0),
          along(f, s, -outer),
        )
        around(0)
        if edge.to == none {
          // A_1^(1): the outer lines close round both vertices.
          arc-through(
            along(f, f.length, outer),
            along(f, f.length + outer, 0),
            along(f, f.length, -outer),
          )
          for s in (1, -1) {
            line(along(f, 0, s * outer), along(f, f.length, s * outer))
            line(
              along(f, inset(inner), s * inner),
              along(f, f.length - inset(inner), s * inner),
            )
          }
        } else {
          // A_2^(2): the outer lines meet in an arrowhead at the shorter root.
          let tip = f.length - r - 0.25
          let back = tip - 1.5
          let half = outer + 0.35
          let edge-at(t) = back + (tip - back) * (half - t) / half
          for s in (1, -1) {
            line(along(f, 0, s * outer), along(f, edge-at(outer), s * outer))
            line(
              along(f, inset(inner), s * inner),
              along(f, edge-at(inner), s * inner),
            )
          }
          line(along(f, back, half), along(f, tip, 0), along(f, back, -half))
        }
      } else if edge.kind == "gap" {
        let stub = calc.min(1.6, f.length / 4)
        line(along(f, r, 0), along(f, r + stub, 0))
        line(along(f, f.length - r - stub, 0), along(f, f.length - r, 0))
        for k in (-1, 0, 1) {
          circle(
            along(f, f.length / 2 + k * 1.4, 0),
            radius: 0.22,
            fill: black,
            stroke: none,
          )
        }
      } else if edge.kind == "pair" {
        // Satake arrows have filled heads in the book.
        let marks = (start: ">", end: ">", fill: black, scale: 0.55)
        let (p, q) = (layout.at(edge.a), layout.at(edge.b))
        let (left, right) = (calc.min(p.x, q.x), calc.max(p.x, q.x))
        let between = layout
          .values()
          .filter(w => w.y == p.y and left < w.x and w.x < right)
        if p.y == q.y and between.len() > 0 {
          // Over a row the arrow arches from above one end to above the
          // other; its tips stand 0.25 above the row and 0.1 inside the end
          // vertices, and it rises 0.2 for every step of its span, plus
          // 0.05 (as in the book: 0.45 over two steps, 0.85 over four).
          let top = 0.2 * (right - left) + 0.05
          arc-through(
            ((left + 0.1) * u, (p.y + 0.25) * u),
            ((left + right) / 2 * u, (p.y + top) * u),
            ((right - 0.1) * u, (p.y + 0.25) * u),
            mark: marks,
          )
        } else {
          line(
            along(f, r + 0.6, 0),
            along(f, f.length - r - 0.6, 0),
            mark: marks,
          )
        }
      }
    }
    for (name, vertex) in layout {
      circle(
        at(name),
        radius: r,
        fill: if vertex.black { black } else { white },
        name: name,
      )
      let label = labels.at(name, default: vertex.label)
      assert(
        not marks or vertex.label == none,
        message: "a label besides the mark",
      )
      if label != none {
        let (side, anchor) = label-sides.at(vertex.at)
        content(name + "." + side, text(size: 0.75em, label), anchor: anchor)
      }
    }
  })
}
