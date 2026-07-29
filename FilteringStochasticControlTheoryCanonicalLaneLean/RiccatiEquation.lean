import FilteringStochasticControlTheoryCanonicalLaneLean.ControlProcess

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure RiccatiEquationPackage {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    (C : ControlProcessPackage S O) where
  algebraicRiccatiEquation : Prop
  differentialRiccatiEquation : Prop
  solutionExists : Prop
  solutionUnique : Prop
  stabilizabilityCondition : Prop
  detectabilityCondition : Prop

structure RiccatiEquationEvidence {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    {C : ControlProcessPackage S O} (R : RiccatiEquationPackage C) where
  algebraicRiccatiEquationClosed : R.algebraicRiccatiEquation
  differentialRiccatiEquationClosed : R.differentialRiccatiEquation
  solutionExistsClosed : R.solutionExists
  solutionUniqueClosed : R.solutionUnique
  stabilizabilityConditionClosed : R.stabilizabilityCondition
  detectabilityConditionClosed : R.detectabilityCondition

def RiccatiEquationClosed {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    {C : ControlProcessPackage S O} (R : RiccatiEquationPackage C) : Prop :=
  R.algebraicRiccatiEquation ∧ R.differentialRiccatiEquation ∧ R.solutionExists ∧
  R.solutionUnique ∧ R.stabilizabilityCondition ∧ R.detectabilityCondition

theorem riccati_equation_closed_from_evidence
    {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    {C : ControlProcessPackage S O} (R : RiccatiEquationPackage C)
    (E : RiccatiEquationEvidence R) : RiccatiEquationClosed R := by
  exact And.intro E.algebraicRiccatiEquationClosed
    (And.intro E.differentialRiccatiEquationClosed
      (And.intro E.solutionExistsClosed
        (And.intro E.solutionUniqueClosed
          (And.intro E.stabilizabilityConditionClosed E.detectabilityConditionClosed))))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
