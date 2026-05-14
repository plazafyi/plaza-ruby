# frozen_string_literal: true

module Plaza
  module Resources
    class Routing
      # Some parameter documentations has been truncated, see
      # {Plaza::Models::RoutingIsochroneParams} for more details.
      #
      # Calculate an isochrone from a point
      #
      # @overload isochrone(geometry:, time:, format_: nil, mode: nil, request_options: {})
      #
      # @param geometry [Plaza::Models::PointGeometry] Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, lat
      #
      # @param time [Array<Integer>] Body param: Travel time budgets in seconds. Each value produces one contour poly
      #
      # @param format_ [String] Query param: Response format: json (default), geojson, csv, ndjson
      #
      # @param mode [Symbol, Plaza::Models::IsochroneRequest::Mode] Body param: Travel mode (default: `auto`)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::RoutingIsochroneResponse]
      #
      # @see Plaza::Models::RoutingIsochroneParams
      def isochrone(params)
        query_params = [:format_]
        parsed, options = Plaza::RoutingIsochroneParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/isochrone",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
          model: Plaza::Models::RoutingIsochroneResponse,
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
      # @param destinations [Array<Plaza::Models::PointGeometry>] Array of destination coordinates as GeoJSON Points (max 50)
      #
      # @param origins [Array<Plaza::Models::PointGeometry>] Array of origin coordinates as GeoJSON Points (max 50)
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

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::RoutingNearestParams} for more details.
      #
      # Snap a coordinate to the nearest road
      #
      # @overload nearest(geometry:, radius: nil, request_options: {})
      #
      # @param geometry [Plaza::Models::PointGeometry] GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude] order
      #
      # @param radius [Float, nil] Maximum search radius in meters (default: 100)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::NearestResult]
      #
      # @see Plaza::Models::RoutingNearestParams
      def nearest(params)
        parsed, options = Plaza::RoutingNearestParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/nearest",
          body: parsed,
          model: Plaza::NearestResult,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Plaza::Models::RoutingRouteParams} for more details.
      #
      # Calculate a route between two points
      #
      # @overload route(destination:, origin:, format_: nil, alternatives: nil, annotations: nil, depart_at: nil, ev: nil, exclude: nil, geometries: nil, mode: nil, overview: nil, steps: nil, traffic_model: nil, waypoints: nil, request_options: {})
      #
      # @param destination [Plaza::Models::PointGeometry] Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, lat
      #
      # @param origin [Plaza::Models::PointGeometry] Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, lat
      #
      # @param format_ [String] Query param: Response format for alternatives: json (default), geojson, csv, ndj
      #
      # @param alternatives [Integer] Body param: Number of alternative routes to return (0-3, default 0). When > 0, r
      #
      # @param annotations [Boolean] Body param: Include per-edge annotations (speed, duration) on the route (default
      #
      # @param depart_at [Time, nil] Body param: Departure time for traffic-aware routing (ISO 8601)
      #
      # @param ev [Plaza::Models::RouteRequest::Ev, nil] Body param: Electric vehicle parameters for EV-aware routing
      #
      # @param exclude [String, nil] Body param: Comma-separated road types to exclude (e.g. `toll,motorway,ferry`)
      #
      # @param geometries [Symbol, Plaza::Models::RouteRequest::Geometries] Body param: Geometry encoding format. Default: `geojson`.
      #
      # @param mode [Symbol, Plaza::Models::RouteRequest::Mode] Body param: Travel mode (default: `auto`)
      #
      # @param overview [Symbol, Plaza::Models::RouteRequest::Overview] Body param: Level of geometry detail: `full` (all points), `simplified` (Douglas
      #
      # @param steps [Boolean] Body param: Include turn-by-turn navigation steps (default: false)
      #
      # @param traffic_model [Symbol, Plaza::Models::RouteRequest::TrafficModel, nil] Body param: Traffic prediction model (only used when `depart_at` is set)
      #
      # @param waypoints [Array<Plaza::Models::PointGeometry>, nil] Body param: Intermediate waypoints to visit in order (maximum 25)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::RouteResult]
      #
      # @see Plaza::Models::RoutingRouteParams
      def route(params)
        query_params = [:format_]
        parsed, options = Plaza::RoutingRouteParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/route",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
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
