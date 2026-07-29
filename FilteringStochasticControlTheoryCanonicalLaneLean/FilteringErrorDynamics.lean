import canonicalLaneMathlib.AdmissibleClass
import FilteringStochasticControlTheoryCanonicalLaneLean.FilteringKernelPackage

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure FilteringErrorDynamicsPackage {F : FilteringKernelPackage} where
  errorCovariance : Type u
  errorMean : Type v
  estimationErrorEquation : Prop
  riccatiEquation : Prop
  asymptoticStability : Prop
  performanceBound : Prop

structure FilteringErrorDynamicsEvidence {F : FilteringKernelPackage} (E : FilteringErrorDynamicsPackage F) where
  estimationErrorEquationClosed : E.estimationErrorEquation
  riccatiEquationClosed : E.riccatiEquation
  asymptoticStabilityClosed : E.asymptoticStability
  performanceBoundClosed : E.performanceBound

def FilteringErrorDynamicsClosed {F : FilteringKernelPackage} (E : FilteringErrorDynamicsPackage F) : Prop :=
  E.estimationErrorEquation ∧ E.riccatiEquation ∧ E.asymptoticStability ∧ E.performanceBound

theorem filtering_error_dynamics_closed_from_evidence {F : FilteringKernelPackage} (E : FilteringErrorDynamicsPackage F) (Ev : FilteringErrorDynamicsEvidence E) : FilteringErrorDynamicsClosed E := by
  exact And.intro Ev.estimationErrorEquationClosed (And.intro Ev.riccatiEquationClosed (And.intro Ev.asymptoticStabilityClosed Ev.performanceBoundClosed))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse