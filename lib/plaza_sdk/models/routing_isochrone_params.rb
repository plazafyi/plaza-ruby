# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Routing#isochrone
    class RoutingIsochroneParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

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

      # @!method initialize(lat:, lng:, time:, mode: nil, request_options: {})
      #   @param lat [Float] Latitude
      #
      #   @param lng [Float] Longitude
      #
      #   @param time [Float] Travel time in seconds (1-7200)
      #
      #   @param mode [String] Travel mode (auto, foot, bicycle)
      #
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
