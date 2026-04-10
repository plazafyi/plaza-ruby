# typed: strong

module Plaza
  module Resources
    class Features
      # Get feature by type and ID
      sig do
        params(
          id: Integer,
          type: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::GeoJsonFeature)
      end
      def retrieve(
        # OSM ID
        id,
        # Element type (node, way, relation)
        type:,
        request_options: {}
      )
      end

      # Fetch multiple features by type and ID
      sig do
        params(
          elements: T::Array[Plaza::BatchRequest::Element::OrHash],
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def batch(
        # Array of element references to fetch
        elements:,
        request_options: {}
      )
      end

      # Query features by spatial predicate, bounding box, or H3 cell
      sig do
        params(
          cursor: String,
          format_: String,
          h3: String,
          limit: Integer,
          type: String,
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
            ),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def query(
        # Query param: Cursor for pagination
        cursor: nil,
        # Query param: Response format. json (default) returns paginated GeoJSON.
        # geojson/csv/ndjson stream via chunked transfer encoding.
        format_: nil,
        # Query param: Legacy shorthand. H3 cell index. Use spatial predicates instead.
        h3: nil,
        # Query param: Maximum results (default 100, max 10000)
        limit: nil,
        # Query param: Element types (comma-separated: node,way,relation)
        type: nil,
        # Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the
        # `type` field determines the coordinate structure.
        around: nil,
        # Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the
        # `type` field determines the coordinate structure.
        contains: nil,
        # Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the
        # `type` field determines the coordinate structure.
        crosses: nil,
        # Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the
        # `type` field determines the coordinate structure.
        intersects: nil,
        # Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the
        # `type` field determines the coordinate structure.
        not_contains: nil,
        # Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the
        # `type` field determines the coordinate structure.
        not_intersects: nil,
        # Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the
        # `type` field determines the coordinate structure.
        not_within: nil,
        # Body param: Search radius in meters. Required for `around`, optional buffer for
        # other predicates.
        radius: nil,
        # Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the
        # `type` field determines the coordinate structure.
        touches: nil,
        # Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the
        # `type` field determines the coordinate structure.
        within: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Plaza::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
