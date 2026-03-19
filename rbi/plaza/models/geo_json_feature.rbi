# typed: strong

module Plaza
  module Models
    class GeoJsonFeature < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::GeoJsonFeature, Plaza::Internal::AnyHash) }

      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :properties

      sig { returns(Plaza::GeoJsonFeature::Type::TaggedSymbol) }
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
          geometry: Plaza::GeoJsonGeometry::OrHash,
          properties: T::Hash[Symbol, T.anything],
          type: Plaza::GeoJsonFeature::Type::OrSymbol,
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
            geometry: Plaza::GeoJsonGeometry,
            properties: T::Hash[Symbol, T.anything],
            type: Plaza::GeoJsonFeature::Type::TaggedSymbol,
            id: String,
            osm_id: Integer
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::GeoJsonFeature::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE = T.let(:Feature, Plaza::GeoJsonFeature::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::GeoJsonFeature::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
