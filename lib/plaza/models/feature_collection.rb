# frozen_string_literal: true

module Plaza
  module Models
    class FeatureCollection < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #   Array of GeoJSON Feature objects
      #
      #   @return [Array<Plaza::Models::GeoJsonFeature>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::GeoJsonFeature] }

      # @!attribute type
      #   Always `FeatureCollection`
      #
      #   @return [Symbol, Plaza::Models::FeatureCollection::Type]
      required :type, enum: -> { Plaza::FeatureCollection::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection (RFC 7946). For paginated endpoints, metadata is
      #   returned in HTTP response headers rather than the body:
      #
      #   | Header          | Description                                      |
      #   | --------------- | ------------------------------------------------ |
      #   | `X-Limit`       | Requested result limit                           |
      #   | `X-Has-More`    | `true` if more results exist                     |
      #   | `X-Next-Cursor` | Opaque cursor for next page (cursor pagination)  |
      #   | `X-Next-Offset` | Numeric offset for next page (offset pagination) |
      #   | `Link`          | RFC 8288 `rel="next"` link to the next page      |
      #
      #   Content-Type is `application/geo+json`.
      #
      #   @param features [Array<Plaza::Models::GeoJsonFeature>] Array of GeoJSON Feature objects
      #
      #   @param type [Symbol, Plaza::Models::FeatureCollection::Type] Always `FeatureCollection`

      # Always `FeatureCollection`
      #
      # @see Plaza::Models::FeatureCollection#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
