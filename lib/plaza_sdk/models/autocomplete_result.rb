# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Geocode#autocomplete
    class AutocompleteResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute features
      #
      #   @return [Array<PlazaSDK::Models::GeocodingFeature>]
      required :features, -> { PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::GeocodingFeature] }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::AutocompleteResult::Type]
      required :type, enum: -> { PlazaSDK::AutocompleteResult::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of autocomplete suggestions
      #
      #   @param features [Array<PlazaSDK::Models::GeocodingFeature>]
      #   @param type [Symbol, PlazaSDK::Models::AutocompleteResult::Type]

      # @see PlazaSDK::Models::AutocompleteResult#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
