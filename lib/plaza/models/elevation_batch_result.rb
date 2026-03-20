# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elevation#batch
    class ElevationBatchResult < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #   Elevation results in the same order as input coordinates
      #
      #   @return [Array<Plaza::Models::ElevationLookupResult>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::ElevationLookupResult] }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::ElevationBatchResult::Type]
      required :type, enum: -> { Plaza::ElevationBatchResult::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of elevation Point Features with 3D coordinates. Order
      #   matches the input coordinates array.
      #
      #   @param features [Array<Plaza::Models::ElevationLookupResult>] Elevation results in the same order as input coordinates
      #
      #   @param type [Symbol, Plaza::Models::ElevationBatchResult::Type]

      # @see Plaza::Models::ElevationBatchResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
