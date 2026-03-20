# frozen_string_literal: true

module Plaza
  module Models
    class OptimizeRequest < Plaza::Internal::Type::BaseModel
      # @!attribute waypoints
      #   Waypoints to visit in optimized order (2-50 points)
      #
      #   @return [Array<Plaza::Models::OptimizeRequest::Waypoint>]
      required :waypoints, -> { Plaza::Internal::Type::ArrayOf[Plaza::OptimizeRequest::Waypoint] }

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
      #   @param waypoints [Array<Plaza::Models::OptimizeRequest::Waypoint>] Waypoints to visit in optimized order (2-50 points)
      #
      #   @param mode [Symbol, Plaza::Models::OptimizeRequest::Mode] Travel mode (default: `auto`)
      #
      #   @param roundtrip [Boolean] Whether the route should return to the starting waypoint (default: true)

      class Waypoint < Plaza::Internal::Type::BaseModel
        # @!attribute lat
        #   Latitude in decimal degrees (-90 to 90)
        #
        #   @return [Float]
        required :lat, Float

        # @!attribute lng
        #   Longitude in decimal degrees (-180 to 180)
        #
        #   @return [Float]
        required :lng, Float

        # @!method initialize(lat:, lng:)
        #   Geographic coordinate as a JSON object with `lat` and `lng` fields.
        #
        #   @param lat [Float] Latitude in decimal degrees (-90 to 90)
        #
        #   @param lng [Float] Longitude in decimal degrees (-180 to 180)
      end

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
