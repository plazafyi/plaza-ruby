# typed: strong

module Plaza
  module Resources
    class Search
      # Search OSM features by name
      sig do
        params(
          q: String,
          cursor: String,
          limit: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def query(
        # Search query string
        q:,
        # Cursor for pagination
        cursor: nil,
        # Maximum results (default 25, max 100)
        limit: nil,
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
