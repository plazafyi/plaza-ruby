# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::MapMatch#match
    class MapMatchResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :geometry, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [PlazaSDK::Models::MapMatchResult::Properties]
      required :properties, -> { PlazaSDK::MapMatchResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::MapMatchResult::Type]
      required :type, enum: -> { PlazaSDK::MapMatchResult::Type }

      # @!attribute legs
      #   Matched route legs between consecutive trace points
      #
      #   @return [Array<Hash{Symbol=>Object}>, nil]
      optional :legs,
               PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::HashOf[PlazaSDK::Internal::Type::Unknown]]

      # @!method initialize(geometry:, properties:, type:, legs: nil)
      #   Map matching result with snapped geometry
      #
      #   @param geometry [PlazaSDK::Models::GeoJsonGeometry]
      #
      #   @param properties [PlazaSDK::Models::MapMatchResult::Properties]
      #
      #   @param type [Symbol, PlazaSDK::Models::MapMatchResult::Type]
      #
      #   @param legs [Array<Hash{Symbol=>Object}>] Matched route legs between consecutive trace points

      # @see PlazaSDK::Models::MapMatchResult#properties
      class Properties < PlazaSDK::Internal::Type::BaseModel
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

      # @see PlazaSDK::Models::MapMatchResult#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
