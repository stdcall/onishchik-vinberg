import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic.IntervalCases

/-!
# Chapter 4, § 2, Problem 8: the product `⟨α|β⟩⟨β|α⟩ = 4 cos² θ` and its table

Place in the book: Onishchik, Vinberg, *Lie Groups and Algebraic Groups*
(Springer, 1990), Chapter 4, § 2, subsection "Principal Definitions and
Examples". Our file `content/42-root-systems.typ`, `#problem(8)` with its
table; the notation `⟨λ|μ⟩ = 2(λ, μ)/(μ, μ)` is defined at the beginning of
the same subsection.

Problem 8: let `α, β` be nonzero vectors of a Euclidean space `E` and `θ` the
angle between them. Then `⟨α|β⟩⟨β|α⟩ = 4 cos² θ`. If `⟨α|β⟩` and `⟨β|α⟩` are
nonpositive integers and `|β| ≥ |α|` then for `θ, ⟨α|β⟩, ⟨β|α⟩, |β|²/|α|²`
only the values of the printed table are possible. Its rows
`(θ, ⟨α|β⟩, ⟨β|α⟩, |β|²/|α|²)` are `(π/2, 0, 0, blank)`, `(2π/3, -1, -1, 1)`,
`(3π/4, -1, -2, 2)`, `(5π/6, -1, -3, 3)`, `(π, -2, -2, 1)`, `(π, -1, -4, 4)`.

For non-proportional roots (as in Problems 9 and 10) the product of the two
Cartan integers is `0, 1, 2` or `3` (strict Cauchy–Schwarz); this is
`cartan_mul_cartan_of_not_proportional`.

Mapping of the notation:
* `E` ↦ a real inner product space `E` (finite dimension is not needed);
* `(λ, μ)` ↦ `inner ℝ λ μ`, `|α|` ↦ `‖α‖`, `⟨λ|μ⟩` ↦ `cartan λ μ`;
* `α, β` ↦ `x, y`; the integers `⟨α|β⟩, ⟨β|α⟩` ↦ `m n : ℤ`;
* `cos θ` ↦ `cosAngle x y = (x, y)/(|x| |y|)`, which is the cosine of the
  angle `θ ∈ [0, π]` (mathlib: `InnerProductGeometry.cos_angle`).

Hypotheses are those of the problem: `x ≠ 0`, `y ≠ 0`; for the table
`m, n ≤ 0` and `‖x‖ ≤ ‖y‖`; for the product in `{0, 1, 2, 3}` the two vectors
are not proportional.

Not covered: the table is proved for `cos θ` (the column `θ` is recovered by
the standard values `cos(π/2) = 0`, `cos(2π/3) = -1/2`, `cos(3π/4) = -√2/2`,
`cos(5π/6) = -√3/2`, `cos π = -1` and the injectivity of `cos` on `[0, π]`,
which are not rechecked here); the problem does not claim that every row
occurs, and neither does this file.
-/

namespace OnishchikVinberg.CartanIntegers

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The book's `⟨λ|μ⟩ = 2(λ, μ)/(μ, μ)`. -/
noncomputable def cartan (x y : E) : ℝ :=
  2 * inner ℝ x y / inner ℝ y y

/-- `cos θ` for the angle `θ` between nonzero vectors `x` and `y`. -/
noncomputable def cosAngle (x y : E) : ℝ :=
  inner ℝ x y / (‖x‖ * ‖y‖)

/-- Problem 8, first statement: `⟨α|β⟩⟨β|α⟩ = 4 cos² θ`. -/
theorem cartan_mul_cartan {x y : E} (hx : x ≠ 0) (hy : y ≠ 0) :
    cartan x y * cartan y x = 4 * cosAngle x y ^ 2 := by
  have hx' : ‖x‖ ≠ 0 := norm_ne_zero_iff.mpr hx
  have hy' : ‖y‖ ≠ 0 := norm_ne_zero_iff.mpr hy
  unfold cartan cosAngle
  rw [real_inner_self_eq_norm_sq, real_inner_self_eq_norm_sq,
    real_inner_comm x y]
  field_simp
  ring

theorem cosAngle_sq_le_one (x y : E) : cosAngle x y ^ 2 ≤ 1 :=
  sq_le_one_iff_abs_le_one _ |>.mpr (abs_real_inner_div_norm_mul_norm_le_one x y)

/-- Strict Cauchy–Schwarz: for non-proportional vectors `cos² θ < 1`. -/
theorem cosAngle_sq_lt_one {x y : E} (hxy : ∀ r : ℝ, y ≠ r • x) :
    cosAngle x y ^ 2 < 1 := by
  have hle := abs_real_inner_div_norm_mul_norm_le_one x y
  have hne : |cosAngle x y| ≠ 1 := by
    intro h
    obtain ⟨-, r, -, hr⟩ := (abs_real_inner_div_norm_mul_norm_eq_one_iff x y).mp h
    exact hxy r hr
  exact (sq_lt_one_iff_abs_lt_one _).mpr (lt_of_le_of_ne hle hne)

