import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure ZakaiFilterPackage (Ω : Type u) where
  unnormalizedFilterEquation : Prop
  initialCondition : Prop
  sdeWellPosedness : Prop
  relationToKushnerStratonovich : Prop

structure ZakaiFilterEvidence (Ω : Type u) (P : ZakaiFilterPackage Ω) where
  unnormalizedFilterEquationClosed : P.unnormalizedFilterEquation
  initialConditionClosed : P.initialCondition
  sdeWellPosednessClosed : P.sdeWellPosedness
  relationToKushnerStratonovichClosed : P.relationToKushnerStratonovich

def ZakaiFilterClosed (Ω : Type u) (P : ZakaiFilterPackage Ω) : Prop :=
  P.unnormalizedFilterEquation ∧ P.initialCondition ∧ P.sdeWellPosedness ∧ P.relationToKushnerStratonovich

theorem zakai_filter_closed_from_evidence (Ω : Type u) (P : ZakaiFilterPackage Ω) (E : ZakaiFilterEvidence Ω P) : ZakaiFilterClosed Ω P :=
  And.intro E.unnormalizedFilterEquationClosed (And.intro E.initialConditionClosed (And.intro E.sdeWellPosednessClosed E.relationToKushnerStratonovichClosed))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse