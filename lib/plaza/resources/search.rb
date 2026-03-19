# frozen_string_literal: true

module Plaza
  module Resources
    class Search
      # Search OSM features by name
      #
      # @overload query(q:, cursor: nil, limit: nil, request_options: {})
      #
      # @param q [String] Search query string
      #
      # @param cursor [String] Cursor for pagination
      #
      # @param limit [Integer] Maximum results (default 25, max 100)
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
          query: query,
          headers: {"accept" => "application/geo+json"},
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
