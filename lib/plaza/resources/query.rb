# frozen_string_literal: true

module Plaza
  module Resources
    class Query
      # Execute a PlazaQL query
      #
      # @overload execute(data:, format_: nil, request_options: {})
      #
      # @param data [String] Body param: PlazaQL query string
      #
      # @param format_ [String] Query param: Response format: json (default), geojson, csv, ndjson
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::QueryExecuteParams
      def execute(params)
        query_params = [:format_]
        parsed, options = Plaza::QueryExecuteParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/query",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
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
