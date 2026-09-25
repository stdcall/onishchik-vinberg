import Mathlib.RepresentationTheory.Basic
import Mathlib.Tactic.Group
import Mathlib.Tactic.Module

/-!
# Chapter 5, § 2, Lemma 2 (Problems 13 and 14): splitting by averaging

Place in the book: Onishchik, Vinberg, *Lie Groups and Algebraic Groups*
(Springer, 1990), Chapter 5, § 2, subsection "Lie Groups with Compact Tangent
Algebras", Lemma 2 ("Let `G` be a Lie group with a normal vector Lie
subgroup `A` of finite index. Then `G = A ⋌ L`, where `L` is a finite
subgroup") and its proof: formulas (4)–(8), Problems 13 and 14.
Our file `content/52-compact-reductive.typ`, `#lemma(2)`, `<eq:5.2.4>` to
`<eq:5.2.8>`, `#problem(13)`, `#problem(14)`.

The proof: `L₀ = G/A`, `π : G → L₀`, a section `ψ : L₀ → G` (`πψ = id`),
`ψ(x)ψ(y) = f(x, y) ψ(xy)` with `f(x, y) ∈ A` (5); `φ(x) = h(x)ψ(x)` (4) is a
homomorphism iff `f(x, y) = ψ(x) h(y)⁻¹ ψ(x)⁻¹ h(x)⁻¹ h(xy)` (6); in additive
notation for `A`, with `R₀(x)` the action of `ψ(x)` on `A` by conjugation,
(6) reads `f(x, y) = h(xy) - h(x) - R₀(x) h(y)` (8). Problem 13:
`f(x, yz) + R₀(x) f(y, z) = f(xy, z) + f(x, y)`. Problem 14:
`h(x) = -(1/|L₀|) ∑_(y ∈ L₀) f(x, y)` satisfies (8).

Mapping of the notation:
* multiplicative part: `G` ↦ any group `G`, `L₀` ↦ any group `L₀`,
  `ψ, h : L₀ → G` ↦ `ψ h`, `f` ↦ `cocycle ψ` (defined by (5));
* additive part: `L₀` ↦ a finite group, `A` ↦ a module over a field `k` of
  characteristic zero (the book: a real vector space), `R₀` ↦ a
  representation `ρ : Representation k L₀ A`, `f : L₀ → L₀ → A` satisfying
  Problem 13 (hypothesis `hf`), `h` ↦ `avg f`, the formula of Problem 14.

Covered: (5) as a definition of `f`; the equivalence of `φ(xy) = φ(x)φ(y)`
and (6) in any group; the multiplicative form of Problem 13 (associativity
in any group); Problem 14 in the additive setting (its proof uses only that
each `R₀(x)` is linear, not that `R₀` is a homomorphism).

Not covered: the passage from the multiplicative identities to the additive
ones (that `A` is commutative, that `f` and `h` take values in `A`, that
conjugation by `ψ(x)` gives a linear representation `R₀` of `L₀`: Problem
1.2.26), and the topological part of Lemma 2.
-/

namespace OnishchikVinberg.Averaging

section Multiplicative

variable {G L₀ : Type*} [Group G] [Group L₀]

/-- (5): `f(x, y)` is defined by `ψ(x)ψ(y) = f(x, y) ψ(xy)`. -/
def cocycle (ψ : L₀ → G) (x y : L₀) : G :=
  ψ x * ψ y * (ψ (x * y))⁻¹

theorem psi_mul_psi (ψ : L₀ → G) (x y : L₀) :
    ψ x * ψ y = cocycle ψ x y * ψ (x * y) := by
  unfold cocycle
  group

