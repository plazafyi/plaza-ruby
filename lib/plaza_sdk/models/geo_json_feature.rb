# frozen_string_literal: true

module PlazaSDK
  module Models
    class GeoJsonFeature < PlazaSDK::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :geometry, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [Hash{Symbol=>Object}]
      required :properties, PlazaSDK::Internal::Type::HashOf[PlazaSDK::Internal::Type::Unknown]

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::GeoJsonFeature::Type]
      required :type, enum: -> { PlazaSDK::GeoJsonFeature::Type }

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
      #   @param geometry [PlazaSDK::Models::GeoJsonGeometry]
      #
      #   @param properties [Hash{Symbol=>Object}]
      #
      #   @param type [Symbol, PlazaSDK::Models::GeoJsonFeature::Type]
      #
      #   @param id [String] Feature identifier (type/osm_id)
      #
      #   @param osm_id [Integer] OpenStreetMap ID

      # @see PlazaSDK::Models::GeoJsonFeature#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
