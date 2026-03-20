# frozen_string_literal: true

module Plaza
  module Models
    class GeoJsonFeature < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
      #   order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :geometry, -> { Plaza::GeoJsonGeometry }

      # @!attribute properties
      #   OSM tags flattened as key-value pairs, plus `@type` (node/way/relation) and
      #   `@id` (OSM ID) metadata fields. May include `distance_m` for proximity queries.
      #
      #   @return [Hash{Symbol=>Object}]
      required :properties, Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]

      # @!attribute type
      #   Always `Feature`
      #
      #   @return [Symbol, Plaza::Models::GeoJsonFeature::Type]
      required :type, enum: -> { Plaza::GeoJsonFeature::Type }

      # @!attribute id
      #   Compound identifier in `type/osm_id` format
      #
      #   @return [String, nil]
      optional :id, String

      # @!method initialize(geometry:, properties:, type:, id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::GeoJsonFeature} for more details.
      #
      #   GeoJSON Feature representing an OSM element. Tags from the original OSM element
      #   are flattened directly into `properties` (not nested under a `tags` key).
      #   Metadata fields `@type` and `@id` identify the OSM element type and ID within
      #   properties.
      #
      #   @param geometry [Plaza::Models::GeoJsonGeometry] GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude] orde
      #
      #   @param properties [Hash{Symbol=>Object}] OSM tags flattened as key-value pairs, plus `@type` (node/way/relation) and `@id
      #
      #   @param type [Symbol, Plaza::Models::GeoJsonFeature::Type] Always `Feature`
      #
      #   @param id [String] Compound identifier in `type/osm_id` format

      # Always `Feature`
      #
      # @see Plaza::Models::GeoJsonFeature#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
