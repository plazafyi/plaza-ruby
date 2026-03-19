# frozen_string_literal: true

module PlazaSDK
  module Models
    class OptimizeCompletedResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :geometry, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [PlazaSDK::Models::OptimizeCompletedResult::Properties]
      required :properties, -> { PlazaSDK::OptimizeCompletedResult::Properties }

      # @!attribute status
      #   Job status
      #
      #   @return [Symbol, PlazaSDK::Models::OptimizeCompletedResult::Status]
      required :status, enum: -> { PlazaSDK::OptimizeCompletedResult::Status }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::OptimizeCompletedResult::Type]
      required :type, enum: -> { PlazaSDK::OptimizeCompletedResult::Type }

      # @!method initialize(geometry:, properties:, status:, type:)
      #   Completed optimization — GeoJSON Feature with optimized route
      #
      #   @param geometry [PlazaSDK::Models::GeoJsonGeometry]
      #
      #   @param properties [PlazaSDK::Models::OptimizeCompletedResult::Properties]
      #
      #   @param status [Symbol, PlazaSDK::Models::OptimizeCompletedResult::Status] Job status
      #
      #   @param type [Symbol, PlazaSDK::Models::OptimizeCompletedResult::Type]

      # @see PlazaSDK::Models::OptimizeCompletedResult#properties
      class Properties < PlazaSDK::Internal::Type::BaseModel
        # @!attribute distance
        #   Total distance in meters
        #
        #   @return [Float, nil]
        optional :distance, Float

        # @!attribute duration
        #   Estimated duration in seconds
        #
        #   @return [Float, nil]
        optional :duration, Float

        # @!attribute waypoint_order
        #   Optimized waypoint ordering
        #
        #   @return [Array<Integer>, nil]
        optional :waypoint_order, PlazaSDK::Internal::Type::ArrayOf[Integer]

        # @!method initialize(distance: nil, duration: nil, waypoint_order: nil)
        #   @param distance [Float] Total distance in meters
        #
        #   @param duration [Float] Estimated duration in seconds
        #
        #   @param waypoint_order [Array<Integer>] Optimized waypoint ordering
      end

      # Job status
      #
      # @see PlazaSDK::Models::OptimizeCompletedResult#status
      module Status
        extend PlazaSDK::Internal::Type::Enum

        COMPLETED = :completed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see PlazaSDK::Models::OptimizeCompletedResult#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
