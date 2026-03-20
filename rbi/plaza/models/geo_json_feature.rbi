# typed: strong

module Plaza
  module Models
    class GeoJsonFeature < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::GeoJsonFeature, Plaza::Internal::AnyHash) }

      # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
      # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      # OSM tags flattened as key-value pairs, plus `@type` (node/way/relation) and
      # `@id` (OSM ID) metadata fields. May include `distance_m` for proximity queries.
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :properties

      # Always `Feature`
      sig { returns(Plaza::GeoJsonFeature::Type::TaggedSymbol) }
      attr_accessor :type

      # Compound identifier in `type/osm_id` format
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # GeoJSON Feature representing an OSM element. Tags from the original OSM element
      # are flattened directly into `properties` (not nested under a `tags` key).
      # Metadata fields `@type` and `@id` identify the OSM element type and ID within
      # properties.
      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          properties: T::Hash[Symbol, T.anything],
          type: Plaza::GeoJsonFeature::Type::OrSymbol,
          id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
        # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
        geometry:,
        # OSM tags flattened as key-value pairs, plus `@type` (node/way/relation) and
        # `@id` (OSM ID) metadata fields. May include `distance_m` for proximity queries.
        properties:,
        # Always `Feature`
        type:,
        # Compound identifier in `type/osm_id` format
        id: nil
      )
      end

      sig do
        override.returns(
          {
            geometry: Plaza::GeoJsonGeometry,
            properties: T::Hash[Symbol, T.anything],
            type: Plaza::GeoJsonFeature::Type::TaggedSymbol,
            id: String
          }
        )
      end
      def to_hash
      end

      # Always `Feature`
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
