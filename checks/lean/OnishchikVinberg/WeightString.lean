import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.LinearAlgebra.Span.Basic
import Mathlib.Tactic.Module

/-!
# Chapter 4, § 1, Hint 41: the `sl₂`-string `U = ⊕ ρ(e_α)^k V_(λ - pα)`

Place in the book: Onishchik, Vinberg, *Lie Groups and Algebraic Groups*
(Springer, 1990), Chapter 4, § 1, Problems 40, 41 and Hint 41. Our file
`content/41-preliminaries.typ`, `#problem(41)` and `#hint(41)` in the repaired
reading (see `corrections.json`):

"Let `s ≥ 0` be the maximal of integers `k` such that
`ρ(e_α)^k V_(λ - pα) ≠ 0`. Verify that
`U = ⊕_(0 ≤ k ≤ s) ρ(e_α)^k V_(λ - pα)` is invariant with respect to
`ρ|𝔤^(α)`. If `s < p + q` then the weight system of the subrepresentation of
`G^(α)` in `U` is not symmetric."

Here `μ = λ - pα` is the bottom of the `α`-string (Problem 40), so
`ρ(e_(-α)) V_μ ⊂ V_(μ - α) = 0`, and `μ(h_α) = λ(h_α) - 2p = -(p + q)`. The
identity behind the invariance under `e_(-α)` (recorded with the correction)
is
`ρ(e_(-α)) ρ(e_α)^k v = -k(μ(h_α) + k - 1) ρ(e_α)^(k-1) v` for `v ∈ V_μ`.

Mapping of the notation:
* `𝔤^(α) = ⟨e_α, e_(-α), h_α⟩` ↦ elements `e f h : L` of a Lie algebra `L`
  over a commutative ring `R` with the relations displayed in the subsection
  "Three-Dimensional Subalgebras" of § 1: `[e_α, e_(-α)] = h_α`,
  `[h_α, e_α] = 2 e_α`, `[h_α, e_(-α)] = -2 e_(-α)` (only the first two are
  needed and assumed);
* the representation `ρ` in `V` ↦ a Lie module `M`, `ρ(x) v` ↦ `⁅x, v⁆`,
  `ρ(e_α)` ↦ `E = LieModule.toEnd R L M e`;
* `V_(λ - pα)` ↦ a submodule `W` on which `h` acts as the scalar
  `m = μ(h_α)` and which `f` annihilates;
* the choice of `s` ↦ `E^(s+1) W = 0` (the only property of `s` used for
  the invariance), `U` ↦ the span of all `E^k w`, `k ≤ s`, `w ∈ W`;
* the weights of `h_α` on `U` ↦ the integers `m + 2k`, `0 ≤ k ≤ s`.

Covered: the two commutation formulas (`h` on `E^k v` and the formula for
`f E^(k+1) v`), the invariance of `U` under `e`, `f`, `h`, the nonvanishing of
`E^k w` for `k ≤ s` when `E^s w ≠ 0`, and the arithmetic of the last
sentence: the weights `m + 2k` (`0 ≤ k ≤ s`) form a symmetric set iff
`m = -s`, so with `m = -(p + q)` they are not symmetric for `s < p + q`.

Not covered: Problem 40 itself (`μ(h_α) = -(p + q)`, integrality of the
weights), the directness of the sum (the summands lie in different weight
spaces), the identification of the weight system of `U` with the set
`{m + 2k}` as sets, and the Corollary of Theorem 5 (weights of an
`sl₂`-representation are symmetric), which concludes Problem 41.
-/

namespace OnishchikVinberg.WeightString

variable {R L M : Type*} [CommRing R] [LieRing L] [LieAlgebra R L]
  [AddCommGroup M] [Module R M] [LieRingModule L M] [LieModule R L M]

local notation "E" => LieModule.toEnd R L M

theorem lie_pow_apply (e : L) (k : ℕ) (v : M) :
    ⁅e, (E e ^ k) v⁆ = (E e ^ (k + 1)) v := by
  rw [pow_succ', Module.End.mul_apply, LieModule.toEnd_apply_apply]

/-- `ρ(h_α) ρ(e_α)^k v = (μ(h_α) + 2k) ρ(e_α)^k v` for `v ∈ V_μ`. -/
theorem h_pow_apply {e h : L} (hhe : ⁅h, e⁆ = (2 : R) • e) {v : M} {m : R}
    (hv : ⁅h, v⁆ = m • v) (k : ℕ) :
    ⁅h, (E e ^ k) v⁆ = (m + 2 * k) • (E e ^ k) v := by
  induction k with
  | zero => simpa using hv
  | succ k ih =>
    rw [← lie_pow_apply, leibniz_lie, hhe, smul_lie, ih, lie_smul, ← add_smul]
    congr 1
    push_cast
    ring

/-- `ρ(e_(-α)) ρ(e_α)^(k+1) v = -(k+1)(μ(h_α) + k) ρ(e_α)^k v` for `v ∈ V_μ`
with `ρ(e_(-α)) v = 0`; this is the formula
`-k(μ(h_α) + k - 1) ρ(e_α)^(k-1) v` with `k` shifted by one. -/
theorem f_pow_succ_apply {e f h : L} (hef : ⁅e, f⁆ = h) (hhe : ⁅h, e⁆ = (2 : R) • e)
    {v : M} {m : R} (hv : ⁅h, v⁆ = m • v) (hfv : ⁅f, v⁆ = 0) (k : ℕ) :
    ⁅f, (E e ^ (k + 1)) v⁆ = -(((k : R) + 1) * (m + k)) • (E e ^ k) v := by
  have hfe : ⁅f, e⁆ = -h := by rw [← lie_skew, hef]
  induction k with
  | zero =>
    rw [← lie_pow_apply, leibniz_lie, hfe, pow_zero, Module.End.one_apply, hfv,
      lie_zero, add_zero, neg_lie, hv]
    simp
  | succ k ih =>
    rw [← lie_pow_apply e (k + 1), leibniz_lie, hfe, neg_lie, ih, lie_smul,
      lie_pow_apply, h_pow_apply hhe hv (k + 1)]
    push_cast
    module

section Invariance

variable {e f h : L} {W : Submodule R M} {m : R} {s : ℕ}

/-- The book's `U`: the span of `ρ(e_α)^k V_μ`, `0 ≤ k ≤ s`. -/
def U (e : L) (W : Submodule R M) (s : ℕ) : Submodule R M :=
  Submodule.span R {x | ∃ k ≤ s, ∃ w ∈ W, x = (E e ^ k) w}

theorem pow_mem_U {k : ℕ} (hk : k ≤ s) {w : M} (hw : w ∈ W) :
    (E e ^ k) w ∈ U e W s :=
  Submodule.subset_span ⟨k, hk, w, hw, rfl⟩

/-- An operator preserving the generators of `U` preserves `U`. -/
theorem mem_U_of_gen (x : L)
    (hgen : ∀ k ≤ s, ∀ w ∈ W, ⁅x, (E e ^ k) w⁆ ∈ U e W s) {u : M}
    (hu : u ∈ U e W s) : ⁅x, u⁆ ∈ U e W s := by
  have hle : U e W s ≤ (U e W s).comap (E x) := by
    refine Submodule.span_le.mpr ?_
    rintro _ ⟨k, hk, w, hw, rfl⟩
    exact hgen k hk w hw
  simpa using hle hu

/-- Hint 41: `U` is invariant under `ρ(e_α)`. -/
theorem e_mem_U (hs : ∀ w ∈ W, (E e ^ (s + 1)) w = 0) {u : M} (hu : u ∈ U e W s) :
    ⁅e, u⁆ ∈ U e W s := by
  refine mem_U_of_gen e (fun k hk w hw => ?_) hu
  rw [lie_pow_apply]
  rcases Nat.lt_or_ge k s with hlt | hge
  · exact pow_mem_U (by omega) hw
  · rw [show k = s by omega, hs w hw]
    exact Submodule.zero_mem _

/-- Hint 41: `U` is invariant under `ρ(h_α)`. -/
theorem h_mem_U (hhe : ⁅h, e⁆ = (2 : R) • e) (hW : ∀ w ∈ W, ⁅h, w⁆ = m • w)
    {u : M} (hu : u ∈ U e W s) : ⁅h, u⁆ ∈ U e W s := by
  refine mem_U_of_gen h (fun k hk w hw => ?_) hu
  rw [h_pow_apply hhe (hW w hw)]
  exact Submodule.smul_mem _ _ (pow_mem_U hk hw)

/-- Hint 41: `U` is invariant under `ρ(e_(-α))`. -/
theorem f_mem_U (hef : ⁅e, f⁆ = h) (hhe : ⁅h, e⁆ = (2 : R) • e)
    (hW : ∀ w ∈ W, ⁅h, w⁆ = m • w) (hWf : ∀ w ∈ W, ⁅f, w⁆ = 0)
    {u : M} (hu : u ∈ U e W s) : ⁅f, u⁆ ∈ U e W s := by
  refine mem_U_of_gen f (fun k hk w hw => ?_) hu
  rcases k with _ | k
  · rw [pow_zero, Module.End.one_apply, hWf w hw]
    exact Submodule.zero_mem _
  · rw [f_pow_succ_apply hef hhe (hW w hw) (hWf w hw)]
    exact Submodule.smul_mem _ _ (pow_mem_U (by omega) hw)

end Invariance

/-- If `ρ(e_α)^s w ≠ 0` then `ρ(e_α)^k w ≠ 0` for all `k ≤ s`: every
`m + 2k`, `0 ≤ k ≤ s`, is a weight of `h_α` on `U`. -/
theorem pow_apply_ne_zero_of_le (e : L) {w : M} {s k : ℕ} (hk : k ≤ s)
    (hs : (E e ^ s) w ≠ 0) : (E e ^ k) w ≠ 0 := by
  intro h0
  apply hs
  rw [show s = (s - k) + k by omega, pow_add, Module.End.mul_apply, h0, map_zero]

/-- The weights `m + 2k`, `0 ≤ k ≤ s`, form a set symmetric with respect to
zero iff `m = -s`. -/
theorem weights_symm_iff (m : ℤ) (s : ℕ) :
    (∀ k ≤ s, ∃ j ≤ s, m + 2 * k = -(m + 2 * j)) ↔ m = -s := by
  constructor
  · intro h
    obtain ⟨j₀, hj₀, h₀⟩ := h 0 (Nat.zero_le s)
    obtain ⟨j₁, -, h₁⟩ := h s le_rfl
    omega
  · rintro rfl k hk
    exact ⟨s - k, Nat.sub_le s k, by push_cast [Nat.cast_sub hk]; ring⟩

/-- The last sentence of Hint 41: with `μ(h_α) = -(p + q)` (Problem 40), if
`s < p + q` the weights of `U` are not symmetric. -/
theorem not_symm_of_lt {m : ℤ} {p q s : ℕ} (hm : m = -((p : ℤ) + q)) (hs : s < p + q) :
    ¬ ∀ k ≤ s, ∃ j ≤ s, m + 2 * k = -(m + 2 * j) := by
  rw [weights_symm_iff]
  omega

end OnishchikVinberg.WeightString

#print axioms OnishchikVinberg.WeightString.lie_pow_apply
#print axioms OnishchikVinberg.WeightString.h_pow_apply
#print axioms OnishchikVinberg.WeightString.f_pow_succ_apply
#print axioms OnishchikVinberg.WeightString.pow_mem_U
#print axioms OnishchikVinberg.WeightString.mem_U_of_gen
#print axioms OnishchikVinberg.WeightString.e_mem_U
#print axioms OnishchikVinberg.WeightString.h_mem_U
#print axioms OnishchikVinberg.WeightString.f_mem_U
#print axioms OnishchikVinberg.WeightString.pow_apply_ne_zero_of_le
#print axioms OnishchikVinberg.WeightString.weights_symm_iff
#print axioms OnishchikVinberg.WeightString.not_symm_of_lt
