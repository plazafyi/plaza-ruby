# frozen_string_literal: true

module Plaza
  module Resources
    class Elevation
      # Look up elevation for multiple coordinates
      #
      # @overload batch(coordinates:, format_: nil, request_options: {})
      #
      # @param coordinates [Array<Plaza::Models::ElevationBatchParams::Coordinate>] Body param: Coordinates to look up elevations for (max 50)
      #
      # @param format_ [String] Query param: Response format: json (default), geojson, csv, ndjson
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::ElevationBatchResult]
      #
      # @see Plaza::Models::ElevationBatchParams
      def batch(params)
        query_params = [:format_]
        parsed, options = Plaza::ElevationBatchParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/elevation/batch",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
          model: Plaza::ElevationBatchResult,
          options: options
        )
      end

      # Look up elevation at one or more points
      #
      # @overload lookup(format_: nil, lat: nil, lng: nil, locations: nil, output_fields: nil, output_include: nil, output_precision: nil, request_options: {})
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param lat [Float] Latitude (single point)
      #
      # @param lng [Float] Longitude (single point)
      #
      # @param locations [String] Pipe-separated lng,lat pairs (batch)
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_include [String] Extra computed fields: bbox, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
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
          query: query.transform_keys(
            format_: "format",
            output_fields: "output[fields]",
            output_include: "output[include]",
            output_precision: "output[precision]"
          ),
          model: Plaza::ElevationLookupResult,
          options: options
        )
      end

      # Look up elevation at one or more points
      #
      # @overload lookup_post(format_: nil, lat: nil, lng: nil, locations: nil, output_fields: nil, output_include: nil, output_precision: nil, request_options: {})
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param lat [Float] Latitude (single point)
      #
      # @param lng [Float] Longitude (single point)
      #
      # @param locations [String] Pipe-separated lng,lat pairs (batch)
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_include [String] Extra computed fields: bbox, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::ElevationLookupResult]
      #
      # @see Plaza::Models::ElevationLookupPostParams
      def lookup_post(params = {})
        parsed, options = Plaza::ElevationLookupPostParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: "api/v1/elevation",
          query: query.transform_keys(
            format_: "format",
            output_fields: "output[fields]",
            output_include: "output[include]",
            output_precision: "output[precision]"
          ),
          model: Plaza::ElevationLookupResult,
          options: options
        )
      end

      # Elevation profile along coordinates
      #
      # @overload profile(coordinates:, request_options: {})
      #
      # @param coordinates [Array<Plaza::Models::ElevationProfileRequest::Coordinate>] Path coordinates in order of travel (min 2, max 50)
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
