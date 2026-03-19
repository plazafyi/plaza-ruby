# frozen_string_literal: true

module Plaza
  module Models
    class GeoJsonGeometry < Plaza::Internal::Type::BaseModel
      # @!attribute coordinates
      #   GeoJSON coordinates array (nesting depth varies by geometry type)
      #
      #   @return [Array<Float>, Array<Array<Float>>, Array<Array<Array<Float>>>, Array<Array<Array<Array<Float>>>>]
      required :coordinates, union: -> { Plaza::GeoJsonGeometry::Coordinates }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::GeoJsonGeometry::Type]
      required :type, enum: -> { Plaza::GeoJsonGeometry::Type }

      # @!method initialize(coordinates:, type:)
      #   @param coordinates [Array<Float>, Array<Array<Float>>, Array<Array<Array<Float>>>, Array<Array<Array<Array<Float>>>>] GeoJSON coordinates array (nesting depth varies by geometry type)
      #
      #   @param type [Symbol, Plaza::Models::GeoJsonGeometry::Type]

      # GeoJSON coordinates array (nesting depth varies by geometry type)
      #
      # @see Plaza::Models::GeoJsonGeometry#coordinates
      module Coordinates
        extend Plaza::Internal::Type::Union

        variant -> { Plaza::Models::GeoJsonGeometry::Coordinates::FloatArray }

        variant -> { Plaza::Models::GeoJsonGeometry::Coordinates::UnionMember1Array }

        variant -> { Plaza::Models::GeoJsonGeometry::Coordinates::UnionMember2Array }

        variant -> { Plaza::Models::GeoJsonGeometry::Coordinates::UnionMember3Array }

        # @!method self.variants
        #   @return [Array(Array<Float>, Array<Array<Float>>, Array<Array<Array<Float>>>, Array<Array<Array<Array<Float>>>>)]

        # @type [Plaza::Internal::Type::Converter]
        FloatArray = Plaza::Internal::Type::ArrayOf[Float]

        # @type [Plaza::Internal::Type::Converter]
        UnionMember1Array = Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]

        # @type [Plaza::Internal::Type::Converter]
        UnionMember2Array =
          Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]]

        # @type [Plaza::Internal::Type::Converter]
        UnionMember3Array =
          Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]]]
      end

      # @see Plaza::Models::GeoJsonGeometry#type
      module Type
        extend Plaza::Internal::Type::Enum

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
