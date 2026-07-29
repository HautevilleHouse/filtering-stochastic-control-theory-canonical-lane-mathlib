import BridgeLemmas

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

def gateClosed (A : AdmissibleClass Ω) : Prop :=
  A.endpointSatisfied ∨ A.remainingErrorRecorded

theorem gate_from_admissible_class (A : AdmissibleClass Ω) : gateClosed A :=
  A.gateWitness

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse