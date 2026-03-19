# typed: strong

module PlazaSDK
  module Models
    class GeocodeBatchParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(PlazaSDK::GeocodeBatchParams, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(T::Array[String]) }
      attr_accessor :addresses

      sig do
        params(
          addresses: T::Array[String],
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(addresses:, request_options: {})
      end

      sig do
        override.returns(
          {
            addresses: T::Array[String],
            request_options: PlazaSDK::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
