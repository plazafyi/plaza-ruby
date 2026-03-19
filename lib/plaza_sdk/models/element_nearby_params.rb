# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Elements#nearby
    class ElementNearbyParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      # @!attribute lat
      #   Latitude (-90 to 90)
      #
      #   @return [Float]
      required :lat, Float

      # @!attribute lng
      #   Longitude (-180 to 180)
      #
      #   @return [Float]
      required :lng, Float

      # @!attribute limit
      #   Maximum results (default 20, max 100)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute radius
      #   Search radius in meters (default 500, max 10000)
      #
      #   @return [Integer, nil]
      optional :radius, Integer

      # @!method initialize(lat:, lng:, limit: nil, radius: nil, request_options: {})
      #   @param lat [Float] Latitude (-90 to 90)
      #
      #   @param lng [Float] Longitude (-180 to 180)
      #
      #   @param limit [Integer] Maximum results (default 20, max 100)
      #
      #   @param radius [Integer] Search radius in meters (default 500, max 10000)
      #
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
