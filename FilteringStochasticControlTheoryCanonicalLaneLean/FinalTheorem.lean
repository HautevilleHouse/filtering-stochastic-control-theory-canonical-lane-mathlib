import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FilteringStochasticControlTheoryCanonicalLaneLean.StochasticControlFilteringAdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

def ConstrainedFilteringClosure (A : FilteringAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_filtering_endgame (A : FilteringAdmissibleClass) :
    ConstrainedFilteringClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
