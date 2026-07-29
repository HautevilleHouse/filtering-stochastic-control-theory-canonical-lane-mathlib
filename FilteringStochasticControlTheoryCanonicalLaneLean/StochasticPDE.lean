import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure StochasticPDEPackage where
  stateDimension : Nat
  observationDimension : Nat
  driftCoefficient : Type u
  diffusionCoefficient : Type v
  innovationProcess : Type w
  spdeWellPosedness : Prop
  filtrability : Prop
  markovProperty : Prop

structure StochasticPDEEvidence (S : StochasticPDEPackage) where
  spdeWellPosednessClosed : S.spdeWellPosedness
  filtrabilityClosed : S.filtrability
  markovPropertyClosed : S.markovProperty

def StochasticPDEClosed (S : StochasticPDEPackage) : Prop :=
  S.spdeWellPosedness ∧ S.filtrability ∧ S.markovProperty

theorem stochastic_pde_closed_from_evidence (S : StochasticPDEPackage) (E : StochasticPDEEvidence S) : StochasticPDEClosed S := by
  exact And.intro E.spdeWellPosednessClosed (And.intro E.filtrabilityClosed E.markovPropertyClosed)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse