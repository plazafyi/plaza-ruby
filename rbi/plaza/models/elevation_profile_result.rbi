# typed: strong

module Plaza
  module Models
    class ElevationProfileResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationProfileResult, Plaza::Internal::AnyHash)
        end

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig { returns(Plaza::Geometry::Variants) }
      attr_accessor :geometry

      # Elevation profile summary statistics
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

      # GeoJSON LineString Feature with 3D coordinates [lng, lat, elevation]
      # representing the elevation profile along the input path. Summary statistics are
      # in properties.
      sig do
        params(
          geometry:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::LineStringGeometry::OrHash,
              Plaza::PolygonGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash,
              Plaza::MultiLineStringGeometry::OrHash,
              Plaza::MultiPolygonGeometry::OrHash
            ),
          properties: Plaza::ElevationProfileResult::Properties::OrHash,
          type: Plaza::ElevationProfileResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        geometry:,
        # Elevation profile summary statistics
        properties:,
        type:
      )
      end

      sig do
        override.returns(
          {
            geometry: Plaza::Geometry::Variants,
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

        # Average elevation along the profile in meters
        sig { returns(Float) }
        attr_accessor :avg_elevation_m

        # Maximum elevation along the profile in meters
        sig { returns(Float) }
        attr_accessor :max_elevation_m

        # Minimum elevation along the profile in meters
        sig { returns(Float) }
        attr_accessor :min_elevation_m

        # Total cumulative elevation gain in meters
        sig { returns(Float) }
        attr_accessor :total_ascent_m

        # Total cumulative elevation loss in meters
        sig { returns(Float) }
        attr_accessor :total_descent_m

        # Elevation profile summary statistics
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
          # Average elevation along the profile in meters
          avg_elevation_m:,
          # Maximum elevation along the profile in meters
          max_elevation_m:,
          # Minimum elevation along the profile in meters
          min_elevation_m:,
          # Total cumulative elevation gain in meters
          total_ascent_m:,
          # Total cumulative elevation loss in meters
          total_descent_m:
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
