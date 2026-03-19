# frozen_string_literal: true

module PlazaSDK
  module Models
    class OptimizeProcessingResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute job_id
      #   Job ID for polling
      #
      #   @return [String]
      required :job_id, String

      # @!attribute status
      #   Job status
      #
      #   @return [Symbol, PlazaSDK::Models::OptimizeProcessingResult::Status]
      required :status, enum: -> { PlazaSDK::OptimizeProcessingResult::Status }

      # @!method initialize(job_id:, status:)
      #   Async optimization in progress — poll with the job_id
      #
      #   @param job_id [String] Job ID for polling
      #
      #   @param status [Symbol, PlazaSDK::Models::OptimizeProcessingResult::Status] Job status

      # Job status
      #
      # @see PlazaSDK::Models::OptimizeProcessingResult#status
      module Status
        extend PlazaSDK::Internal::Type::Enum

        PROCESSING = :processing

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
