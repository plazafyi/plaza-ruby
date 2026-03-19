# typed: strong

module PlazaSDK
  module Models
    class Error < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(PlazaSDK::Error, PlazaSDK::Internal::AnyHash) }

      sig { returns(PlazaSDK::Error::Error) }
      attr_reader :error

      sig { params(error: PlazaSDK::Error::Error::OrHash).void }
      attr_writer :error

      # Standard API error response
      sig do
        params(error: PlazaSDK::Error::Error::OrHash).returns(T.attached_class)
      end
      def self.new(error:)
      end

      sig { override.returns({ error: PlazaSDK::Error::Error }) }
      def to_hash
      end

      class Error < PlazaSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(PlazaSDK::Error::Error, PlazaSDK::Internal::AnyHash)
          end

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
