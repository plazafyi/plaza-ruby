# typed: strong

module PlazaSDK
  module Resources
    class Search
      # Search OSM features by name
      sig do
        params(
          q: String,
          cursor: String,
          limit: Integer,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::FeatureCollection)
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
      sig { params(client: PlazaSDK::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
