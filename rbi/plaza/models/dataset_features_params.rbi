# typed: strong

module Plaza
  module Models
    class DatasetFeaturesParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::DatasetFeaturesParams, Plaza::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Cursor for pagination
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum results
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

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

      sig do
        params(
          id: String,
          cursor: String,
          limit: Integer,
          output_buffer: Float,
          output_centroid: T::Boolean,
          output_fields: String,
          output_geometry: T::Boolean,
          output_include: String,
          output_precision: Integer,
          output_simplify: Float,
          output_sort: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Cursor for pagination
        cursor: nil,
        # Maximum results
        limit: nil,
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
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            cursor: String,
            limit: Integer,
            output_buffer: Float,
            output_centroid: T::Boolean,
            output_fields: String,
            output_geometry: T::Boolean,
            output_include: String,
            output_precision: Integer,
            output_simplify: Float,
            output_sort: String,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
