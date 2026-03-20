# typed: strong

module Plaza
  module Models
    class GeocodeReverseParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::GeocodeReverseParams, Plaza::Internal::AnyHash)
        end

      # Language code for localized names (e.g. en, de, fr)
      sig { returns(T.nilable(String)) }
      attr_reader :lang

      sig { params(lang: String).void }
      attr_writer :lang

      # Legacy shorthand. Latitude. Use near param instead.
      sig { returns(T.nilable(Float)) }
      attr_reader :lat

      sig { params(lat: Float).void }
      attr_writer :lat

      # Filter by layer: house or poi
      sig { returns(T.nilable(String)) }
      attr_reader :layer

      sig { params(layer: String).void }
      attr_writer :layer

      # Maximum results (default 1, max 20)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Legacy shorthand. Longitude. Use near param instead.
      sig { returns(T.nilable(Float)) }
      attr_reader :lng

      sig { params(lng: Float).void }
      attr_writer :lng

      # Point geometry for reverse geocode (lat,lng or GeoJSON). Alternative to lat/lng
      # params.
      sig { returns(T.nilable(String)) }
      attr_reader :near

      sig { params(near: String).void }
      attr_writer :near

      # Search radius in meters (default 200, max 5000)
      sig { returns(T.nilable(Integer)) }
      attr_reader :radius

      sig { params(radius: Integer).void }
      attr_writer :radius

      sig do
        params(
          lang: String,
          lat: Float,
          layer: String,
          limit: Integer,
          lng: Float,
          near: String,
          radius: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Language code for localized names (e.g. en, de, fr)
        lang: nil,
        # Legacy shorthand. Latitude. Use near param instead.
        lat: nil,
        # Filter by layer: house or poi
        layer: nil,
        # Maximum results (default 1, max 20)
        limit: nil,
        # Legacy shorthand. Longitude. Use near param instead.
        lng: nil,
        # Point geometry for reverse geocode (lat,lng or GeoJSON). Alternative to lat/lng
        # params.
        near: nil,
        # Search radius in meters (default 200, max 5000)
        radius: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lang: String,
            lat: Float,
            layer: String,
            limit: Integer,
            lng: Float,
            near: String,
            radius: Integer,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
