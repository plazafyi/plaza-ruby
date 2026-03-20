# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Query#execute
    class QueryExecuteResponse < Plaza::Internal::Type::BaseModel
      # @!attribute steps
      #   Results from each pipeline step in execution order
      #
      #   @return [Array<Hash{Symbol=>Object}>]
      required :steps,
               Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]]

      # @!method initialize(steps:)
      #   Pipeline execution result containing the output of each step.
      #
      #   @param steps [Array<Hash{Symbol=>Object}>] Results from each pipeline step in execution order
    end
  end
end
