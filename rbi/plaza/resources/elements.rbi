# typed: strong

module Plaza
  module Resources
    class Elements
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

      # Get feature by type and ID
      sig do
        params(request_options: Plaza::RequestOptions::OrHash).returns(
          Plaza::GeoJsonFeature
        )
      end
      def lookup(request_options: {})
      end

      # Find features near a geographic point
      sig do
        params(
          lat: Float,
          limit: Integer,
          lng: Float,
          near: String,
          output_buffer: Float,
          output_centroid: T::Boolean,
          output_fields: String,
          output_geometry: T::Boolean,
          output_include: String,
          output_precision: Integer,
          output_simplify: Float,
          output_sort: String,
          radius: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def nearby(
        # Legacy shorthand. Latitude (-90 to 90). Use near param instead.
        lat: nil,
        # Maximum results (default 20, max 100)
        limit: nil,
        # Legacy shorthand. Longitude (-180 to 180). Use near param instead.
        lng: nil,
        # Point geometry for proximity search (lat,lng or GeoJSON). Alternative to lat/lng
        # params.
        near: nil,
        # Buffer geometry by meters
        output_buffer: nil,
        # Replace geometry with centroid
        output_centroid: nil,
        # Comma-separated property fields to include
        output_fields: nil,
        # Include geometry (default true)
        output_geometry: nil,
        # Extra computed fields: bbox, distance, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Simplify geometry tolerance in meters
        output_simplify: nil,
        # Sort by: distance, name, osm_id
        output_sort: nil,
        # Search radius in meters (default 500, max 10000)
        radius: nil,
        request_options: {}
      )
      end

      # Find features near a geographic point
      sig do
        params(
          lat: Float,
          limit: Integer,
          lng: Float,
          near: String,
          output_buffer: Float,
          output_centroid: T::Boolean,
          output_fields: String,
          output_geometry: T::Boolean,
          output_include: String,
          output_precision: Integer,
          output_simplify: Float,
          output_sort: String,
          radius: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def nearby_post(
        # Legacy shorthand. Latitude (-90 to 90). Use near param instead.
        lat: nil,
        # Maximum results (default 20, max 100)
        limit: nil,
        # Legacy shorthand. Longitude (-180 to 180). Use near param instead.
        lng: nil,
        # Point geometry for proximity search (lat,lng or GeoJSON). Alternative to lat/lng
        # params.
        near: nil,
        # Buffer geometry by meters
        output_buffer: nil,
        # Replace geometry with centroid
        output_centroid: nil,
        # Comma-separated property fields to include
        output_fields: nil,
        # Include geometry (default true)
        output_geometry: nil,
        # Extra computed fields: bbox, distance, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Simplify geometry tolerance in meters
        output_simplify: nil,
        # Sort by: distance, name, osm_id
        output_sort: nil,
        # Search radius in meters (default 500, max 10000)
        radius: nil,
        request_options: {}
      )
      end

      # Query features by spatial predicate, bounding box, or H3 cell
      sig do
        params(
          bbox: String,
          contains: String,
          crosses: String,
          cursor: String,
          h3: String,
          intersects: String,
          limit: Integer,
          near: String,
          output_buffer: Float,
          output_centroid: T::Boolean,
          output_fields: String,
          output_geometry: T::Boolean,
          output_include: String,
          output_precision: Integer,
          output_simplify: Float,
          output_sort: String,
          radius: Float,
          touches: String,
          type: String,
          within: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def query(
        # Legacy shorthand. Bounding box: south,west,north,east. Use spatial predicates
        # (near, within, intersects) instead.
        bbox: nil,
        # Geometry that features must contain
        contains: nil,
        # Geometry that features must cross
        crosses: nil,
        # Cursor for pagination
        cursor: nil,
        # Legacy shorthand. H3 cell index. Use spatial predicates instead.
        h3: nil,
        # Geometry that features must intersect
        intersects: nil,
        # Maximum results (default 100, max 10000)
        limit: nil,
        # Point geometry for proximity search (lat,lng). Requires radius.
        near: nil,
        # Buffer geometry by meters
        output_buffer: nil,
        # Replace geometry with centroid
        output_centroid: nil,
        # Comma-separated property fields to include
        output_fields: nil,
        # Include geometry (default true)
        output_geometry: nil,
        # Extra computed fields: bbox, distance, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Simplify geometry tolerance in meters
        output_simplify: nil,
        # Sort by: distance, name, osm_id
        output_sort: nil,
        # Search radius in meters (for near) or buffer distance (for other predicates)
        radius: nil,
        # Geometry that features must touch
        touches: nil,
        # Element types (comma-separated: node,way,relation)
        type: nil,
        # Geometry that features must be within
        within: nil,
        request_options: {}
      )
      end

      # Query features by spatial predicate, bounding box, or H3 cell
      sig do
        params(
          bbox: String,
          contains: String,
          crosses: String,
          cursor: String,
          h3: String,
          intersects: String,
          limit: Integer,
          near: String,
          output_buffer: Float,
          output_centroid: T::Boolean,
          output_fields: String,
          output_geometry: T::Boolean,
          output_include: String,
          output_precision: Integer,
          output_simplify: Float,
          output_sort: String,
          radius: Float,
          touches: String,
          type: String,
          within: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def query_post(
        # Legacy shorthand. Bounding box: south,west,north,east. Use spatial predicates
        # (near, within, intersects) instead.
        bbox: nil,
        # Geometry that features must contain
        contains: nil,
        # Geometry that features must cross
        crosses: nil,
        # Cursor for pagination
        cursor: nil,
        # Legacy shorthand. H3 cell index. Use spatial predicates instead.
        h3: nil,
        # Geometry that features must intersect
        intersects: nil,
        # Maximum results (default 100, max 10000)
        limit: nil,
        # Point geometry for proximity search (lat,lng). Requires radius.
        near: nil,
        # Buffer geometry by meters
        output_buffer: nil,
        # Replace geometry with centroid
        output_centroid: nil,
        # Comma-separated property fields to include
        output_fields: nil,
        # Include geometry (default true)
        output_geometry: nil,
        # Extra computed fields: bbox, distance, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Simplify geometry tolerance in meters
        output_simplify: nil,
        # Sort by: distance, name, osm_id
        output_sort: nil,
        # Search radius in meters (for near) or buffer distance (for other predicates)
        radius: nil,
        # Geometry that features must touch
        touches: nil,
        # Element types (comma-separated: node,way,relation)
        type: nil,
        # Geometry that features must be within
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
