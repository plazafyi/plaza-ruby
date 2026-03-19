# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Geocode#reverse
    class ReverseGeocodeResult < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #
      #   @return [Array<Plaza::Models::GeocodingFeature>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::GeocodingFeature] }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::ReverseGeocodeResult::Type]
      required :type, enum: -> { Plaza::ReverseGeocodeResult::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of reverse geocoding results
      #
      #   @param features [Array<Plaza::Models::GeocodingFeature>]
      #   @param type [Symbol, Plaza::Models::ReverseGeocodeResult::Type]

      # @see Plaza::Models::ReverseGeocodeResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
