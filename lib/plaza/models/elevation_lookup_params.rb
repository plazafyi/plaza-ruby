# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elevation#lookup
    class ElevationLookupParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

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

      # @!method initialize(lat: nil, lng: nil, locations: nil, request_options: {})
      #   @param lat [Float] Latitude (single point)
      #
      #   @param lng [Float] Longitude (single point)
      #
      #   @param locations [String] Pipe-separated lng,lat pairs (batch)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
