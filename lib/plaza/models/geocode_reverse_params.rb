# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Geocode#reverse
    class GeocodeReverseParams < Plaza::Internal::Type::BaseModel
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

      # @!attribute lang
      #   Language code for localized names (e.g. en, de, fr)
      #
      #   @return [String, nil]
      optional :lang, String

      # @!attribute layer
      #   Filter by layer: house or poi
      #
      #   @return [String, nil]
      optional :layer, String

      # @!attribute limit
      #   Maximum results (default 1, max 20)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute radius
      #   Search radius in meters (default 200, max 5000)
      #
      #   @return [Integer, nil]
      optional :radius, Integer

      # @!method initialize(lat:, lng:, lang: nil, layer: nil, limit: nil, radius: nil, request_options: {})
      #   @param lat [Float] Latitude
      #
      #   @param lng [Float] Longitude
      #
      #   @param lang [String] Language code for localized names (e.g. en, de, fr)
      #
      #   @param layer [String] Filter by layer: house or poi
      #
      #   @param limit [Integer] Maximum results (default 1, max 20)
      #
      #   @param radius [Integer] Search radius in meters (default 200, max 5000)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
