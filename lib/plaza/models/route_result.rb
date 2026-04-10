# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#route
    class RouteResult < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry]
      required :geometry, union: -> { Plaza::Geometry }

      # @!attribute properties
      #   Route metadata
      #
      #   @return [Plaza::Models::RouteResult::Properties]
      required :properties, -> { Plaza::RouteResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::RouteResult::Type]
      required :type, enum: -> { Plaza::RouteResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::RouteResult} for more details.
      #
      #   GeoJSON Feature representing a calculated route. The geometry is a LineString or
      #   MultiLineString of the route path. When `alternatives > 0`, the response is a
      #   FeatureCollection containing multiple route Features.
      #
      #   @param geometry [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param properties [Plaza::Models::RouteResult::Properties] Route metadata
      #
      #   @param type [Symbol, Plaza::Models::RouteResult::Type]

      # @see Plaza::Models::RouteResult#properties
      class Properties < Plaza::Internal::Type::BaseModel
        # @!attribute distance_m
        #   Total route distance in meters
        #
        #   @return [Float]
        required :distance_m, Float

        # @!attribute duration_s
        #   Estimated travel duration in seconds
        #
        #   @return [Float]
        required :duration_s, Float

        # @!attribute annotations
        #   Per-edge annotations (present when `annotations: true` in request)
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :annotations, Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown], nil?: true

        # @!attribute charge_profile
        #   Battery charge level at route waypoints as [distance_fraction, charge_pct] pairs
        #   (EV routes only)
        #
        #   @return [Array<Array<Float>>, nil]
        optional :charge_profile,
                 Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float]],
                 nil?: true

        # @!attribute charging_stops
        #   Recommended charging stops along the route (EV routes only)
        #
        #   @return [Array<Hash{Symbol=>Object}>, nil]
        optional :charging_stops,
                 Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]],
                 nil?: true

        # @!attribute edges
        #   Edge-level route details (present when `annotations: true`)
        #
        #   @return [Array<Hash{Symbol=>Object}>, nil]
        optional :edges,
                 Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]],
                 nil?: true

        # @!attribute energy_used_wh
        #   Total energy consumed in watt-hours (EV routes only)
        #
        #   @return [Float, nil]
        optional :energy_used_wh, Float, nil?: true

        # @!method initialize(distance_m:, duration_s:, annotations: nil, charge_profile: nil, charging_stops: nil, edges: nil, energy_used_wh: nil)
        #   Some parameter documentations has been truncated, see
        #   {Plaza::Models::RouteResult::Properties} for more details.
        #
        #   Route metadata
        #
        #   @param distance_m [Float] Total route distance in meters
        #
        #   @param duration_s [Float] Estimated travel duration in seconds
        #
        #   @param annotations [Hash{Symbol=>Object}, nil] Per-edge annotations (present when `annotations: true` in request)
        #
        #   @param charge_profile [Array<Array<Float>>, nil] Battery charge level at route waypoints as [distance_fraction, charge_pct] pairs
        #
        #   @param charging_stops [Array<Hash{Symbol=>Object}>, nil] Recommended charging stops along the route (EV routes only)
        #
        #   @param edges [Array<Hash{Symbol=>Object}>, nil] Edge-level route details (present when `annotations: true`)
        #
        #   @param energy_used_wh [Float, nil] Total energy consumed in watt-hours (EV routes only)
      end

      # @see Plaza::Models::RouteResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
