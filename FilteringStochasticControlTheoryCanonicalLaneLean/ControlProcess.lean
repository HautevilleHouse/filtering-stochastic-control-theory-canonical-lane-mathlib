import FilteringStochasticControlTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure SignalProcessPackage where
  stateSpace : Type u
  stateTopology : TopologicalSpace stateSpace
  stateSpaceIsManifold : Prop
  driftField : Type v
  diffusionField : Type w
  initialDistribution : Prop
  markovProperty : Prop

structure ObservationProcessPackage (S : SignalProcessPackage) where
  observationSpace : Type u
  observationTopology : TopologicalSpace observationSpace
  observationFunction : Type v
  observationNoise : Type w
  conditionalIndependence : Prop
  nondegenerateNoise : Prop

structure ControlProcessPackage (S : SignalProcessPackage) (O : ObservationProcessPackage S) where
  controlSpace : Type u
  controlPolicy : Type v
  adaptedToFilteration : Prop
  costFunctional : Prop
  optimalControlExists : Prop

structure ControlProcessEvidence {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    (C : ControlProcessPackage S O) where
  adaptedToFilterationClosed : C.adaptedToFilteration
  costFunctionalClosed : C.costFunctional
  optimalControlExistsClosed : C.optimalControlExists

def ControlProcessClosed {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    (C : ControlProcessPackage S O) : Prop :=
  C.adaptedToFilteration ∧ C.costFunctional ∧ C.optimalControlExists

theorem control_process_closed_from_evidence
    {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    (C : ControlProcessPackage S O) (E : ControlProcessEvidence C) :
    ControlProcessClosed C := by
  exact And.intro E.adaptedToFilterationClosed
    (And.intro E.costFunctionalClosed E.optimalControlExistsClosed)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
