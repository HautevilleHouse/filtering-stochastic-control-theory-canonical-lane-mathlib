import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure KushnerStratonovichPackage (Ω : Type u) where
  signalDynamics : Ω → ℝ
  observationDynamics : Ω → ℝ
  innovationProcess : Prop
  filterEquation : Prop
  normalizedFilter : Prop

structure KushnerStratonovichEvidence (Ω : Type u) (P : KushnerStratonovichPackage Ω) where
  innovationProcessClosed : P.innovationProcess
  filterEquationClosed : P.filterEquation
  normalizedFilterClosed : P.normalizedFilter

def KushnerStratonovichClosed (Ω : Type u) (P : KushnerStratonovichPackage Ω) : Prop :=
  P.innovationProcess ∧ P.filterEquation ∧ P.normalizedFilter

theorem kushner_stratonovich_closed_from_evidence (Ω : Type u) (P : KushnerStratonovichPackage Ω) (E : KushnerStratonovichEvidence Ω P) : KushnerStratonovichClosed Ω P :=
  And.intro E.innovationProcessClosed (And.intro E.filterEquationClosed E.normalizedFilterClosed)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse