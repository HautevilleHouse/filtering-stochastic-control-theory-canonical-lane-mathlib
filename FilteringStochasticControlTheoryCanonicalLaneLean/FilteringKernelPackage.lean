import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure FilteringKernelPackage where
  stateSpace : Type u
  observationSpace : Type v
  kernel : stateSpace → observationSpace → Prop
  kernelMeasurable : Prop
  kernelMarkov : Prop
  initialDistribution : Prop

structure FilteringKernelEvidence (F : FilteringKernelPackage) where
  kernelMeasurableClosed : F.kernelMeasurable
  kernelMarkovClosed : F.kernelMarkov
  initialDistributionClosed : F.initialDistribution

def FilteringKernelClosed (F : FilteringKernelPackage) : Prop :=
  F.kernelMeasurable ∧ F.kernelMarkov ∧ F.initialDistribution

theorem filtering_kernel_closed_from_evidence (F : FilteringKernelPackage) (E : FilteringKernelEvidence F) : FilteringKernelClosed F := by
  exact And.intro E.kernelMeasurableClosed (And.intro E.kernelMarkovClosed E.initialDistributionClosed)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse