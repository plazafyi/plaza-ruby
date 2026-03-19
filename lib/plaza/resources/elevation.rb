# frozen_string_literal: true

module Plaza
  module Resources
    class Elevation
      # Look up elevation for multiple coordinates
      #
      # @overload batch(geometry:, request_options: {})
      #
      # @param geometry [Plaza::Models::GeoJsonGeometry] Path to profile (GeoJSON LineString geometry, minimum 2 points)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::ElevationBatchResult]
      #
      # @see Plaza::Models::ElevationBatchParams
      def batch(params)
        parsed, options = Plaza::ElevationBatchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/elevation/batch",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: Plaza::ElevationBatchResult,
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
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::ElevationLookupResult]
      #
      # @see Plaza::Models::ElevationLookupParams
      def lookup(params = {})
        parsed, options = Plaza::ElevationLookupParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/elevation",
          query: query,
          headers: {"accept" => "application/geo+json"},
          model: Plaza::ElevationLookupResult,
          options: options
        )
      end

      # Elevation profile along coordinates
      #
      # @overload profile(geometry:, request_options: {})
      #
      # @param geometry [Plaza::Models::GeoJsonGeometry] Path to profile (GeoJSON LineString geometry, minimum 2 points)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::ElevationProfileResult]
      #
      # @see Plaza::Models::ElevationProfileParams
      def profile(params)
        parsed, options = Plaza::ElevationProfileParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/elevation/profile",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: Plaza::ElevationProfileResult,
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
