# typed: strong

module Plaza
  module Models
    class OptimizeJobStatus < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::OptimizeJobStatus, Plaza::Internal::AnyHash)
        end

      # Current job state
      sig { returns(Plaza::OptimizeJobStatus::Status::TaggedSymbol) }
      attr_accessor :status

      # Completed optimization result as a GeoJSON FeatureCollection. Each Feature is a
      # waypoint in optimized visit order. Top-level fields provide summary statistics.
      sig { returns(T.nilable(Plaza::OptimizeCompletedResult)) }
      attr_reader :result

      sig do
        params(result: T.nilable(Plaza::OptimizeCompletedResult::OrHash)).void
      end
      attr_writer :result

      # Status of an async optimization job. When `completed`, the `result` field
      # contains the full OptimizeCompletedResult. When `processing`, the job is still
      # running — poll again. Failed jobs return a standard Error response (HTTP 422),
      # not this schema.
      sig do
        params(
          status: Plaza::OptimizeJobStatus::Status::OrSymbol,
          result: T.nilable(Plaza::OptimizeCompletedResult::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Current job state
        status:,
        # Completed optimization result as a GeoJSON FeatureCollection. Each Feature is a
        # waypoint in optimized visit order. Top-level fields provide summary statistics.
        result: nil
      )
      end

      sig do
        override.returns(
          {
            status: Plaza::OptimizeJobStatus::Status::TaggedSymbol,
            result: T.nilable(Plaza::OptimizeCompletedResult)
          }
        )
      end
      def to_hash
      end

      # Current job state
      module Status
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::OptimizeJobStatus::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COMPLETED =
          T.let(:completed, Plaza::OptimizeJobStatus::Status::TaggedSymbol)
        PROCESSING =
          T.let(:processing, Plaza::OptimizeJobStatus::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::OptimizeJobStatus::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
