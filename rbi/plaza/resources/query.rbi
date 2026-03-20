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
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def overpass(
        # Overpass QL query string
        data:,
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