/-- (4) and (6): `φ(x) = h(x)ψ(x)` is multiplicative at `(x, y)` iff
`f(x, y) = ψ(x) h(y)⁻¹ ψ(x)⁻¹ h(x)⁻¹ h(xy)`. -/
theorem phi_mul_iff (ψ h : L₀ → G) (x y : L₀) :
    h (x * y) * ψ (x * y) = h x * ψ x * (h y * ψ y) ↔
      cocycle ψ x y = ψ x * (h y)⁻¹ * (ψ x)⁻¹ * (h x)⁻¹ * h (x * y) := by
  unfold cocycle
  constructor
  · intro H
    have hc : h (x * y) = h x * ψ x * (h y * ψ y) * (ψ (x * y))⁻¹ := by
      rw [← H]
      group
    rw [hc]
    group
  · intro H
    have hc : h (x * y) =
        (ψ x * (h y)⁻¹ * (ψ x)⁻¹ * (h x)⁻¹)⁻¹ * (ψ x * ψ y * (ψ (x * y))⁻¹) := by
      rw [H]
      group
    rw [hc]
    group

/-- Problem 13 in multiplicative form:
`f(x, y) f(xy, z) = (ψ(x) f(y, z) ψ(x)⁻¹) f(x, yz)`. -/
theorem cocycle_assoc (ψ : L₀ → G) (x y z : L₀) :
    cocycle ψ x y * cocycle ψ (x * y) z =
      ψ x * cocycle ψ y z * (ψ x)⁻¹ * cocycle ψ x (y * z) := by
  unfold cocycle
  rw [mul_assoc x y z]
  group

end Multiplicative

section Additive

variable {k L₀ A : Type*} [Field k] [CharZero k] [Group L₀] [Fintype L₀]
  [AddCommGroup A] [Module k A]

/-- Problem 14: `h(x) = -(1/|L₀|) ∑_y f(x, y)`. -/
noncomputable def avg (f : L₀ → L₀ → A) (x : L₀) : A :=
  -((Fintype.card L₀ : k)⁻¹ • ∑ y, f x y)

/-- Problem 14: if `f` satisfies Problem 13 then `h = avg f` satisfies (8),
`f(x, y) = h(xy) - h(x) - R₀(x) h(y)`. -/
theorem problem_14 (ρ : Representation k L₀ A) (f : L₀ → L₀ → A)
    (hf : ∀ x y z, f x (y * z) + ρ x (f y z) = f (x * y) z + f x y) (x y : L₀) :
    f x y = avg (k := k) f (x * y) - avg (k := k) f x - ρ x (avg (k := k) f y) := by
  have hn : (Fintype.card L₀ : k) ≠ 0 := Nat.cast_ne_zero.mpr Fintype.card_ne_zero
  have hshift : ∑ z, f x (y * z) = ∑ z, f x z :=
    Fintype.sum_equiv (Equiv.mulLeft y) _ _ (fun _ => rfl)
  have key : (∑ z, f x z) + ρ x (∑ z, f y z) =
      (∑ z, f (x * y) z) + (Fintype.card L₀ : k) • f x y := by
    have hsum := Finset.sum_congr rfl (fun z (_ : z ∈ Finset.univ) => hf x y z)
    rw [Finset.sum_add_distrib, Finset.sum_add_distrib, hshift, ← map_sum,
      Finset.sum_const, Finset.card_univ] at hsum
    rw [hsum, Nat.cast_smul_eq_nsmul]
  unfold avg
  rw [map_neg, map_smul]
  set n := (Fintype.card L₀ : k)
  have hfxy : f x y = n⁻¹ • ((∑ z, f x z) + ρ x (∑ z, f y z) - ∑ z, f (x * y) z) := by
    rw [key, add_sub_cancel_left, smul_smul, inv_mul_cancel₀ hn, one_smul]
  rw [hfxy]
  module

end Additive

end OnishchikVinberg.Averaging

#print axioms OnishchikVinberg.Averaging.psi_mul_psi
#print axioms OnishchikVinberg.Averaging.phi_mul_iff
#print axioms OnishchikVinberg.Averaging.cocycle_assoc
#print axioms OnishchikVinberg.Averaging.problem_14
