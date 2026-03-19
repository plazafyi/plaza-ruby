# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Optimize#retrieve
    class OptimizeJobStatus < Plaza::Internal::Type::BaseModel
      # @!attribute status
      #   Job status
      #
      #   @return [Symbol, Plaza::Models::OptimizeJobStatus::Status]
      required :status, enum: -> { Plaza::OptimizeJobStatus::Status }

      # @!attribute error
      #   Error message when failed
      #
      #   @return [String, nil]
      optional :error, String, nil?: true

      # @!attribute result
      #   Optimization result when completed
      #
      #   @return [Object, nil]
      optional :result, Plaza::Internal::Type::Unknown, nil?: true

      # @!method initialize(status:, error: nil, result: nil)
      #   Status of an async optimization job
      #
      #   @param status [Symbol, Plaza::Models::OptimizeJobStatus::Status] Job status
      #
      #   @param error [String, nil] Error message when failed
      #
      #   @param result [Object, nil] Optimization result when completed

      # Job status
      #
      # @see Plaza::Models::OptimizeJobStatus#status
      module Status
        extend Plaza::Internal::Type::Enum

        COMPLETED = :completed
        PROCESSING = :processing
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
