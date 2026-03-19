# typed: strong

module PlazaSDK
  module Models
    class OptimizeCompletedResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::OptimizeCompletedResult, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(PlazaSDK::OptimizeCompletedResult::Properties) }
      attr_reader :properties

      sig do
        params(
          properties: PlazaSDK::OptimizeCompletedResult::Properties::OrHash
        ).void
      end
      attr_writer :properties

      # Job status
      sig { returns(PlazaSDK::OptimizeCompletedResult::Status::TaggedSymbol) }
      attr_accessor :status

      sig { returns(PlazaSDK::OptimizeCompletedResult::Type::TaggedSymbol) }
      attr_accessor :type

      # Completed optimization — GeoJSON Feature with optimized route
      sig do
        params(
          geometry: PlazaSDK::GeoJsonGeometry::OrHash,
          properties: PlazaSDK::OptimizeCompletedResult::Properties::OrHash,
          status: PlazaSDK::OptimizeCompletedResult::Status::OrSymbol,
          type: PlazaSDK::OptimizeCompletedResult::Type::OrSymbol
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
            geometry: PlazaSDK::GeoJsonGeometry,
            properties: PlazaSDK::OptimizeCompletedResult::Properties,
            status: PlazaSDK::OptimizeCompletedResult::Status::TaggedSymbol,
            type: PlazaSDK::OptimizeCompletedResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < PlazaSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              PlazaSDK::OptimizeCompletedResult::Properties,
              PlazaSDK::Internal::AnyHash
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
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, PlazaSDK::OptimizeCompletedResult::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        COMPLETED =
          T.let(
            :completed,
            PlazaSDK::OptimizeCompletedResult::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[PlazaSDK::OptimizeCompletedResult::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, PlazaSDK::OptimizeCompletedResult::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE =
          T.let(:Feature, PlazaSDK::OptimizeCompletedResult::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::OptimizeCompletedResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
