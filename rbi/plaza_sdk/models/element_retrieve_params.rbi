# typed: strong

module PlazaSDK
  module Models
    class ElementRetrieveParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(PlazaSDK::ElementRetrieveParams, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :type

      sig { returns(Integer) }
      attr_accessor :id

      sig do
        params(
          type: String,
          id: Integer,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(type:, id:, request_options: {})
      end

      sig do
        override.returns(
          {
            type: String,
            id: Integer,
            request_options: PlazaSDK::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
