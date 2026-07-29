import FilteringStochasticControlTheoryCanonicalLaneLean.FilteringEquation

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure InnovationsProcessPackage {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    (F : FilteringEquationPackage S O) where
  innovationProcessDefined : Prop
  innovationIsMartingale : Prop
  innovationCovariance : Prop
  innovationBrowianMotion : Prop
  innovationsRepresentation : Prop

structure InnovationsProcessEvidence {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    {F : FilteringEquationPackage S O} (I : InnovationsProcessPackage F) where
  innovationProcessDefinedClosed : I.innovationProcessDefined
  innovationIsMartingaleClosed : I.innovationIsMartingale
  innovationCovarianceClosed : I.innovationCovariance
  innovationBrowianMotionClosed : I.innovationBrowianMotion
  innovationsRepresentationClosed : I.innovationsRepresentation

def InnovationsProcessClosed {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    {F : FilteringEquationPackage S O} (I : InnovationsProcessPackage F) : Prop :=
  I.innovationProcessDefined ∧ I.innovationIsMartingale ∧ I.innovationCovariance ∧
  I.innovationBrowianMotion ∧ I.innovationsRepresentation

theorem innovations_process_closed_from_evidence
    {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    {F : FilteringEquationPackage S O} (I : InnovationsProcessPackage F)
    (E : InnovationsProcessEvidence I) : InnovationsProcessClosed I := by
  exact And.intro E.innovationProcessDefinedClosed
    (And.intro E.innovationIsMartingaleClosed
      (And.intro E.innovationCovarianceClosed
        (And.intro E.innovationBrowianMotionClosed E.innovationsRepresentationClosed)))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
