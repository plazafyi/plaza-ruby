# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Geocode#reverse_post
    class GeocodeReversePostParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

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
      #   Legacy shorthand. Latitude. Use near param instead.
      #
      #   @return [Float, nil]
      optional :lat, Float

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

      # @!attribute lng
      #   Legacy shorthand. Longitude. Use near param instead.
      #
      #   @return [Float, nil]
      optional :lng, Float

      # @!attribute near
      #   Point geometry for reverse geocode (lat,lng or GeoJSON). Alternative to lat/lng
      #   params.
      #
      #   @return [String, nil]
      optional :near, String

      # @!attribute radius
      #   Search radius in meters (default 200, max 5000)
      #
      #   @return [Integer, nil]
      optional :radius, Integer

      # @!method initialize(format_: nil, lang: nil, lat: nil, layer: nil, limit: nil, lng: nil, near: nil, radius: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::GeocodeReversePostParams} for more details.
      #
      #   @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      #   @param lang [String] Language code for localized names (e.g. en, de, fr)
      #
      #   @param lat [Float] Legacy shorthand. Latitude. Use near param instead.
      #
      #   @param layer [String] Filter by layer: house or poi
      #
      #   @param limit [Integer] Maximum results (default 1, max 20)
      #
      #   @param lng [Float] Legacy shorthand. Longitude. Use near param instead.
      #
      #   @param near [String] Point geometry for reverse geocode (lat,lng or GeoJSON). Alternative to lat/lng
      #
      #   @param radius [Integer] Search radius in meters (default 200, max 5000)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
