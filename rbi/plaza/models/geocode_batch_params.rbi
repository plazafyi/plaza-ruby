# typed: strong

module Plaza
  module Models
    class GeocodeBatchParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::GeocodeBatchParams, Plaza::Internal::AnyHash)
        end

      sig { returns(T::Array[String]) }
      attr_accessor :addresses

      sig do
        params(
          addresses: T::Array[String],
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(addresses:, request_options: {})
      end

      sig do
        override.returns(
          {
            addresses: T::Array[String],
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
