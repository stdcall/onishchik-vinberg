import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.RingTheory.Nilpotent.Basic

/-!
# Chapter 3, § 3, Problem 12 and Hint 12: `X ^ m = 0` gives `(ad X) ^ (2m - 1) = 0`

Place in the book: Onishchik, Vinberg, *Lie Groups and Algebraic Groups*
(Springer, 1990), Chapter 3, § 3, subsection "Engel's Theorem", where vector
spaces and Lie algebras are over an arbitrary field. Our file
`content/33-tangent-algebra.typ`, `#problem(12)` and `#hint(12)`.

* Problem 12: if a linear Lie algebra `𝔤 ⊂ 𝔤𝔩(V)` is unipotent (all its
  operators are nilpotent), then so is the linear Lie algebra
  `ad 𝔤 ⊂ 𝔤𝔩(𝔤)`. It is used in the proof of Engel's theorem (Theorem 6).
* Hint 12: "if `X ^ m = 0` then `(ad X) ^ (2m - 1) = 0`". This is the exact
  bound checked here.

Mapping of the notation:
* the ground field ↦ `R`, any commutative ring (no field axioms are used);
* `𝔤𝔩(V)` ↦ an associative `R`-algebra `A` with the commutator bracket (for
  the book `A = Module.End R V`);
* `X` ↦ `a : A` (or `x : 𝔤`), `m` ↦ `m : ℕ`;
* `ad X` on `𝔤𝔩(V)` ↦ `LieAlgebra.ad R A a`; `𝔤` ↦ `g : LieSubalgebra R A`
  and `ad X` on `𝔤` ↦ `LieAlgebra.ad R g x`.

Hypotheses: only `X ^ m = 0`, as in the hint (`m = 0` is allowed: then
`A = 0`). The "straightforward verification" is `ad X = L_X - R_X`, where the
left and right multiplications by `X` commute and have zero `m`-th powers.

Not covered: Engel's theorem itself and the rest of the subsection.
-/

namespace OnishchikVinberg.AdNilpotent

attribute [local instance 100] LieRing.ofAssociativeRing

/-- Two commuting elements with zero `m`-th powers: their difference has zero
`(2m - 1)`-th power. -/
theorem sub_pow_two_mul_sub_one_eq_zero {S : Type*} [Ring S] {a b : S}
    (hab : Commute a b) {m : ℕ} (ha : a ^ m = 0) (hb : b ^ m = 0) :
    (a - b) ^ (2 * m - 1) = 0 := by
  have hb' : (-b) ^ m = 0 := by rw [neg_pow, hb, mul_zero]
  have h := hab.neg_right.add_pow_add_eq_zero_of_pow_eq_zero ha hb'
  rwa [← sub_eq_add_neg, ← two_mul] at h

variable {R A : Type*} [CommRing R] [Ring A] [Algebra R A]

/-- Hint 12 in `𝔤𝔩(V)` (any associative algebra): `X ^ m = 0` implies
`(ad X) ^ (2m - 1) = 0`. -/
theorem ad_pow_eq_zero {a : A} {m : ℕ} (ha : a ^ m = 0) :
    LieAlgebra.ad R A a ^ (2 * m - 1) = 0 := by
  rw [LieAlgebra.ad_eq_lmul_left_sub_lmul_right]
  refine sub_pow_two_mul_sub_one_eq_zero
    (LinearMap.commute_mulLeft_right a a) ?_ ?_
  · rw [LinearMap.pow_mulLeft, ha, LinearMap.mulLeft_zero_eq_zero]
  · rw [LinearMap.pow_mulRight, ha, LinearMap.mulRight_zero_eq_zero]

/-- Hint 12 for `ad` computed inside a linear Lie algebra `𝔤 ⊂ 𝔤𝔩(V)`: the
same bound, since `𝔤` is invariant under `ad X`. -/
theorem ad_subalgebra_pow_eq_zero (g : LieSubalgebra R A) (x : g) {m : ℕ}
    (hx : (x : A) ^ m = 0) : LieAlgebra.ad R g x ^ (2 * m - 1) = 0 :=
  Module.End.submodule_pow_eq_zero_of_pow_eq_zero (g.ad_comp_incl_eq x)
    (ad_pow_eq_zero hx)

/-- Problem 12: if all operators of `𝔤` are nilpotent then so are all
operators of `ad 𝔤`, with the explicit exponent of Hint 12. -/
theorem problem_12 (g : LieSubalgebra R A)
    (hg : ∀ x : g, IsNilpotent (x : A)) (x : g) :
    ∃ m : ℕ, (x : A) ^ m = 0 ∧ LieAlgebra.ad R g x ^ (2 * m - 1) = 0 := by
  obtain ⟨m, hm⟩ := hg x
  exact ⟨m, hm, ad_subalgebra_pow_eq_zero g x hm⟩

end OnishchikVinberg.AdNilpotent

#print axioms OnishchikVinberg.AdNilpotent.sub_pow_two_mul_sub_one_eq_zero
#print axioms OnishchikVinberg.AdNilpotent.ad_pow_eq_zero
#print axioms OnishchikVinberg.AdNilpotent.ad_subalgebra_pow_eq_zero
#print axioms OnishchikVinberg.AdNilpotent.problem_12
