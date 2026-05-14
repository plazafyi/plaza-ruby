# typed: strong

module Plaza
  module Models
    # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
    # determines the coordinate structure.
    module Geometry
      extend Plaza::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Plaza::PointGeometry,
            Plaza::LineStringGeometry,
            Plaza::PolygonGeometry,
            Plaza::MultiPointGeometry,
            Plaza::MultiLineStringGeometry,
            Plaza::MultiPolygonGeometry
          )
        end

      sig { override.returns(T::Array[Plaza::Geometry::Variants]) }
      def self.variants
      end
    end
  end
end
