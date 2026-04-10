# frozen_string_literal: true

module Plaza
  module Models
    class AutocompleteRequest < Plaza::Internal::Type::BaseModel
      # @!attribute q
      #   Partial address or place name input
      #
      #   @return [String]
      required :q, String

      # @!attribute country_code
      #   ISO 3166-1 alpha-2 country code to restrict results
      #
      #   @return [String, nil]
      optional :country_code, String, nil?: true

      # @!attribute focus
      #   GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
      #   order. Optional third element is altitude in meters.
      #
      #   @return [Plaza::Models::PointGeometry, nil]
      optional :focus, -> { Plaza::PointGeometry }, nil?: true

      # @!attribute lang
      #   Preferred response language (ISO 639-1)
      #
      #   @return [String, nil]
      optional :lang, String, nil?: true

      # @!attribute layer
      #   Filter by result layer (e.g. `address`, `place`, `poi`)
      #
      #   @return [String, nil]
      optional :layer, String, nil?: true

      # @!attribute limit
      #   Maximum number of suggestions (default: 5, max: 20)
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!method initialize(q:, country_code: nil, focus: nil, lang: nil, layer: nil, limit: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::AutocompleteRequest} for more details.
      #
      #   Request body for autocomplete suggestions. Optimized for low-latency type-ahead
      #   UIs.
      #
      #   @param q [String] Partial address or place name input
      #
      #   @param country_code [String, nil] ISO 3166-1 alpha-2 country code to restrict results
      #
      #   @param focus [Plaza::Models::PointGeometry, nil] GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude] order
      #
      #   @param lang [String, nil] Preferred response language (ISO 639-1)
      #
      #   @param layer [String, nil] Filter by result layer (e.g. `address`, `place`, `poi`)
      #
      #   @param limit [Integer, nil] Maximum number of suggestions (default: 5, max: 20)
    end
  end
end
