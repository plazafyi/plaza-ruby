# typed: strong

module Plaza
  module Resources
    class Routing
      # Calculate an isochrone from a point
      sig do
        params(
          geometry: Plaza::PointGeometry::OrHash,
          time: T::Array[Integer],
          format_: String,
          mode: Plaza::IsochroneRequest::Mode::OrSymbol,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::Models::RoutingIsochroneResponse)
      end
      def isochrone(
        # Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude,
        # latitude] order. Optional third element is altitude in meters.
        geometry:,
        # Body param: Travel time budgets in seconds. Each value produces one contour
        # polygon.
        time:,
        # Query param: Response format: json (default), geojson, csv, ndjson
        format_: nil,
        # Body param: Travel mode (default: `auto`)
        mode: nil,
        request_options: {}
      )
      end

      # Calculate a distance matrix between points
      sig do
        params(
          destinations: T::Array[Plaza::PointGeometry::OrHash],
          origins: T::Array[Plaza::PointGeometry::OrHash],
          annotations: String,
          fallback_speed: T.nilable(Float),
          mode: Plaza::MatrixRequest::Mode::OrSymbol,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T::Hash[Symbol, T.anything])
      end
      def matrix(
        # Array of destination coordinates as GeoJSON Points (max 50)
        destinations:,
        # Array of origin coordinates as GeoJSON Points (max 50)
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
          geometry: Plaza::PointGeometry::OrHash,
          radius: T.nilable(Float),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::NearestResult)
      end
      def nearest(
        # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
        # order. Optional third element is altitude in meters.
        geometry:,
        # Maximum search radius in meters (default: 100)
        radius: nil,
        request_options: {}
      )
      end

      # Calculate a route between two points
      sig do
        params(
          destination: Plaza::PointGeometry::OrHash,
          origin: Plaza::PointGeometry::OrHash,
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
          waypoints: T.nilable(T::Array[Plaza::PointGeometry::OrHash]),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::RouteResult)
      end
      def route(
        # Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude,
        # latitude] order. Optional third element is altitude in meters.
        destination:,
        # Body param: GeoJSON Point geometry per RFC 7946. Coordinates use [longitude,
        # latitude] order. Optional third element is altitude in meters.
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
