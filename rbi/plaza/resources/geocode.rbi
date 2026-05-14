# typed: strong

module Plaza
  module Resources
    class Geocode
      # Autocomplete a partial address
      sig do
        params(
          q: String,
          format_: String,
          country_code: T.nilable(String),
          focus: T.nilable(Plaza::PointGeometry::OrHash),
          lang: T.nilable(String),
          layer: T.nilable(String),
          limit: T.nilable(Integer),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::AutocompleteResult)
      end
      def autocomplete(
        # Body param: Partial address or place name input
        q:,
        # Query param: Response format: json (default), geojson, csv, ndjson
        format_: nil,
        # Body param: ISO 3166-1 alpha-2 country code to restrict results
        country_code: nil,
        # Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude,
        # latitude] order. Optional third element is altitude in meters.
        focus: nil,
        # Body param: Preferred response language (ISO 639-1)
        lang: nil,
        # Body param: Filter by result layer (e.g. `address`, `place`, `poi`)
        layer: nil,
        # Body param: Maximum number of suggestions (default: 5, max: 20)
        limit: nil,
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
          format_: String,
          country_code: T.nilable(String),
          focus: T.nilable(Plaza::PointGeometry::OrHash),
          lang: T.nilable(String),
          layer: T.nilable(String),
          limit: T.nilable(Integer),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::GeocodeResult)
      end
      def forward(
        # Body param: Address or place name to geocode
        q:,
        # Query param: Response format: json (default), geojson, csv, ndjson
        format_: nil,
        # Body param: ISO 3166-1 alpha-2 country code to restrict results
        country_code: nil,
        # Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude,
        # latitude] order. Optional third element is altitude in meters.
        focus: nil,
        # Body param: Preferred response language (ISO 639-1)
        lang: nil,
        # Body param: Filter by result layer (e.g. `address`, `place`, `poi`)
        layer: nil,
        # Body param: Maximum number of results (default: 5, max: 50)
        limit: nil,
        request_options: {}
      )
      end

      # Reverse geocode a coordinate
      sig do
        params(
          geometry: Plaza::PointGeometry::OrHash,
          format_: String,
          lang: T.nilable(String),
          limit: T.nilable(Integer),
          radius: T.nilable(Float),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ReverseGeocodeResult)
      end
      def reverse(
        # Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude,
        # latitude] order. Optional third element is altitude in meters.
        geometry:,
        # Query param: Response format: json (default), geojson, csv, ndjson
        format_: nil,
        # Body param: Preferred response language (ISO 639-1)
        lang: nil,
        # Body param: Maximum number of results (default: 1, max: 50)
        limit: nil,
        # Body param: Search radius in meters (default: 100)
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
