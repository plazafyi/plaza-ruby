# frozen_string_literal: true

module Plaza
  module Models
    class GeoJsonGeometry < Plaza::Internal::Type::BaseModel
      # @!attribute coordinates
      #   Coordinates array. Nesting depth varies by geometry type: Point = [lng, lat],
      #   LineString = [[lng, lat], ...], Polygon = [[[lng, lat], ...], ...], etc.
      #
      #   @return [Array<Float>, Array<Array<Float>>, Array<Array<Array<Float>>>, Array<Array<Array<Array<Float>>>>]
      required :coordinates, union: -> { Plaza::GeoJsonGeometry::Coordinates }

      # @!attribute type
      #   Geometry type
      #
      #   @return [Symbol, Plaza::Models::GeoJsonGeometry::Type]
      required :type, enum: -> { Plaza::GeoJsonGeometry::Type }

      # @!method initialize(coordinates:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::GeoJsonGeometry} for more details.
      #
      #   GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
      #   order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
      #
      #   @param coordinates [Array<Float>, Array<Array<Float>>, Array<Array<Array<Float>>>, Array<Array<Array<Array<Float>>>>] Coordinates array. Nesting depth varies by geometry type: Point = [lng, lat], Li
      #
      #   @param type [Symbol, Plaza::Models::GeoJsonGeometry::Type] Geometry type

      # Coordinates array. Nesting depth varies by geometry type: Point = [lng, lat],
      # LineString = [[lng, lat], ...], Polygon = [[[lng, lat], ...], ...], etc.
      #
      # @see Plaza::Models::GeoJsonGeometry#coordinates
      module Coordinates
        extend Plaza::Internal::Type::Union

        # [longitude, latitude] or [longitude, latitude, elevation]
        variant -> { Plaza::Models::GeoJsonGeometry::Coordinates::FloatArray }

        # Array of [lng, lat] positions
        variant -> { Plaza::Models::GeoJsonGeometry::Coordinates::LineStringOrMultiPointArray }

        # Array of linear rings / line strings
        variant -> { Plaza::Models::GeoJsonGeometry::Coordinates::PolygonOrMultiLineStringArray }

        # Array of polygons
        variant -> { Plaza::Models::GeoJsonGeometry::Coordinates::MultiPolygonArray }

        # @!method self.variants
        #   @return [Array(Array<Float>, Array<Array<Float>>, Array<Array<Array<Float>>>, Array<Array<Array<Array<Float>>>>)]

        # @type [Plaza::Internal::Type::Converter]
        FloatArray = Plaza::Internal::Type::ArrayOf[Float]

        # @type [Plaza::Internal::Type::Converter]
        LineStringOrMultiPointArray = Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]

        # @type [Plaza::Internal::Type::Converter]
        PolygonOrMultiLineStringArray =
          Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]]

        # @type [Plaza::Internal::Type::Converter]
        MultiPolygonArray =
          Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]]]
      end

      # Geometry type
      #
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
