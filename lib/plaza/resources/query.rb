# frozen_string_literal: true

module Plaza
  module Resources
    class Query
      # Execute an Overpass QL query
      #
      # @overload overpass(data:, request_options: {})
      #
      # @param data [String] Overpass QL query string
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::QueryOverpassParams
      def overpass(params)
        parsed, options = Plaza::QueryOverpassParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/overpass",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
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
          headers: {"accept" => "application/geo+json"},
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
