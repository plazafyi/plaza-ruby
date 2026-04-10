# frozen_string_literal: true

module Plaza
  module Models
    class OptimizeRequest < Plaza::Internal::Type::BaseModel
      # @!attribute waypoints
      #   GeoJSON MultiPoint geometry per RFC 7946. An array of positions.
      #
      #   @return [Plaza::Models::MultiPointGeometry]
      required :waypoints, -> { Plaza::MultiPointGeometry }

      # @!attribute mode
      #   Travel mode (default: `auto`)
      #
      #   @return [Symbol, Plaza::Models::OptimizeRequest::Mode, nil]
      optional :mode, enum: -> { Plaza::OptimizeRequest::Mode }

      # @!attribute roundtrip
      #   Whether the route should return to the starting waypoint (default: true)
      #
      #   @return [Boolean, nil]
      optional :roundtrip, Plaza::Internal::Type::Boolean

      # @!method initialize(waypoints:, mode: nil, roundtrip: nil)
      #   Route optimization (Travelling Salesman) request. Finds the most efficient order
      #   to visit a set of waypoints. Minimum 2 waypoints, maximum 50. For large inputs,
      #   the request may be processed asynchronously.
      #
      #   @param waypoints [Plaza::Models::MultiPointGeometry] GeoJSON MultiPoint geometry per RFC 7946. An array of positions.
      #
      #   @param mode [Symbol, Plaza::Models::OptimizeRequest::Mode] Travel mode (default: `auto`)
      #
      #   @param roundtrip [Boolean] Whether the route should return to the starting waypoint (default: true)

      # Travel mode (default: `auto`)
      #
      # @see Plaza::Models::OptimizeRequest#mode
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
