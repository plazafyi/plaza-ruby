# typed: strong

module PlazaSDK
  module Models
    class OptimizeProcessingResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::OptimizeProcessingResult, PlazaSDK::Internal::AnyHash)
        end

      # Job ID for polling
      sig { returns(String) }
      attr_accessor :job_id

      # Job status
      sig { returns(PlazaSDK::OptimizeProcessingResult::Status::TaggedSymbol) }
      attr_accessor :status

      # Async optimization in progress — poll with the job_id
      sig do
        params(
          job_id: String,
          status: PlazaSDK::OptimizeProcessingResult::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Job ID for polling
        job_id:,
        # Job status
        status:
      )
      end

      sig do
        override.returns(
          {
            job_id: String,
            status: PlazaSDK::OptimizeProcessingResult::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Job status
      module Status
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, PlazaSDK::OptimizeProcessingResult::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PROCESSING =
          T.let(
            :processing,
            PlazaSDK::OptimizeProcessingResult::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[PlazaSDK::OptimizeProcessingResult::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
