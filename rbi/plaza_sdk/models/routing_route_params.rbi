# typed: strong

module PlazaSDK
  module Models
    class RoutingRouteParams < PlazaSDK::Models::RouteRequest
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(PlazaSDK::RoutingRouteParams, PlazaSDK::Internal::AnyHash)
        end

      sig do
        params(request_options: PlazaSDK::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: PlazaSDK::RequestOptions }) }
      def to_hash
      end
    end
  end
end
