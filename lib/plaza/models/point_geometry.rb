# frozen_string_literal: true

module Plaza
  module Models
    class PointGeometry < Plaza::Internal::Type::BaseModel
      # @!attribute coordinates
      #   [longitude, latitude] or [longitude, latitude, altitude]
      #
      #   @return [Array<Float>]
      required :coordinates, Plaza::Internal::Type::ArrayOf[Float]

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::PointGeometry::Type]
      required :type, enum: -> { Plaza::PointGeometry::Type }

      # @!method initialize(coordinates:, type:)
      #   GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
      #   order. Optional third element is altitude in meters.
      #
      #   @param coordinates [Array<Float>] [longitude, latitude] or [longitude, latitude, altitude]
      #
      #   @param type [Symbol, Plaza::Models::PointGeometry::Type]

      # @see Plaza::Models::PointGeometry#type
      module Type
        extend Plaza::Internal::Type::Enum

        POINT = :Point

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
