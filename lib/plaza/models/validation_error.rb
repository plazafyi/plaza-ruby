# frozen_string_literal: true

module Plaza
  module Models
    class ValidationError < Plaza::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Plaza::Models::ValidationError::Error]
      required :error, -> { Plaza::ValidationError::Error }

      # @!method initialize(error:)
      #   Validation error with per-field details. The `details` object maps field names
      #   to arrays of error messages.
      #
      #   @param error [Plaza::Models::ValidationError::Error]

      # @see Plaza::Models::ValidationError#error
      class Error < Plaza::Internal::Type::BaseModel
        # @!attribute code
        #   Always `validation_failed`
        #
        #   @return [Symbol, Plaza::Models::ValidationError::Error::Code]
        required :code, enum: -> { Plaza::ValidationError::Error::Code }

        # @!attribute message
        #   Human-readable summary
        #
        #   @return [String]
        required :message, String

        # @!attribute details
        #   Map of field names to error message arrays
        #
        #   @return [Hash{Symbol=>Array<String>}, nil]
        optional :details, Plaza::Internal::Type::HashOf[Plaza::Internal::Type::ArrayOf[String]], nil?: true

        # @!method initialize(code:, message:, details: nil)
        #   @param code [Symbol, Plaza::Models::ValidationError::Error::Code] Always `validation_failed`
        #
        #   @param message [String] Human-readable summary
        #
        #   @param details [Hash{Symbol=>Array<String>}, nil] Map of field names to error message arrays

        # Always `validation_failed`
        #
        # @see Plaza::Models::ValidationError::Error#code
        module Code
          extend Plaza::Internal::Type::Enum

          VALIDATION_FAILED = :validation_failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
