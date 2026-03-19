# typed: strong

module Plaza
  module Models
    class MapMatchRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::MapMatchRequest, Plaza::Internal::AnyHash) }

      # GPS trace (GeoJSON LineString geometry)
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :trace

      sig { params(trace: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :trace

      # Search radius per coordinate in meters (optional, default 50)
      sig { returns(T.nilable(T::Array[Float])) }
      attr_accessor :radiuses

      # GPS trace to match against the road network
      sig do
        params(
          trace: Plaza::GeoJsonGeometry::OrHash,
          radiuses: T.nilable(T::Array[Float])
        ).returns(T.attached_class)
      end
      def self.new(
        # GPS trace (GeoJSON LineString geometry)
        trace:,
        # Search radius per coordinate in meters (optional, default 50)
        radiuses: nil
      )
      end

      sig do
        override.returns(
          {
            trace: Plaza::GeoJsonGeometry,
            radiuses: T.nilable(T::Array[Float])
          }
        )
      end
      def to_hash
      end
    end
  end
end
