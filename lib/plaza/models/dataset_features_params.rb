# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Datasets#features
    class DatasetFeaturesParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute cursor
      #   Cursor for pagination
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum results
      #
      #   @return [Integer, nil]
      optional :limit, Integer

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

      # @!method initialize(id:, cursor: nil, limit: nil, output_buffer: nil, output_centroid: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, output_sort: nil, request_options: {})
      #   @param id [String]
      #
      #   @param cursor [String] Cursor for pagination
      #
      #   @param limit [Integer] Maximum results
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
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
