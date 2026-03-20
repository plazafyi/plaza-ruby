# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Optimize#retrieve
    class OptimizeJobStatus < Plaza::Internal::Type::BaseModel
      # @!attribute status
      #   Current job state
      #
      #   @return [Symbol, Plaza::Models::OptimizeJobStatus::Status]
      required :status, enum: -> { Plaza::OptimizeJobStatus::Status }

      # @!attribute result
      #   Completed optimization result as a GeoJSON FeatureCollection. Each Feature is a
      #   waypoint in optimized visit order. Top-level fields provide summary statistics.
      #
      #   @return [Plaza::Models::OptimizeCompletedResult, nil]
      optional :result, -> { Plaza::OptimizeCompletedResult }, nil?: true

      # @!method initialize(status:, result: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::OptimizeJobStatus} for more details.
      #
      #   Status of an async optimization job. When `completed`, the `result` field
      #   contains the full OptimizeCompletedResult. When `processing`, the job is still
      #   running — poll again. Failed jobs return a standard Error response (HTTP 422),
      #   not this schema.
      #
      #   @param status [Symbol, Plaza::Models::OptimizeJobStatus::Status] Current job state
      #
      #   @param result [Plaza::Models::OptimizeCompletedResult, nil] Completed optimization result as a GeoJSON FeatureCollection. Each Feature is a

      # Current job state
      #
      # @see Plaza::Models::OptimizeJobStatus#status
      module Status
        extend Plaza::Internal::Type::Enum

        COMPLETED = :completed
        PROCESSING = :processing

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
