# typed: strong

module Plaza
  module Resources
    class Routing
      # Calculate an isochrone from a point
      sig do
        params(
          lat: Float,
          lng: Float,
          time: Float,
          format_: String,
          mode: String,
          output_fields: String,
          output_geometry: T::Boolean,
          output_include: String,
          output_precision: Integer,
          output_simplify: Float,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::Models::RoutingIsochroneResponse)
      end
      def isochrone(
        # Latitude
        lat:,
        # Longitude
        lng:,
        # Travel time in seconds (1-7200)
        time:,
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
        # Travel mode (auto, foot, bicycle)
        mode: nil,
        # Comma-separated property fields to include
        output_fields: nil,
        # Include geometry (default true)
        output_geometry: nil,
        # Extra computed fields: bbox, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Simplify geometry tolerance in meters
        output_simplify: nil,
        request_options: {}
      )
      end

      # Calculate an isochrone from a point
      sig do
        params(
          lat: Float,
          lng: Float,
          time: Float,
          format_: String,
          mode: String,
          output_fields: String,
          output_geometry: T::Boolean,
          output_include: String,
          output_precision: Integer,
          output_simplify: Float,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::Models::RoutingIsochronePostResponse)
      end
      def isochrone_post(
        # Latitude
        lat:,
        # Longitude
        lng:,
        # Travel time in seconds (1-7200)
        time:,
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
        # Travel mode (auto, foot, bicycle)
        mode: nil,
        # Comma-separated property fields to include
        output_fields: nil,
        # Include geometry (default true)
        output_geometry: nil,
        # Extra computed fields: bbox, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Simplify geometry tolerance in meters
        output_simplify: nil,
        request_options: {}
      )
      end

      # Calculate a distance matrix between points
      sig do
        params(
          destinations: T::Array[Plaza::MatrixRequest::Destination::OrHash],
          origins: T::Array[Plaza::MatrixRequest::Origin::OrHash],
          annotations: String,
          fallback_speed: T.nilable(Float),
          mode: Plaza::MatrixRequest::Mode::OrSymbol,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T::Hash[Symbol, T.anything])
      end
      def matrix(
        # Array of destination coordinates (max 50)
        destinations:,
        # Array of origin coordinates (max 50)
        origins:,
        # Comma-separated list of annotations to include: `duration` (always included),
        # `distance`. Example: `duration,distance`.
        annotations: nil,
        # Fallback speed in km/h for pairs where no route exists. When set, unreachable
        # pairs get estimated values instead of null.
        fallback_speed: nil,
        # Travel mode (default: `auto`)
        mode: nil,
        request_options: {}
      )
      end

      # Snap a coordinate to the nearest road
      sig do
        params(
          lat: Float,
          lng: Float,
          output_fields: String,
          output_include: String,
          output_precision: Integer,
          radius: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::NearestResult)
      end
      def nearest(
        # Latitude
        lat:,
        # Longitude
        lng:,
        # Comma-separated property fields to include
        output_fields: nil,
        # Extra computed fields: bbox, distance, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Search radius in meters (default 500, max 5000)
        radius: nil,
        request_options: {}
      )
      end

      # Snap a coordinate to the nearest road
      sig do
        params(
          lat: Float,
          lng: Float,
          output_fields: String,
          output_include: String,
          output_precision: Integer,
          radius: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::NearestResult)
      end
      def nearest_post(
        # Latitude
        lat:,
        # Longitude
        lng:,
        # Comma-separated property fields to include
        output_fields: nil,
        # Extra computed fields: bbox, distance, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Search radius in meters (default 500, max 5000)
        radius: nil,
        request_options: {}
      )
      end

      # Calculate a route between two points
      sig do
        params(
          destination: Plaza::RouteRequest::Destination::OrHash,
          origin: Plaza::RouteRequest::Origin::OrHash,
          format_: String,
          alternatives: Integer,
          annotations: T::Boolean,
          depart_at: T.nilable(Time),
          ev: T.nilable(Plaza::RouteRequest::Ev::OrHash),
          exclude: T.nilable(String),
          geometries: Plaza::RouteRequest::Geometries::OrSymbol,
          mode: Plaza::RouteRequest::Mode::OrSymbol,
          overview: Plaza::RouteRequest::Overview::OrSymbol,
          steps: T::Boolean,
          traffic_model: T.nilable(Plaza::RouteRequest::TrafficModel::OrSymbol),
          waypoints: T.nilable(T::Array[Plaza::RouteRequest::Waypoint::OrHash]),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::RouteResult)
      end
      def route(
        # Body param: Geographic coordinate as a JSON object with `lat` and `lng` fields.
        destination:,
        # Body param: Geographic coordinate as a JSON object with `lat` and `lng` fields.
        origin:,
        # Query param: Response format for alternatives: json (default), geojson, csv,
        # ndjson
        format_: nil,
        # Body param: Number of alternative routes to return (0-3, default 0). When > 0,
        # response is a FeatureCollection of route Features.
        alternatives: nil,
        # Body param: Include per-edge annotations (speed, duration) on the route
        # (default: false)
        annotations: nil,
        # Body param: Departure time for traffic-aware routing (ISO 8601)
        depart_at: nil,
        # Body param: Electric vehicle parameters for EV-aware routing
        ev: nil,
        # Body param: Comma-separated road types to exclude (e.g. `toll,motorway,ferry`)
        exclude: nil,
        # Body param: Geometry encoding format. Default: `geojson`.
        geometries: nil,
        # Body param: Travel mode (default: `auto`)
        mode: nil,
        # Body param: Level of geometry detail: `full` (all points), `simplified`
        # (Douglas-Peucker), `false` (no geometry). Default: `full`.
        overview: nil,
        # Body param: Include turn-by-turn navigation steps (default: false)
        steps: nil,
        # Body param: Traffic prediction model (only used when `depart_at` is set)
        traffic_model: nil,
        # Body param: Intermediate waypoints to visit in order (maximum 25)
        waypoints: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Plaza::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
