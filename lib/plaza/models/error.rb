# frozen_string_literal: true

module Plaza
  module Models
    class Error < Plaza::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Plaza::Models::Error::Error]
      required :error, -> { Plaza::Error::Error }

      # @!method initialize(error:)
      #   Standard API error response
      #
      #   @param error [Plaza::Models::Error::Error]

      # @see Plaza::Models::Error#error
      class Error < Plaza::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code
        #
        #   @return [String]
        required :code, String

        # @!attribute message
        #   Human-readable error message
        #
        #   @return [String]
        required :message, String

        # @!attribute details
        #   Additional error details
        #
        #   @return [Object, nil]
        optional :details, Plaza::Internal::Type::Unknown, nil?: true

        # @!method initialize(code:, message:, details: nil)
        #   @param code [String] Machine-readable error code
        #
        #   @param message [String] Human-readable error message
        #
        #   @param details [Object, nil] Additional error details
      end
    end
  end
end
