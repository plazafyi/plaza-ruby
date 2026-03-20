# frozen_string_literal: true

module Plaza
  module Models
    class Error < Plaza::Internal::Type::BaseModel
      # @!attribute error
      #   Error payload
      #
      #   @return [Plaza::Models::Error::Error]
      required :error, -> { Plaza::Error::Error }

      # @!method initialize(error:)
      #   Standard API error envelope. Every error response wraps a single `error` object
      #   with a machine-readable `code`, a human-readable `message`, and optional
      #   structured `details`.
      #
      #   @param error [Plaza::Models::Error::Error] Error payload

      # @see Plaza::Models::Error#error
      class Error < Plaza::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code (e.g. `invalid_request`, `not_found`,
        #   `rate_limited`, `query_error`, `daily_limit_exceeded`)
        #
        #   @return [String]
        required :code, String

        # @!attribute message
        #   Human-readable explanation of what went wrong
        #
        #   @return [String]
        required :message, String

        # @!attribute details
        #   Structured details when available (e.g. field-level validation errors, rate
        #   limit metadata, billing info)
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :details, Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown], nil?: true

        # @!method initialize(code:, message:, details: nil)
        #   Some parameter documentations has been truncated, see
        #   {Plaza::Models::Error::Error} for more details.
        #
        #   Error payload
        #
        #   @param code [String] Machine-readable error code (e.g. `invalid_request`, `not_found`, `rate_limited`
        #
        #   @param message [String] Human-readable explanation of what went wrong
        #
        #   @param details [Hash{Symbol=>Object}, nil] Structured details when available (e.g. field-level validation errors, rate limi
      end
    end
  end
end
