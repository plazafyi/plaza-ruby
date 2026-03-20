# frozen_string_literal: true

module Plaza
  module Resources
    class Search
      # Search OSM features by name
      #
      # @overload query(q:, cursor: nil, format_: nil, limit: nil, output_fields: nil, output_include: nil, output_precision: nil, output_sort: nil, request_options: {})
      #
      # @param q [String] Search query string
      #
      # @param cursor [String] Cursor for pagination
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param limit [Integer] Maximum results (default 25, max 100)
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_include [String] Extra computed fields: bbox, distance, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param output_sort [String] Sort by: distance, name, osm_id
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::SearchQueryParams
      def query(params)
        parsed, options = Plaza::SearchQueryParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/search",
          query: query.transform_keys(
            format_: "format",
            output_fields: "output[fields]",
            output_include: "output[include]",
            output_precision: "output[precision]",
            output_sort: "output[sort]"
          ),
          model: Plaza::FeatureCollection,
          options: options
        )
      end

      # Search OSM features by name
      #
      # @overload query_post(q:, cursor: nil, format_: nil, limit: nil, output_fields: nil, output_include: nil, output_precision: nil, output_sort: nil, request_options: {})
      #
      # @param q [String] Search query string
      #
      # @param cursor [String] Cursor for pagination
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param limit [Integer] Maximum results (default 25, max 100)
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_include [String] Extra computed fields: bbox, distance, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param output_sort [String] Sort by: distance, name, osm_id
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::SearchQueryPostParams
      def query_post(params)
        parsed, options = Plaza::SearchQueryPostParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: "api/v1/search",
          query: query.transform_keys(
            format_: "format",
            output_fields: "output[fields]",
            output_include: "output[include]",
            output_precision: "output[precision]",
            output_sort: "output[sort]"
          ),
          model: Plaza::FeatureCollection,
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
