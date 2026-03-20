# typed: strong

module Plaza
  module Models
    class RouteRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::RouteRequest, Plaza::Internal::AnyHash) }

      # Geographic coordinate as a JSON object with `lat` and `lng` fields.
      sig { returns(Plaza::RouteRequest::Destination) }
      attr_reader :destination

      sig { params(destination: Plaza::RouteRequest::Destination::OrHash).void }
      attr_writer :destination

      # Geographic coordinate as a JSON object with `lat` and `lng` fields.
      sig { returns(Plaza::RouteRequest::Origin) }
      attr_reader :origin

      sig { params(origin: Plaza::RouteRequest::Origin::OrHash).void }
      attr_writer :origin

      # Number of alternative routes to return (0-3, default 0). When > 0, response is a
      # FeatureCollection of route Features.
      sig { returns(T.nilable(Integer)) }
      attr_reader :alternatives

      sig { params(alternatives: Integer).void }
      attr_writer :alternatives

      # Include per-edge annotations (speed, duration) on the route (default: false)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :annotations

      sig { params(annotations: T::Boolean).void }
      attr_writer :annotations

      # Departure time for traffic-aware routing (ISO 8601)
      sig { returns(T.nilable(Time)) }
      attr_accessor :depart_at

      # Electric vehicle parameters for EV-aware routing
      sig { returns(T.nilable(Plaza::RouteRequest::Ev)) }
      attr_reader :ev

      sig { params(ev: T.nilable(Plaza::RouteRequest::Ev::OrHash)).void }
      attr_writer :ev

      # Comma-separated road types to exclude (e.g. `toll,motorway,ferry`)
      sig { returns(T.nilable(String)) }
      attr_accessor :exclude

      # Geometry encoding format. Default: `geojson`.
      sig { returns(T.nilable(Plaza::RouteRequest::Geometries::OrSymbol)) }
      attr_reader :geometries

      sig { params(geometries: Plaza::RouteRequest::Geometries::OrSymbol).void }
      attr_writer :geometries

      # Travel mode (default: `auto`)
      sig { returns(T.nilable(Plaza::RouteRequest::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: Plaza::RouteRequest::Mode::OrSymbol).void }
      attr_writer :mode

      # Level of geometry detail: `full` (all points), `simplified` (Douglas-Peucker),
      # `false` (no geometry). Default: `full`.
      sig { returns(T.nilable(Plaza::RouteRequest::Overview::OrSymbol)) }
      attr_reader :overview

      sig { params(overview: Plaza::RouteRequest::Overview::OrSymbol).void }
      attr_writer :overview

      # Include turn-by-turn navigation steps (default: false)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :steps

      sig { params(steps: T::Boolean).void }
      attr_writer :steps

      # Traffic prediction model (only used when `depart_at` is set)
      sig { returns(T.nilable(Plaza::RouteRequest::TrafficModel::OrSymbol)) }
      attr_accessor :traffic_model

      # Intermediate waypoints to visit in order (maximum 25)
      sig { returns(T.nilable(T::Array[Plaza::RouteRequest::Waypoint])) }
      attr_accessor :waypoints

      # Request body for route calculation. Origin and destination are lat/lng
      # coordinate objects. Supports optional waypoints, alternative routes,
      # turn-by-turn steps, and EV routing parameters.
      sig do
        params(
          destination: Plaza::RouteRequest::Destination::OrHash,
          origin: Plaza::RouteRequest::Origin::OrHash,
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
          waypoints: T.nilable(T::Array[Plaza::RouteRequest::Waypoint::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(
        # Geographic coordinate as a JSON object with `lat` and `lng` fields.
        destination:,
        # Geographic coordinate as a JSON object with `lat` and `lng` fields.
        origin:,
        # Number of alternative routes to return (0-3, default 0). When > 0, response is a
        # FeatureCollection of route Features.
        alternatives: nil,
        # Include per-edge annotations (speed, duration) on the route (default: false)
        annotations: nil,
        # Departure time for traffic-aware routing (ISO 8601)
        depart_at: nil,
        # Electric vehicle parameters for EV-aware routing
        ev: nil,
        # Comma-separated road types to exclude (e.g. `toll,motorway,ferry`)
        exclude: nil,
        # Geometry encoding format. Default: `geojson`.
        geometries: nil,
        # Travel mode (default: `auto`)
        mode: nil,
        # Level of geometry detail: `full` (all points), `simplified` (Douglas-Peucker),
        # `false` (no geometry). Default: `full`.
        overview: nil,
        # Include turn-by-turn navigation steps (default: false)
        steps: nil,
        # Traffic prediction model (only used when `depart_at` is set)
        traffic_model: nil,
        # Intermediate waypoints to visit in order (maximum 25)
        waypoints: nil
      )
      end

      sig do
        override.returns(
          {
            destination: Plaza::RouteRequest::Destination,
            origin: Plaza::RouteRequest::Origin,
            alternatives: Integer,
            annotations: T::Boolean,
            depart_at: T.nilable(Time),
            ev: T.nilable(Plaza::RouteRequest::Ev),
            exclude: T.nilable(String),
            geometries: Plaza::RouteRequest::Geometries::OrSymbol,
            mode: Plaza::RouteRequest::Mode::OrSymbol,
            overview: Plaza::RouteRequest::Overview::OrSymbol,
            steps: T::Boolean,
            traffic_model:
              T.nilable(Plaza::RouteRequest::TrafficModel::OrSymbol),
            waypoints: T.nilable(T::Array[Plaza::RouteRequest::Waypoint])
          }
        )
      end
      def to_hash
      end

      class Destination < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::RouteRequest::Destination, Plaza::Internal::AnyHash)
          end

        # Latitude in decimal degrees (-90 to 90)
        sig { returns(Float) }
        attr_accessor :lat

        # Longitude in decimal degrees (-180 to 180)
        sig { returns(Float) }
        attr_accessor :lng

        # Geographic coordinate as a JSON object with `lat` and `lng` fields.
        sig { params(lat: Float, lng: Float).returns(T.attached_class) }
        def self.new(
          # Latitude in decimal degrees (-90 to 90)
          lat:,
          # Longitude in decimal degrees (-180 to 180)
          lng:
        )
        end

        sig { override.returns({ lat: Float, lng: Float }) }
        def to_hash
        end
      end

      class Origin < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::RouteRequest::Origin, Plaza::Internal::AnyHash)
          end

        # Latitude in decimal degrees (-90 to 90)
        sig { returns(Float) }
        attr_accessor :lat

        # Longitude in decimal degrees (-180 to 180)
        sig { returns(Float) }
        attr_accessor :lng

        # Geographic coordinate as a JSON object with `lat` and `lng` fields.
        sig { params(lat: Float, lng: Float).returns(T.attached_class) }
        def self.new(
          # Latitude in decimal degrees (-90 to 90)
          lat:,
          # Longitude in decimal degrees (-180 to 180)
          lng:
        )
        end

        sig { override.returns({ lat: Float, lng: Float }) }
        def to_hash
        end
      end

      class Ev < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::RouteRequest::Ev, Plaza::Internal::AnyHash)
          end

        # Total battery capacity in watt-hours (required for EV routing)
        sig { returns(Float) }
        attr_accessor :battery_capacity_wh

        # Acceptable connector types (e.g. `["ccs", "chademo"]`)
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :connector_types

        # Starting charge as a fraction 0-1 (default: 0.8)
        sig { returns(T.nilable(Float)) }
        attr_reader :initial_charge_pct

        sig { params(initial_charge_pct: Float).void }
        attr_writer :initial_charge_pct

        # Minimum acceptable charge at destination as a fraction 0-1 (default: 0.10)
        sig { returns(T.nilable(Float)) }
        attr_reader :min_charge_pct

        sig { params(min_charge_pct: Float).void }
        attr_writer :min_charge_pct

        # Minimum charger power in kilowatts
        sig { returns(T.nilable(Float)) }
        attr_accessor :min_power_kw

        # Electric vehicle parameters for EV-aware routing
        sig do
          params(
            battery_capacity_wh: Float,
            connector_types: T.nilable(T::Array[String]),
            initial_charge_pct: Float,
            min_charge_pct: Float,
            min_power_kw: T.nilable(Float)
          ).returns(T.attached_class)
        end
        def self.new(
          # Total battery capacity in watt-hours (required for EV routing)
          battery_capacity_wh:,
          # Acceptable connector types (e.g. `["ccs", "chademo"]`)
          connector_types: nil,
          # Starting charge as a fraction 0-1 (default: 0.8)
          initial_charge_pct: nil,
          # Minimum acceptable charge at destination as a fraction 0-1 (default: 0.10)
          min_charge_pct: nil,
          # Minimum charger power in kilowatts
          min_power_kw: nil
        )
        end

        sig do
          override.returns(
            {
              battery_capacity_wh: Float,
              connector_types: T.nilable(T::Array[String]),
              initial_charge_pct: Float,
              min_charge_pct: Float,
              min_power_kw: T.nilable(Float)
            }
          )
        end
        def to_hash
        end
      end

      # Geometry encoding format. Default: `geojson`.
      module Geometries
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::RouteRequest::Geometries) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GEOJSON = T.let(:geojson, Plaza::RouteRequest::Geometries::TaggedSymbol)
        POLYLINE =
          T.let(:polyline, Plaza::RouteRequest::Geometries::TaggedSymbol)
        POLYLINE6 =
          T.let(:polyline6, Plaza::RouteRequest::Geometries::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::RouteRequest::Geometries::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Travel mode (default: `auto`)
      module Mode
        extend Plaza::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Plaza::RouteRequest::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Plaza::RouteRequest::Mode::TaggedSymbol)
        FOOT = T.let(:foot, Plaza::RouteRequest::Mode::TaggedSymbol)
        BICYCLE = T.let(:bicycle, Plaza::RouteRequest::Mode::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::RouteRequest::Mode::TaggedSymbol])
        end
        def self.values
        end
      end

      # Level of geometry detail: `full` (all points), `simplified` (Douglas-Peucker),
      # `false` (no geometry). Default: `full`.
      module Overview
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::RouteRequest::Overview) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FULL = T.let(:full, Plaza::RouteRequest::Overview::TaggedSymbol)
        SIMPLIFIED =
          T.let(:simplified, Plaza::RouteRequest::Overview::TaggedSymbol)
        FALSE = T.let(:false, Plaza::RouteRequest::Overview::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::RouteRequest::Overview::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Traffic prediction model (only used when `depart_at` is set)
      module TrafficModel
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::RouteRequest::TrafficModel) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BEST_GUESS =
          T.let(:best_guess, Plaza::RouteRequest::TrafficModel::TaggedSymbol)
        OPTIMISTIC =
          T.let(:optimistic, Plaza::RouteRequest::TrafficModel::TaggedSymbol)
        PESSIMISTIC =
          T.let(:pessimistic, Plaza::RouteRequest::TrafficModel::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::RouteRequest::TrafficModel::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Waypoint < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::RouteRequest::Waypoint, Plaza::Internal::AnyHash)
          end

        # Latitude in decimal degrees (-90 to 90)
        sig { returns(Float) }
        attr_accessor :lat

        # Longitude in decimal degrees (-180 to 180)
        sig { returns(Float) }
        attr_accessor :lng

        # Geographic coordinate as a JSON object with `lat` and `lng` fields.
        sig { params(lat: Float, lng: Float).returns(T.attached_class) }
        def self.new(
          # Latitude in decimal degrees (-90 to 90)
          lat:,
          # Longitude in decimal degrees (-180 to 180)
          lng:
        )
        end

        sig { override.returns({ lat: Float, lng: Float }) }
        def to_hash
        end
      end
    end
  end
end
