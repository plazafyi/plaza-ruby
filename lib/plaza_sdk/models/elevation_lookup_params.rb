# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Elevation#lookup
    class ElevationLookupParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

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
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
