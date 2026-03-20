# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#isochrone
    class RoutingIsochroneParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute lat
      #   Latitude
      #
      #   @return [Float]
      required :lat, Float

      # @!attribute lng
      #   Longitude
      #
      #   @return [Float]
      required :lng, Float

      # @!attribute time
      #   Travel time in seconds (1-7200)
      #
      #   @return [Float]
      required :time, Float

      # @!attribute mode
      #   Travel mode (auto, foot, bicycle)
      #
      #   @return [String, nil]
      optional :mode, String

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
      #   Extra computed fields: bbox, center
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

      # @!method initialize(lat:, lng:, time:, mode: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, request_options: {})
      #   @param lat [Float] Latitude
      #
      #   @param lng [Float] Longitude
      #
      #   @param time [Float] Travel time in seconds (1-7200)
      #
      #   @param mode [String] Travel mode (auto, foot, bicycle)
      #
      #   @param output_fields [String] Comma-separated property fields to include
      #
      #   @param output_geometry [Boolean] Include geometry (default true)
      #
      #   @param output_include [String] Extra computed fields: bbox, center
      #
      #   @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      #   @param output_simplify [Float] Simplify geometry tolerance in meters
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
