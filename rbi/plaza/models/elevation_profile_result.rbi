# typed: strong

module Plaza
  module Models
    class ElevationProfileResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationProfileResult, Plaza::Internal::AnyHash)
        end

      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(Plaza::ElevationProfileResult::Properties) }
      attr_reader :properties

      sig do
        params(
          properties: Plaza::ElevationProfileResult::Properties::OrHash
        ).void
      end
      attr_writer :properties

      sig { returns(Plaza::ElevationProfileResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON LineString Feature with 3D coordinates representing an elevation profile
      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          properties: Plaza::ElevationProfileResult::Properties::OrHash,
          type: Plaza::ElevationProfileResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(geometry:, properties:, type:)
      end

      sig do
        override.returns(
          {
            geometry: Plaza::GeoJsonGeometry,
            properties: Plaza::ElevationProfileResult::Properties,
            type: Plaza::ElevationProfileResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Plaza::ElevationProfileResult::Properties,
              Plaza::Internal::AnyHash
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
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::ElevationProfileResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE =
          T.let(:Feature, Plaza::ElevationProfileResult::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::ElevationProfileResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