/-- For non-proportional nonzero vectors with integer `⟨α|β⟩`, `⟨β|α⟩`, the
product of the two integers is `0, 1, 2` or `3`. -/
theorem cartan_mul_cartan_of_not_proportional {x y : E} (hx : x ≠ 0) (hy : y ≠ 0)
    (hxy : ∀ r : ℝ, y ≠ r • x) {m n : ℤ} (hm : cartan x y = m)
    (hn : cartan y x = n) :
    m * n = 0 ∨ m * n = 1 ∨ m * n = 2 ∨ m * n = 3 := by
  have h := cartan_mul_cartan hx hy
  rw [hm, hn] at h
  have h0 : (0 : ℝ) ≤ ((m * n : ℤ) : ℝ) := by
    push_cast
    rw [h]
    positivity
  have h4 : ((m * n : ℤ) : ℝ) < 4 := by
    push_cast
    rw [h]
    nlinarith [cosAngle_sq_lt_one hxy]
  have h0' : 0 ≤ m * n := by exact_mod_cast h0
  have h4' : m * n < 4 := by exact_mod_cast h4
  omega

/-- The integer part of the table: `n ≤ m ≤ 0`, `m n ≤ 4` and `m = 0 ↔ n = 0`
leave exactly the six printed pairs. -/
theorem int_pairs {m n : ℤ} (hnm : n ≤ m) (hm : m ≤ 0) (hmn : m * n ≤ 4)
    (hz : m = 0 ↔ n = 0) :
    (m = 0 ∧ n = 0) ∨ (m = -1 ∧ n = -1) ∨ (m = -1 ∧ n = -2) ∨
      (m = -1 ∧ n = -3) ∨ (m = -2 ∧ n = -2) ∨ (m = -1 ∧ n = -4) := by
  have hm2 : -2 ≤ m := by nlinarith
  rcases eq_or_lt_of_le hm with h0 | hlt
  · left
    exact ⟨h0, hz.mp h0⟩
  have hn4 : -4 ≤ n := by nlinarith
  interval_cases m <;> interval_cases n <;> simp_all

/-- `cos θ ≤ 0` and `4 cos² θ = k` determine `cos θ = -√k/2`. -/
theorem eq_neg_sqrt_div_two {c k : ℝ} (hc : c ≤ 0) (h : 4 * c ^ 2 = k) :
    c = -(Real.sqrt k / 2) := by
  have hk : Real.sqrt k = -2 * c := by
    rw [← h, show 4 * c ^ 2 = (-2 * c) ^ 2 by ring]
    exact Real.sqrt_sq (by linarith)
  rw [hk]
  ring

/-- Problem 8, the table: for `x = α`, `y = β` with nonpositive integers
`⟨α|β⟩ = m`, `⟨β|α⟩ = n` and `|α| ≤ |β|`, the values of
`(m, n, cos θ, |β|²/|α|²)` are those of the printed rows. -/
theorem problem_8_table {x y : E} (hx : x ≠ 0) (hy : y ≠ 0) {m n : ℤ}
    (hm : cartan x y = m) (hn : cartan y x = n) (hm0 : m ≤ 0) (hn0 : n ≤ 0)
    (hxy : ‖x‖ ≤ ‖y‖) :
    (m = 0 ∧ n = 0 ∧ cosAngle x y = 0) ∨
    (m = -1 ∧ n = -1 ∧ cosAngle x y = -(1 / 2) ∧ ‖y‖ ^ 2 / ‖x‖ ^ 2 = 1) ∨
    (m = -1 ∧ n = -2 ∧ cosAngle x y = -(Real.sqrt 2 / 2) ∧
      ‖y‖ ^ 2 / ‖x‖ ^ 2 = 2) ∨
    (m = -1 ∧ n = -3 ∧ cosAngle x y = -(Real.sqrt 3 / 2) ∧
      ‖y‖ ^ 2 / ‖x‖ ^ 2 = 3) ∨
    (m = -2 ∧ n = -2 ∧ cosAngle x y = -1 ∧ ‖y‖ ^ 2 / ‖x‖ ^ 2 = 1) ∨
    (m = -1 ∧ n = -4 ∧ cosAngle x y = -1 ∧ ‖y‖ ^ 2 / ‖x‖ ^ 2 = 4) := by
  have hxp : 0 < ‖x‖ := norm_pos_iff.mpr hx
  have hyp : 0 < ‖y‖ := norm_pos_iff.mpr hy
  -- `m |β|² = 2(α, β) = n |α|²`
  have hmy : (m : ℝ) * ‖y‖ ^ 2 = 2 * inner ℝ x y := by
    rw [← hm]
    unfold cartan
    rw [real_inner_self_eq_norm_sq]
    field_simp
  have hnx : (n : ℝ) * ‖x‖ ^ 2 = 2 * inner ℝ x y := by
    rw [← hn]
    unfold cartan
    rw [real_inner_self_eq_norm_sq, real_inner_comm]
    field_simp
  have hm0' : (m : ℝ) ≤ 0 := by exact_mod_cast hm0
  have hn0' : (n : ℝ) ≤ 0 := by exact_mod_cast hn0
  have hsq : ‖x‖ ^ 2 ≤ ‖y‖ ^ 2 := by gcongr
  have hnm : n ≤ m := by
    have h1 : (m : ℝ) * ‖y‖ ^ 2 ≤ m * ‖x‖ ^ 2 :=
      mul_le_mul_of_nonpos_left hsq hm0'
    have h2 : (n : ℝ) * ‖x‖ ^ 2 ≤ m * ‖x‖ ^ 2 := by linarith
    exact_mod_cast le_of_mul_le_mul_right h2 (by positivity)
  have hz : m = 0 ↔ n = 0 := by
    constructor
    · intro h
      have : (n : ℝ) * ‖x‖ ^ 2 = 0 := by rw [hnx, ← hmy, h]; simp
      exact_mod_cast (mul_eq_zero.mp this).resolve_right (by positivity)
    · intro h
      have : (m : ℝ) * ‖y‖ ^ 2 = 0 := by rw [hmy, ← hnx, h]; simp
      exact_mod_cast (mul_eq_zero.mp this).resolve_right (by positivity)
  have hprod := cartan_mul_cartan hx hy
  rw [hm, hn] at hprod
  have hmn : m * n ≤ 4 := by
    have : (m : ℝ) * n ≤ 4 := by
      rw [hprod]
      nlinarith [cosAngle_sq_le_one x y]
    exact_mod_cast this
  have hc : cosAngle x y ≤ 0 := by
    unfold cosAngle
    apply div_nonpos_of_nonpos_of_nonneg _ (by positivity)
    nlinarith
  have hratio : m ≠ 0 → ‖y‖ ^ 2 / ‖x‖ ^ 2 = n / m := by
    intro h
    have h' : (m : ℝ) ≠ 0 := by exact_mod_cast h
    rw [div_eq_div_iff (by positivity) h']
    linarith
  have hcos := eq_neg_sqrt_div_two hc hprod.symm
  rcases int_pairs hnm hm0 hmn hz with
    ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · left
    refine ⟨rfl, rfl, ?_⟩
    rw [hcos]
    norm_num
  · right; left
    refine ⟨rfl, rfl, ?_, ?_⟩
    · rw [hcos]
      norm_num
    · rw [hratio (by norm_num)]
      norm_num
  · right; right; left
    refine ⟨rfl, rfl, ?_, ?_⟩
    · rw [hcos]
      norm_num
    · rw [hratio (by norm_num)]
      norm_num
  · right; right; right; left
    refine ⟨rfl, rfl, ?_, ?_⟩
    · rw [hcos]
      norm_num
    · rw [hratio (by norm_num)]
      norm_num
  · right; right; right; right; left
    refine ⟨rfl, rfl, ?_, ?_⟩
    · rw [hcos, show ((-2 : ℤ) : ℝ) * ((-2 : ℤ) : ℝ) = 2 ^ 2 by norm_num,
        Real.sqrt_sq (by norm_num)]
      norm_num
    · rw [hratio (by norm_num)]
      norm_num
  · right; right; right; right; right
    refine ⟨rfl, rfl, ?_, ?_⟩
    · rw [hcos, show ((-1 : ℤ) : ℝ) * ((-4 : ℤ) : ℝ) = 2 ^ 2 by norm_num,
        Real.sqrt_sq (by norm_num)]
      norm_num
    · rw [hratio (by norm_num)]
      norm_num

end OnishchikVinberg.CartanIntegers

#print axioms OnishchikVinberg.CartanIntegers.cartan_mul_cartan
#print axioms OnishchikVinberg.CartanIntegers.cosAngle_sq_le_one
#print axioms OnishchikVinberg.CartanIntegers.cosAngle_sq_lt_one
#print axioms OnishchikVinberg.CartanIntegers.cartan_mul_cartan_of_not_proportional
#print axioms OnishchikVinberg.CartanIntegers.int_pairs
#print axioms OnishchikVinberg.CartanIntegers.eq_neg_sqrt_div_two
#print axioms OnishchikVinberg.CartanIntegers.problem_8_table
