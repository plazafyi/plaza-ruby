# typed: strong

module PlazaSDK
  module Models
    class RoutingNearestParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(PlazaSDK::RoutingNearestParams, PlazaSDK::Internal::AnyHash)
        end

      # Latitude
      sig { returns(Float) }
      attr_accessor :lat

      # Longitude
      sig { returns(Float) }
      attr_accessor :lng

      # Search radius in meters (default 500, max 5000)
      sig { returns(T.nilable(Integer)) }
      attr_reader :radius

      sig { params(radius: Integer).void }
      attr_writer :radius

      sig do
        params(
          lat: Float,
          lng: Float,
          radius: Integer,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Latitude
        lat:,
        # Longitude
        lng:,
        # Search radius in meters (default 500, max 5000)
        radius: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lat: Float,
            lng: Float,
            radius: Integer,
            request_options: PlazaSDK::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
