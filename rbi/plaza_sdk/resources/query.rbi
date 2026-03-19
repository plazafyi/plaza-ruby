# typed: strong

module PlazaSDK
  module Resources
    class Query
      # Execute an Overpass QL query
      sig do
        params(
          data: String,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::FeatureCollection)
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
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::SparqlResult)
      end
      def sparql(
        # SPARQL query string
        query:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: PlazaSDK::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
