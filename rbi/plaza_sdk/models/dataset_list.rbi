# typed: strong

module PlazaSDK
  module Models
    class DatasetList < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::DatasetList, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(T::Array[PlazaSDK::Dataset]) }
      attr_accessor :datasets

      sig do
        params(datasets: T::Array[PlazaSDK::Dataset::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(datasets:)
      end

      sig { override.returns({ datasets: T::Array[PlazaSDK::Dataset] }) }
      def to_hash
      end
    end
  end
end
