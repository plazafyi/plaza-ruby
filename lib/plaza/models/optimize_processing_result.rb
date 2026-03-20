# frozen_string_literal: true

module Plaza
  module Models
    class OptimizeProcessingResult < Plaza::Internal::Type::BaseModel
      # @!attribute job_id
      #   Job ID for polling the result
      #
      #   @return [String]
      required :job_id, String

      # @!attribute status
      #   Always `processing`
      #
      #   @return [Symbol, Plaza::Models::OptimizeProcessingResult::Status]
      required :status, enum: -> { Plaza::OptimizeProcessingResult::Status }

      # @!method initialize(job_id:, status:)
      #   Async optimization in progress. Poll `GET /api/v1/optimize/{job_id}` until the
      #   status changes to `completed` or `failed`.
      #
      #   @param job_id [String] Job ID for polling the result
      #
      #   @param status [Symbol, Plaza::Models::OptimizeProcessingResult::Status] Always `processing`

      # Always `processing`
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
