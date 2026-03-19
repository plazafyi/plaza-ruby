# typed: strong

module Plaza
  module Models
    class OptimizeProcessingResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::OptimizeProcessingResult, Plaza::Internal::AnyHash)
        end

      # Job ID for polling
      sig { returns(String) }
      attr_accessor :job_id

      # Job status
      sig { returns(Plaza::OptimizeProcessingResult::Status::TaggedSymbol) }
      attr_accessor :status

      # Async optimization in progress — poll with the job_id
      sig do
        params(
          job_id: String,
          status: Plaza::OptimizeProcessingResult::Status::OrSymbol
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
            status: Plaza::OptimizeProcessingResult::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Job status
      module Status
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Plaza::OptimizeProcessingResult::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PROCESSING =
          T.let(
            :processing,
            Plaza::OptimizeProcessingResult::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Plaza::OptimizeProcessingResult::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
