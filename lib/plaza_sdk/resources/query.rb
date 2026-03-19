# frozen_string_literal: true

module PlazaSDK
  module Resources
    class Query
      # Execute an Overpass QL query
      #
      # @overload overpass(data:, request_options: {})
      #
      # @param data [String] Overpass QL query string
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::FeatureCollection]
      #
      # @see PlazaSDK::Models::QueryOverpassParams
      def overpass(params)
        parsed, options = PlazaSDK::QueryOverpassParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/overpass",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: PlazaSDK::FeatureCollection,
          options: options
        )
      end

      # Execute a SPARQL query
      #
      # @overload sparql(query:, request_options: {})
      #
      # @param query [String] SPARQL query string
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::SparqlResult]
      #
      # @see PlazaSDK::Models::QuerySparqlParams
      def sparql(params)
        parsed, options = PlazaSDK::QuerySparqlParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/sparql",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: PlazaSDK::SparqlResult,
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
