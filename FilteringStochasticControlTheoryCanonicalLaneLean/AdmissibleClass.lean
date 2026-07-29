import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure AdmissibleClass where
  object : FilteringAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FilteringWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse