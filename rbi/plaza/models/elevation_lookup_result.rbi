# typed: strong

module Plaza
  module Models
    class ElevationLookupResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationLookupResult, Plaza::Internal::AnyHash)
        end

      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

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

      # GeoJSON Point Feature with 3D coordinate [lng, lat, elevation] (RFC 7946 §3.1.1)
      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          properties: Plaza::ElevationLookupResult::Properties::OrHash,
          type: Plaza::ElevationLookupResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(geometry:, properties:, type:)
      end

      sig do
        override.returns(
          {
            geometry: Plaza::GeoJsonGeometry,
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
