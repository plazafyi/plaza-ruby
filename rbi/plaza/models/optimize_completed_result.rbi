# typed: strong

module Plaza
  module Models
    class OptimizeCompletedResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::OptimizeCompletedResult, Plaza::Internal::AnyHash)
        end

      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(Plaza::OptimizeCompletedResult::Properties) }
      attr_reader :properties

      sig do
        params(
          properties: Plaza::OptimizeCompletedResult::Properties::OrHash
        ).void
      end
      attr_writer :properties

      # Job status
      sig { returns(Plaza::OptimizeCompletedResult::Status::TaggedSymbol) }
      attr_accessor :status

      sig { returns(Plaza::OptimizeCompletedResult::Type::TaggedSymbol) }
      attr_accessor :type

      # Completed optimization — GeoJSON Feature with optimized route
      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          properties: Plaza::OptimizeCompletedResult::Properties::OrHash,
          status: Plaza::OptimizeCompletedResult::Status::OrSymbol,
          type: Plaza::OptimizeCompletedResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        geometry:,
        properties:,
        # Job status
        status:,
        type:
      )
      end

      sig do
        override.returns(
          {
            geometry: Plaza::GeoJsonGeometry,
            properties: Plaza::OptimizeCompletedResult::Properties,
            status: Plaza::OptimizeCompletedResult::Status::TaggedSymbol,
            type: Plaza::OptimizeCompletedResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Plaza::OptimizeCompletedResult::Properties,
              Plaza::Internal::AnyHash
            )
          end

        # Total distance in meters
        sig { returns(T.nilable(Float)) }
        attr_reader :distance

        sig { params(distance: Float).void }
        attr_writer :distance

        # Estimated duration in seconds
        sig { returns(T.nilable(Float)) }
        attr_reader :duration

        sig { params(duration: Float).void }
        attr_writer :duration

        # Optimized waypoint ordering
        sig { returns(T.nilable(T::Array[Integer])) }
        attr_reader :waypoint_order

        sig { params(waypoint_order: T::Array[Integer]).void }
        attr_writer :waypoint_order

        sig do
          params(
            distance: Float,
            duration: Float,
            waypoint_order: T::Array[Integer]
          ).returns(T.attached_class)
        end
        def self.new(
          # Total distance in meters
          distance: nil,
          # Estimated duration in seconds
          duration: nil,
          # Optimized waypoint ordering
          waypoint_order: nil
        )
        end

        sig do
          override.returns(
            {
              distance: Float,
              duration: Float,
              waypoint_order: T::Array[Integer]
            }
          )
        end
        def to_hash
        end
      end

      # Job status
      module Status
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::OptimizeCompletedResult::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COMPLETED =
          T.let(
            :completed,
            Plaza::OptimizeCompletedResult::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Plaza::OptimizeCompletedResult::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::OptimizeCompletedResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE =
          T.let(:Feature, Plaza::OptimizeCompletedResult::Type::TaggedSymbol)

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
