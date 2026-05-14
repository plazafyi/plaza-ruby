# frozen_string_literal: true

module Plaza
  module Models
    class MultiPolygonGeometry < Plaza::Internal::Type::BaseModel
      # @!attribute coordinates
      #   Array of Polygon coordinate arrays
      #
      #   @return [Array<Array<Array<Array<Float>>>>]
      required :coordinates,
               Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]]]

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::MultiPolygonGeometry::Type]
      required :type, enum: -> { Plaza::MultiPolygonGeometry::Type }

      # @!method initialize(coordinates:, type:)
      #   GeoJSON MultiPolygon geometry per RFC 7946. An array of Polygon coordinate
      #   arrays.
      #
      #   @param coordinates [Array<Array<Array<Array<Float>>>>] Array of Polygon coordinate arrays
      #
      #   @param type [Symbol, Plaza::Models::MultiPolygonGeometry::Type]

      # @see Plaza::Models::MultiPolygonGeometry#type
      module Type
        extend Plaza::Internal::Type::Enum

        MULTI_POLYGON = :MultiPolygon

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
