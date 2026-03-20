# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#nearest_post
    class RoutingNearestPostParams < Plaza::Internal::Type::BaseModel
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

      # @!attribute output_fields
      #   Comma-separated property fields to include
      #
      #   @return [String, nil]
      optional :output_fields, String

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

      # @!attribute radius
      #   Search radius in meters (default 500, max 5000)
      #
      #   @return [Integer, nil]
      optional :radius, Integer

      # @!method initialize(lat:, lng:, output_fields: nil, output_include: nil, output_precision: nil, radius: nil, request_options: {})
      #   @param lat [Float] Latitude
      #
      #   @param lng [Float] Longitude
      #
      #   @param output_fields [String] Comma-separated property fields to include
      #
      #   @param output_include [String] Extra computed fields: bbox, distance, center
      #
      #   @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      #   @param radius [Integer] Search radius in meters (default 500, max 5000)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
