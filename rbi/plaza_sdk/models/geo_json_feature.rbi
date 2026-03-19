# typed: strong

module PlazaSDK
  module Models
    class GeoJsonFeature < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::GeoJsonFeature, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :properties

      sig { returns(PlazaSDK::GeoJsonFeature::Type::TaggedSymbol) }
      attr_accessor :type

      # Feature identifier (type/osm_id)
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # OpenStreetMap ID
      sig { returns(T.nilable(Integer)) }
      attr_reader :osm_id

      sig { params(osm_id: Integer).void }
      attr_writer :osm_id

      sig do
        params(
          geometry: PlazaSDK::GeoJsonGeometry::OrHash,
          properties: T::Hash[Symbol, T.anything],
          type: PlazaSDK::GeoJsonFeature::Type::OrSymbol,
          id: String,
          osm_id: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        geometry:,
        properties:,
        type:,
        # Feature identifier (type/osm_id)
        id: nil,
        # OpenStreetMap ID
        osm_id: nil
      )
      end

      sig do
        override.returns(
          {
            geometry: PlazaSDK::GeoJsonGeometry,
            properties: T::Hash[Symbol, T.anything],
            type: PlazaSDK::GeoJsonFeature::Type::TaggedSymbol,
            id: String,
            osm_id: Integer
          }
        )
      end
      def to_hash
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::GeoJsonFeature::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE = T.let(:Feature, PlazaSDK::GeoJsonFeature::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::GeoJsonFeature::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
