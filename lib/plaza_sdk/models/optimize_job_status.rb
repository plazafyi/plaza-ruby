# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Optimize#retrieve
    class OptimizeJobStatus < PlazaSDK::Internal::Type::BaseModel
      # @!attribute status
      #   Job status
      #
      #   @return [Symbol, PlazaSDK::Models::OptimizeJobStatus::Status]
      required :status, enum: -> { PlazaSDK::OptimizeJobStatus::Status }

      # @!attribute error
      #   Error message when failed
      #
      #   @return [String, nil]
      optional :error, String, nil?: true

      # @!attribute result
      #   Optimization result when completed
      #
      #   @return [Object, nil]
      optional :result, PlazaSDK::Internal::Type::Unknown, nil?: true

      # @!method initialize(status:, error: nil, result: nil)
      #   Status of an async optimization job
      #
      #   @param status [Symbol, PlazaSDK::Models::OptimizeJobStatus::Status] Job status
      #
      #   @param error [String, nil] Error message when failed
      #
      #   @param result [Object, nil] Optimization result when completed

      # Job status
      #
      # @see PlazaSDK::Models::OptimizeJobStatus#status
      module Status
        extend PlazaSDK::Internal::Type::Enum

        COMPLETED = :completed
        PROCESSING = :processing
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
