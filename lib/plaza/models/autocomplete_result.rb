# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Geocode#autocomplete
    class AutocompleteResult < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #   Autocomplete suggestions ordered by relevance
      #
      #   @return [Array<Plaza::Models::GeocodingFeature>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::GeocodingFeature] }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::AutocompleteResult::Type]
      required :type, enum: -> { Plaza::AutocompleteResult::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of autocomplete suggestions for partial address input.
      #   Optimized for low-latency type-ahead UIs. Content-Type: `application/geo+json`.
      #
      #   @param features [Array<Plaza::Models::GeocodingFeature>] Autocomplete suggestions ordered by relevance
      #
      #   @param type [Symbol, Plaza::Models::AutocompleteResult::Type]

      # @see Plaza::Models::AutocompleteResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
