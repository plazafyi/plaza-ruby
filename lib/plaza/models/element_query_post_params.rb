# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elements#query_post
    class ElementQueryPostParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute bbox
      #   Legacy shorthand. Bounding box: south,west,north,east. Use spatial predicates
      #   (near, within, intersects) instead.
      #
      #   @return [String, nil]
      optional :bbox, String

      # @!attribute contains
      #   Geometry that features must contain
      #
      #   @return [String, nil]
      optional :contains, String

      # @!attribute crosses
      #   Geometry that features must cross
      #
      #   @return [String, nil]
      optional :crosses, String

      # @!attribute cursor
      #   Cursor for pagination
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute h3
      #   Legacy shorthand. H3 cell index. Use spatial predicates instead.
      #
      #   @return [String, nil]
      optional :h3, String

      # @!attribute intersects
      #   Geometry that features must intersect
      #
      #   @return [String, nil]
      optional :intersects, String

      # @!attribute limit
      #   Maximum results (default 100, max 10000)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute near
      #   Point geometry for proximity search (lat,lng). Requires radius.
      #
      #   @return [String, nil]
      optional :near, String

      # @!attribute output_buffer
      #   Buffer geometry by meters
      #
      #   @return [Float, nil]
      optional :output_buffer, Float

      # @!attribute output_centroid
      #   Replace geometry with centroid
      #
      #   @return [Boolean, nil]
      optional :output_centroid, Plaza::Internal::Type::Boolean

      # @!attribute output_fields
      #   Comma-separated property fields to include
      #
      #   @return [String, nil]
      optional :output_fields, String

      # @!attribute output_geometry
      #   Include geometry (default true)
      #
      #   @return [Boolean, nil]
      optional :output_geometry, Plaza::Internal::Type::Boolean

      # @!attribute output_include
      #   Extra computed fields: bbox, distance, center
      #
      #   @return [String, nil]
      optional :output_include, String

      # @!attribute output_precision
      #   Coordinate decimal precision (1-15, default 7)
      #
      #   @return [Integer, nil]
      optional :output_precision, Integer

      # @!attribute output_simplify
      #   Simplify geometry tolerance in meters
      #
      #   @return [Float, nil]
      optional :output_simplify, Float

      # @!attribute output_sort
      #   Sort by: distance, name, osm_id
      #
      #   @return [String, nil]
      optional :output_sort, String

      # @!attribute radius
      #   Search radius in meters (for near) or buffer distance (for other predicates)
      #
      #   @return [Float, nil]
      optional :radius, Float

      # @!attribute touches
      #   Geometry that features must touch
      #
      #   @return [String, nil]
      optional :touches, String

      # @!attribute type
      #   Element types (comma-separated: node,way,relation)
      #
      #   @return [String, nil]
      optional :type, String

      # @!attribute within
      #   Geometry that features must be within
      #
      #   @return [String, nil]
      optional :within, String

      # @!method initialize(bbox: nil, contains: nil, crosses: nil, cursor: nil, h3: nil, intersects: nil, limit: nil, near: nil, output_buffer: nil, output_centroid: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, output_sort: nil, radius: nil, touches: nil, type: nil, within: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::ElementQueryPostParams} for more details.
      #
      #   @param bbox [String] Legacy shorthand. Bounding box: south,west,north,east. Use spatial predicates (n
      #
      #   @param contains [String] Geometry that features must contain
      #
      #   @param crosses [String] Geometry that features must cross
      #
      #   @param cursor [String] Cursor for pagination
      #
      #   @param h3 [String] Legacy shorthand. H3 cell index. Use spatial predicates instead.
      #
      #   @param intersects [String] Geometry that features must intersect
      #
      #   @param limit [Integer] Maximum results (default 100, max 10000)
      #
      #   @param near [String] Point geometry for proximity search (lat,lng). Requires radius.
      #
      #   @param output_buffer [Float] Buffer geometry by meters
      #
      #   @param output_centroid [Boolean] Replace geometry with centroid
      #
      #   @param output_fields [String] Comma-separated property fields to include
      #
      #   @param output_geometry [Boolean] Include geometry (default true)
      #
      #   @param output_include [String] Extra computed fields: bbox, distance, center
      #
      #   @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      #   @param output_simplify [Float] Simplify geometry tolerance in meters
      #
      #   @param output_sort [String] Sort by: distance, name, osm_id
      #
      #   @param radius [Float] Search radius in meters (for near) or buffer distance (for other predicates)
      #
      #   @param touches [String] Geometry that features must touch
      #
      #   @param type [String] Element types (comma-separated: node,way,relation)
      #
      #   @param within [String] Geometry that features must be within
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
