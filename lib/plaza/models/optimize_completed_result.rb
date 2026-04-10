# frozen_string_literal: true

module Plaza
  module Models
    class OptimizeCompletedResult < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #   Waypoints in optimized visit order
      #
      #   @return [Array<Plaza::Models::OptimizeCompletedResult::Feature>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::OptimizeCompletedResult::Feature] }

      # @!attribute optimization
      #   Optimization method used (e.g. `nearest_neighbor`, `2opt`)
      #
      #   @return [String]
      required :optimization, String

      # @!attribute roundtrip
      #   Whether the route returns to the starting waypoint
      #
      #   @return [Boolean]
      required :roundtrip, Plaza::Internal::Type::Boolean

      # @!attribute total_cost_s
      #   Total travel time for the optimized route in seconds
      #
      #   @return [Float]
      required :total_cost_s, Float

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::OptimizeCompletedResult::Type]
      required :type, enum: -> { Plaza::OptimizeCompletedResult::Type }

      # @!method initialize(features:, optimization:, roundtrip:, total_cost_s:, type:)
      #   Completed optimization result as a GeoJSON FeatureCollection. Each Feature is a
      #   waypoint in optimized visit order. Top-level fields provide summary statistics.
      #
      #   @param features [Array<Plaza::Models::OptimizeCompletedResult::Feature>] Waypoints in optimized visit order
      #
      #   @param optimization [String] Optimization method used (e.g. `nearest_neighbor`, `2opt`)
      #
      #   @param roundtrip [Boolean] Whether the route returns to the starting waypoint
      #
      #   @param total_cost_s [Float] Total travel time for the optimized route in seconds
      #
      #   @param type [Symbol, Plaza::Models::OptimizeCompletedResult::Type]

      class Feature < Plaza::Internal::Type::BaseModel
        # @!attribute geometry
        #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        #   determines the coordinate structure.
        #
        #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry]
        required :geometry, union: -> { Plaza::Geometry }

        # @!attribute properties
        #
        #   @return [Plaza::Models::OptimizeCompletedResult::Feature::Properties]
        required :properties, -> { Plaza::OptimizeCompletedResult::Feature::Properties }

        # @!attribute type
        #
        #   @return [Symbol, Plaza::Models::OptimizeCompletedResult::Feature::Type]
        required :type, enum: -> { Plaza::OptimizeCompletedResult::Feature::Type }

        # @!method initialize(geometry:, properties:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Plaza::Models::OptimizeCompletedResult::Feature} for more details.
        #
        #   GeoJSON Point Feature representing an optimized waypoint with cost data.
        #
        #   @param geometry [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
        #
        #   @param properties [Plaza::Models::OptimizeCompletedResult::Feature::Properties]
        #
        #   @param type [Symbol, Plaza::Models::OptimizeCompletedResult::Feature::Type]

        # @see Plaza::Models::OptimizeCompletedResult::Feature#properties
        class Properties < Plaza::Internal::Type::BaseModel
          # @!attribute cost_s
          #   Travel time in seconds from the previous waypoint to this one (0 for the first
          #   waypoint)
          #
          #   @return [Float]
          required :cost_s, Float

          # @!attribute cumulative_cost_s
          #   Cumulative travel time in seconds from the start to this waypoint
          #
          #   @return [Float]
          required :cumulative_cost_s, Float

          # @!attribute waypoint_index
          #   Position of this waypoint in the optimized visit order (0-based)
          #
          #   @return [Integer]
          required :waypoint_index, Integer

          # @!method initialize(cost_s:, cumulative_cost_s:, waypoint_index:)
          #   Some parameter documentations has been truncated, see
          #   {Plaza::Models::OptimizeCompletedResult::Feature::Properties} for more details.
          #
          #   @param cost_s [Float] Travel time in seconds from the previous waypoint to this one (0 for the first w
          #
          #   @param cumulative_cost_s [Float] Cumulative travel time in seconds from the start to this waypoint
          #
          #   @param waypoint_index [Integer] Position of this waypoint in the optimized visit order (0-based)
        end

        # @see Plaza::Models::OptimizeCompletedResult::Feature#type
        module Type
          extend Plaza::Internal::Type::Enum

          FEATURE = :Feature

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Plaza::Models::OptimizeCompletedResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
