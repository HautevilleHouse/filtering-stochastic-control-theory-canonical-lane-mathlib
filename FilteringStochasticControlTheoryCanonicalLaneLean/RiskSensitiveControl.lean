import FilteringStochasticControlTheoryCanonicalLaneLean.SeparationPrinciple

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure RiskSensitiveControlPackage where
  riskParameter : ℝ
  exponentialCost : Prop
  associatedRiskNeutral : Prop
  optimalControlCharacterized : Prop
  largeDeviationLimit : Prop

structure RiskSensitiveControlEvidence (R : RiskSensitiveControlPackage) where
  exponentialCostClosed : R.exponentialCost
  associatedRiskNeutralClosed : R.associatedRiskNeutral
  optimalControlCharacterizedClosed : R.optimalControlCharacterized
  largeDeviationLimitClosed : R.largeDeviationLimit

def RiskSensitiveControlClosed (R : RiskSensitiveControlPackage) : Prop :=
  R.exponentialCost ∧ R.associatedRiskNeutral ∧
  R.optimalControlCharacterized ∧ R.largeDeviationLimit

theorem risk_sensitive_control_closed_from_evidence
    (R : RiskSensitiveControlPackage) (E : RiskSensitiveControlEvidence R) :
    RiskSensitiveControlClosed R := by
  exact And.intro E.exponentialCostClosed
    (And.intro E.associatedRiskNeutralClosed
      (And.intro E.optimalControlCharacterizedClosed E.largeDeviationLimitClosed))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse