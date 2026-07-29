import canonicalLaneMathlib.AdmissibleClass
import FilteringStochasticControlTheoryCanonicalLaneLean.ZakaiEquation
import FilteringStochasticControlTheoryCanonicalLaneLean.FilteringErrorDynamics

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure SeparationPrinciplePackage {F : FilteringKernelPackage} {S : StochasticPDEPackage} {Z : ZakaiEquationPackage S} {E : FilteringErrorDynamicsPackage F} where
  controlPolicy : Type u
  separatedController : Type v
  certaintyEquivalence : Prop
  optimalityUnderSeparatedStructure : Prop
  separationHolds : Prop

structure SeparationPrincipleEvidence {F : FilteringKernelPackage} {S : StochasticPDEPackage} {Z : ZakaiEquationPackage S} {E : FilteringErrorDynamicsPackage F} (Sep : SeparationPrinciplePackage F S Z E) where
  certaintyEquivalenceClosed : Sep.certaintyEquivalence
  optimalityUnderSeparatedStructureClosed : Sep.optimalityUnderSeparatedStructure
  separationHoldsClosed : Sep.separationHolds

def SeparationPrincipleClosed {F : FilteringKernelPackage} {S : StochasticPDEPackage} {Z : ZakaiEquationPackage S} {E : FilteringErrorDynamicsPackage F} (Sep : SeparationPrinciplePackage F S Z E) : Prop :=
  Sep.certaintyEquivalence ∧ Sep.optimalityUnderSeparatedStructure ∧ Sep.separationHolds

theorem separation_principle_closed_from_evidence {F : FilteringKernelPackage} {S : StochasticPDEPackage} {Z : ZakaiEquationPackage S} {E : FilteringErrorDynamicsPackage F} (Sep : SeparationPrinciplePackage F S Z E) (Ev : SeparationPrincipleEvidence Sep) : SeparationPrincipleClosed Sep := by
  exact And.intro Ev.certaintyEquivalenceClosed (And.intro Ev.optimalityUnderSeparatedStructureClosed Ev.separationHoldsClosed)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse