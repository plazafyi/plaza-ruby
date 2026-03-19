# typed: strong

module PlazaSDK
  module Models
    class ElevationProfileResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::ElevationProfileResult, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(PlazaSDK::ElevationProfileResult::Properties) }
      attr_reader :properties

      sig do
        params(
          properties: PlazaSDK::ElevationProfileResult::Properties::OrHash
        ).void
      end
      attr_writer :properties

      sig { returns(PlazaSDK::ElevationProfileResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON LineString Feature with 3D coordinates representing an elevation profile
      sig do
        params(
          geometry: PlazaSDK::GeoJsonGeometry::OrHash,
          properties: PlazaSDK::ElevationProfileResult::Properties::OrHash,
          type: PlazaSDK::ElevationProfileResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(geometry:, properties:, type:)
      end

      sig do
        override.returns(
          {
            geometry: PlazaSDK::GeoJsonGeometry,
            properties: PlazaSDK::ElevationProfileResult::Properties,
            type: PlazaSDK::ElevationProfileResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < PlazaSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              PlazaSDK::ElevationProfileResult::Properties,
              PlazaSDK::Internal::AnyHash
            )
          end

        # Average elevation along profile
        sig { returns(T.nilable(Float)) }
        attr_reader :avg_elevation_m

        sig { params(avg_elevation_m: Float).void }
        attr_writer :avg_elevation_m

        # Maximum elevation along profile
        sig { returns(T.nilable(Float)) }
        attr_reader :max_elevation_m

        sig { params(max_elevation_m: Float).void }
        attr_writer :max_elevation_m

        # Minimum elevation along profile
        sig { returns(T.nilable(Float)) }
        attr_reader :min_elevation_m

        sig { params(min_elevation_m: Float).void }
        attr_writer :min_elevation_m

        # Total elevation gain in meters
        sig { returns(T.nilable(Float)) }
        attr_reader :total_ascent_m

        sig { params(total_ascent_m: Float).void }
        attr_writer :total_ascent_m

        # Total elevation loss in meters
        sig { returns(T.nilable(Float)) }
        attr_reader :total_descent_m

        sig { params(total_descent_m: Float).void }
        attr_writer :total_descent_m

        sig do
          params(
            avg_elevation_m: Float,
            max_elevation_m: Float,
            min_elevation_m: Float,
            total_ascent_m: Float,
            total_descent_m: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Average elevation along profile
          avg_elevation_m: nil,
          # Maximum elevation along profile
          max_elevation_m: nil,
          # Minimum elevation along profile
          min_elevation_m: nil,
          # Total elevation gain in meters
          total_ascent_m: nil,
          # Total elevation loss in meters
          total_descent_m: nil
        )
        end

        sig do
          override.returns(
            {
              avg_elevation_m: Float,
              max_elevation_m: Float,
              min_elevation_m: Float,
              total_ascent_m: Float,
              total_descent_m: Float
            }
          )
        end
        def to_hash
        end
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::ElevationProfileResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE =
          T.let(:Feature, PlazaSDK::ElevationProfileResult::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::ElevationProfileResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
