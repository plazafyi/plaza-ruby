# typed: strong

module Plaza
  module Models
    class FeatureRetrieveParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::FeatureRetrieveParams, Plaza::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :type

      sig { returns(Integer) }
      attr_accessor :id

      sig do
        params(
          type: String,
          id: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(type:, id:, request_options: {})
      end

      sig do
        override.returns(
          { type: String, id: Integer, request_options: Plaza::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
