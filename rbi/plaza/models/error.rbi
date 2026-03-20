# typed: strong

module Plaza
  module Models
    class Error < Plaza::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Plaza::Error, Plaza::Internal::AnyHash) }

      # Error payload
      sig { returns(Plaza::Error::Error) }
      attr_reader :error

      sig { params(error: Plaza::Error::Error::OrHash).void }
      attr_writer :error

      # Standard API error envelope. Every error response wraps a single `error` object
      # with a machine-readable `code`, a human-readable `message`, and optional
      # structured `details`.
      sig do
        params(error: Plaza::Error::Error::OrHash).returns(T.attached_class)
      end
      def self.new(
        # Error payload
        error:
      )
      end

      sig { override.returns({ error: Plaza::Error::Error }) }
      def to_hash
      end

      class Error < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(Plaza::Error::Error, Plaza::Internal::AnyHash) }

        # Machine-readable error code (e.g. `invalid_request`, `not_found`,
        # `rate_limited`, `query_error`, `daily_limit_exceeded`)
        sig { returns(String) }
        attr_accessor :code

        # Human-readable explanation of what went wrong
        sig { returns(String) }
        attr_accessor :message

        # Structured details when available (e.g. field-level validation errors, rate
        # limit metadata, billing info)
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :details

        # Error payload
        sig do
          params(
            code: String,
            message: String,
            details: T.nilable(T::Hash[Symbol, T.anything])
          ).returns(T.attached_class)
        end
        def self.new(
          # Machine-readable error code (e.g. `invalid_request`, `not_found`,
          # `rate_limited`, `query_error`, `daily_limit_exceeded`)
          code:,
          # Human-readable explanation of what went wrong
          message:,
          # Structured details when available (e.g. field-level validation errors, rate
          # limit metadata, billing info)
          details: nil
        )
        end

        sig do
          override.returns(
            {
              code: String,
              message: String,
              details: T.nilable(T::Hash[Symbol, T.anything])
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
