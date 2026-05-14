# frozen_string_literal: true

module Plaza
  module Resources
    class Elevation
      # Look up elevation at one or more points
      #
      # @overload lookup(geometry:, format_: nil, request_options: {})
      #
      # @param geometry [Plaza::Models::PointGeometry, Plaza::Models::MultiPointGeometry] Body param: Point or MultiPoint geometry to look up elevations for
      #
      # @param format_ [String] Query param: Response format: json (default), geojson, csv, ndjson
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::ElevationLookupResult]
      #
      # @see Plaza::Models::ElevationLookupParams
      def lookup(params)
        query_params = [:format_]
        parsed, options = Plaza::ElevationLookupParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/elevation",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
          model: Plaza::ElevationLookupResult,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::ElevationProfileParams} for more details.
      #
      # Elevation profile along coordinates
      #
      # @overload profile(geometry:, request_options: {})
      #
      # @param geometry [Plaza::Models::LineStringGeometry] GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more pos
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
