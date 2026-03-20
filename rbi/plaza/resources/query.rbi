# typed: strong

module Plaza
  module Resources
    class Query
      # Execute a multi-step query pipeline
      sig do
        params(
          steps: T::Array[Plaza::QueryExecuteParams::Step::OrHash],
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::Models::QueryExecuteResponse)
      end
      def execute(
        # Ordered list of query steps to execute
        steps:,
        request_options: {}
      )
      end

      # Execute an Overpass QL query
      sig do
        params(
          data: String,
          format_: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def overpass(
        # Body param: Overpass QL query string
        data:,
        # Query param: Response format: json (default), geojson, csv, ndjson
        format_: nil,
        request_options: {}
      )
      end

      # Execute a SPARQL query
      sig do
        params(
          query: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::SparqlResult)
      end
      def sparql(
        # SPARQL query string
        query:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Plaza::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
