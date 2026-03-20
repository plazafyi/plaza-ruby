# typed: strong

module Plaza
  module Models
    class QueryExecuteResponse < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::Models::QueryExecuteResponse, Plaza::Internal::AnyHash)
        end

      # Results from each pipeline step in execution order
      sig { returns(T::Array[T::Hash[Symbol, T.anything]]) }
      attr_accessor :steps

      # Pipeline execution result containing the output of each step.
      sig do
        params(steps: T::Array[T::Hash[Symbol, T.anything]]).returns(
          T.attached_class
        )
      end
      def self.new(
        # Results from each pipeline step in execution order
        steps:
      )
      end

      sig { override.returns({ steps: T::Array[T::Hash[Symbol, T.anything]] }) }
      def to_hash
      end
    end
  end
end
