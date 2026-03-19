# typed: strong

module Plaza
  module Models
    class ElevationProfileRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationProfileRequest, Plaza::Internal::AnyHash)
        end

      # Path to profile (GeoJSON LineString geometry, minimum 2 points)
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      # Request body for elevation profile
      sig do
        params(geometry: Plaza::GeoJsonGeometry::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(
        # Path to profile (GeoJSON LineString geometry, minimum 2 points)
        geometry:
      )
      end

      sig { override.returns({ geometry: Plaza::GeoJsonGeometry }) }
      def to_hash
      end
    end
  end
end
