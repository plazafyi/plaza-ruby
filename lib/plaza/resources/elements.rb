# frozen_string_literal: true

module Plaza
  module Resources
    class Elements
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
      # @see Plaza::Models::ElementRetrieveParams
      def retrieve(id, params)
        parsed, options = Plaza::ElementRetrieveParams.dump_request(params)
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
      # @see Plaza::Models::ElementBatchParams
      def batch(params)
        parsed, options = Plaza::ElementBatchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/features/batch",
          body: parsed,
          model: Plaza::FeatureCollection,
          options: options
        )
      end

      # Get feature by type and ID
      #
      # @overload lookup(request_options: {})
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::GeoJsonFeature]
      #
      # @see Plaza::Models::ElementLookupParams
      def lookup(params = {})
        @client.request(
          method: :post,
          path: "api/v1/features/lookup",
          model: Plaza::GeoJsonFeature,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::ElementNearbyParams} for more details.
      #
      # Find features near a geographic point
      #
      # @overload nearby(lat: nil, limit: nil, lng: nil, near: nil, output_buffer: nil, output_centroid: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, output_sort: nil, radius: nil, request_options: {})
      #
      # @param lat [Float] Legacy shorthand. Latitude (-90 to 90). Use near param instead.
      #
      # @param limit [Integer] Maximum results (default 20, max 100)
      #
      # @param lng [Float] Legacy shorthand. Longitude (-180 to 180). Use near param instead.
      #
      # @param near [String] Point geometry for proximity search (lat,lng or GeoJSON). Alternative to lat/lng
      #
      # @param output_buffer [Float] Buffer geometry by meters
      #
      # @param output_centroid [Boolean] Replace geometry with centroid
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_geometry [Boolean] Include geometry (default true)
      #
      # @param output_include [String] Extra computed fields: bbox, distance, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param output_simplify [Float] Simplify geometry tolerance in meters
      #
      # @param output_sort [String] Sort by: distance, name, osm_id
      #
      # @param radius [Integer] Search radius in meters (default 500, max 10000)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::ElementNearbyParams
      def nearby(params = {})
        parsed, options = Plaza::ElementNearbyParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/features/nearby",
          query: query.transform_keys(
            output_buffer: "output[buffer]",
            output_centroid: "output[centroid]",
            output_fields: "output[fields]",
            output_geometry: "output[geometry]",
            output_include: "output[include]",
            output_precision: "output[precision]",
            output_simplify: "output[simplify]",
            output_sort: "output[sort]"
          ),
          model: Plaza::FeatureCollection,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::ElementNearbyPostParams} for more details.
      #
      # Find features near a geographic point
      #
      # @overload nearby_post(lat: nil, limit: nil, lng: nil, near: nil, output_buffer: nil, output_centroid: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, output_sort: nil, radius: nil, request_options: {})
      #
      # @param lat [Float] Legacy shorthand. Latitude (-90 to 90). Use near param instead.
      #
      # @param limit [Integer] Maximum results (default 20, max 100)
      #
      # @param lng [Float] Legacy shorthand. Longitude (-180 to 180). Use near param instead.
      #
      # @param near [String] Point geometry for proximity search (lat,lng or GeoJSON). Alternative to lat/lng
      #
      # @param output_buffer [Float] Buffer geometry by meters
      #
      # @param output_centroid [Boolean] Replace geometry with centroid
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_geometry [Boolean] Include geometry (default true)
      #
      # @param output_include [String] Extra computed fields: bbox, distance, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param output_simplify [Float] Simplify geometry tolerance in meters
      #
      # @param output_sort [String] Sort by: distance, name, osm_id
      #
      # @param radius [Integer] Search radius in meters (default 500, max 10000)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::ElementNearbyPostParams
      def nearby_post(params = {})
        parsed, options = Plaza::ElementNearbyPostParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: "api/v1/features/nearby",
          query: query.transform_keys(
            output_buffer: "output[buffer]",
            output_centroid: "output[centroid]",
            output_fields: "output[fields]",
            output_geometry: "output[geometry]",
            output_include: "output[include]",
            output_precision: "output[precision]",
            output_simplify: "output[simplify]",
            output_sort: "output[sort]"
          ),
          model: Plaza::FeatureCollection,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::ElementQueryParams} for more details.
      #
      # Query features by spatial predicate, bounding box, or H3 cell
      #
      # @overload query(bbox: nil, contains: nil, crosses: nil, cursor: nil, format_: nil, h3: nil, intersects: nil, limit: nil, near: nil, output_buffer: nil, output_centroid: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, output_sort: nil, radius: nil, touches: nil, type: nil, within: nil, request_options: {})
      #
      # @param bbox [String] Legacy shorthand. Bounding box: south,west,north,east. Use spatial predicates (n
      #
      # @param contains [String] Geometry that features must contain
      #
      # @param crosses [String] Geometry that features must cross
      #
      # @param cursor [String] Cursor for pagination
      #
      # @param format_ [String] Response format. json (default) returns paginated GeoJSON. geojson/csv/ndjson st
      #
      # @param h3 [String] Legacy shorthand. H3 cell index. Use spatial predicates instead.
      #
      # @param intersects [String] Geometry that features must intersect
      #
      # @param limit [Integer] Maximum results (default 100, max 10000)
      #
      # @param near [String] Point geometry for proximity search (lat,lng). Requires radius.
      #
      # @param output_buffer [Float] Buffer geometry by meters
      #
      # @param output_centroid [Boolean] Replace geometry with centroid
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_geometry [Boolean] Include geometry (default true)
      #
      # @param output_include [String] Extra computed fields: bbox, distance, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param output_simplify [Float] Simplify geometry tolerance in meters
      #
      # @param output_sort [String] Sort by: distance, name, osm_id
      #
      # @param radius [Float] Search radius in meters (for near) or buffer distance (for other predicates)
      #
      # @param touches [String] Geometry that features must touch
      #
      # @param type [String] Element types (comma-separated: node,way,relation)
      #
      # @param within [String] Geometry that features must be within
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::ElementQueryParams
      def query(params = {})
        parsed, options = Plaza::ElementQueryParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/features",
          query: query.transform_keys(
            format_: "format",
            output_buffer: "output[buffer]",
            output_centroid: "output[centroid]",
            output_fields: "output[fields]",
            output_geometry: "output[geometry]",
            output_include: "output[include]",
            output_precision: "output[precision]",
            output_simplify: "output[simplify]",
            output_sort: "output[sort]"
          ),
          model: Plaza::FeatureCollection,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::ElementQueryPostParams} for more details.
      #
      # Query features by spatial predicate, bounding box, or H3 cell
      #
      # @overload query_post(bbox: nil, contains: nil, crosses: nil, cursor: nil, format_: nil, h3: nil, intersects: nil, limit: nil, near: nil, output_buffer: nil, output_centroid: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, output_sort: nil, radius: nil, touches: nil, type: nil, within: nil, request_options: {})
      #
      # @param bbox [String] Legacy shorthand. Bounding box: south,west,north,east. Use spatial predicates (n
      #
      # @param contains [String] Geometry that features must contain
      #
      # @param crosses [String] Geometry that features must cross
      #
      # @param cursor [String] Cursor for pagination
      #
      # @param format_ [String] Response format. json (default) returns paginated GeoJSON. geojson/csv/ndjson st
      #
      # @param h3 [String] Legacy shorthand. H3 cell index. Use spatial predicates instead.
      #
      # @param intersects [String] Geometry that features must intersect
      #
      # @param limit [Integer] Maximum results (default 100, max 10000)
      #
      # @param near [String] Point geometry for proximity search (lat,lng). Requires radius.
      #
      # @param output_buffer [Float] Buffer geometry by meters
      #
      # @param output_centroid [Boolean] Replace geometry with centroid
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_geometry [Boolean] Include geometry (default true)
      #
      # @param output_include [String] Extra computed fields: bbox, distance, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param output_simplify [Float] Simplify geometry tolerance in meters
      #
      # @param output_sort [String] Sort by: distance, name, osm_id
      #
      # @param radius [Float] Search radius in meters (for near) or buffer distance (for other predicates)
      #
      # @param touches [String] Geometry that features must touch
      #
      # @param type [String] Element types (comma-separated: node,way,relation)
      #
      # @param within [String] Geometry that features must be within
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::ElementQueryPostParams
      def query_post(params = {})
        parsed, options = Plaza::ElementQueryPostParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: "api/v1/features",
          query: query.transform_keys(
            format_: "format",
            output_buffer: "output[buffer]",
            output_centroid: "output[centroid]",
            output_fields: "output[fields]",
            output_geometry: "output[geometry]",
            output_include: "output[include]",
            output_precision: "output[precision]",
            output_simplify: "output[simplify]",
            output_sort: "output[sort]"
          ),
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
