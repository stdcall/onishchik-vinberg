import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Expand
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.FieldTheory.Separable

/-!
# Chapter 2, § 3, Problem 9 and Hint 9: extending a derivation to `A[u]`

Place in the book: Onishchik, Vinberg, *Lie Groups and Algebraic Groups*
(Springer, 1990), Chapter 2, § 3, subsection "Derivations of the Algebra of
Functions". Our file `content/23-dimension.typ`, `#problem(9)` and
`#hint(9)`.

* Problem 9 (corrected: the hypothesis `char K = 0` is ours): let `B ⊂ L` be a
  subalgebra finitely generated over `A`; if `B` is algebraic over `A`, then
  any derivation `∂ : A → L` uniquely extends to a derivation `B → L`.
* Hint 9: reduce to `B = A[u]`; if `f` is a minimal polynomial of `u` over
  `A` then `f'(u) ≠ 0` and `∂u` is determined from the linear equation
  `f'(u) ∂u + f^∂(u) = 0`, where `f^∂` applies `∂` to the coefficients.
* The counterexample behind the added hypothesis (see `corrections.json`):
  in characteristic `p`, `A = K[t]`, `B = A[t^(1/p)]`, `∂ = d/dt` has no
  extension, since `1 = ∂t = ∂((t^(1/p))^p) = 0`.

Mapping of the notation:
* `A ⊂ B` ↦ commutative rings with `[Algebra A B]` (injectivity not needed);
* `L` ↦ a `B`-module `M` (for the book, the field `L ⊃ B`);
* a derivation `B → L` (the extension of `∂`) ↦ an additive map
  `D : B →+ M` with `D (x * y) = x • D y + y • D x` (`IsLeibniz D`), the
  book's formula (2.3.1) with `φ = id`; `K`-linearity is not used;
* `u` ↦ `u : B`; `f ∈ A[T]` ↦ `f : A[X]`; `f(u)` ↦ `aeval u f`;
  `f'` ↦ `derivative f`; `f^∂(u)` ↦ `twist D f u = ∑ₙ uⁿ • D(aₙ)`.

Covered: the chain rule `D (f u) = f^D(u) + f'(u) D(u)` for every `f`; the
linear equation of Hint 9 for a root `u` of `f`; uniqueness (a derivation on
`A[u]` is determined by its values on `A` and at `u`, and the value at `u` is
determined when `f'(u)` acts injectively, e.g. `f'(u) ≠ 0` in a field `L`);
`f'(u) ≠ 0` for the minimal polynomial over a field of characteristic zero
(for the book, over the field of fractions `Q A`); in characteristic `p` every
derivation kills `p`-th powers, the derivative of `X ^ p - t` vanishes (so
Hint 9 fails as printed), and the counterexample `d/dt` on `K[t] ⊂ K[s]`,
`t = s ^ p`, into any nontrivial `K[s]`-algebra `L` (e.g. `K(s)`).

Not covered: the existence of the extension in characteristic zero (the
construction of `D` on `A[u]` and its well-definedness), the reduction to
`B = A[u]` and to the field of fractions (Problem 8), the irreducibility of
`X ^ p - t` over `K(t)`, and Problem 10 / Theorem 3.
-/

namespace OnishchikVinberg.DerivationExtension

open Polynomial

section Leibniz

variable {B M : Type*} [CommRing B] [AddCommGroup M] [Module B M]

/-- The Leibniz rule (2.3.1) for `φ = id`. -/
def IsLeibniz (D : B →+ M) : Prop :=
  ∀ x y : B, D (x * y) = x • D y + y • D x

variable {D : B →+ M}

theorem map_one_eq_zero (hD : IsLeibniz D) : D 1 = 0 := by
  have h := hD 1 1
  rw [one_mul, one_smul] at h
  have h2 : D 1 + D 1 = D 1 + 0 := by rw [add_zero]; exact h.symm
  exact add_left_cancel h2

theorem map_pow (hD : IsLeibniz D) (x : B) (n : ℕ) :
    D (x ^ n) = ((n : B) * x ^ (n - 1)) • D x := by
  induction n with
  | zero => simp [map_one_eq_zero hD]
  | succ n ih =>
    rw [pow_succ, hD, ih, smul_smul]
    rcases n with _ | n
    · simp
    · simp only [Nat.add_sub_cancel, Nat.cast_add, Nat.cast_one, pow_succ]
      rw [← add_smul]
      congr 1
      ring

/-- In characteristic `p` every derivation kills `p`-th powers. -/
theorem map_pow_char (hD : IsLeibniz D) (p : ℕ) [CharP B p] (s : B) :
    D (s ^ p) = 0 := by
  rw [map_pow hD, CharP.cast_eq_zero, zero_mul, zero_smul]

end Leibniz

section ChainRule

variable {A B M : Type*} [CommRing A] [CommRing B] [Algebra A B]
  [AddCommGroup M] [Module B M]

/-- `f^D(u)`: the polynomial `f` with `D` applied to its coefficients,
evaluated at `u`. -/
noncomputable def twist (D : B →+ M) (f : A[X]) (u : B) : M :=
  f.sum fun n a => u ^ n • D (algebraMap A B a)

theorem twist_add (D : B →+ M) (f g : A[X]) (u : B) :
    twist D (f + g) u = twist D f u + twist D g u := by
  unfold twist
  refine sum_add_index f g _ (fun n => by simp) (fun n a b => ?_)
  rw [map_add, map_add, smul_add]

theorem twist_monomial (D : B →+ M) (n : ℕ) (a : A) (u : B) :
    twist D (monomial n a) u = u ^ n • D (algebraMap A B a) := by
  unfold twist
  exact sum_monomial_index a _ (by simp)

/-- Hint 9, the chain rule: `D(f(u)) = f^D(u) + f'(u) D(u)`. -/
theorem map_aeval {D : B →+ M} (hD : IsLeibniz D) (f : A[X]) (u : B) :
    D (aeval u f) = twist D f u + aeval u (derivative f) • D u := by
  induction f using Polynomial.induction_on' with
  | add f g hf hg =>
    rw [map_add, map_add, hf, hg, twist_add, derivative_add, map_add,
      add_smul]
    abel
  | monomial n a =>
    rw [aeval_monomial, hD, map_pow hD, twist_monomial, derivative_monomial,
      aeval_monomial, smul_smul, map_mul, map_natCast, add_comm]
    congr 2
    ring

/-- Hint 9, the linear equation: if `f(u) = 0` then `f'(u) D(u) + f^D(u) = 0`. -/
theorem derivative_smul_add_twist_eq_zero {D : B →+ M} (hD : IsLeibniz D)
    {f : A[X]} {u : B} (hu : aeval u f = 0) :
    aeval u (derivative f) • D u + twist D f u = 0 := by
  rw [add_comm, ← map_aeval hD, hu, map_zero]

theorem twist_congr {D₁ D₂ : B →+ M}
    (h : ∀ a : A, D₁ (algebraMap A B a) = D₂ (algebraMap A B a))
    (f : A[X]) (u : B) : twist D₁ f u = twist D₂ f u := by
  unfold twist
  simp only [h]

/-- Uniqueness on `A[u]`: two derivations that agree on `A` and at `u` agree
on every `g(u)`, `g ∈ A[T]`. -/
theorem eq_on_aeval {D₁ D₂ : B →+ M} (hD₁ : IsLeibniz D₁) (hD₂ : IsLeibniz D₂)
    (hA : ∀ a : A, D₁ (algebraMap A B a) = D₂ (algebraMap A B a)) {u : B}
    (hu : D₁ u = D₂ u) (g : A[X]) : D₁ (aeval u g) = D₂ (aeval u g) := by
  rw [map_aeval hD₁, map_aeval hD₂, twist_congr hA, hu]

/-- Hint 9: `∂u` is determined by the linear equation when `f'(u)` acts
injectively (for the book: `f'(u) ≠ 0` in the field `L`). -/
theorem eq_at_root {D₁ D₂ : B →+ M} (hD₁ : IsLeibniz D₁) (hD₂ : IsLeibniz D₂)
    (hA : ∀ a : A, D₁ (algebraMap A B a) = D₂ (algebraMap A B a))
    {f : A[X]} {u : B} (hu : aeval u f = 0)
    (hf' : ∀ m : M, aeval u (derivative f) • m = 0 → m = 0) : D₁ u = D₂ u := by
  have h₁ := derivative_smul_add_twist_eq_zero hD₁ hu
  have h₂ := derivative_smul_add_twist_eq_zero hD₂ hu
  rw [twist_congr hA] at h₁
  have h : aeval u (derivative f) • (D₁ u - D₂ u) = 0 := by
    rw [smul_sub, sub_eq_zero]
    exact add_right_cancel (h₁.trans h₂.symm)
  exact sub_eq_zero.mp (hf' _ h)

end ChainRule

/-- Hint 9 in characteristic zero: for the minimal polynomial `f` of an
algebraic `u` over a field `F` (for the book, `F = Q A`), `f'(u) ≠ 0`. -/
theorem minpoly_derivative_ne_zero {F E : Type*} [Field F] [CharZero F]
    [Field E] [Algebra F E] {u : E} (hu : IsIntegral F u) :
    aeval u (derivative (minpoly F u)) ≠ 0 :=
  (minpoly.irreducible hu).separable.aeval_derivative_ne_zero (minpoly.aeval F u)

/-- Hint 9 as printed fails in characteristic `p`: the minimal polynomial
`X ^ p - t` of `t ^ (1/p)` has zero derivative. -/
theorem derivative_X_pow_char_sub_C {R : Type*} [CommRing R] (p : ℕ) [CharP R p]
    (t : R) : derivative (X ^ p - C t : R[X]) = 0 := by
  rw [derivative_sub, derivative_C, sub_zero, derivative_X_pow,
    CharP.cast_eq_zero, map_zero, zero_mul]

/-- The counterexample to Problem 9 as printed. `A = K[t]` is embedded in
`B = K[s]` by `t ↦ s ^ p` (`expand K p`), `∂ = d/dt : A → L`, where `L` is any
nontrivial `B`-algebra (in the book `L = K(s)`). No derivation `D : B → L`
extends `∂`: `1 = ∂t = D(s ^ p) = 0`. For the book `p` is the prime
characteristic of `K`; the proof only uses `CharP K p`. -/
theorem no_extension (K : Type*) [CommRing K] (p : ℕ) [CharP K p]
    (L : Type*) [CommRing L] [Nontrivial L] [Algebra K[X] L] :
    ¬ ∃ D : K[X] →+ L, IsLeibniz D ∧
      ∀ g : K[X], D (expand K p g) = algebraMap K[X] L (expand K p (derivative g)) := by
  rintro ⟨D, hD, hext⟩
  have h := hext X
  rw [expand_X, map_pow_char hD p, derivative_X, map_one, map_one] at h
  exact zero_ne_one h

end OnishchikVinberg.DerivationExtension

#print axioms OnishchikVinberg.DerivationExtension.map_one_eq_zero
#print axioms OnishchikVinberg.DerivationExtension.map_pow
#print axioms OnishchikVinberg.DerivationExtension.map_pow_char
#print axioms OnishchikVinberg.DerivationExtension.twist_add
#print axioms OnishchikVinberg.DerivationExtension.twist_monomial
#print axioms OnishchikVinberg.DerivationExtension.map_aeval
#print axioms OnishchikVinberg.DerivationExtension.derivative_smul_add_twist_eq_zero
#print axioms OnishchikVinberg.DerivationExtension.twist_congr
#print axioms OnishchikVinberg.DerivationExtension.eq_on_aeval
#print axioms OnishchikVinberg.DerivationExtension.eq_at_root
#print axioms OnishchikVinberg.DerivationExtension.minpoly_derivative_ne_zero
#print axioms OnishchikVinberg.DerivationExtension.derivative_X_pow_char_sub_C
#print axioms OnishchikVinberg.DerivationExtension.no_extension
