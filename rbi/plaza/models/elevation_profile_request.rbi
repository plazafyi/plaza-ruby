# typed: strong

module Plaza
  module Models
    class ElevationProfileRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationProfileRequest, Plaza::Internal::AnyHash)
        end

      # GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more
      # positions.
      sig { returns(Plaza::LineStringGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::LineStringGeometry::OrHash).void }
      attr_writer :geometry

      # Request body for elevation profile along a path. Provide a GeoJSON LineString
      # geometry defining the path.
      sig do
        params(geometry: Plaza::LineStringGeometry::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(
        # GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more
        # positions.
        geometry:
      )
      end

      sig { override.returns({ geometry: Plaza::LineStringGeometry }) }
      def to_hash
      end
    end
  end
end
