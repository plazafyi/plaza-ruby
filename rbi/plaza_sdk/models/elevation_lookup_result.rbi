# typed: strong

module PlazaSDK
  module Models
    class ElevationLookupResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::ElevationLookupResult, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(PlazaSDK::ElevationLookupResult::Properties) }
      attr_reader :properties

      sig do
        params(
          properties: PlazaSDK::ElevationLookupResult::Properties::OrHash
        ).void
      end
      attr_writer :properties

      sig { returns(PlazaSDK::ElevationLookupResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON Point Feature with 3D coordinate [lng, lat, elevation] (RFC 7946 §3.1.1)
      sig do
        params(
          geometry: PlazaSDK::GeoJsonGeometry::OrHash,
          properties: PlazaSDK::ElevationLookupResult::Properties::OrHash,
          type: PlazaSDK::ElevationLookupResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(geometry:, properties:, type:)
      end

      sig do
        override.returns(
          {
            geometry: PlazaSDK::GeoJsonGeometry,
            properties: PlazaSDK::ElevationLookupResult::Properties,
            type: PlazaSDK::ElevationLookupResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < PlazaSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              PlazaSDK::ElevationLookupResult::Properties,
              PlazaSDK::Internal::AnyHash
            )
          end

        # Elevation in meters above mean sea level
        sig { returns(T.nilable(Float)) }
        attr_reader :elevation_m

        sig { params(elevation_m: Float).void }
        attr_writer :elevation_m

        sig { params(elevation_m: Float).returns(T.attached_class) }
        def self.new(
          # Elevation in meters above mean sea level
          elevation_m: nil
        )
        end

        sig { override.returns({ elevation_m: Float }) }
        def to_hash
        end
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::ElevationLookupResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE =
          T.let(:Feature, PlazaSDK::ElevationLookupResult::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::ElevationLookupResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
