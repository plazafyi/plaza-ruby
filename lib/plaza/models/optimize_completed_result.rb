# frozen_string_literal: true

module Plaza
  module Models
    class OptimizeCompletedResult < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :geometry, -> { Plaza::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [Plaza::Models::OptimizeCompletedResult::Properties]
      required :properties, -> { Plaza::OptimizeCompletedResult::Properties }

      # @!attribute status
      #   Job status
      #
      #   @return [Symbol, Plaza::Models::OptimizeCompletedResult::Status]
      required :status, enum: -> { Plaza::OptimizeCompletedResult::Status }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::OptimizeCompletedResult::Type]
      required :type, enum: -> { Plaza::OptimizeCompletedResult::Type }

      # @!method initialize(geometry:, properties:, status:, type:)
      #   Completed optimization — GeoJSON Feature with optimized route
      #
      #   @param geometry [Plaza::Models::GeoJsonGeometry]
      #
      #   @param properties [Plaza::Models::OptimizeCompletedResult::Properties]
      #
      #   @param status [Symbol, Plaza::Models::OptimizeCompletedResult::Status] Job status
      #
      #   @param type [Symbol, Plaza::Models::OptimizeCompletedResult::Type]

      # @see Plaza::Models::OptimizeCompletedResult#properties
      class Properties < Plaza::Internal::Type::BaseModel
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
        optional :waypoint_order, Plaza::Internal::Type::ArrayOf[Integer]

        # @!method initialize(distance: nil, duration: nil, waypoint_order: nil)
        #   @param distance [Float] Total distance in meters
        #
        #   @param duration [Float] Estimated duration in seconds
        #
        #   @param waypoint_order [Array<Integer>] Optimized waypoint ordering
      end

      # Job status
      #
      # @see Plaza::Models::OptimizeCompletedResult#status
      module Status
        extend Plaza::Internal::Type::Enum

        COMPLETED = :completed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Plaza::Models::OptimizeCompletedResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
