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

      # @!method initialize(lat:, lng:, time:, mode: nil, request_options: {})
      #   @param lat [Float] Latitude
      #
      #   @param lng [Float] Longitude
      #
      #   @param time [Float] Travel time in seconds (1-7200)
      #
      #   @param mode [String] Travel mode (auto, foot, bicycle)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
