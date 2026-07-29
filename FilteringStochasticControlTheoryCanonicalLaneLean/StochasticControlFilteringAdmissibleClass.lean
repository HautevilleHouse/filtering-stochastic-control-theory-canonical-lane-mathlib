import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FilteringStochasticControlTheoryCanonicalLaneLean.KushnerStratonovichEquation
import HautevilleHouse.FilteringStochasticControlTheoryCanonicalLaneLean.ZakaiEquation

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

/-!
# Admissible Class for Filtering Stochastic Control Theory

Pins the signal–observation model, the Kushner–Stratonovich bridge, and the Zakai bridge.
-/

structure FilteringAdmittedObject where
  signalObservation : SignalObservationModel
  kushnerStratonovich : KushnerStratonovichPackage signalObservation
  zakai : ZakaiEquationPackage kushnerStratonovich
  filteringBridgeClosed : Prop
  filteringBridgeClosedTerm : filteringBridgeClosed

structure FilteringAdmissibleClass where
  object : FilteringAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def filteringAdmittedClosure (A : FilteringAdmissibleClass) : Prop :=
  A.object.filteringBridgeClosed ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse
