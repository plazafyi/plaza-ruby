# typed: strong

module Plaza
  module Models
    class NearestRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::NearestRequest, Plaza::Internal::AnyHash) }

      # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
      # order. Optional third element is altitude in meters.
      sig { returns(Plaza::PointGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::PointGeometry::OrHash).void }
      attr_writer :geometry

      # Maximum search radius in meters (default: 100)
      sig { returns(T.nilable(Float)) }
      attr_accessor :radius

      # Request body for nearest-road-segment lookup. Snaps a point to the road network.
      sig do
        params(
          geometry: Plaza::PointGeometry::OrHash,
          radius: T.nilable(Float)
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
        # order. Optional third element is altitude in meters.
        geometry:,
        # Maximum search radius in meters (default: 100)
        radius: nil
      )
      end

      sig do
        override.returns(
          { geometry: Plaza::PointGeometry, radius: T.nilable(Float) }
        )
      end
      def to_hash
      end
    end
  end
end
