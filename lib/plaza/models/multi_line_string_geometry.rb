# frozen_string_literal: true

module Plaza
  module Models
    class MultiLineStringGeometry < Plaza::Internal::Type::BaseModel
      # @!attribute coordinates
      #   Array of LineString coordinate arrays
      #
      #   @return [Array<Array<Array<Float>>>]
      required :coordinates,
               Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]]

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::MultiLineStringGeometry::Type]
      required :type, enum: -> { Plaza::MultiLineStringGeometry::Type }

      # @!method initialize(coordinates:, type:)
      #   GeoJSON MultiLineString geometry per RFC 7946. An array of LineString coordinate
      #   arrays.
      #
      #   @param coordinates [Array<Array<Array<Float>>>] Array of LineString coordinate arrays
      #
      #   @param type [Symbol, Plaza::Models::MultiLineStringGeometry::Type]

      # @see Plaza::Models::MultiLineStringGeometry#type
      module Type
        extend Plaza::Internal::Type::Enum

        MULTI_LINE_STRING = :MultiLineString

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
