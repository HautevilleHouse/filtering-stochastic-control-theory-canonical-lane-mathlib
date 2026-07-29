import FilteringStochasticControlTheoryCanonicalLaneLean.PartiallyObservedControl

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure InformationStatePackage where
  conditionalDistribution : ConditionalDistribution
  sufficientStatistic : SufficientStatistic
  beliefState : BeliefState
  markovianProperty : Prop
  dimensionReduction : Prop

structure InformationStateEvidence (I : InformationStatePackage) where
  conditionalDistributionClosed : I.conditionalDistribution
  sufficientStatisticClosed : I.sufficientStatistic
  beliefStateClosed : I.beliefState
  markovianPropertyClosed : I.markovianProperty
  dimensionReductionClosed : I.dimensionReduction

def InformationStateClosed (I : InformationStatePackage) : Prop :=
  I.conditionalDistribution ∧ I.sufficientStatistic ∧
  I.beliefState ∧ I.markovianProperty ∧ I.dimensionReduction

theorem information_state_closed_from_evidence
    (I : InformationStatePackage) (E : InformationStateEvidence I) :
    InformationStateClosed I := by
  exact And.intro E.conditionalDistributionClosed
    (And.intro E.sufficientStatisticClosed
      (And.intro E.beliefStateClosed
        (And.intro E.markovianPropertyClosed E.dimensionReductionClosed)))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse