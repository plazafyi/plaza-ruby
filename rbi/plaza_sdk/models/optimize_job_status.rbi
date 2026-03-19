# typed: strong

module PlazaSDK
  module Models
    class OptimizeJobStatus < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::OptimizeJobStatus, PlazaSDK::Internal::AnyHash)
        end

      # Job status
      sig { returns(PlazaSDK::OptimizeJobStatus::Status::TaggedSymbol) }
      attr_accessor :status

      # Error message when failed
      sig { returns(T.nilable(String)) }
      attr_accessor :error

      # Optimization result when completed
      sig { returns(T.nilable(T.anything)) }
      attr_accessor :result

      # Status of an async optimization job
      sig do
        params(
          status: PlazaSDK::OptimizeJobStatus::Status::OrSymbol,
          error: T.nilable(String),
          result: T.nilable(T.anything)
        ).returns(T.attached_class)
      end
      def self.new(
        # Job status
        status:,
        # Error message when failed
        error: nil,
        # Optimization result when completed
        result: nil
      )
      end

      sig do
        override.returns(
          {
            status: PlazaSDK::OptimizeJobStatus::Status::TaggedSymbol,
            error: T.nilable(String),
            result: T.nilable(T.anything)
          }
        )
      end
      def to_hash
      end

      # Job status
      module Status
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::OptimizeJobStatus::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COMPLETED =
          T.let(:completed, PlazaSDK::OptimizeJobStatus::Status::TaggedSymbol)
        PROCESSING =
          T.let(:processing, PlazaSDK::OptimizeJobStatus::Status::TaggedSymbol)
        FAILED =
          T.let(:failed, PlazaSDK::OptimizeJobStatus::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::OptimizeJobStatus::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
