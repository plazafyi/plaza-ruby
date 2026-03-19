# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Elevation#batch
    class ElevationBatchResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute features
      #   Elevation Point Features for each queried point
      #
      #   @return [Array<PlazaSDK::Models::ElevationLookupResult>]
      required :features, -> { PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::ElevationLookupResult] }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::ElevationBatchResult::Type]
      required :type, enum: -> { PlazaSDK::ElevationBatchResult::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of elevation Point Features with 3D coordinates
      #
      #   @param features [Array<PlazaSDK::Models::ElevationLookupResult>] Elevation Point Features for each queried point
      #
      #   @param type [Symbol, PlazaSDK::Models::ElevationBatchResult::Type]

      # @see PlazaSDK::Models::ElevationBatchResult#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
