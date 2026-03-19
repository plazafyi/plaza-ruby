# typed: strong

module PlazaSDK
  module Models
    class ElevationLookupParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(PlazaSDK::ElevationLookupParams, PlazaSDK::Internal::AnyHash)
        end

      # Latitude (single point)
      sig { returns(T.nilable(Float)) }
      attr_reader :lat

      sig { params(lat: Float).void }
      attr_writer :lat

      # Longitude (single point)
      sig { returns(T.nilable(Float)) }
      attr_reader :lng

      sig { params(lng: Float).void }
      attr_writer :lng

      # Pipe-separated lng,lat pairs (batch)
      sig { returns(T.nilable(String)) }
      attr_reader :locations

      sig { params(locations: String).void }
      attr_writer :locations

      sig do
        params(
          lat: Float,
          lng: Float,
          locations: String,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Latitude (single point)
        lat: nil,
        # Longitude (single point)
        lng: nil,
        # Pipe-separated lng,lat pairs (batch)
        locations: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lat: Float,
            lng: Float,
            locations: String,
            request_options: PlazaSDK::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
