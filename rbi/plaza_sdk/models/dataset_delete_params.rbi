# typed: strong

module PlazaSDK
  module Models
    class DatasetDeleteParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(PlazaSDK::DatasetDeleteParams, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          id: String,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(id:, request_options: {})
      end

      sig do
        override.returns(
          { id: String, request_options: PlazaSDK::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
