# frozen_string_literal: true

module Plaza
  module Models
    class GeoJsonFeature < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :geometry, -> { Plaza::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [Hash{Symbol=>Object}]
      required :properties, Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::GeoJsonFeature::Type]
      required :type, enum: -> { Plaza::GeoJsonFeature::Type }

      # @!attribute id
      #   Feature identifier (type/osm_id)
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute osm_id
      #   OpenStreetMap ID
      #
      #   @return [Integer, nil]
      optional :osm_id, Integer

      # @!method initialize(geometry:, properties:, type:, id: nil, osm_id: nil)
      #   @param geometry [Plaza::Models::GeoJsonGeometry]
      #
      #   @param properties [Hash{Symbol=>Object}]
      #
      #   @param type [Symbol, Plaza::Models::GeoJsonFeature::Type]
      #
      #   @param id [String] Feature identifier (type/osm_id)
      #
      #   @param osm_id [Integer] OpenStreetMap ID

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
