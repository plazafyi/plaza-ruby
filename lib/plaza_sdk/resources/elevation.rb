# frozen_string_literal: true

module PlazaSDK
  module Resources
    class Elevation
      # Look up elevation for multiple coordinates
      #
      # @overload batch(geometry:, request_options: {})
      #
      # @param geometry [PlazaSDK::Models::GeoJsonGeometry] Path to profile (GeoJSON LineString geometry, minimum 2 points)
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::ElevationBatchResult]
      #
      # @see PlazaSDK::Models::ElevationBatchParams
      def batch(params)
        parsed, options = PlazaSDK::ElevationBatchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/elevation/batch",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: PlazaSDK::ElevationBatchResult,
          options: options
        )
      end

      # Look up elevation at one or more points
      #
      # @overload lookup(lat: nil, lng: nil, locations: nil, request_options: {})
      #
      # @param lat [Float] Latitude (single point)
      #
      # @param lng [Float] Longitude (single point)
      #
      # @param locations [String] Pipe-separated lng,lat pairs (batch)
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::ElevationLookupResult]
      #
      # @see PlazaSDK::Models::ElevationLookupParams
      def lookup(params = {})
        parsed, options = PlazaSDK::ElevationLookupParams.dump_request(params)
        query = PlazaSDK::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/elevation",
          query: query,
          headers: {"accept" => "application/geo+json"},
          model: PlazaSDK::ElevationLookupResult,
          options: options
        )
      end

      # Elevation profile along coordinates
      #
      # @overload profile(geometry:, request_options: {})
      #
      # @param geometry [PlazaSDK::Models::GeoJsonGeometry] Path to profile (GeoJSON LineString geometry, minimum 2 points)
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::ElevationProfileResult]
      #
      # @see PlazaSDK::Models::ElevationProfileParams
      def profile(params)
        parsed, options = PlazaSDK::ElevationProfileParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/elevation/profile",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: PlazaSDK::ElevationProfileResult,
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
