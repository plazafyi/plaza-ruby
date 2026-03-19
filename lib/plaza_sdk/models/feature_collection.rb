# frozen_string_literal: true

module PlazaSDK
  module Models
    class FeatureCollection < PlazaSDK::Internal::Type::BaseModel
      # @!attribute features
      #
      #   @return [Array<PlazaSDK::Models::GeoJsonFeature>]
      required :features, -> { PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::GeoJsonFeature] }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::FeatureCollection::Type]
      required :type, enum: -> { PlazaSDK::FeatureCollection::Type }

      # @!method initialize(features:, type:)
      #   Bare GeoJSON FeatureCollection. Pagination metadata is returned in HTTP headers
      #   (X-Limit, X-Has-More, X-Next-Cursor, X-Next-Offset, Link).
      #
      #   @param features [Array<PlazaSDK::Models::GeoJsonFeature>]
      #   @param type [Symbol, PlazaSDK::Models::FeatureCollection::Type]

      # @see PlazaSDK::Models::FeatureCollection#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
