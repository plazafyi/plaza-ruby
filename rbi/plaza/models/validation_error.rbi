# typed: strong

module Plaza
  module Models
    class ValidationError < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::ValidationError, Plaza::Internal::AnyHash) }

      sig { returns(Plaza::ValidationError::Error) }
      attr_reader :error

      sig { params(error: Plaza::ValidationError::Error::OrHash).void }
      attr_writer :error

      # Validation error with per-field details. The `details` object maps field names
      # to arrays of error messages.
      sig do
        params(error: Plaza::ValidationError::Error::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(error:)
      end

      sig { override.returns({ error: Plaza::ValidationError::Error }) }
      def to_hash
      end

      class Error < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::ValidationError::Error, Plaza::Internal::AnyHash)
          end

        # Always `validation_failed`
        sig { returns(Plaza::ValidationError::Error::Code::OrSymbol) }
        attr_accessor :code

        # Human-readable summary
        sig { returns(String) }
        attr_accessor :message

        # Map of field names to error message arrays
        sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
        attr_accessor :details

        sig do
          params(
            code: Plaza::ValidationError::Error::Code::OrSymbol,
            message: String,
            details: T.nilable(T::Hash[Symbol, T::Array[String]])
          ).returns(T.attached_class)
        end
        def self.new(
          # Always `validation_failed`
          code:,
          # Human-readable summary
          message:,
          # Map of field names to error message arrays
          details: nil
        )
        end

        sig do
          override.returns(
            {
              code: Plaza::ValidationError::Error::Code::OrSymbol,
              message: String,
              details: T.nilable(T::Hash[Symbol, T::Array[String]])
            }
          )
        end
        def to_hash
        end

        # Always `validation_failed`
        module Code
          extend Plaza::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Plaza::ValidationError::Error::Code) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          VALIDATION_FAILED =
            T.let(
              :validation_failed,
              Plaza::ValidationError::Error::Code::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Plaza::ValidationError::Error::Code::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
