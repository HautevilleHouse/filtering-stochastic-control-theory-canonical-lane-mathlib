import canonicalLaneMathlib.AdmissibleClass

/-!
# Separation Principle Package
-/

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure SeparatingPrinciplePackage where
  controlProcess : Type u
  filterEstimate : Type v
  certaintyEquivalence : Prop
  optimalControlLaw : Prop
  separationTheorem : Prop

structure SeparatingPrincipleEvidence (S : SeparatingPrinciplePackage) where
  certaintyEquivalenceClosed : S.certaintyEquivalence
  optimalControlLawClosed : S.optimalControlLaw
  separationTheoremClosed : S.separationTheorem

def SeparatingPrincipleClosed (S : SeparatingPrinciplePackage) : Prop :=
  S.certaintyEquivalence ∧ S.optimalControlLaw ∧ S.separationTheorem

theorem separating_principle_closed_from_evidence
    (S : SeparatingPrinciplePackage) (E : SeparatingPrincipleEvidence S) :
    SeparatingPrincipleClosed S := by
  exact And.intro E.certaintyEquivalenceClosed
    (And.intro E.optimalControlLawClosed E.separationTheoremClosed)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse