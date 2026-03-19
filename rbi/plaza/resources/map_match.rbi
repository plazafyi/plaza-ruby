# typed: strong

module Plaza
  module Resources
    class MapMatch
      # Match GPS coordinates to the road network
      sig do
        params(
          trace: Plaza::GeoJsonGeometry::OrHash,
          radiuses: T.nilable(T::Array[Float]),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::MapMatchResult)
      end
      def match(
        # GPS trace (GeoJSON LineString geometry)
        trace:,
        # Search radius per coordinate in meters (optional, default 50)
        radiuses: nil,
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
