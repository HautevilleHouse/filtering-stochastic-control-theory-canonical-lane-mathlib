import FilteringStochasticControlTheoryCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace FilteringStochasticControlTheoryCanonicalLaneLean

structure FilteringSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  measure : MeasureTheory.Measure carrier
  filtration : FilteringStructure carrier

structure FilteringAdmittedObject where
  space : FilteringSpace
  signalProcess : StochasticProcess
  observationProcess : StochasticProcess
  controlProcess : StochasticProcess
  conditionalState : ConditionalDistribution
  optimalityCondition : Prop
  conclusion : optimalityCondition

structure FilteringEndgameState where
  object : FilteringAdmittedObject

def FilteringWitnessClosed (O : FilteringAdmittedObject) : Prop :=
  O.optimalityCondition

end FilteringStochasticControlTheoryCanonicalLaneLean
end HautevilleHouse