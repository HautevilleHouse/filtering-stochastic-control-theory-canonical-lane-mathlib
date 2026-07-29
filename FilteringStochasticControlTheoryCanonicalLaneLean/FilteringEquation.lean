import FilteringStochasticControlTheoryCanonicalLaneLean.ControlProcess

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure FilteringEquationPackage (S : SignalProcessPackage) (O : ObservationProcessPackage S) where
  signalDynamics : Prop
  observationDynamics : Prop
  conditionalDensityEvolution : Prop
  fokkerPlanckKolmogorov : Prop
  normalizingConstant : Prop

structure FilteringEquationEvidence {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    (F : FilteringEquationPackage S O) where
  signalDynamicsClosed : F.signalDynamics
  observationDynamicsClosed : F.observationDynamics
  conditionalDensityEvolutionClosed : F.conditionalDensityEvolution
  fokkerPlanckKolmogorovClosed : F.fokkerPlanckKolmogorov
  normalizingConstantClosed : F.normalizingConstant

def FilteringEquationClosed {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    (F : FilteringEquationPackage S O) : Prop :=
  F.signalDynamics ∧ F.observationDynamics ∧ F.conditionalDensityEvolution ∧
  F.fokkerPlanckKolmogorov ∧ F.normalizingConstant

theorem filtering_equation_closed_from_evidence
    {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    (F : FilteringEquationPackage S O) (E : FilteringEquationEvidence F) :
    FilteringEquationClosed F := by
  exact And.intro E.signalDynamicsClosed
    (And.intro E.observationDynamicsClosed
      (And.intro E.conditionalDensityEvolutionClosed
        (And.intro E.fokkerPlanckKolmogorovClosed E.normalizingConstantClosed)))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
