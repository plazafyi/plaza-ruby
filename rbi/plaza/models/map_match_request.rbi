# typed: strong

module Plaza
  module Models
    class MapMatchRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::MapMatchRequest, Plaza::Internal::AnyHash) }

      # GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more
      # positions.
      sig { returns(Plaza::LineStringGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::LineStringGeometry::OrHash).void }
      attr_writer :geometry

      # Search radius per coordinate in meters. Must have the same length as the
      # geometry coordinates or be omitted entirely. Default: 50m per point.
      sig { returns(T.nilable(T::Array[Float])) }
      attr_accessor :radiuses

      # GPS trace to snap to the road network. Provide a GeoJSON LineString geometry
      # representing the GPS trace.
      sig do
        params(
          geometry: Plaza::LineStringGeometry::OrHash,
          radiuses: T.nilable(T::Array[Float])
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more
        # positions.
        geometry:,
        # Search radius per coordinate in meters. Must have the same length as the
        # geometry coordinates or be omitted entirely. Default: 50m per point.
        radiuses: nil
      )
      end

      sig do
        override.returns(
          {
            geometry: Plaza::LineStringGeometry,
            radiuses: T.nilable(T::Array[Float])
          }
        )
      end
      def to_hash
      end
    end
  end
end
