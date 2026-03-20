# frozen_string_literal: true

module Plaza
  module Resources
    class Routing
      # Calculate an isochrone from a point
      #
      # @overload isochrone(lat:, lng:, time:, mode: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, request_options: {})
      #
      # @param lat [Float] Latitude
      #
      # @param lng [Float] Longitude
      #
      # @param time [Float] Travel time in seconds (1-7200)
      #
      # @param mode [String] Travel mode (auto, foot, bicycle)
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_geometry [Boolean] Include geometry (default true)
      #
      # @param output_include [String] Extra computed fields: bbox, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param output_simplify [Float] Simplify geometry tolerance in meters
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::RoutingIsochroneResponse]
      #
      # @see Plaza::Models::RoutingIsochroneParams
      def isochrone(params)
        parsed, options = Plaza::RoutingIsochroneParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/isochrone",
          query: query.transform_keys(
            output_fields: "output[fields]",
            output_geometry: "output[geometry]",
            output_include: "output[include]",
            output_precision: "output[precision]",
            output_simplify: "output[simplify]"
          ),
          model: Plaza::Models::RoutingIsochroneResponse,
          options: options
        )
      end

      # Calculate an isochrone from a point
      #
      # @overload isochrone_post(lat:, lng:, time:, mode: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, request_options: {})
      #
      # @param lat [Float] Latitude
      #
      # @param lng [Float] Longitude
      #
      # @param time [Float] Travel time in seconds (1-7200)
      #
      # @param mode [String] Travel mode (auto, foot, bicycle)
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_geometry [Boolean] Include geometry (default true)
      #
      # @param output_include [String] Extra computed fields: bbox, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param output_simplify [Float] Simplify geometry tolerance in meters
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::RoutingIsochronePostResponse]
      #
      # @see Plaza::Models::RoutingIsochronePostParams
      def isochrone_post(params)
        parsed, options = Plaza::RoutingIsochronePostParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: "api/v1/isochrone",
          query: query.transform_keys(
            output_fields: "output[fields]",
            output_geometry: "output[geometry]",
            output_include: "output[include]",
            output_precision: "output[precision]",
            output_simplify: "output[simplify]"
          ),
          model: Plaza::Models::RoutingIsochronePostResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::RoutingMatrixParams} for more details.
      #
      # Calculate a distance matrix between points
      #
      # @overload matrix(destinations:, origins:, annotations: nil, fallback_speed: nil, mode: nil, request_options: {})
      #
      # @param destinations [Array<Plaza::Models::MatrixRequest::Destination>] Array of destination coordinates (max 50)
      #
      # @param origins [Array<Plaza::Models::MatrixRequest::Origin>] Array of origin coordinates (max 50)
      #
      # @param annotations [String] Comma-separated list of annotations to include: `duration` (always included), `d
      #
      # @param fallback_speed [Float, nil] Fallback speed in km/h for pairs where no route exists. When set, unreachable pa
      #
      # @param mode [Symbol, Plaza::Models::MatrixRequest::Mode] Travel mode (default: `auto`)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Hash{Symbol=>Object}]
      #
      # @see Plaza::Models::RoutingMatrixParams
      def matrix(params)
        parsed, options = Plaza::RoutingMatrixParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/matrix",
          body: parsed,
          model: Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown],
          options: options
        )
      end

      # Snap a coordinate to the nearest road
      #
      # @overload nearest(lat:, lng:, output_fields: nil, output_include: nil, output_precision: nil, radius: nil, request_options: {})
      #
      # @param lat [Float] Latitude
      #
      # @param lng [Float] Longitude
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_include [String] Extra computed fields: bbox, distance, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param radius [Integer] Search radius in meters (default 500, max 5000)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::NearestResult]
      #
      # @see Plaza::Models::RoutingNearestParams
      def nearest(params)
        parsed, options = Plaza::RoutingNearestParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/nearest",
          query: query.transform_keys(
            output_fields: "output[fields]",
            output_include: "output[include]",
            output_precision: "output[precision]"
          ),
          model: Plaza::NearestResult,
          options: options
        )
      end

      # Snap a coordinate to the nearest road
      #
      # @overload nearest_post(lat:, lng:, output_fields: nil, output_include: nil, output_precision: nil, radius: nil, request_options: {})
      #
      # @param lat [Float] Latitude
      #
      # @param lng [Float] Longitude
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_include [String] Extra computed fields: bbox, distance, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param radius [Integer] Search radius in meters (default 500, max 5000)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::NearestResult]
      #
      # @see Plaza::Models::RoutingNearestPostParams
      def nearest_post(params)
        parsed, options = Plaza::RoutingNearestPostParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :post,
          path: "api/v1/nearest",
          query: query.transform_keys(
            output_fields: "output[fields]",
            output_include: "output[include]",
            output_precision: "output[precision]"
          ),
          model: Plaza::NearestResult,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::RoutingRouteParams} for more details.
      #
      # Calculate a route between two points
      #
      # @overload route(destination:, origin:, alternatives: nil, annotations: nil, depart_at: nil, ev: nil, exclude: nil, geometries: nil, mode: nil, overview: nil, steps: nil, traffic_model: nil, waypoints: nil, request_options: {})
      #
      # @param destination [Plaza::Models::RouteRequest::Destination] Geographic coordinate as a JSON object with `lat` and `lng` fields.
      #
      # @param origin [Plaza::Models::RouteRequest::Origin] Geographic coordinate as a JSON object with `lat` and `lng` fields.
      #
      # @param alternatives [Integer] Number of alternative routes to return (0-3, default 0). When > 0, response is a
      #
      # @param annotations [Boolean] Include per-edge annotations (speed, duration) on the route (default: false)
      #
      # @param depart_at [Time, nil] Departure time for traffic-aware routing (ISO 8601)
      #
      # @param ev [Plaza::Models::RouteRequest::Ev, nil] Electric vehicle parameters for EV-aware routing
      #
      # @param exclude [String, nil] Comma-separated road types to exclude (e.g. `toll,motorway,ferry`)
      #
      # @param geometries [Symbol, Plaza::Models::RouteRequest::Geometries] Geometry encoding format. Default: `geojson`.
      #
      # @param mode [Symbol, Plaza::Models::RouteRequest::Mode] Travel mode (default: `auto`)
      #
      # @param overview [Symbol, Plaza::Models::RouteRequest::Overview] Level of geometry detail: `full` (all points), `simplified` (Douglas-Peucker), `
      #
      # @param steps [Boolean] Include turn-by-turn navigation steps (default: false)
      #
      # @param traffic_model [Symbol, Plaza::Models::RouteRequest::TrafficModel, nil] Traffic prediction model (only used when `depart_at` is set)
      #
      # @param waypoints [Array<Plaza::Models::RouteRequest::Waypoint>, nil] Intermediate waypoints to visit in order (maximum 25)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::RouteResult]
      #
      # @see Plaza::Models::RoutingRouteParams
      def route(params)
        parsed, options = Plaza::RoutingRouteParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/route",
          body: parsed,
          model: Plaza::RouteResult,
          options: options
        )
      end

      # @api private
      #
      # @param client [Plaza::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
