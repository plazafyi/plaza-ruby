# typed: strong

module PlazaSDK
  module Resources
    class Elements
      # Get feature by type and ID
      sig do
        params(
          id: Integer,
          type: String,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::GeoJsonFeature)
      end
      def retrieve(
        # OSM ID
        id,
        # Element type (node, way, relation)
        type:,
        request_options: {}
      )
      end

      # Fetch multiple features by type and ID
      sig do
        params(
          elements: T::Array[PlazaSDK::BatchRequest::Element::OrHash],
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::FeatureCollection)
      end
      def batch(elements:, request_options: {})
      end

      # Find features near a geographic point
      sig do
        params(
          lat: Float,
          lng: Float,
          limit: Integer,
          radius: Integer,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::FeatureCollection)
      end
      def nearby(
        # Latitude (-90 to 90)
        lat:,
        # Longitude (-180 to 180)
        lng:,
        # Maximum results (default 20, max 100)
        limit: nil,
        # Search radius in meters (default 500, max 10000)
        radius: nil,
        request_options: {}
      )
      end

      # Query features by bounding box or H3 cell
      sig do
        params(
          bbox: String,
          cursor: String,
          h3: String,
          limit: Integer,
          type: String,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::FeatureCollection)
      end
      def query(
        # Bounding box: south,west,north,east. At least one of bbox or h3 is required.
        bbox: nil,
        # Cursor for pagination
        cursor: nil,
        # H3 cell index. At least one of bbox or h3 is required.
        h3: nil,
        # Maximum results (default 100, max 10000)
        limit: nil,
        # Element types (comma-separated: node,way,relation)
        type: nil,
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
