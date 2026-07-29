import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure FilteringStochasticControlState (Ω : Type u) where
  observationProcess : Ω → ℝ
  controlProcess : Ω → ℝ
  signalProcess : Ω → ℝ
  filteringError : Prop
  controlObjective : Prop

def filtering_state_closed (s : FilteringStochasticControlState Ω) : Prop :=
  s.filteringError ∧ s.controlObjective

structure AdmissibleClass where
  object : FilteringStochasticControlState Ω
  endpointSatisfied : filterStateClosed object
  remainingErrorRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainingErrorRecorded

def admittedClosure (A : AdmissibleClass Ω) : Prop :=
  filtering_state_closed A.object ∧ (A.endpointSatisfied ∨ A.remainingErrorRecorded)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse