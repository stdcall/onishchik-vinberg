import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.LinearAlgebra.Basis.VectorSpace
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.FreeModule.Finite.Matrix
import Mathlib.LinearAlgebra.Projection

/-!
# Chapter 6, Problems 5 and 6: the spaces `P`, `Q`, `R` in the proof of Levi's theorem

Place in the book: Onishchik, Vinberg, *Lie Groups and Algebraic Groups*
(Springer, 1990), Chapter 6, subsection "Levi's Theorem", the construction of
a projection `h : 𝔤 → rad 𝔤` normalizing `ad 𝔤` (Problems 5, 6 and the
paragraph after Problem 6). Our file `content/60-levi-decomposition.typ`,
`#problem(5)` and `#problem(6)`, as corrected (see `corrections.json`):

* `P = {v ∈ 𝔤𝔩(𝔤) : v(𝔤) ⊂ rad 𝔤 and v|rad 𝔤 is a scalar operator}` (the book
  prints `v(𝔤) = rad 𝔤`, which is not a subspace);
  `Q = {v ∈ P : v|rad 𝔤 = 0}`, `R = ad(rad 𝔤)`.
* Problem 5: `P, Q, R` are subspaces, `Q ⊂ P`, `dim P - dim Q = 1`; if
  `rad 𝔤` is commutative then `R ⊂ Q` (the book prints `R ⊂ Q ⊂ P` for every
  `𝔤`).
* Problem 6, with `ρ(x) = ad(ad x)`: `P, Q, R` are `ρ(𝔤)`-invariant and
  `ρ(x) P ⊂ Q` for all `x ∈ 𝔤` (the book prints `x ∈ rad 𝔤`); if `rad 𝔤` is
  commutative then `ρ(x) P ⊂ R` for all `x ∈ rad 𝔤`.
* After Problem 6: `v₀ ∈ P` with `v₀|rad 𝔤 = λE`, `λ ≠ 0` and
  `[ad x, v₀] ∈ R` for all `x` gives the projection `h = v₀/λ` onto `rad 𝔤`
  normalizing `ad 𝔤`.

Mapping of the notation:
* `K = ℂ` or `ℝ` ↦ any field `K`; `𝔤` ↦ a Lie algebra `L` over `K`;
* `rad 𝔤` ↦ `I : Submodule K L` with the ideal property `hI` (solvability
  is never used); "`rad 𝔤` is commutative" ↦ `∀ y ∈ I, ∀ z ∈ I, ⁅y, z⁆ = 0`;
* `𝔤𝔩(𝔤)` ↦ `Module.End K L`; `ad` ↦ `LieAlgebra.ad K L`;
* `P, Q, R` ↦ `P I`, `Q I`, `R I`; `ρ(x) v = [ad x, v]` ↦
  `rho x v = ad x * v - v * ad x`.

Hypotheses: the ideal property of `I` everywhere; finite dimension of `L` and
`I ≠ 0` only for `dim P - dim Q = 1` (for `I = 0` both spaces are `0`);
commutativity of `I` exactly where the book states it. `R ⊂ Q` is shown to be
equivalent to the commutativity of `I` (`R_le_Q_iff`), which is why the
printed general claim `R ⊂ Q` is false.

Not covered: the representation `ρ̂` of `𝔤/rad 𝔤` in `P/R`, its complete
reducibility (Corollary 3 of Theorem 5.2.13), the existence of `v₀`, and
Problems 3, 4 and the rest of the proof of Levi's theorem.
-/

namespace OnishchikVinberg.LeviProjection

attribute [local instance 100] LieRing.ofAssociativeRing

variable {K L : Type*} [Field K] [LieRing L] [LieAlgebra K L]

/-- The book's `P`: operators mapping `𝔤` into `I` and acting on `I` as a
scalar. -/
def P (I : Submodule K L) : Submodule K (Module.End K L) where
  carrier := {v | (∀ y, v y ∈ I) ∧ ∃ c : K, ∀ y ∈ I, v y = c • y}
  add_mem' := by
    rintro v w ⟨hv, c, hc⟩ ⟨hw, d, hd⟩
    refine ⟨fun y => I.add_mem (hv y) (hw y), c + d, fun y hy => ?_⟩
    rw [LinearMap.add_apply, hc y hy, hd y hy, add_smul]
  zero_mem' := ⟨fun _ => I.zero_mem, 0, fun y _ => by simp⟩
  smul_mem' := by
    rintro a v ⟨hv, c, hc⟩
    refine ⟨fun y => I.smul_mem a (hv y), a * c, fun y hy => ?_⟩
    rw [LinearMap.smul_apply, hc y hy, mul_smul]

/-- The book's `Q`: operators mapping `𝔤` into `I` and vanishing on `I`. -/
def Q (I : Submodule K L) : Submodule K (Module.End K L) where
  carrier := {v | (∀ y, v y ∈ I) ∧ ∀ y ∈ I, v y = 0}
  add_mem' := by
    rintro v w ⟨hv, hv'⟩ ⟨hw, hw'⟩
    refine ⟨fun y => I.add_mem (hv y) (hw y), fun y hy => ?_⟩
    rw [LinearMap.add_apply, hv' y hy, hw' y hy, add_zero]
  zero_mem' := ⟨fun _ => I.zero_mem, fun _ _ => rfl⟩
  smul_mem' := by
    rintro a v ⟨hv, hv'⟩
    refine ⟨fun y => I.smul_mem a (hv y), fun y hy => ?_⟩
    rw [LinearMap.smul_apply, hv' y hy, smul_zero]

/-- The book's `R = ad(rad 𝔤)`. -/
def R (I : Submodule K L) : Submodule K (Module.End K L) :=
  I.map (LieAlgebra.ad K L).toLinearMap

/-- The book's `ρ(x) = ad(ad x)`: `ρ(x) v = [ad x, v]`. -/
def rho (x : L) (v : Module.End K L) : Module.End K L :=
  LieAlgebra.ad K L x * v - v * LieAlgebra.ad K L x

theorem rho_apply (x : L) (v : Module.End K L) (y : L) :
    rho x v y = ⁅x, v y⁆ - v ⁅x, y⁆ := rfl

variable {I : Submodule K L}

theorem Q_le_P : Q I ≤ P I := fun _ ⟨hv, hv'⟩ =>
  ⟨hv, 0, fun y hy => by rw [hv' y hy, zero_smul]⟩

/-- An ideal absorbs brackets from either side. -/
theorem lie_mem_of_left_mem (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I) {x : L}
    (hx : x ∈ I) (y : L) : ⁅x, y⁆ ∈ I := by
  rw [← lie_skew]
  exact I.neg_mem (hI y x hx)

/-- Problem 6 (corrected): `ρ(x) P ⊂ Q` for every `x ∈ 𝔤`. -/
theorem rho_mem_Q (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I) (x : L) {v : Module.End K L}
    (hv : v ∈ P I) : rho x v ∈ Q I := by
  obtain ⟨hv, c, hc⟩ := hv
  refine ⟨fun y => ?_, fun y hy => ?_⟩
  · rw [rho_apply]
    exact I.sub_mem (hI x _ (hv y)) (hv _)
  · rw [rho_apply, hc y hy, hc _ (hI x y hy), lie_smul, sub_self]

/-- Problem 6: `P` is `ρ(𝔤)`-invariant. -/
theorem rho_mem_P (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I) (x : L) {v : Module.End K L}
    (hv : v ∈ P I) : rho x v ∈ P I :=
  Q_le_P (rho_mem_Q hI x hv)

/-- Problem 6: `Q` is `ρ(𝔤)`-invariant. -/
theorem rho_mem_Q_of_mem_Q (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I) (x : L)
    {v : Module.End K L} (hv : v ∈ Q I) : rho x v ∈ Q I :=
  rho_mem_Q hI x (Q_le_P hv)

/-- `ρ(x) ad z = ad [x, z]` (the Jacobi identity). -/
theorem rho_ad (x z : L) :
    rho x (LieAlgebra.ad K L z) = LieAlgebra.ad K L ⁅x, z⁆ := by
  ext y
  rw [rho_apply, LieAlgebra.ad_apply, LieAlgebra.ad_apply, LieAlgebra.ad_apply,
    leibniz_lie]
  abel

/-- Problem 6: `R` is `ρ(𝔤)`-invariant. -/
theorem rho_mem_R (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I) (x : L) {w : Module.End K L}
    (hw : w ∈ R I) : rho x w ∈ R I := by
  obtain ⟨z, hz, rfl⟩ := hw
  exact ⟨⁅x, z⁆, hI x z hz, (rho_ad x z).symm⟩

/-- Problem 6: for commutative `I`, `x ∈ I` and `v ∈ P` with `v|I = c E`,
`ρ(x) v = ad(-c x)`. -/
theorem rho_eq_ad_of_comm (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I)
    (hab : ∀ y ∈ I, ∀ z ∈ I, ⁅y, z⁆ = 0) {x : L} (hx : x ∈ I)
    {v : Module.End K L} (hv : ∀ y, v y ∈ I) {c : K} (hc : ∀ y ∈ I, v y = c • y) :
    rho x v = LieAlgebra.ad K L (-(c • x)) := by
  ext y
  rw [rho_apply, hab x hx _ (hv y), hc _ (lie_mem_of_left_mem hI hx y),
    LieAlgebra.ad_apply, neg_lie, smul_lie, zero_sub]

/-- Problem 6: for commutative `I`, `ρ(x) P ⊂ R` for every `x ∈ I`. -/
theorem rho_mem_R_of_comm (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I)
    (hab : ∀ y ∈ I, ∀ z ∈ I, ⁅y, z⁆ = 0) {x : L} (hx : x ∈ I)
    {v : Module.End K L} (hv : v ∈ P I) : rho x v ∈ R I := by
  obtain ⟨hv, c, hc⟩ := hv
  exact ⟨-(c • x), I.neg_mem (I.smul_mem c hx),
    (rho_eq_ad_of_comm hI hab hx hv hc).symm⟩

/-- For `x ∈ I` the operator `(ad x)|I` is scalar only if it is zero, since
`(ad x) x = 0`; so `ad x ∈ P` iff `ad x ∈ Q` iff `x` commutes with `I`. -/
theorem ad_mem_P_iff (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I) {x : L} (hx : x ∈ I) :
    LieAlgebra.ad K L x ∈ P I ↔ ∀ y ∈ I, ⁅x, y⁆ = 0 := by
  constructor
  · rintro ⟨-, c, hc⟩ y hy
    have hxx : c • x = 0 := by rw [← hc x hx, LieAlgebra.ad_apply, lie_self]
    rcases smul_eq_zero.mp hxx with h | h
    · rw [← LieAlgebra.ad_apply K L, hc y hy, h, zero_smul]
    · rw [h, zero_lie]
  · intro h
    refine ⟨fun y => lie_mem_of_left_mem hI hx y, 0, fun y hy => ?_⟩
    rw [LieAlgebra.ad_apply, h y hy, zero_smul]

theorem ad_mem_Q_iff (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I) {x : L} (hx : x ∈ I) :
    LieAlgebra.ad K L x ∈ Q I ↔ ∀ y ∈ I, ⁅x, y⁆ = 0 := by
  constructor
  · rintro ⟨-, h⟩ y hy
    exact h y hy
  · intro h
    obtain ⟨hr, -⟩ := (ad_mem_P_iff hI hx).mpr h
    exact ⟨hr, h⟩

/-- Problem 5 (corrected): `R ⊂ P` holds exactly when `I` is commutative. -/
theorem R_le_P_iff (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I) :
    R I ≤ P I ↔ ∀ y ∈ I, ∀ z ∈ I, ⁅y, z⁆ = 0 := by
  constructor
  · intro h y hy
    exact (ad_mem_P_iff hI hy).mp (h ⟨y, hy, rfl⟩)
  · rintro hab _ ⟨y, hy, rfl⟩
    exact (ad_mem_P_iff hI hy).mpr (hab y hy)

/-- Problem 5 (corrected): `R ⊂ Q` holds exactly when `I` is commutative;
in particular `R ⊂ Q` if `rad 𝔤` is commutative. -/
theorem R_le_Q_iff (hI : ∀ x y : L, y ∈ I → ⁅x, y⁆ ∈ I) :
    R I ≤ Q I ↔ ∀ y ∈ I, ∀ z ∈ I, ⁅y, z⁆ = 0 := by
  constructor
  · intro h
    exact (R_le_P_iff hI).mp (h.trans Q_le_P)
  · rintro hab _ ⟨y, hy, rfl⟩
    exact (ad_mem_Q_iff hI hy).mpr (hab y hy)

/-- Problem 5 (corrected): `dim P - dim Q = 1` for `I ≠ 0`. A projection `h`
of `L` onto `I` lies in `P \ Q`, and `v - c h ∈ Q` for `v ∈ P` with
`v|I = c E`. -/
theorem finrank_P [FiniteDimensional K L] (hI0 : I ≠ ⊥) :
    Module.finrank K (P I) = Module.finrank K (Q I) + 1 := by
  obtain ⟨J, hJ⟩ := Submodule.exists_isCompl I
  set h : Module.End K L := I.projection J hJ with h_def
  have hP : h ∈ P I :=
    ⟨fun y => Submodule.projection_apply_mem hJ y, 1, fun y hy => by
      rw [one_smul, h_def, Submodule.projection_apply_of_mem_left hJ hy]⟩
  obtain ⟨y₀, hy₀, hy₀0⟩ := Submodule.exists_mem_ne_zero_of_ne_bot hI0
  have hQ : h ∉ Q I := fun hq => hy₀0 <| by
    rw [← Submodule.projection_apply_of_mem_left hJ hy₀, ← h_def]
    exact hq.2 y₀ hy₀
  have h0 : h ≠ 0 := fun h0 => hQ (h0 ▸ (Q I).zero_mem)
  have hsup : P I = Q I ⊔ K ∙ h := by
    apply le_antisymm
    · rintro v ⟨hv, c, hc⟩
      have hvq : v - c • h ∈ Q I := by
        refine ⟨fun y => I.sub_mem (hv y) (I.smul_mem c (hP.1 y)), fun y hy => ?_⟩
        rw [LinearMap.sub_apply, LinearMap.smul_apply, hc y hy, h_def,
          Submodule.projection_apply_of_mem_left hJ hy, sub_self]
      have hv' : v = (v - c • h) + c • h := by abel
      rw [hv']
      exact Submodule.add_mem_sup hvq (Submodule.smul_mem _ c
        (Submodule.mem_span_singleton_self h))
    · exact sup_le Q_le_P ((Submodule.span_singleton_le_iff_mem h _).mpr hP)
  have hinf : Q I ⊓ K ∙ h = ⊥ :=
    disjoint_iff.mp ((Submodule.disjoint_span_singleton' h0).mpr hQ)
  have hdim := Submodule.finrank_sup_add_finrank_inf_eq (Q I) (K ∙ h)
  rw [hinf, finrank_bot, add_zero, finrank_span_singleton h0, ← hsup] at hdim
  exact hdim

/-- After Problem 6: a `ρ(𝔤)`-fixed class `v₀ + R` with `v₀|I = λ E`,
`λ ≠ 0`, gives the projection `h = v₀/λ` of `L` onto `I` that normalizes
`ad 𝔤` (the hypotheses of Problem 4). -/
theorem projection_of_fixed {v₀ : Module.End K L} (hv₀ : ∀ y, v₀ y ∈ I) {c : K}
    (hc : ∀ y ∈ I, v₀ y = c • y) (hc0 : c ≠ 0) (hfix : ∀ x, rho x v₀ ∈ R I) :
    (∀ y, (c⁻¹ • v₀) y ∈ I) ∧ (∀ y ∈ I, (c⁻¹ • v₀) y = y) ∧
      ∀ x, rho x (c⁻¹ • v₀) ∈ R I := by
  refine ⟨fun y => I.smul_mem _ (hv₀ y), fun y hy => ?_, fun x => ?_⟩
  · rw [LinearMap.smul_apply, hc y hy, smul_smul, inv_mul_cancel₀ hc0, one_smul]
  · have : rho x (c⁻¹ • v₀) = c⁻¹ • rho x v₀ := by
      unfold rho
      rw [mul_smul_comm, smul_mul_assoc, smul_sub]
    rw [this]
    exact (R I).smul_mem _ (hfix x)

end OnishchikVinberg.LeviProjection

#print axioms OnishchikVinberg.LeviProjection.rho_apply
#print axioms OnishchikVinberg.LeviProjection.Q_le_P
#print axioms OnishchikVinberg.LeviProjection.lie_mem_of_left_mem
#print axioms OnishchikVinberg.LeviProjection.rho_mem_Q
#print axioms OnishchikVinberg.LeviProjection.rho_mem_P
#print axioms OnishchikVinberg.LeviProjection.rho_mem_Q_of_mem_Q
#print axioms OnishchikVinberg.LeviProjection.rho_ad
#print axioms OnishchikVinberg.LeviProjection.rho_mem_R
#print axioms OnishchikVinberg.LeviProjection.rho_eq_ad_of_comm
#print axioms OnishchikVinberg.LeviProjection.rho_mem_R_of_comm
#print axioms OnishchikVinberg.LeviProjection.ad_mem_P_iff
#print axioms OnishchikVinberg.LeviProjection.ad_mem_Q_iff
#print axioms OnishchikVinberg.LeviProjection.R_le_P_iff
#print axioms OnishchikVinberg.LeviProjection.R_le_Q_iff
#print axioms OnishchikVinberg.LeviProjection.finrank_P
#print axioms OnishchikVinberg.LeviProjection.projection_of_fixed
