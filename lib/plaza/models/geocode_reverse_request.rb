# frozen_string_literal: true

module Plaza
  module Models
    class GeocodeReverseRequest < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
      #   order. Optional third element is altitude in meters.
      #
      #   @return [Plaza::Models::PointGeometry]
      required :geometry, -> { Plaza::PointGeometry }

      # @!attribute lang
      #   Preferred response language (ISO 639-1)
      #
      #   @return [String, nil]
      optional :lang, String, nil?: true

      # @!attribute limit
      #   Maximum number of results (default: 1, max: 50)
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute radius
      #   Search radius in meters (default: 100)
      #
      #   @return [Float, nil]
      optional :radius, Float, nil?: true

      # @!method initialize(geometry:, lang: nil, limit: nil, radius: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::GeocodeReverseRequest} for more details.
      #
      #   Request body for reverse geocoding. Converts coordinates to addresses or place
      #   names.
      #
      #   @param geometry [Plaza::Models::PointGeometry] GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude] order
      #
      #   @param lang [String, nil] Preferred response language (ISO 639-1)
      #
      #   @param limit [Integer, nil] Maximum number of results (default: 1, max: 50)
      #
      #   @param radius [Float, nil] Search radius in meters (default: 100)
    end
  end
end
