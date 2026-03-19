# frozen_string_literal: true

module Plaza
  module Models
    class OptimizeProcessingResult < Plaza::Internal::Type::BaseModel
      # @!attribute job_id
      #   Job ID for polling
      #
      #   @return [String]
      required :job_id, String

      # @!attribute status
      #   Job status
      #
      #   @return [Symbol, Plaza::Models::OptimizeProcessingResult::Status]
      required :status, enum: -> { Plaza::OptimizeProcessingResult::Status }

      # @!method initialize(job_id:, status:)
      #   Async optimization in progress — poll with the job_id
      #
      #   @param job_id [String] Job ID for polling
      #
      #   @param status [Symbol, Plaza::Models::OptimizeProcessingResult::Status] Job status

      # Job status
      #
      # @see Plaza::Models::OptimizeProcessingResult#status
      module Status
        extend Plaza::Internal::Type::Enum

        PROCESSING = :processing

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
