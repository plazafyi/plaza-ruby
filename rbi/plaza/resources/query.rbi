# typed: strong

module Plaza
  module Resources
    class Query
      # Execute a PlazaQL query
      sig do
        params(
          data: String,
          format_: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def execute(
        # Body param: PlazaQL query string
        data:,
        # Query param: Response format: json (default), geojson, csv, ndjson
        format_: nil,
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
