# typed: strong

module Plaza
  module Models
    class OptimizeCompletedResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::OptimizeCompletedResult, Plaza::Internal::AnyHash)
        end

      # Waypoints in optimized visit order
      sig { returns(T::Array[Plaza::OptimizeCompletedResult::Feature]) }
      attr_accessor :features

      # Optimization method used (e.g. `nearest_neighbor`, `2opt`)
      sig { returns(String) }
      attr_accessor :optimization

      # Whether the route returns to the starting waypoint
      sig { returns(T::Boolean) }
      attr_accessor :roundtrip

      # Total travel time for the optimized route in seconds
      sig { returns(Float) }
      attr_accessor :total_cost_s

      sig { returns(Plaza::OptimizeCompletedResult::Type::TaggedSymbol) }
      attr_accessor :type

      # Completed optimization result as a GeoJSON FeatureCollection. Each Feature is a
      # waypoint in optimized visit order. Top-level fields provide summary statistics.
      sig do
        params(
          features: T::Array[Plaza::OptimizeCompletedResult::Feature::OrHash],
          optimization: String,
          roundtrip: T::Boolean,
          total_cost_s: Float,
          type: Plaza::OptimizeCompletedResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Waypoints in optimized visit order
        features:,
        # Optimization method used (e.g. `nearest_neighbor`, `2opt`)
        optimization:,
        # Whether the route returns to the starting waypoint
        roundtrip:,
        # Total travel time for the optimized route in seconds
        total_cost_s:,
        type:
      )
      end

      sig do
        override.returns(
          {
            features: T::Array[Plaza::OptimizeCompletedResult::Feature],
            optimization: String,
            roundtrip: T::Boolean,
            total_cost_s: Float,
            type: Plaza::OptimizeCompletedResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Feature < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Plaza::OptimizeCompletedResult::Feature,
              Plaza::Internal::AnyHash
            )
          end

        # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
        # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
        sig { returns(Plaza::GeoJsonGeometry) }
        attr_reader :geometry

        sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
        attr_writer :geometry

        sig { returns(Plaza::OptimizeCompletedResult::Feature::Properties) }
        attr_reader :properties

        sig do
          params(
            properties:
              Plaza::OptimizeCompletedResult::Feature::Properties::OrHash
          ).void
        end
        attr_writer :properties

        sig do
          returns(Plaza::OptimizeCompletedResult::Feature::Type::TaggedSymbol)
        end
        attr_accessor :type

        # GeoJSON Point Feature representing an optimized waypoint with cost data.
        sig do
          params(
            geometry: Plaza::GeoJsonGeometry::OrHash,
            properties:
              Plaza::OptimizeCompletedResult::Feature::Properties::OrHash,
            type: Plaza::OptimizeCompletedResult::Feature::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
          # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
          geometry:,
          properties:,
          type:
        )
        end

        sig do
          override.returns(
            {
              geometry: Plaza::GeoJsonGeometry,
              properties: Plaza::OptimizeCompletedResult::Feature::Properties,
              type: Plaza::OptimizeCompletedResult::Feature::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        class Properties < Plaza::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Plaza::OptimizeCompletedResult::Feature::Properties,
                Plaza::Internal::AnyHash
              )
            end

          # Travel time in seconds from the previous waypoint to this one (0 for the first
          # waypoint)
          sig { returns(Float) }
          attr_accessor :cost_s

          # Cumulative travel time in seconds from the start to this waypoint
          sig { returns(Float) }
          attr_accessor :cumulative_cost_s

          # Position of this waypoint in the optimized visit order (0-based)
          sig { returns(Integer) }
          attr_accessor :waypoint_index

          sig do
            params(
              cost_s: Float,
              cumulative_cost_s: Float,
              waypoint_index: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Travel time in seconds from the previous waypoint to this one (0 for the first
            # waypoint)
            cost_s:,
            # Cumulative travel time in seconds from the start to this waypoint
            cumulative_cost_s:,
            # Position of this waypoint in the optimized visit order (0-based)
            waypoint_index:
          )
          end

          sig do
            override.returns(
              {
                cost_s: Float,
                cumulative_cost_s: Float,
                waypoint_index: Integer
              }
            )
          end
          def to_hash
          end
        end

        module Type
          extend Plaza::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Plaza::OptimizeCompletedResult::Feature::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FEATURE =
            T.let(
              :Feature,
              Plaza::OptimizeCompletedResult::Feature::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Plaza::OptimizeCompletedResult::Feature::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::OptimizeCompletedResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(
            :FeatureCollection,
            Plaza::OptimizeCompletedResult::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Plaza::OptimizeCompletedResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
