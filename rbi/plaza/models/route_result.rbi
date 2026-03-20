# typed: strong

module Plaza
  module Models
    class RouteResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::RouteResult, Plaza::Internal::AnyHash) }

      # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
      # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      # Route metadata
      sig { returns(Plaza::RouteResult::Properties) }
      attr_reader :properties

      sig { params(properties: Plaza::RouteResult::Properties::OrHash).void }
      attr_writer :properties

      sig { returns(Plaza::RouteResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON Feature representing a calculated route. The geometry is a LineString or
      # MultiLineString of the route path. When `alternatives > 0`, the response is a
      # FeatureCollection containing multiple route Features.
      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          properties: Plaza::RouteResult::Properties::OrHash,
          type: Plaza::RouteResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
        # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
        geometry:,
        # Route metadata
        properties:,
        type:
      )
      end

      sig do
        override.returns(
          {
            geometry: Plaza::GeoJsonGeometry,
            properties: Plaza::RouteResult::Properties,
            type: Plaza::RouteResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::RouteResult::Properties, Plaza::Internal::AnyHash)
          end

        # Total route distance in meters
        sig { returns(Float) }
        attr_accessor :distance_m

        # Estimated travel duration in seconds
        sig { returns(Float) }
        attr_accessor :duration_s

        # Per-edge annotations (present when `annotations: true` in request)
        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_accessor :annotations

        # Battery charge level at route waypoints as [distance_fraction, charge_pct] pairs
        # (EV routes only)
        sig { returns(T.nilable(T::Array[T::Array[Float]])) }
        attr_accessor :charge_profile

        # Recommended charging stops along the route (EV routes only)
        sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
        attr_accessor :charging_stops

        # Edge-level route details (present when `annotations: true`)
        sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
        attr_accessor :edges

        # Total energy consumed in watt-hours (EV routes only)
        sig { returns(T.nilable(Float)) }
        attr_accessor :energy_used_wh

        # Route metadata
        sig do
          params(
            distance_m: Float,
            duration_s: Float,
            annotations: T.nilable(T::Hash[Symbol, T.anything]),
            charge_profile: T.nilable(T::Array[T::Array[Float]]),
            charging_stops: T.nilable(T::Array[T::Hash[Symbol, T.anything]]),
            edges: T.nilable(T::Array[T::Hash[Symbol, T.anything]]),
            energy_used_wh: T.nilable(Float)
          ).returns(T.attached_class)
        end
        def self.new(
          # Total route distance in meters
          distance_m:,
          # Estimated travel duration in seconds
          duration_s:,
          # Per-edge annotations (present when `annotations: true` in request)
          annotations: nil,
          # Battery charge level at route waypoints as [distance_fraction, charge_pct] pairs
          # (EV routes only)
          charge_profile: nil,
          # Recommended charging stops along the route (EV routes only)
          charging_stops: nil,
          # Edge-level route details (present when `annotations: true`)
          edges: nil,
          # Total energy consumed in watt-hours (EV routes only)
          energy_used_wh: nil
        )
        end

        sig do
          override.returns(
            {
              distance_m: Float,
              duration_s: Float,
              annotations: T.nilable(T::Hash[Symbol, T.anything]),
              charge_profile: T.nilable(T::Array[T::Array[Float]]),
              charging_stops: T.nilable(T::Array[T::Hash[Symbol, T.anything]]),
              edges: T.nilable(T::Array[T::Hash[Symbol, T.anything]]),
              energy_used_wh: T.nilable(Float)
            }
          )
        end
        def to_hash
        end
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Plaza::RouteResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE = T.let(:Feature, Plaza::RouteResult::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::RouteResult::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
