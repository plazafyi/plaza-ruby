# typed: strong

module Plaza
  module Resources
    class MapMatch
      # Match GPS coordinates to the road network
      sig do
        params(
          geometry: Plaza::LineStringGeometry::OrHash,
          radiuses: T.nilable(T::Array[Float]),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::MapMatchResult)
      end
      def match(
        # GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more
        # positions.
        geometry:,
        # Search radius per coordinate in meters. Must have the same length as the
        # geometry coordinates or be omitted entirely. Default: 50m per point.
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
