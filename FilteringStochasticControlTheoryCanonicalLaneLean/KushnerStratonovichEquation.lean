import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

/-!
# Kushner–Stratonovich Equation Package

This module structures the main filtering equation as an admissible-class bridge.
The signal–observation model is expressed through explicit proof obligations.
-/

structure SignalObservationModel where
  signalProcess : Type u
  observationProcess : Type v
  signalDynamics : Prop
  observationDynamics : Prop
  initialCondition : Prop
  independenceStructure : Prop

structure SignalObservationEvidence (M : SignalObservationModel) where
  signalDynamicsClosed : M.signalDynamics
  observationDynamicsClosed : M.observationDynamics
  initialConditionClosed : M.initialCondition
  independenceStructureClosed : M.independenceStructure

def SignalObservationClosed (M : SignalObservationModel) : Prop :=
  M.signalDynamics ∧ M.observationDynamics ∧ M.initialCondition ∧ M.independenceStructure

theorem signal_observation_closed_from_evidence (M : SignalObservationModel)
    (E : SignalObservationEvidence M) : SignalObservationClosed M := by
  exact And.intro E.signalDynamicsClosed
    (And.intro E.observationDynamicsClosed
      (And.intro E.initialConditionClosed E.independenceStructureClosed))

structure KushnerStratonovichPackage (M : SignalObservationModel) where
  unnormalizedDensity : Type w
  spdeForm : Prop
  normalizedEquation : Prop
  existenceAndUniqueness : Prop

structure KushnerStratonovichEvidence {M : SignalObservationModel}
    (K : KushnerStratonovichPackage M) where
  spdeFormClosed : K.spdeForm
  normalizedEquationClosed : K.normalizedEquation
  existenceAndUniquenessClosed : K.existenceAndUniqueness

def KushnerStratonovichClosed {M : SignalObservationModel}
    (K : KushnerStratonovichPackage M) : Prop :=
  K.spdeForm ∧ K.normalizedEquation ∧ K.existenceAndUniqueness

theorem kushner_stratonovich_closed_from_evidence {M : SignalObservationModel}
    (K : KushnerStratonovichPackage M) (E : KushnerStratonovichEvidence K) :
    KushnerStratonovichClosed K := by
  exact And.intro E.spdeFormClosed
    (And.intro E.normalizedEquationClosed E.existenceAndUniquenessClosed)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
