# frozen_string_literal: true

module PlazaSDK
  module Resources
    class Geocode
      # Autocomplete a partial address
      #
      # @overload autocomplete(q:, country_code: nil, lang: nil, lat: nil, layer: nil, limit: nil, lng: nil, request_options: {})
      #
      # @param q [String] Partial address query
      #
      # @param country_code [String] ISO 3166-1 alpha-2 country code filter
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
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::AutocompleteResult]
      #
      # @see PlazaSDK::Models::GeocodeAutocompleteParams
      def autocomplete(params)
        parsed, options = PlazaSDK::GeocodeAutocompleteParams.dump_request(params)
        query = PlazaSDK::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/geocode/autocomplete",
          query: query,
          headers: {"accept" => "application/geo+json"},
          model: PlazaSDK::AutocompleteResult,
          options: options
        )
      end

      # Batch geocode multiple addresses
      #
      # @overload batch(addresses:, request_options: {})
      #
      # @param addresses [Array<String>]
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see PlazaSDK::Models::GeocodeBatchParams
      def batch(params)
        parsed, options = PlazaSDK::GeocodeBatchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/geocode/batch",
          body: parsed,
          model: PlazaSDK::Internal::Type::Unknown,
          options: options
        )
      end

      # Forward geocode an address
      #
      # @overload forward(q:, bbox: nil, country_code: nil, lang: nil, lat: nil, layer: nil, limit: nil, lng: nil, request_options: {})
      #
      # @param q [String] Address or place name
      #
      # @param bbox [String] Bounding box filter: south,west,north,east
      #
      # @param country_code [String] ISO 3166-1 alpha-2 country code filter
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
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::GeocodeResult]
      #
      # @see PlazaSDK::Models::GeocodeForwardParams
      def forward(params)
        parsed, options = PlazaSDK::GeocodeForwardParams.dump_request(params)
        query = PlazaSDK::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/geocode",
          query: query,
          headers: {"accept" => "application/geo+json"},
          model: PlazaSDK::GeocodeResult,
          options: options
        )
      end

      # Reverse geocode a coordinate
      #
      # @overload reverse(lat:, lng:, lang: nil, layer: nil, limit: nil, radius: nil, request_options: {})
      #
      # @param lat [Float] Latitude
      #
      # @param lng [Float] Longitude
      #
      # @param lang [String] Language code for localized names (e.g. en, de, fr)
      #
      # @param layer [String] Filter by layer: house or poi
      #
      # @param limit [Integer] Maximum results (default 1, max 20)
      #
      # @param radius [Integer] Search radius in meters (default 200, max 5000)
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::ReverseGeocodeResult]
      #
      # @see PlazaSDK::Models::GeocodeReverseParams
      def reverse(params)
        parsed, options = PlazaSDK::GeocodeReverseParams.dump_request(params)
        query = PlazaSDK::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/geocode/reverse",
          query: query,
          headers: {"accept" => "application/geo+json"},
          model: PlazaSDK::ReverseGeocodeResult,
          options: options
        )
      end

      # @api private
      #
      # @param client [PlazaSDK::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
