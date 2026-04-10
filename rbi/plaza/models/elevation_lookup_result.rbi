# typed: strong

module Plaza
  module Models
    class ElevationLookupResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationLookupResult, Plaza::Internal::AnyHash)
        end

      # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      # determines the coordinate structure.
      sig { returns(Plaza::Geometry::Variants) }
      attr_accessor :geometry

      sig { returns(Plaza::ElevationLookupResult::Properties) }
      attr_reader :properties

      sig do
        params(
          properties: Plaza::ElevationLookupResult::Properties::OrHash
        ).void
      end
      attr_writer :properties

      sig { returns(Plaza::ElevationLookupResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON Point Feature with a 3D coordinate [lng, lat, elevation] per RFC 7946
      # §3.1.1. The elevation is also available in `properties.elevation_m` for
      # convenience.
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
          properties: Plaza::ElevationLookupResult::Properties::OrHash,
          type: Plaza::ElevationLookupResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
        # determines the coordinate structure.
        geometry:,
        properties:,
        type:
      )
      end

      sig do
        override.returns(
          {
            geometry: Plaza::Geometry::Variants,
            properties: Plaza::ElevationLookupResult::Properties,
            type: Plaza::ElevationLookupResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Plaza::ElevationLookupResult::Properties,
              Plaza::Internal::AnyHash
            )
          end

        # Elevation in meters above mean sea level (WGS84 EGM96 geoid)
        sig { returns(Float) }
        attr_accessor :elevation_m

        sig { params(elevation_m: Float).returns(T.attached_class) }
        def self.new(
          # Elevation in meters above mean sea level (WGS84 EGM96 geoid)
          elevation_m:
        )
        end

        sig { override.returns({ elevation_m: Float }) }
        def to_hash
        end
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::ElevationLookupResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE =
          T.let(:Feature, Plaza::ElevationLookupResult::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::ElevationLookupResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
