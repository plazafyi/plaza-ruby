# frozen_string_literal: true

module Plaza
  module Resources
    class Features
      # Get feature by type and ID
      #
      # @overload retrieve(id, type:, request_options: {})
      #
      # @param id [Integer] OSM ID
      #
      # @param type [String] Element type (node, way, relation)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::GeoJsonFeature]
      #
      # @see Plaza::Models::FeatureRetrieveParams
      def retrieve(id, params)
        parsed, options = Plaza::FeatureRetrieveParams.dump_request(params)
        type =
          parsed.delete(:type) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["api/v1/features/%1$s/%2$s", type, id],
          model: Plaza::GeoJsonFeature,
          options: options
        )
      end

      # Fetch multiple features by type and ID
      #
      # @overload batch(elements:, request_options: {})
      #
      # @param elements [Array<Plaza::Models::BatchRequest::Element>] Array of element references to fetch
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::FeatureBatchParams
      def batch(params)
        parsed, options = Plaza::FeatureBatchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/features/batch",
          body: parsed,
          model: Plaza::FeatureCollection,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::FeatureQueryParams} for more details.
      #
      # Query features by spatial predicate, bounding box, or H3 cell
      #
      # @overload query(cursor: nil, format_: nil, h3: nil, limit: nil, type: nil, around: nil, contains: nil, crosses: nil, intersects: nil, not_contains: nil, not_intersects: nil, not_within: nil, radius: nil, touches: nil, within: nil, request_options: {})
      #
      # @param cursor [String] Query param: Cursor for pagination
      #
      # @param format_ [String] Query param: Response format. json (default) returns paginated GeoJSON. geojson/
      #
      # @param h3 [String] Query param: Legacy shorthand. H3 cell index. Use spatial predicates instead.
      #
      # @param limit [Integer] Query param: Maximum results (default 100, max 10000)
      #
      # @param type [String] Query param: Element types (comma-separated: node,way,relation)
      #
      # @param around [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the `typ
      #
      # @param contains [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the `typ
      #
      # @param crosses [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the `typ
      #
      # @param intersects [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the `typ
      #
      # @param not_contains [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the `typ
      #
      # @param not_intersects [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the `typ
      #
      # @param not_within [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the `typ
      #
      # @param radius [Float] Body param: Search radius in meters. Required for `around`, optional buffer for
      #
      # @param touches [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the `typ
      #
      # @param within [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] Body param: GeoJSON Geometry object per RFC 7946. Discriminated union — the `typ
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::FeatureQueryParams
      def query(params = {})
        query_params = [:cursor, :format_, :h3, :limit, :type]
        parsed, options = Plaza::FeatureQueryParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/features",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
          model: Plaza::FeatureCollection,
          options: options
        )
      end

      # @api private
      #
      # @param client [Plaza::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
