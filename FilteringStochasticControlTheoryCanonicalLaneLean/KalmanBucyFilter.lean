import FilteringStochasticControlTheoryCanonicalLaneLean.FilteringEquation
import FilteringStochasticControlTheoryCanonicalLaneLean.RiccatiEquation

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure KalmanBucyFilterPackage {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    {F : FilteringEquationPackage S O} (R : RiccatiEquationPackage (C : ControlProcessPackage S O)) where
  filterDynamics : Prop
  covarianceUpdate : Prop
  gainMatrix : Prop
  innovationResidual : Prop
  optimalFiltering : Prop

structure KalmanBucyFilterEvidence {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    {F : FilteringEquationPackage S O} {C : ControlProcessPackage S O}
    {R : RiccatiEquationPackage C} (K : KalmanBucyFilterPackage R) where
  filterDynamicsClosed : K.filterDynamics
  covarianceUpdateClosed : K.covarianceUpdate
  gainMatrixClosed : K.gainMatrix
  innovationResidualClosed : K.innovationResidual
  optimalFilteringClosed : K.optimalFiltering

def KalmanBucyFilterClosed {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    {F : FilteringEquationPackage S O} {C : ControlProcessPackage S O}
    {R : RiccatiEquationPackage C} (K : KalmanBucyFilterPackage R) : Prop :=
  K.filterDynamics ∧ K.covarianceUpdate ∧ K.gainMatrix ∧
  K.innovationResidual ∧ K.optimalFiltering

theorem kalman_bucy_filter_closed_from_evidence
    {S : SignalProcessPackage} {O : ObservationProcessPackage S}
    {F : FilteringEquationPackage S O} {C : ControlProcessPackage S O}
    {R : RiccatiEquationPackage C} (K : KalmanBucyFilterPackage R)
    (E : KalmanBucyFilterEvidence K) : KalmanBucyFilterClosed K := by
  exact And.intro E.filterDynamicsClosed
    (And.intro E.covarianceUpdateClosed
      (And.intro E.gainMatrixClosed
        (And.intro E.innovationResidualClosed E.optimalFilteringClosed)))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
