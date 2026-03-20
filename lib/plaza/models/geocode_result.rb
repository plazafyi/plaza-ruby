# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Geocode#forward
    class GeocodeResult < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #   Geocoding results ordered by relevance score
      #
      #   @return [Array<Plaza::Models::GeocodingFeature>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::GeocodingFeature] }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::GeocodeResult::Type]
      required :type, enum: -> { Plaza::GeocodeResult::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of forward geocoding results, ordered by relevance.
      #   Content-Type: `application/geo+json`.
      #
      #   @param features [Array<Plaza::Models::GeocodingFeature>] Geocoding results ordered by relevance score
      #
      #   @param type [Symbol, Plaza::Models::GeocodeResult::Type]

      # @see Plaza::Models::GeocodeResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
