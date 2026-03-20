# frozen_string_literal: true

module Plaza
  module Models
    class RouteRequest < Plaza::Internal::Type::BaseModel
      # @!attribute destination
      #   Geographic coordinate as a JSON object with `lat` and `lng` fields.
      #
      #   @return [Plaza::Models::RouteRequest::Destination]
      required :destination, -> { Plaza::RouteRequest::Destination }

      # @!attribute origin
      #   Geographic coordinate as a JSON object with `lat` and `lng` fields.
      #
      #   @return [Plaza::Models::RouteRequest::Origin]
      required :origin, -> { Plaza::RouteRequest::Origin }

      # @!attribute alternatives
      #   Number of alternative routes to return (0-3, default 0). When > 0, response is a
      #   FeatureCollection of route Features.
      #
      #   @return [Integer, nil]
      optional :alternatives, Integer

      # @!attribute annotations
      #   Include per-edge annotations (speed, duration) on the route (default: false)
      #
      #   @return [Boolean, nil]
      optional :annotations, Plaza::Internal::Type::Boolean

      # @!attribute depart_at
      #   Departure time for traffic-aware routing (ISO 8601)
      #
      #   @return [Time, nil]
      optional :depart_at, Time, nil?: true

      # @!attribute ev
      #   Electric vehicle parameters for EV-aware routing
      #
      #   @return [Plaza::Models::RouteRequest::Ev, nil]
      optional :ev, -> { Plaza::RouteRequest::Ev }, nil?: true

      # @!attribute exclude
      #   Comma-separated road types to exclude (e.g. `toll,motorway,ferry`)
      #
      #   @return [String, nil]
      optional :exclude, String, nil?: true

      # @!attribute geometries
      #   Geometry encoding format. Default: `geojson`.
      #
      #   @return [Symbol, Plaza::Models::RouteRequest::Geometries, nil]
      optional :geometries, enum: -> { Plaza::RouteRequest::Geometries }

      # @!attribute mode
      #   Travel mode (default: `auto`)
      #
      #   @return [Symbol, Plaza::Models::RouteRequest::Mode, nil]
      optional :mode, enum: -> { Plaza::RouteRequest::Mode }

      # @!attribute overview
      #   Level of geometry detail: `full` (all points), `simplified` (Douglas-Peucker),
      #   `false` (no geometry). Default: `full`.
      #
      #   @return [Symbol, Plaza::Models::RouteRequest::Overview, nil]
      optional :overview, enum: -> { Plaza::RouteRequest::Overview }

      # @!attribute steps
      #   Include turn-by-turn navigation steps (default: false)
      #
      #   @return [Boolean, nil]
      optional :steps, Plaza::Internal::Type::Boolean

      # @!attribute traffic_model
      #   Traffic prediction model (only used when `depart_at` is set)
      #
      #   @return [Symbol, Plaza::Models::RouteRequest::TrafficModel, nil]
      optional :traffic_model, enum: -> { Plaza::RouteRequest::TrafficModel }, nil?: true

      # @!attribute waypoints
      #   Intermediate waypoints to visit in order (maximum 25)
      #
      #   @return [Array<Plaza::Models::RouteRequest::Waypoint>, nil]
      optional :waypoints, -> { Plaza::Internal::Type::ArrayOf[Plaza::RouteRequest::Waypoint] }, nil?: true

      # @!method initialize(destination:, origin:, alternatives: nil, annotations: nil, depart_at: nil, ev: nil, exclude: nil, geometries: nil, mode: nil, overview: nil, steps: nil, traffic_model: nil, waypoints: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::RouteRequest} for more details.
      #
      #   Request body for route calculation. Origin and destination are lat/lng
      #   coordinate objects. Supports optional waypoints, alternative routes,
      #   turn-by-turn steps, and EV routing parameters.
      #
      #   @param destination [Plaza::Models::RouteRequest::Destination] Geographic coordinate as a JSON object with `lat` and `lng` fields.
      #
      #   @param origin [Plaza::Models::RouteRequest::Origin] Geographic coordinate as a JSON object with `lat` and `lng` fields.
      #
      #   @param alternatives [Integer] Number of alternative routes to return (0-3, default 0). When > 0, response is a
      #
      #   @param annotations [Boolean] Include per-edge annotations (speed, duration) on the route (default: false)
      #
      #   @param depart_at [Time, nil] Departure time for traffic-aware routing (ISO 8601)
      #
      #   @param ev [Plaza::Models::RouteRequest::Ev, nil] Electric vehicle parameters for EV-aware routing
      #
      #   @param exclude [String, nil] Comma-separated road types to exclude (e.g. `toll,motorway,ferry`)
      #
      #   @param geometries [Symbol, Plaza::Models::RouteRequest::Geometries] Geometry encoding format. Default: `geojson`.
      #
      #   @param mode [Symbol, Plaza::Models::RouteRequest::Mode] Travel mode (default: `auto`)
      #
      #   @param overview [Symbol, Plaza::Models::RouteRequest::Overview] Level of geometry detail: `full` (all points), `simplified` (Douglas-Peucker), `
      #
      #   @param steps [Boolean] Include turn-by-turn navigation steps (default: false)
      #
      #   @param traffic_model [Symbol, Plaza::Models::RouteRequest::TrafficModel, nil] Traffic prediction model (only used when `depart_at` is set)
      #
      #   @param waypoints [Array<Plaza::Models::RouteRequest::Waypoint>, nil] Intermediate waypoints to visit in order (maximum 25)

      # @see Plaza::Models::RouteRequest#destination
      class Destination < Plaza::Internal::Type::BaseModel
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

      # @see Plaza::Models::RouteRequest#origin
      class Origin < Plaza::Internal::Type::BaseModel
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

      # @see Plaza::Models::RouteRequest#ev
      class Ev < Plaza::Internal::Type::BaseModel
        # @!attribute battery_capacity_wh
        #   Total battery capacity in watt-hours (required for EV routing)
        #
        #   @return [Float]
        required :battery_capacity_wh, Float

        # @!attribute connector_types
        #   Acceptable connector types (e.g. `["ccs", "chademo"]`)
        #
        #   @return [Array<String>, nil]
        optional :connector_types, Plaza::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute initial_charge_pct
        #   Starting charge as a fraction 0-1 (default: 0.8)
        #
        #   @return [Float, nil]
        optional :initial_charge_pct, Float

        # @!attribute min_charge_pct
        #   Minimum acceptable charge at destination as a fraction 0-1 (default: 0.10)
        #
        #   @return [Float, nil]
        optional :min_charge_pct, Float

        # @!attribute min_power_kw
        #   Minimum charger power in kilowatts
        #
        #   @return [Float, nil]
        optional :min_power_kw, Float, nil?: true

        # @!method initialize(battery_capacity_wh:, connector_types: nil, initial_charge_pct: nil, min_charge_pct: nil, min_power_kw: nil)
        #   Electric vehicle parameters for EV-aware routing
        #
        #   @param battery_capacity_wh [Float] Total battery capacity in watt-hours (required for EV routing)
        #
        #   @param connector_types [Array<String>, nil] Acceptable connector types (e.g. `["ccs", "chademo"]`)
        #
        #   @param initial_charge_pct [Float] Starting charge as a fraction 0-1 (default: 0.8)
        #
        #   @param min_charge_pct [Float] Minimum acceptable charge at destination as a fraction 0-1 (default: 0.10)
        #
        #   @param min_power_kw [Float, nil] Minimum charger power in kilowatts
      end

      # Geometry encoding format. Default: `geojson`.
      #
      # @see Plaza::Models::RouteRequest#geometries
      module Geometries
        extend Plaza::Internal::Type::Enum

        GEOJSON = :geojson
        POLYLINE = :polyline
        POLYLINE6 = :polyline6

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Travel mode (default: `auto`)
      #
      # @see Plaza::Models::RouteRequest#mode
      module Mode
        extend Plaza::Internal::Type::Enum

        AUTO = :auto
        FOOT = :foot
        BICYCLE = :bicycle

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Level of geometry detail: `full` (all points), `simplified` (Douglas-Peucker),
      # `false` (no geometry). Default: `full`.
      #
      # @see Plaza::Models::RouteRequest#overview
      module Overview
        extend Plaza::Internal::Type::Enum

        FULL = :full
        SIMPLIFIED = :simplified
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Traffic prediction model (only used when `depart_at` is set)
      #
      # @see Plaza::Models::RouteRequest#traffic_model
      module TrafficModel
        extend Plaza::Internal::Type::Enum

        BEST_GUESS = :best_guess
        OPTIMISTIC = :optimistic
        PESSIMISTIC = :pessimistic

        # @!method self.values
        #   @return [Array<Symbol>]
      end

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
    end
  end
end
