# typed: strong

module Plaza
  module Models
    class Error < Plaza::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Plaza::Error, Plaza::Internal::AnyHash) }

      sig { returns(Plaza::Error::Error) }
      attr_reader :error

      sig { params(error: Plaza::Error::Error::OrHash).void }
      attr_writer :error

      # Standard API error response
      sig do
        params(error: Plaza::Error::Error::OrHash).returns(T.attached_class)
      end
      def self.new(error:)
      end

      sig { override.returns({ error: Plaza::Error::Error }) }
      def to_hash
      end

      class Error < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(Plaza::Error::Error, Plaza::Internal::AnyHash) }

        # Machine-readable error code
        sig { returns(String) }
        attr_accessor :code

        # Human-readable error message
        sig { returns(String) }
        attr_accessor :message

        # Additional error details
        sig { returns(T.nilable(T.anything)) }
        attr_accessor :details

        sig do
          params(
            code: String,
            message: String,
            details: T.nilable(T.anything)
          ).returns(T.attached_class)
        end
        def self.new(
          # Machine-readable error code
          code:,
          # Human-readable error message
          message:,
          # Additional error details
          details: nil
        )
        end

        sig do
          override.returns(
            { code: String, message: String, details: T.nilable(T.anything) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
