# typed: strong

module Plaza
  module Models
    class DatasetList < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::DatasetList, Plaza::Internal::AnyHash) }

      sig { returns(T::Array[Plaza::Dataset]) }
      attr_accessor :datasets

      sig do
        params(datasets: T::Array[Plaza::Dataset::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(datasets:)
      end

      sig { override.returns({ datasets: T::Array[Plaza::Dataset] }) }
      def to_hash
      end
    end
  end
end
