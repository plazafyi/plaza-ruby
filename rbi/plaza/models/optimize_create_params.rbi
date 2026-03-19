# typed: strong

module Plaza
  module Models
    class OptimizeCreateParams < Plaza::Models::OptimizeRequest
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::OptimizeCreateParams, Plaza::Internal::AnyHash)
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
