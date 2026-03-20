# frozen_string_literal: true

module Plaza
  module Resources
    class Query
      # Execute a multi-step query pipeline
      #
      # @overload execute(steps:, request_options: {})
      #
      # @param steps [Array<Plaza::Models::QueryExecuteParams::Step>] Ordered list of query steps to execute
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::QueryExecuteResponse]
      #
      # @see Plaza::Models::QueryExecuteParams
      def execute(params)
        parsed, options = Plaza::QueryExecuteParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/query",
          body: parsed,
          model: Plaza::Models::QueryExecuteResponse,
          options: options
        )
      end

      # Execute an Overpass QL query
      #
      # @overload overpass(data:, format_: nil, request_options: {})
      #
      # @param data [String] Body param: Overpass QL query string
      #
      # @param format_ [String] Query param: Response format: json (default), geojson, csv, ndjson
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::QueryOverpassParams
      def overpass(params)
        query_params = [:format_]
        parsed, options = Plaza::QueryOverpassParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/overpass",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
          model: Plaza::FeatureCollection,
          options: options
        )
      end

      # Execute a SPARQL query
      #
      # @overload sparql(query:, request_options: {})
      #
      # @param query [String] SPARQL query string
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::SparqlResult]
      #
      # @see Plaza::Models::QuerySparqlParams
      def sparql(params)
        parsed, options = Plaza::QuerySparqlParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/sparql",
          body: parsed,
          model: Plaza::SparqlResult,
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
