# frozen_string_literal: true

module Plaza
  module Models
    class LineStringGeometry < Plaza::Internal::Type::BaseModel
      # @!attribute coordinates
      #   Array of [lng, lat] or [lng, lat, alt] positions
      #
      #   @return [Array<Array<Float>>]
      required :coordinates, Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::LineStringGeometry::Type]
      required :type, enum: -> { Plaza::LineStringGeometry::Type }

      # @!method initialize(coordinates:, type:)
      #   GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more
      #   positions.
      #
      #   @param coordinates [Array<Array<Float>>] Array of [lng, lat] or [lng, lat, alt] positions
      #
      #   @param type [Symbol, Plaza::Models::LineStringGeometry::Type]

      # @see Plaza::Models::LineStringGeometry#type
      module Type
        extend Plaza::Internal::Type::Enum

        LINE_STRING = :LineString

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
