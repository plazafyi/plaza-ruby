# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Geocode#forward
    class GeocodeResult < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #
      #   @return [Array<Plaza::Models::GeocodingFeature>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::GeocodingFeature] }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::GeocodeResult::Type]
      required :type, enum: -> { Plaza::GeocodeResult::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of geocoding results
      #
      #   @param features [Array<Plaza::Models::GeocodingFeature>]
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
