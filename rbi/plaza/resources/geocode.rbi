# typed: strong

module Plaza
  module Resources
    class Geocode
      # Autocomplete a partial address
      sig do
        params(
          q: String,
          country_code: String,
          format_: String,
          lang: String,
          lat: Float,
          layer: String,
          limit: Integer,
          lng: Float,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::AutocompleteResult)
      end
      def autocomplete(
        # Partial address query
        q:,
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
        # Maximum results (default 10, max 20)
        limit: nil,
        # Focus longitude
        lng: nil,
        request_options: {}
      )
      end

      # Autocomplete a partial address
      sig do
        params(
          q: String,
          country_code: String,
          format_: String,
          lang: String,
          lat: Float,
          layer: String,
          limit: Integer,
          lng: Float,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::AutocompleteResult)
      end
      def autocomplete_post(
        # Partial address query
        q:,
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
        # Maximum results (default 10, max 20)
        limit: nil,
        # Focus longitude
        lng: nil,
        request_options: {}
      )
      end

      # Batch geocode multiple addresses
      sig do
        params(
          addresses: T::Array[String],
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::Models::GeocodeBatchResponse)
      end
      def batch(addresses:, request_options: {})
      end

      # Forward geocode an address
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
        ).returns(Plaza::GeocodeResult)
      end
      def forward(
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

      # Forward geocode an address
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
        ).returns(Plaza::GeocodeResult)
      end
      def forward_post(
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

      # Reverse geocode a coordinate
      sig do
        params(
          format_: String,
          lang: String,
          lat: Float,
          layer: String,
          limit: Integer,
          lng: Float,
          near: String,
          radius: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ReverseGeocodeResult)
      end
      def reverse(
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
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

      # Reverse geocode a coordinate
      sig do
        params(
          format_: String,
          lang: String,
          lat: Float,
          layer: String,
          limit: Integer,
          lng: Float,
          near: String,
          radius: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ReverseGeocodeResult)
      end
      def reverse_post(
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
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

      # @api private
      sig { params(client: Plaza::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
