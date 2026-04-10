# typed: strong

module Plaza
  module Models
    class SpatialPredicate < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::SpatialPredicate, Plaza::Internal::AnyHash)
        end

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig do
        returns(
          T.nilable(
            T.any(
              Plaza::PointGeometry,
              Plaza::LineStringGeometry,
              Plaza::PolygonGeometry,
              Plaza::MultiPointGeometry,
              Plaza::MultiLineStringGeometry,
              Plaza::MultiPolygonGeometry
            )
          )
        )
      end
      attr_reader :around

      sig do
        params(
          around:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            )
        ).void
      end
      attr_writer :around

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig do
        returns(
          T.nilable(
            T.any(
              Plaza::PointGeometry,
              Plaza::LineStringGeometry,
              Plaza::PolygonGeometry,
              Plaza::MultiPointGeometry,
              Plaza::MultiLineStringGeometry,
              Plaza::MultiPolygonGeometry
            )
          )
        )
      end
      attr_reader :contains

      sig do
        params(
          contains:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            )
        ).void
      end
      attr_writer :contains

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig do
        returns(
          T.nilable(
            T.any(
              Plaza::PointGeometry,
              Plaza::LineStringGeometry,
              Plaza::PolygonGeometry,
              Plaza::MultiPointGeometry,
              Plaza::MultiLineStringGeometry,
              Plaza::MultiPolygonGeometry
            )
          )
        )
      end
      attr_reader :crosses

      sig do
        params(
          crosses:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            )
        ).void
      end
      attr_writer :crosses

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig do
        returns(
          T.nilable(
            T.any(
              Plaza::PointGeometry,
              Plaza::LineStringGeometry,
              Plaza::PolygonGeometry,
              Plaza::MultiPointGeometry,
              Plaza::MultiLineStringGeometry,
              Plaza::MultiPolygonGeometry
            )
          )
        )
      end
      attr_reader :intersects

      sig do
        params(
          intersects:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            )
        ).void
      end
      attr_writer :intersects

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig do
        returns(
          T.nilable(
            T.any(
              Plaza::PointGeometry,
              Plaza::LineStringGeometry,
              Plaza::PolygonGeometry,
              Plaza::MultiPointGeometry,
              Plaza::MultiLineStringGeometry,
              Plaza::MultiPolygonGeometry
            )
          )
        )
      end
      attr_reader :not_contains

      sig do
        params(
          not_contains:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            )
        ).void
      end
      attr_writer :not_contains

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig do
        returns(
          T.nilable(
            T.any(
              Plaza::PointGeometry,
              Plaza::LineStringGeometry,
              Plaza::PolygonGeometry,
              Plaza::MultiPointGeometry,
              Plaza::MultiLineStringGeometry,
              Plaza::MultiPolygonGeometry
            )
          )
        )
      end
      attr_reader :not_intersects

      sig do
        params(
          not_intersects:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            )
        ).void
      end
      attr_writer :not_intersects

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig do
        returns(
          T.nilable(
            T.any(
              Plaza::PointGeometry,
              Plaza::LineStringGeometry,
              Plaza::PolygonGeometry,
              Plaza::MultiPointGeometry,
              Plaza::MultiLineStringGeometry,
              Plaza::MultiPolygonGeometry
            )
          )
        )
      end
      attr_reader :not_within

      sig do
        params(
          not_within:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            )
        ).void
      end
      attr_writer :not_within

      # Search radius in meters. Required for `around`, optional buffer for other
      # predicates.
      sig { returns(T.nilable(Float)) }
      attr_reader :radius

      sig { params(radius: Float).void }
      attr_writer :radius

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig do
        returns(
          T.nilable(
            T.any(
              Plaza::PointGeometry,
              Plaza::LineStringGeometry,
              Plaza::PolygonGeometry,
              Plaza::MultiPointGeometry,
              Plaza::MultiLineStringGeometry,
              Plaza::MultiPolygonGeometry
            )
          )
        )
      end
      attr_reader :touches

      sig do
        params(
          touches:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            )
        ).void
      end
      attr_writer :touches

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig do
        returns(
          T.nilable(
            T.any(
              Plaza::PointGeometry,
              Plaza::LineStringGeometry,
              Plaza::PolygonGeometry,
              Plaza::MultiPointGeometry,
              Plaza::MultiLineStringGeometry,
              Plaza::MultiPolygonGeometry
            )
          )
        )
      end
      attr_reader :within

      sig do
        params(
          within:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            )
        ).void
      end
      attr_writer :within

      # Spatial predicates for filtering features by geographic relationship. Predicates
      # are mutually exclusive — use exactly one per request. The parameter name is the
      # spatial operation, the value is a GeoJSON geometry to test against.
      #
      # | Predicate        | Meaning                                    |
      # | ---------------- | ------------------------------------------ |
      # | `around`         | Within radius meters (requires `radius`)   |
      # | `intersects`     | Feature overlaps the input geometry        |
      # | `within`         | Feature is fully inside the input geometry |
      # | `contains`       | Feature fully contains the input geometry  |
      # | `crosses`        | Feature crosses the input geometry         |
      # | `touches`        | Feature shares boundary but not interior   |
      # | `not_intersects` | Feature does not overlap                   |
      # | `not_within`     | Feature is not fully inside                |
      # | `not_contains`   | Feature does not fully contain             |
      sig do
        params(
          around:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            ),
          contains:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            ),
          crosses:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            ),
          intersects:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            ),
          not_contains:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            ),
          not_intersects:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            ),
          not_within:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            ),
          radius: Float,
          touches:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            ),
          within:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        around: nil,
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        contains: nil,
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        crosses: nil,
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        intersects: nil,
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        not_contains: nil,
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        not_intersects: nil,
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        not_within: nil,
        # Search radius in meters. Required for `around`, optional buffer for other
        # predicates.
        radius: nil,
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        touches: nil,
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        within: nil
      )
      end

      sig do
        override.returns(
          {
            around:
              T.any(
                Plaza::PointGeometry,
                Plaza::LineStringGeometry,
                Plaza::PolygonGeometry,
                Plaza::MultiPointGeometry,
                Plaza::MultiLineStringGeometry,
                Plaza::MultiPolygonGeometry
              ),
            contains:
              T.any(
                Plaza::PointGeometry,
                Plaza::LineStringGeometry,
                Plaza::PolygonGeometry,
                Plaza::MultiPointGeometry,
                Plaza::MultiLineStringGeometry,
                Plaza::MultiPolygonGeometry
              ),
            crosses:
              T.any(
                Plaza::PointGeometry,
                Plaza::LineStringGeometry,
                Plaza::PolygonGeometry,
                Plaza::MultiPointGeometry,
                Plaza::MultiLineStringGeometry,
                Plaza::MultiPolygonGeometry
              ),
            intersects:
              T.any(
                Plaza::PointGeometry,
                Plaza::LineStringGeometry,
                Plaza::PolygonGeometry,
                Plaza::MultiPointGeometry,
                Plaza::MultiLineStringGeometry,
                Plaza::MultiPolygonGeometry
              ),
            not_contains:
              T.any(
                Plaza::PointGeometry,
                Plaza::LineStringGeometry,
                Plaza::PolygonGeometry,
                Plaza::MultiPointGeometry,
                Plaza::MultiLineStringGeometry,
                Plaza::MultiPolygonGeometry
              ),
            not_intersects:
              T.any(
                Plaza::PointGeometry,
                Plaza::LineStringGeometry,
                Plaza::PolygonGeometry,
                Plaza::MultiPointGeometry,
                Plaza::MultiLineStringGeometry,
                Plaza::MultiPolygonGeometry
              ),
            not_within:
              T.any(
                Plaza::PointGeometry,
                Plaza::LineStringGeometry,
                Plaza::PolygonGeometry,
                Plaza::MultiPointGeometry,
                Plaza::MultiLineStringGeometry,
                Plaza::MultiPolygonGeometry
              ),
            radius: Float,
            touches:
              T.any(
                Plaza::PointGeometry,
                Plaza::LineStringGeometry,
                Plaza::PolygonGeometry,
                Plaza::MultiPointGeometry,
                Plaza::MultiLineStringGeometry,
                Plaza::MultiPolygonGeometry
              ),
            within:
              T.any(
                Plaza::PointGeometry,
                Plaza::LineStringGeometry,
                Plaza::PolygonGeometry,
                Plaza::MultiPointGeometry,
                Plaza::MultiLineStringGeometry,
                Plaza::MultiPolygonGeometry
              )
          }
        )
      end
      def to_hash
      end
    end
  end
end
