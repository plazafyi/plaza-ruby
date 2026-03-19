# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Geocode#forward
    class GeocodeResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute features
      #
      #   @return [Array<PlazaSDK::Models::GeocodingFeature>]
      required :features, -> { PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::GeocodingFeature] }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::GeocodeResult::Type]
      required :type, enum: -> { PlazaSDK::GeocodeResult::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of geocoding results
      #
      #   @param features [Array<PlazaSDK::Models::GeocodingFeature>]
      #   @param type [Symbol, PlazaSDK::Models::GeocodeResult::Type]

      # @see PlazaSDK::Models::GeocodeResult#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
