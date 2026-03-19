# frozen_string_literal: true

module PlazaSDK
  module Models
    class GeoJsonGeometry < PlazaSDK::Internal::Type::BaseModel
      # @!attribute coordinates
      #   GeoJSON coordinates array (nesting depth varies by geometry type)
      #
      #   @return [Array<Float>, Array<Array<Float>>, Array<Array<Array<Float>>>, Array<Array<Array<Array<Float>>>>]
      required :coordinates, union: -> { PlazaSDK::GeoJsonGeometry::Coordinates }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::GeoJsonGeometry::Type]
      required :type, enum: -> { PlazaSDK::GeoJsonGeometry::Type }

      # @!method initialize(coordinates:, type:)
      #   @param coordinates [Array<Float>, Array<Array<Float>>, Array<Array<Array<Float>>>, Array<Array<Array<Array<Float>>>>] GeoJSON coordinates array (nesting depth varies by geometry type)
      #
      #   @param type [Symbol, PlazaSDK::Models::GeoJsonGeometry::Type]

      # GeoJSON coordinates array (nesting depth varies by geometry type)
      #
      # @see PlazaSDK::Models::GeoJsonGeometry#coordinates
      module Coordinates
        extend PlazaSDK::Internal::Type::Union

        variant -> { PlazaSDK::Models::GeoJsonGeometry::Coordinates::FloatArray }

        variant -> { PlazaSDK::Models::GeoJsonGeometry::Coordinates::UnionMember1Array }

        variant -> { PlazaSDK::Models::GeoJsonGeometry::Coordinates::UnionMember2Array }

        variant -> { PlazaSDK::Models::GeoJsonGeometry::Coordinates::UnionMember3Array }

        # @!method self.variants
        #   @return [Array(Array<Float>, Array<Array<Float>>, Array<Array<Array<Float>>>, Array<Array<Array<Array<Float>>>>)]

        # @type [PlazaSDK::Internal::Type::Converter]
        FloatArray = PlazaSDK::Internal::Type::ArrayOf[Float]

        # @type [PlazaSDK::Internal::Type::Converter]
        UnionMember1Array = PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::ArrayOf[Float]]

        # @type [PlazaSDK::Internal::Type::Converter]
        UnionMember2Array =
          PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::ArrayOf[Float]]]

        # @type [PlazaSDK::Internal::Type::Converter]
        UnionMember3Array =
          PlazaSDK::Internal::Type::ArrayOf[
            PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::ArrayOf[Float]]]
          ]
      end

      # @see PlazaSDK::Models::GeoJsonGeometry#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        POINT = :Point
        LINE_STRING = :LineString
        POLYGON = :Polygon
        MULTI_POINT = :MultiPoint
        MULTI_LINE_STRING = :MultiLineString
        MULTI_POLYGON = :MultiPolygon

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
