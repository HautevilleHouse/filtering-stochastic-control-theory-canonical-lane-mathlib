import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

/-!
# Zakai Equation Package

The unnormalized filtering equation as an admissible-class bridge.
-/

structure ZakaiEquationPackage {M : SignalObservationModel}
    (K : KushnerStratonovichPackage M) where
  unnormalizedSPDE : Prop
  mildSolution : Prop
  wellPosedness : Prop
  relationToKushnerStratonovich : Prop

structure ZakaiEquationEvidence {M : SignalObservationModel}
    {K : KushnerStratonovichPackage M} (Z : ZakaiEquationPackage K) where
  unnormalizedSPDEClosed : Z.unnormalizedSPDE
  mildSolutionClosed : Z.mildSolution
  wellPosednessClosed : Z.wellPosedness
  relationToKushnerStratonovichClosed : Z.relationToKushnerStratonovich

def ZakaiEquationClosed {M : SignalObservationModel}
    {K : KushnerStratonovichPackage M} (Z : ZakaiEquationPackage K) : Prop :=
  Z.unnormalizedSPDE ∧ Z.mildSolution ∧ Z.wellPosedness ∧ Z.relationToKushnerStratonovich

theorem zakai_equation_closed_from_evidence {M : SignalObservationModel}
    {K : KushnerStratonovichPackage M} (Z : ZakaiEquationPackage K)
    (E : ZakaiEquationEvidence Z) : ZakaiEquationClosed Z := by
  exact And.intro E.unnormalizedSPDEClosed
    (And.intro E.mildSolutionClosed
      (And.intro E.wellPosednessClosed E.relationToKushnerStratonovichClosed))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
