# typed: strong

module Plaza
  module Models
    class MatrixResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::MatrixResult, Plaza::Internal::AnyHash) }

      # Distance matrix (meters), origins x destinations
      sig { returns(T::Array[T::Array[T.nilable(Float)]]) }
      attr_accessor :distances

      # Duration matrix (seconds), origins x destinations
      sig { returns(T::Array[T::Array[T.nilable(Float)]]) }
      attr_accessor :durations

      sig do
        params(
          distances: T::Array[T::Array[T.nilable(Float)]],
          durations: T::Array[T::Array[T.nilable(Float)]]
        ).returns(T.attached_class)
      end
      def self.new(
        # Distance matrix (meters), origins x destinations
        distances:,
        # Duration matrix (seconds), origins x destinations
        durations:
      )
      end

      sig do
        override.returns(
          {
            distances: T::Array[T::Array[T.nilable(Float)]],
            durations: T::Array[T::Array[T.nilable(Float)]]
          }
        )
      end
      def to_hash
      end
    end
  end
end
