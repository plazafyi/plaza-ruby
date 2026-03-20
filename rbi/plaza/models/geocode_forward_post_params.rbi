# typed: strong

module Plaza
  module Models
    class GeocodeForwardPostParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::GeocodeForwardPostParams, Plaza::Internal::AnyHash)
        end

      # Address or place name
      sig { returns(String) }
      attr_accessor :q

      # Bounding box filter: south,west,north,east
      sig { returns(T.nilable(String)) }
      attr_reader :bbox

      sig { params(bbox: String).void }
      attr_writer :bbox

      # ISO 3166-1 alpha-2 country code filter
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      # Response format: json (default), geojson, csv, ndjson
      sig { returns(T.nilable(String)) }
      attr_reader :format_

      sig { params(format_: String).void }
      attr_writer :format_

      # Language code for localized names (e.g. en, de, fr)
      sig { returns(T.nilable(String)) }
      attr_reader :lang

      sig { params(lang: String).void }
      attr_writer :lang

      # Focus latitude
      sig { returns(T.nilable(Float)) }
      attr_reader :lat

      sig { params(lat: Float).void }
      attr_writer :lat

      # Filter by layer: address, poi, or admin
      sig { returns(T.nilable(String)) }
      attr_reader :layer

      sig { params(layer: String).void }
      attr_writer :layer

      # Maximum results (default 20, max 100)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Focus longitude
      sig { returns(T.nilable(Float)) }
      attr_reader :lng

      sig { params(lng: Float).void }
      attr_writer :lng

      sig do
        params(
          q: String,
          bbox: String,
          country_code: String,
          format_: String,
          lang: String,
          lat: Float,
          layer: String,
          limit: Integer,
          lng: Float,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Address or place name
        q:,
        # Bounding box filter: south,west,north,east
        bbox: nil,
        # ISO 3166-1 alpha-2 country code filter
        country_code: nil,
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
        # Language code for localized names (e.g. en, de, fr)
        lang: nil,
        # Focus latitude
        lat: nil,
        # Filter by layer: address, poi, or admin
        layer: nil,
        # Maximum results (default 20, max 100)
        limit: nil,
        # Focus longitude
        lng: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            q: String,
            bbox: String,
            country_code: String,
            format_: String,
            lang: String,
            lat: Float,
            layer: String,
            limit: Integer,
            lng: Float,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
