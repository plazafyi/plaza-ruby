# frozen_string_literal: true

module Plaza
  module Models
    class FeatureCollection < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #
      #   @return [Array<Plaza::Models::GeoJsonFeature>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::GeoJsonFeature] }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::FeatureCollection::Type]
      required :type, enum: -> { Plaza::FeatureCollection::Type }

      # @!method initialize(features:, type:)
      #   Bare GeoJSON FeatureCollection. Pagination metadata is returned in HTTP headers
      #   (X-Limit, X-Has-More, X-Next-Cursor, X-Next-Offset, Link).
      #
      #   @param features [Array<Plaza::Models::GeoJsonFeature>]
      #   @param type [Symbol, Plaza::Models::FeatureCollection::Type]

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
