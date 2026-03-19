# typed: strong

module PlazaSDK
  module Models
    class MapMatchRequest < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::MapMatchRequest, PlazaSDK::Internal::AnyHash)
        end

      # GPS trace (GeoJSON LineString geometry)
      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :trace

      sig { params(trace: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :trace

      # Search radius per coordinate in meters (optional, default 50)
      sig { returns(T.nilable(T::Array[Float])) }
      attr_accessor :radiuses

      # GPS trace to match against the road network
      sig do
        params(
          trace: PlazaSDK::GeoJsonGeometry::OrHash,
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
            trace: PlazaSDK::GeoJsonGeometry,
            radiuses: T.nilable(T::Array[Float])
          }
        )
      end
      def to_hash
      end
    end
  end
end
