import canonicalLaneMathlib.AdmissibleClass

/-!
# Kushner–Stratonovich Equation Package
-/

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure KushnerStratonovichPackage where
  signalProcess : Type u
  observationProcess : Type v
  innovationProcess : Type w
  filterDensity : Prop
  spdeFormulation : Prop
  strongSolution : Prop
  uniqueness : Prop

structure KushnerStratonovichEvidence (K : KushnerStratonovichPackage) where
  filterDensityClosed : K.filterDensity
  spdeFormulationClosed : K.spdeFormulation
  strongSolutionClosed : K.strongSolution
  uniquenessClosed : K.uniqueness

def KushnerStratonovichClosed (K : KushnerStratonovichPackage) : Prop :=
  K.filterDensity ∧ K.spdeFormulation ∧ K.strongSolution ∧ K.uniqueness

theorem kushner_stratonovich_closed_from_evidence
    (K : KushnerStratonovichPackage) (E : KushnerStratonovichEvidence K) :
    KushnerStratonovichClosed K := by
  exact And.intro E.filterDensityClosed
    (And.intro E.spdeFormulationClosed
      (And.intro E.strongSolutionClosed E.uniquenessClosed))

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse