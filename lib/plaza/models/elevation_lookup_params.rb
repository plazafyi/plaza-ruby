# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elevation#lookup
    class ElevationLookupParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute format_
      #   Response format: json (default), geojson, csv, ndjson
      #
      #   @return [String, nil]
      optional :format_, String

      # @!attribute lat
      #   Latitude (single point)
      #
      #   @return [Float, nil]
      optional :lat, Float

      # @!attribute lng
      #   Longitude (single point)
      #
      #   @return [Float, nil]
      optional :lng, Float

      # @!attribute locations
      #   Pipe-separated lng,lat pairs (batch)
      #
      #   @return [String, nil]
      optional :locations, String

      # @!attribute output_fields
      #   Comma-separated property fields to include
      #
      #   @return [String, nil]
      optional :output_fields, String

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

      # @!method initialize(format_: nil, lat: nil, lng: nil, locations: nil, output_fields: nil, output_include: nil, output_precision: nil, request_options: {})
      #   @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      #   @param lat [Float] Latitude (single point)
      #
      #   @param lng [Float] Longitude (single point)
      #
      #   @param locations [String] Pipe-separated lng,lat pairs (batch)
      #
      #   @param output_fields [String] Comma-separated property fields to include
      #
      #   @param output_include [String] Extra computed fields: bbox, center
      #
      #   @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
