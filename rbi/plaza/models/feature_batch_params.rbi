# typed: strong

module Plaza
  module Models
    class FeatureBatchParams < Plaza::Models::BatchRequest
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::FeatureBatchParams, Plaza::Internal::AnyHash)
        end

      sig do
        params(request_options: Plaza::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Plaza::RequestOptions }) }
      def to_hash
      end
    end
  end
end
