# typed: strong

module PlazaSDK
  module Models
    class ElevationProfileRequest < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::ElevationProfileRequest, PlazaSDK::Internal::AnyHash)
        end

      # Path to profile (GeoJSON LineString geometry, minimum 2 points)
      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      # Request body for elevation profile
      sig do
        params(geometry: PlazaSDK::GeoJsonGeometry::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(
        # Path to profile (GeoJSON LineString geometry, minimum 2 points)
        geometry:
      )
      end

      sig { override.returns({ geometry: PlazaSDK::GeoJsonGeometry }) }
      def to_hash
      end
    end
  end
end
