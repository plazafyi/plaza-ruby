# frozen_string_literal: true

module Plaza
  module Resources
    class Geocode
      # Autocomplete a partial address
      #
      # @overload autocomplete(q:, country_code: nil, format_: nil, lang: nil, lat: nil, layer: nil, limit: nil, lng: nil, request_options: {})
      #
      # @param q [String] Partial address query
      #
      # @param country_code [String] ISO 3166-1 alpha-2 country code filter
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param lang [String] Language code for localized names (e.g. en, de, fr)
      #
      # @param lat [Float] Focus latitude
      #
      # @param layer [String] Filter by layer: address, poi, or admin
      #
      # @param limit [Integer] Maximum results (default 10, max 20)
      #
      # @param lng [Float] Focus longitude
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::AutocompleteResult]
      #
      # @see Plaza::Models::GeocodeAutocompleteParams
      def autocomplete(params)
        parsed, options = Plaza::GeocodeAutocompleteParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/geocode/autocomplete",
          query: query.transform_keys(format_: "format"),
          model: Plaza::AutocompleteResult,
          options: options
        )
      end

      # Autocomplete a partial address
      #
      # @overload autocomplete_post(q:, country_code: nil, format_: nil, lang: nil, lat: nil, layer: nil, limit: nil, lng: nil, request_options: {})
      #
      # @param q [String] Partial address query
      #
      # @param country_code [String] ISO 3166-1 alpha-2 country code filter
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param lang [String] Language code for localized names (e.g. en, de, fr)
      #
      # @param lat [Float] Focus latitude
      #
      # @param layer [String] Filter by layer: address, poi, or admin
      #
      # @param limit [Integer] Maximum results (default 10, max 20)
      #
      # @param lng [Float] Focus longitude
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::AutocompleteResult]
      #
      # @see Plaza::Models::GeocodeAutocompletePostParams
      def autocomplete_post(params)
        parsed, options = Plaza::GeocodeAutocompletePostParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: "api/v1/geocode/autocomplete",
          query: query.transform_keys(format_: "format"),
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

      # Forward geocode an address
      #
      # @overload forward(q:, bbox: nil, country_code: nil, format_: nil, lang: nil, lat: nil, layer: nil, limit: nil, lng: nil, request_options: {})
      #
      # @param q [String] Address or place name
      #
      # @param bbox [String] Bounding box filter: south,west,north,east
      #
      # @param country_code [String] ISO 3166-1 alpha-2 country code filter
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param lang [String] Language code for localized names (e.g. en, de, fr)
      #
      # @param lat [Float] Focus latitude
      #
      # @param layer [String] Filter by layer: address, poi, or admin
      #
      # @param limit [Integer] Maximum results (default 20, max 100)
      #
      # @param lng [Float] Focus longitude
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::GeocodeResult]
      #
      # @see Plaza::Models::GeocodeForwardParams
      def forward(params)
        parsed, options = Plaza::GeocodeForwardParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/geocode",
          query: query.transform_keys(format_: "format"),
          model: Plaza::GeocodeResult,
          options: options
        )
      end

      # Forward geocode an address
      #
      # @overload forward_post(q:, bbox: nil, country_code: nil, format_: nil, lang: nil, lat: nil, layer: nil, limit: nil, lng: nil, request_options: {})
      #
      # @param q [String] Address or place name
      #
      # @param bbox [String] Bounding box filter: south,west,north,east
      #
      # @param country_code [String] ISO 3166-1 alpha-2 country code filter
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param lang [String] Language code for localized names (e.g. en, de, fr)
      #
      # @param lat [Float] Focus latitude
      #
      # @param layer [String] Filter by layer: address, poi, or admin
      #
      # @param limit [Integer] Maximum results (default 20, max 100)
      #
      # @param lng [Float] Focus longitude
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::GeocodeResult]
      #
      # @see Plaza::Models::GeocodeForwardPostParams
      def forward_post(params)
        parsed, options = Plaza::GeocodeForwardPostParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: "api/v1/geocode",
          query: query.transform_keys(format_: "format"),
          model: Plaza::GeocodeResult,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::GeocodeReverseParams} for more details.
      #
      # Reverse geocode a coordinate
      #
      # @overload reverse(format_: nil, lang: nil, lat: nil, layer: nil, limit: nil, lng: nil, near: nil, radius: nil, request_options: {})
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param lang [String] Language code for localized names (e.g. en, de, fr)
      #
      # @param lat [Float] Legacy shorthand. Latitude. Use near param instead.
      #
      # @param layer [String] Filter by layer: house or poi
      #
      # @param limit [Integer] Maximum results (default 1, max 20)
      #
      # @param lng [Float] Legacy shorthand. Longitude. Use near param instead.
      #
      # @param near [String] Point geometry for reverse geocode (lat,lng or GeoJSON). Alternative to lat/lng
      #
      # @param radius [Integer] Search radius in meters (default 200, max 5000)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::ReverseGeocodeResult]
      #
      # @see Plaza::Models::GeocodeReverseParams
      def reverse(params = {})
        parsed, options = Plaza::GeocodeReverseParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/geocode/reverse",
          query: query.transform_keys(format_: "format"),
          model: Plaza::ReverseGeocodeResult,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::GeocodeReversePostParams} for more details.
      #
      # Reverse geocode a coordinate
      #
      # @overload reverse_post(format_: nil, lang: nil, lat: nil, layer: nil, limit: nil, lng: nil, near: nil, radius: nil, request_options: {})
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param lang [String] Language code for localized names (e.g. en, de, fr)
      #
      # @param lat [Float] Legacy shorthand. Latitude. Use near param instead.
      #
      # @param layer [String] Filter by layer: house or poi
      #
      # @param limit [Integer] Maximum results (default 1, max 20)
      #
      # @param lng [Float] Legacy shorthand. Longitude. Use near param instead.
      #
      # @param near [String] Point geometry for reverse geocode (lat,lng or GeoJSON). Alternative to lat/lng
      #
      # @param radius [Integer] Search radius in meters (default 200, max 5000)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::ReverseGeocodeResult]
      #
      # @see Plaza::Models::GeocodeReversePostParams
      def reverse_post(params = {})
        parsed, options = Plaza::GeocodeReversePostParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: "api/v1/geocode/reverse",
          query: query.transform_keys(format_: "format"),
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
