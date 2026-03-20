# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Geocode#autocomplete
    class GeocodeAutocompleteParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute q
      #   Partial address query
      #
      #   @return [String]
      required :q, String

      # @!attribute country_code
      #   ISO 3166-1 alpha-2 country code filter
      #
      #   @return [String, nil]
      optional :country_code, String

      # @!attribute format_
      #   Response format: json (default), geojson, csv, ndjson
      #
      #   @return [String, nil]
      optional :format_, String

      # @!attribute lang
      #   Language code for localized names (e.g. en, de, fr)
      #
      #   @return [String, nil]
      optional :lang, String

      # @!attribute lat
      #   Focus latitude
      #
      #   @return [Float, nil]
      optional :lat, Float

      # @!attribute layer
      #   Filter by layer: address, poi, or admin
      #
      #   @return [String, nil]
      optional :layer, String

      # @!attribute limit
      #   Maximum results (default 10, max 20)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute lng
      #   Focus longitude
      #
      #   @return [Float, nil]
      optional :lng, Float

      # @!method initialize(q:, country_code: nil, format_: nil, lang: nil, lat: nil, layer: nil, limit: nil, lng: nil, request_options: {})
      #   @param q [String] Partial address query
      #
      #   @param country_code [String] ISO 3166-1 alpha-2 country code filter
      #
      #   @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      #   @param lang [String] Language code for localized names (e.g. en, de, fr)
      #
      #   @param lat [Float] Focus latitude
      #
      #   @param layer [String] Filter by layer: address, poi, or admin
      #
      #   @param limit [Integer] Maximum results (default 10, max 20)
      #
      #   @param lng [Float] Focus longitude
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
