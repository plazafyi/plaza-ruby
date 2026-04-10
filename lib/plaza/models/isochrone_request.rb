# frozen_string_literal: true

module Plaza
  module Models
    class IsochroneRequest < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
      #   order. Optional third element is altitude in meters.
      #
      #   @return [Plaza::Models::PointGeometry]
      required :geometry, -> { Plaza::PointGeometry }

      # @!attribute time
      #   Travel time budgets in seconds. Each value produces one contour polygon.
      #
      #   @return [Array<Integer>]
      required :time, Plaza::Internal::Type::ArrayOf[Integer]

      # @!attribute mode
      #   Travel mode (default: `auto`)
      #
      #   @return [Symbol, Plaza::Models::IsochroneRequest::Mode, nil]
      optional :mode, enum: -> { Plaza::IsochroneRequest::Mode }

      # @!method initialize(geometry:, time:, mode: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::IsochroneRequest} for more details.
      #
      #   Request body for isochrone calculation. Computes areas reachable from a point
      #   within the given travel time(s).
      #
      #   @param geometry [Plaza::Models::PointGeometry] GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude] order
      #
      #   @param time [Array<Integer>] Travel time budgets in seconds. Each value produces one contour polygon.
      #
      #   @param mode [Symbol, Plaza::Models::IsochroneRequest::Mode] Travel mode (default: `auto`)

      # Travel mode (default: `auto`)
      #
      # @see Plaza::Models::IsochroneRequest#mode
      module Mode
        extend Plaza::Internal::Type::Enum

        AUTO = :auto
        FOOT = :foot
        BICYCLE = :bicycle

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
