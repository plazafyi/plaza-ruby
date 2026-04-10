# frozen_string_literal: true

module Plaza
  module Models
    class MultiPointGeometry < Plaza::Internal::Type::BaseModel
      # @!attribute coordinates
      #   Array of [lng, lat] or [lng, lat, alt] positions
      #
      #   @return [Array<Array<Float>>]
      required :coordinates, Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]]

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::MultiPointGeometry::Type]
      required :type, enum: -> { Plaza::MultiPointGeometry::Type }

      # @!method initialize(coordinates:, type:)
      #   GeoJSON MultiPoint geometry per RFC 7946. An array of positions.
      #
      #   @param coordinates [Array<Array<Float>>] Array of [lng, lat] or [lng, lat, alt] positions
      #
      #   @param type [Symbol, Plaza::Models::MultiPointGeometry::Type]

      # @see Plaza::Models::MultiPointGeometry#type
      module Type
        extend Plaza::Internal::Type::Enum

        MULTI_POINT = :MultiPoint

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
