# frozen_string_literal: true

module Plaza
  module Models
    class SpatialPredicate < Plaza::Internal::Type::BaseModel
      # @!attribute around
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry, nil]
      optional :around, union: -> { Plaza::Geometry }

      # @!attribute contains
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry, nil]
      optional :contains, union: -> { Plaza::Geometry }

      # @!attribute crosses
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry, nil]
      optional :crosses, union: -> { Plaza::Geometry }

      # @!attribute intersects
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry, nil]
      optional :intersects, union: -> { Plaza::Geometry }

      # @!attribute not_contains
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry, nil]
      optional :not_contains, union: -> { Plaza::Geometry }

      # @!attribute not_intersects
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry, nil]
      optional :not_intersects, union: -> { Plaza::Geometry }

      # @!attribute not_within
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry, nil]
      optional :not_within, union: -> { Plaza::Geometry }

      # @!attribute radius
      #   Search radius in meters. Required for `around`, optional buffer for other
      #   predicates.
      #
      #   @return [Float, nil]
      optional :radius, Float

      # @!attribute touches
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry, nil]
      optional :touches, union: -> { Plaza::Geometry }

      # @!attribute within
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry, nil]
      optional :within, union: -> { Plaza::Geometry }

      # @!method initialize(around: nil, contains: nil, crosses: nil, intersects: nil, not_contains: nil, not_intersects: nil, not_within: nil, radius: nil, touches: nil, within: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::SpatialPredicate} for more details.
      #
      #   Spatial predicates for filtering features by geographic relationship. Predicates
      #   are mutually exclusive — use exactly one per request. The parameter name is the
      #   spatial operation, the value is a GeoJSON geometry to test against.
      #
      #   | Predicate        | Meaning                                    |
      #   | ---------------- | ------------------------------------------ |
      #   | `around`         | Within radius meters (requires `radius`)   |
      #   | `intersects`     | Feature overlaps the input geometry        |
      #   | `within`         | Feature is fully inside the input geometry |
      #   | `contains`       | Feature fully contains the input geometry  |
      #   | `crosses`        | Feature crosses the input geometry         |
      #   | `touches`        | Feature shares boundary but not interior   |
      #   | `not_intersects` | Feature does not overlap                   |
      #   | `not_within`     | Feature is not fully inside                |
      #   | `not_contains`   | Feature does not fully contain             |
      #
      #   @param around [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param contains [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param crosses [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param intersects [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param not_contains [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param not_intersects [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param not_within [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param radius [Float] Search radius in meters. Required for `around`, optional buffer for other predic
      #
      #   @param touches [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param within [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
    end
  end
end
