# typed: strong

module Plaza
  module Models
    class ElementQueryParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::ElementQueryParams, Plaza::Internal::AnyHash)
        end

      # Legacy shorthand. Bounding box: south,west,north,east. Use spatial predicates
      # (near, within, intersects) instead.
      sig { returns(T.nilable(String)) }
      attr_reader :bbox

      sig { params(bbox: String).void }
      attr_writer :bbox

      # Geometry that features must contain
      sig { returns(T.nilable(String)) }
      attr_reader :contains

      sig { params(contains: String).void }
      attr_writer :contains

      # Geometry that features must cross
      sig { returns(T.nilable(String)) }
      attr_reader :crosses

      sig { params(crosses: String).void }
      attr_writer :crosses

      # Cursor for pagination
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Legacy shorthand. H3 cell index. Use spatial predicates instead.
      sig { returns(T.nilable(String)) }
      attr_reader :h3

      sig { params(h3: String).void }
      attr_writer :h3

      # Geometry that features must intersect
      sig { returns(T.nilable(String)) }
      attr_reader :intersects

      sig { params(intersects: String).void }
      attr_writer :intersects

      # Maximum results (default 100, max 10000)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Point geometry for proximity search (lat,lng). Requires radius.
      sig { returns(T.nilable(String)) }
      attr_reader :near

      sig { params(near: String).void }
      attr_writer :near

      # Buffer geometry by meters
      sig { returns(T.nilable(Float)) }
      attr_reader :output_buffer

      sig { params(output_buffer: Float).void }
      attr_writer :output_buffer

      # Replace geometry with centroid
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :output_centroid

      sig { params(output_centroid: T::Boolean).void }
      attr_writer :output_centroid

      # Comma-separated property fields to include
      sig { returns(T.nilable(String)) }
      attr_reader :output_fields

      sig { params(output_fields: String).void }
      attr_writer :output_fields

      # Include geometry (default true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :output_geometry

      sig { params(output_geometry: T::Boolean).void }
      attr_writer :output_geometry

      # Extra computed fields: bbox, distance, center
      sig { returns(T.nilable(String)) }
      attr_reader :output_include

      sig { params(output_include: String).void }
      attr_writer :output_include

      # Coordinate decimal precision (1-15, default 7)
      sig { returns(T.nilable(Integer)) }
      attr_reader :output_precision

      sig { params(output_precision: Integer).void }
      attr_writer :output_precision

      # Simplify geometry tolerance in meters
      sig { returns(T.nilable(Float)) }
      attr_reader :output_simplify

      sig { params(output_simplify: Float).void }
      attr_writer :output_simplify

      # Sort by: distance, name, osm_id
      sig { returns(T.nilable(String)) }
      attr_reader :output_sort

      sig { params(output_sort: String).void }
      attr_writer :output_sort

      # Search radius in meters (for near) or buffer distance (for other predicates)
      sig { returns(T.nilable(Float)) }
      attr_reader :radius

      sig { params(radius: Float).void }
      attr_writer :radius

      # Geometry that features must touch
      sig { returns(T.nilable(String)) }
      attr_reader :touches

      sig { params(touches: String).void }
      attr_writer :touches

      # Element types (comma-separated: node,way,relation)
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # Geometry that features must be within
      sig { returns(T.nilable(String)) }
      attr_reader :within

      sig { params(within: String).void }
      attr_writer :within

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
        ).returns(T.attached_class)
      end
      def self.new(
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

      sig do
        override.returns(
          {
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
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
