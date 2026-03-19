# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#nearest
    class RoutingNearestParams < Plaza::Internal::Type::BaseModel
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

      # @!attribute radius
      #   Search radius in meters (default 500, max 5000)
      #
      #   @return [Integer, nil]
      optional :radius, Integer

      # @!method initialize(lat:, lng:, radius: nil, request_options: {})
      #   @param lat [Float] Latitude
      #
      #   @param lng [Float] Longitude
      #
      #   @param radius [Integer] Search radius in meters (default 500, max 5000)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
