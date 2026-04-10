# frozen_string_literal: true

module Plaza
  module Resources
    class Geocode
      # Some parameter documentations has been truncated, see
      # {Plaza::Models::GeocodeAutocompleteParams} for more details.
      #
      # Autocomplete a partial address
      #
      # @overload autocomplete(q:, format_: nil, country_code: nil, focus: nil, lang: nil, layer: nil, limit: nil, request_options: {})
      #
      # @param q [String] Body param: Partial address or place name input
      #
      # @param format_ [String] Query param: Response format: json (default), geojson, csv, ndjson
      #
      # @param country_code [String, nil] Body param: ISO 3166-1 alpha-2 country code to restrict results
      #
      # @param focus [Plaza::Models::PointGeometry, nil] Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, lat
      #
      # @param lang [String, nil] Body param: Preferred response language (ISO 639-1)
      #
      # @param layer [String, nil] Body param: Filter by result layer (e.g. `address`, `place`, `poi`)
      #
      # @param limit [Integer, nil] Body param: Maximum number of suggestions (default: 5, max: 20)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::AutocompleteResult]
      #
      # @see Plaza::Models::GeocodeAutocompleteParams
      def autocomplete(params)
        query_params = [:format_]
        parsed, options = Plaza::GeocodeAutocompleteParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/geocode/autocomplete",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
          model: Plaza::AutocompleteResult,
          options: options
        )
      end

      # Batch geocode multiple addresses
      #
      # @overload batch(addresses:, request_options: {})
      #
      # @param addresses [Array<String>]
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::GeocodeBatchResponse]
      #
      # @see Plaza::Models::GeocodeBatchParams
      def batch(params)
        parsed, options = Plaza::GeocodeBatchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/geocode/batch",
          body: parsed,
          model: Plaza::Models::GeocodeBatchResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::GeocodeForwardParams} for more details.
      #
      # Forward geocode an address
      #
      # @overload forward(q:, format_: nil, country_code: nil, focus: nil, lang: nil, layer: nil, limit: nil, request_options: {})
      #
      # @param q [String] Body param: Address or place name to geocode
      #
      # @param format_ [String] Query param: Response format: json (default), geojson, csv, ndjson
      #
      # @param country_code [String, nil] Body param: ISO 3166-1 alpha-2 country code to restrict results
      #
      # @param focus [Plaza::Models::PointGeometry, nil] Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, lat
      #
      # @param lang [String, nil] Body param: Preferred response language (ISO 639-1)
      #
      # @param layer [String, nil] Body param: Filter by result layer (e.g. `address`, `place`, `poi`)
      #
      # @param limit [Integer, nil] Body param: Maximum number of results (default: 5, max: 50)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::GeocodeResult]
      #
      # @see Plaza::Models::GeocodeForwardParams
      def forward(params)
        query_params = [:format_]
        parsed, options = Plaza::GeocodeForwardParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/geocode",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
          model: Plaza::GeocodeResult,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::GeocodeReverseParams} for more details.
      #
      # Reverse geocode a coordinate
      #
      # @overload reverse(geometry:, format_: nil, lang: nil, limit: nil, radius: nil, request_options: {})
      #
      # @param geometry [Plaza::Models::PointGeometry] Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, lat
      #
      # @param format_ [String] Query param: Response format: json (default), geojson, csv, ndjson
      #
      # @param lang [String, nil] Body param: Preferred response language (ISO 639-1)
      #
      # @param limit [Integer, nil] Body param: Maximum number of results (default: 1, max: 50)
      #
      # @param radius [Float, nil] Body param: Search radius in meters (default: 100)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::ReverseGeocodeResult]
      #
      # @see Plaza::Models::GeocodeReverseParams
      def reverse(params)
        query_params = [:format_]
        parsed, options = Plaza::GeocodeReverseParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/geocode/reverse",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
          model: Plaza::ReverseGeocodeResult,
          options: options
        )
      end

      # @api private
      #
      # @param client [Plaza::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
