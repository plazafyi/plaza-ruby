# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elements#nearby_post
    class ElementNearbyPostParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute lat
      #   Legacy shorthand. Latitude (-90 to 90). Use near param instead.
      #
      #   @return [Float, nil]
      optional :lat, Float

      # @!attribute limit
      #   Maximum results (default 20, max 100)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute lng
      #   Legacy shorthand. Longitude (-180 to 180). Use near param instead.
      #
      #   @return [Float, nil]
      optional :lng, Float

      # @!attribute near
      #   Point geometry for proximity search (lat,lng or GeoJSON). Alternative to lat/lng
      #   params.
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
      #   Search radius in meters (default 500, max 10000)
      #
      #   @return [Integer, nil]
      optional :radius, Integer

      # @!method initialize(lat: nil, limit: nil, lng: nil, near: nil, output_buffer: nil, output_centroid: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, output_sort: nil, radius: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::ElementNearbyPostParams} for more details.
      #
      #   @param lat [Float] Legacy shorthand. Latitude (-90 to 90). Use near param instead.
      #
      #   @param limit [Integer] Maximum results (default 20, max 100)
      #
      #   @param lng [Float] Legacy shorthand. Longitude (-180 to 180). Use near param instead.
      #
      #   @param near [String] Point geometry for proximity search (lat,lng or GeoJSON). Alternative to lat/lng
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
      #   @param radius [Integer] Search radius in meters (default 500, max 10000)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
