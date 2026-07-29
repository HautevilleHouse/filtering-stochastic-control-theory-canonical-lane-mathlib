import SeparationPrinciple

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure HJBEquationPackage (Ω : Type u) where
  valueFunctionDefined : Prop
  hjbPde : Prop
  viscositySolution : Prop
  optimalFeedbackControl : Prop

structure HJBEquationEvidence (Ω : Type u) (P : HJBEquationPackage Ω) where
  valueFunctionDefinedClosed : P.valueFunctionDefined
  hjbPdeClosed : P.hjbPde
  viscositySolutionClosed : P.viscositySolution
  optimalFeedbackControlClosed : P.optimalFeedbackControl

def HJBEquationClosed (Ω : Type u) (P : HJBEquationPackage Ω) : Prop :=
  P.valueFunctionDefined ∧ P.hjbPde ∧ P.viscositySolution ∧ P.optimalFeedbackControl

theorem hjb_equation_closed_from_evidence (Ω : Type u) (P : HJBEquationPackage Ω) (E : HJBEquationEvidence Ω P) : HJBEquationClosed Ω P :=
  And.intro E.valueFunctionDefinedClosed (And.intro E.hjbPdeClosed (And.intro E.viscositySolutionClosed E.optimalFeedbackControlClosed))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse