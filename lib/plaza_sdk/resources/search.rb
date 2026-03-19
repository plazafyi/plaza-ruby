# frozen_string_literal: true

module PlazaSDK
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
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::FeatureCollection]
      #
      # @see PlazaSDK::Models::SearchQueryParams
      def query(params)
        parsed, options = PlazaSDK::SearchQueryParams.dump_request(params)
        query = PlazaSDK::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/search",
          query: query,
          headers: {"accept" => "application/geo+json"},
          model: PlazaSDK::FeatureCollection,
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
