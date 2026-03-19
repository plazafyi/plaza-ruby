# frozen_string_literal: true

module PlazaSDK
  module Models
    class Error < PlazaSDK::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [PlazaSDK::Models::Error::Error]
      required :error, -> { PlazaSDK::Error::Error }

      # @!method initialize(error:)
      #   Standard API error response
      #
      #   @param error [PlazaSDK::Models::Error::Error]

      # @see PlazaSDK::Models::Error#error
      class Error < PlazaSDK::Internal::Type::BaseModel
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
        optional :details, PlazaSDK::Internal::Type::Unknown, nil?: true

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
