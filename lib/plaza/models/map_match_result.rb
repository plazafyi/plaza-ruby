# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::MapMatch#match
    class MapMatchResult < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :geometry, -> { Plaza::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [Plaza::Models::MapMatchResult::Properties]
      required :properties, -> { Plaza::MapMatchResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::MapMatchResult::Type]
      required :type, enum: -> { Plaza::MapMatchResult::Type }

      # @!attribute legs
      #   Matched route legs between consecutive trace points
      #
      #   @return [Array<Hash{Symbol=>Object}>, nil]
      optional :legs,
               Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]]

      # @!method initialize(geometry:, properties:, type:, legs: nil)
      #   Map matching result with snapped geometry
      #
      #   @param geometry [Plaza::Models::GeoJsonGeometry]
      #
      #   @param properties [Plaza::Models::MapMatchResult::Properties]
      #
      #   @param type [Symbol, Plaza::Models::MapMatchResult::Type]
      #
      #   @param legs [Array<Hash{Symbol=>Object}>] Matched route legs between consecutive trace points

      # @see Plaza::Models::MapMatchResult#properties
      class Properties < Plaza::Internal::Type::BaseModel
        # @!attribute confidence
        #   Match confidence score
        #
        #   @return [Float, nil]
        optional :confidence, Float

        # @!attribute distance
        #   Total matched distance in meters
        #
        #   @return [Float, nil]
        optional :distance, Float

        # @!attribute duration
        #   Estimated duration in seconds
        #
        #   @return [Float, nil]
        optional :duration, Float

        # @!method initialize(confidence: nil, distance: nil, duration: nil)
        #   @param confidence [Float] Match confidence score
        #
        #   @param distance [Float] Total matched distance in meters
        #
        #   @param duration [Float] Estimated duration in seconds
      end

      # @see Plaza::Models::MapMatchResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
