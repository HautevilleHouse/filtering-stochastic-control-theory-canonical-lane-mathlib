import canonicalLaneMathlib.AdmissibleClass

/-!
# Finite-Dimensional Filter Package
-/

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure FiniteDimensionalFilterPackage where
  stateDimension : ℕ
  observationDimension : ℕ
  benesDaumType : Prop
  exactFiniteFilter : Prop
  momentClosure : Prop

structure FiniteDimensionalFilterEvidence (F : FiniteDimensionalFilterPackage) where
  benesDaumTypeClosed : F.benesDaumType
  exactFiniteFilterClosed : F.exactFiniteFilter
  momentClosureClosed : F.momentClosure

def FiniteDimensionalFilterClosed (F : FiniteDimensionalFilterPackage) : Prop :=
  F.benesDaumType ∧ F.exactFiniteFilter ∧ F.momentClosure

theorem finite_dimensional_filter_closed_from_evidence
    (F : FiniteDimensionalFilterPackage) (E : FiniteDimensionalFilterEvidence F) :
    FiniteDimensionalFilterClosed F := by
  exact And.intro E.benesDaumTypeClosed
    (And.intro E.exactFiniteFilterClosed E.momentClosureClosed)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse