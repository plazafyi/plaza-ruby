# frozen_string_literal: true

module Plaza
  module Models
    class PolygonGeometry < Plaza::Internal::Type::BaseModel
      # @!attribute coordinates
      #   Array of linear rings (first = exterior, rest = holes)
      #
      #   @return [Array<Array<Array<Float>>>]
      required :coordinates,
               Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]]

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::PolygonGeometry::Type]
      required :type, enum: -> { Plaza::PolygonGeometry::Type }

      # @!method initialize(coordinates:, type:)
      #   GeoJSON Polygon geometry per RFC 7946. An array of linear rings where the first
      #   ring is the exterior boundary and subsequent rings are holes. Each ring must
      #   have at least 4 positions with the first and last being identical.
      #
      #   @param coordinates [Array<Array<Array<Float>>>] Array of linear rings (first = exterior, rest = holes)
      #
      #   @param type [Symbol, Plaza::Models::PolygonGeometry::Type]

      # @see Plaza::Models::PolygonGeometry#type
      module Type
        extend Plaza::Internal::Type::Enum

        POLYGON = :Polygon

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
