import FilteringStochasticControlTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

def ConstrainedFilteringClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_filtering_endgame (A : AdmissibleClass) :
    ConstrainedFilteringClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse