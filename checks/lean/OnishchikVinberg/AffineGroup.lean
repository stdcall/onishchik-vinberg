import Mathlib.Algebra.Group.Subgroup.Map
import Mathlib.Basic.Real.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.FinCases

/-!
# Chapter 1, § 4, Exercise 15: the subgroup `x ↦ a x` is not normal

Place in the book: Onishchik, Vinberg, *Lie Groups and Algebraic Groups*
(Springer, 1990), Chapter 1, § 4, Exercise 15. Our file
`content/14-derived-algebra.typ`, `#exercise(15)`.

Printed statement: "Let `G` be a connected solvable real Lie group and `H` its
connected solvable Lie subgroup of codimension 1. Then `G = H ⋌ P`, where `P`
is a connected one-dimensional Lie subgroup." A splitting `G = H ⋌ P`
(Chapter 1, § 1, subsection "Semidirect Product", condition 1) requires `H`
to be normal, and our text adds
"normal" (see `corrections.json`). This file checks the counterexample to the
printed statement: in the group `G` of the maps `x ↦ a x + b` (`a > 0`) of the
real line, the subgroup `H` of the maps `x ↦ a x` is commutative and not
normal.

Mapping of the notation:
* the map `x ↦ a x + b` ↦ the matrix `!![a, b; 0, 1]` in `GL (Fin 2) ℝ`
  (it sends the column `(x, 1)` to `(a x + b, 1)`, and composition of maps is
  the product of matrices);
* `G` ↦ `G : Subgroup (GL (Fin 2) ℝ)` (entries `(1, 0) = 0`, `(1, 1) = 1`,
  `(0, 0) > 0`); `H` ↦ `H` (moreover `(0, 1) = 0`);
* "`H` is normal in `G`" ↦ `(H.subgroupOf G).Normal`.

The witnesses: `g : x ↦ x + 1`, `h : x ↦ 2 x`; then `g h g⁻¹ : x ↦ 2 x - 1`
is not in `H`.

Not covered: that `G` is a connected solvable Lie group of dimension 2 and
`H ≅ ℝ_{>0}` a connected Lie subgroup of codimension 1 (evident from the
parametrizations `a = e^s`); the corrected statement (with `H` normal) is
not formalized.
-/

namespace OnishchikVinberg.AffineGroup

open Matrix

/-- The maps `x ↦ a x + b`, `a > 0`, as the matrices `!![a, b; 0, 1]`. -/
def G : Subgroup (GL (Fin 2) ℝ) where
  carrier := {A | (A : Matrix (Fin 2) (Fin 2) ℝ) 1 0 = 0 ∧
    (A : Matrix (Fin 2) (Fin 2) ℝ) 1 1 = 1 ∧ 0 < (A : Matrix (Fin 2) (Fin 2) ℝ) 0 0}
  mul_mem' := by
    rintro A B ⟨hA₁, hA₂, hA₃⟩ ⟨hB₁, hB₂, hB₃⟩
    simp only [Set.mem_ofPred_eq, Units.val_mul, mul_apply, Fin.sum_univ_two]
    refine ⟨?_, ?_, ?_⟩
    · rw [hA₁, hA₂, hB₁]
      ring
    · rw [hA₁, hA₂, hB₂]
      ring
    · rw [hB₁, mul_zero, add_zero]
      exact mul_pos hA₃ hB₃
  one_mem' := by simp
  inv_mem' := by
    rintro A ⟨h₁, h₂, h₃⟩
    have hBA := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℝ => M) (Units.inv_mul A)
    have e₁₀ := congrFun (congrFun hBA 1) 0
    have e₁₁ := congrFun (congrFun hBA 1) 1
    have e₀₀ := congrFun (congrFun hBA 0) 0
    simp only [mul_apply, Fin.sum_univ_two, h₁, h₂, mul_zero, add_zero, mul_one,
      one_apply_ne (show (1 : Fin 2) ≠ 0 by decide), one_apply_eq] at e₁₀ e₁₁ e₀₀
    have hB₁₀ : (↑A⁻¹ : Matrix (Fin 2) (Fin 2) ℝ) 1 0 = 0 := by
      rcases mul_eq_zero.mp e₁₀ with h | h
      · exact h
      · exact absurd h h₃.ne'
    refine ⟨hB₁₀, ?_, ?_⟩
    · rw [hB₁₀, zero_mul, zero_add] at e₁₁
      exact e₁₁
    · by_contra hneg
      have : (↑A⁻¹ : Matrix (Fin 2) (Fin 2) ℝ) 0 0 * (A : Matrix (Fin 2) (Fin 2) ℝ) 0 0 ≤ 0 :=
        mul_nonpos_of_nonpos_of_nonneg (not_lt.mp hneg) h₃.le
      linarith

/-- The maps `x ↦ a x`, `a > 0`, as the matrices `!![a, 0; 0, 1]`. -/
def H : Subgroup (GL (Fin 2) ℝ) where
  carrier := {A | (A : Matrix (Fin 2) (Fin 2) ℝ) 0 1 = 0 ∧ A ∈ G}
  mul_mem' := by
    rintro A B ⟨hA, hAG⟩ ⟨hB, hBG⟩
    refine ⟨?_, G.mul_mem hAG hBG⟩
    simp only [Units.val_mul, mul_apply, Fin.sum_univ_two, hA, hB, hBG.2.1]
    ring
  one_mem' := ⟨by simp, G.one_mem⟩
  inv_mem' := by
    rintro A ⟨hA, hAG⟩
    refine ⟨?_, G.inv_mem hAG⟩
    have hBA := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℝ => M) (Units.inv_mul A)
    have e₀₁ := congrFun (congrFun hBA 0) 1
    simp only [mul_apply, Fin.sum_univ_two, hA, hAG.2.1, mul_zero, zero_add, mul_one,
      one_apply_ne (show (0 : Fin 2) ≠ 1 by decide)] at e₀₁
    exact e₀₁

theorem H_le_G : H ≤ G := fun _ h => h.2

/-- `H` is commutative. -/
theorem H_comm {A B : GL (Fin 2) ℝ} (hA : A ∈ H) (hB : B ∈ H) : A * B = B * A := by
  obtain ⟨hA₀₁, hA₁₀, hA₁₁, -⟩ := hA
  obtain ⟨hB₀₁, hB₁₀, hB₁₁, -⟩ := hB
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [mul_apply, Fin.sum_univ_two, hA₀₁, hA₁₀, hA₁₁, hB₀₁, hB₁₀, hB₁₁, mul_comm]

/-- `g : x ↦ x + 1`. -/
def g : GL (Fin 2) ℝ :=
  ⟨!![1, 1; 0, 1], !![1, -1; 0, 1], by rw [mul_fin_two, one_fin_two]; norm_num,
    by rw [mul_fin_two, one_fin_two]; norm_num⟩

/-- `h : x ↦ 2 x`. -/
noncomputable def h : GL (Fin 2) ℝ :=
  ⟨!![2, 0; 0, 1], !![1 / 2, 0; 0, 1], by rw [mul_fin_two, one_fin_two]; norm_num,
    by rw [mul_fin_two, one_fin_two]; norm_num⟩

theorem g_mem : g ∈ G := by
  refine ⟨?_, ?_, ?_⟩ <;> simp [g]

theorem h_mem : h ∈ H := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> norm_num [h]

/-- `g h g⁻¹ = !![2, -1; 0, 1]`, the map `x ↦ 2 x - 1`. -/
theorem conj_val : ((g * h * g⁻¹ : GL (Fin 2) ℝ) : Matrix (Fin 2) (Fin 2) ℝ) =
    !![2, -1; 0, 1] := by
  change !![1, 1; 0, 1] * !![2, 0; 0, 1] * !![1, -1; 0, 1] = _
  simp only [mul_fin_two]
  norm_num

theorem conj_not_mem : g * h * g⁻¹ ∉ H := by
  intro hc
  have h₀₁ := hc.1
  rw [conj_val] at h₀₁
  norm_num at h₀₁

/-- Exercise 15 as printed fails: `H` is not a normal subgroup of `G`. -/
theorem H_not_normal : ¬ (H.subgroupOf G).Normal := by
  intro hN
  have hc := hN.conj_mem ⟨h, H_le_G h_mem⟩ (Subgroup.mem_subgroupOf.mpr h_mem) ⟨g, g_mem⟩
  rw [Subgroup.mem_subgroupOf] at hc
  exact conj_not_mem hc

end OnishchikVinberg.AffineGroup

#print axioms OnishchikVinberg.AffineGroup.H_le_G
#print axioms OnishchikVinberg.AffineGroup.H_comm
#print axioms OnishchikVinberg.AffineGroup.g_mem
#print axioms OnishchikVinberg.AffineGroup.h_mem
#print axioms OnishchikVinberg.AffineGroup.conj_val
#print axioms OnishchikVinberg.AffineGroup.conj_not_mem
#print axioms OnishchikVinberg.AffineGroup.H_not_normal
