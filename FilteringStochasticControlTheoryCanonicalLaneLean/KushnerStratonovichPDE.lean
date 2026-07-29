import FilteringStochasticControlTheoryCanonicalLaneLean.RicciFlowPDE

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure KushnerStratonovichPDEPackage where
  signalSDE : StochasticDifferentialEquation
  observationSDE : StochasticDifferentialEquation
  conditionalDensity : DensityProcess
  spdeEvolution : Prop
  innovationProcess : Prop
  initialCondition : Prop

structure KushnerStratonovichEvidence (K : KushnerStratonovichPDEPackage) where
  spdeEvolutionClosed : K.spdeEvolution
  innovationProcessClosed : K.innovationProcess
  initialConditionClosed : K.initialCondition

def KushnerStratonovichClosed (K : KushnerStratonovichPDEPackage) : Prop :=
  K.spdeEvolution ∧ K.innovationProcess ∧ K.initialCondition

theorem kushner_stratonovich_closed_from_evidence
    (K : KushnerStratonovichPDEPackage) (E : KushnerStratonovichEvidence K) :
    KushnerStratonovichClosed K := by
  exact And.intro E.spdeEvolutionClosed
    (And.intro E.innovationProcessClosed E.initialConditionClosed)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse