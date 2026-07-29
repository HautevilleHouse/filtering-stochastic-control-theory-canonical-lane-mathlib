import FilteringStochasticControlAdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass Ω) : Prop :=
  filtering_state_closed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass Ω) : bridgeClosed A :=
  A.object.filteringError ∧ A.object.controlObjective

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse