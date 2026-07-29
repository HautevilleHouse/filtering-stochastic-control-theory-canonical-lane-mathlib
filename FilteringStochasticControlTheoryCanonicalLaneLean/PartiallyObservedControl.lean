import FilteringStochasticControlTheoryCanonicalLaneLean.RiskSensitiveControl

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure PartiallyObservedControlPackage where
  stateSpace : Type u
  observationSpace : Type v
  controlSpace : Type w
  dynamics : StochasticDifferentialEquation
  observationModel : StochasticDifferentialEquation
  costFunctional : CostFunctional
  optimalControlCondition : Prop
  valueFunction : ValueFunction
  hjbEquation : Prop
  optimalityClosed : Prop

structure PartiallyObservedControlEvidence (P : PartiallyObservedControlPackage) where
  optimalControlConditionClosed : P.optimalControlCondition
  hjbEquationClosed : P.hjbEquation
  optimalityClosedClosed : P.optimalityClosed

def PartiallyObservedControlClosed (P : PartiallyObservedControlPackage) : Prop :=
  P.optimalControlCondition ∧ P.hjbEquation ∧ P.optimalityClosed

theorem partially_observed_control_closed_from_evidence
    (P : PartiallyObservedControlPackage) (E : PartiallyObservedControlEvidence P) :
    PartiallyObservedControlClosed P := by
  exact And.intro E.optimalControlConditionClosed
    (And.intro E.hjbEquationClosed E.optimalityClosedClosed)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse