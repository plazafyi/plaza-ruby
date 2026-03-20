# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#isochrone_post
    class RoutingIsochronePostResponse < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #   Array of isochrone polygon Features (multi-contour only)
      #
      #   @return [Array<Plaza::Models::GeoJsonFeature>, nil]
      optional :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::GeoJsonFeature] }, nil?: true

      # @!attribute geometry
      #   GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
      #   order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
      #
      #   @return [Plaza::Models::GeoJsonGeometry, nil]
      optional :geometry, -> { Plaza::GeoJsonGeometry }, nil?: true

      # @!attribute properties
      #   Isochrone metadata
      #
      #   @return [Plaza::Models::RoutingIsochronePostResponse::Properties, nil]
      optional :properties, -> { Plaza::Models::RoutingIsochronePostResponse::Properties }, nil?: true

      # @!attribute type
      #   `Feature` for single contour, `FeatureCollection` for multiple contours
      #
      #   @return [Symbol, Plaza::Models::RoutingIsochronePostResponse::Type, nil]
      optional :type, enum: -> { Plaza::Models::RoutingIsochronePostResponse::Type }

      # @!method initialize(features: nil, geometry: nil, properties: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::RoutingIsochronePostResponse} for more details.
      #
      #   GeoJSON Feature or FeatureCollection representing isochrone polygons — areas
      #   reachable within the specified travel time(s). Single time value returns a
      #   Feature; comma-separated times return a FeatureCollection with one polygon per
      #   contour.
      #
      #   @param features [Array<Plaza::Models::GeoJsonFeature>, nil] Array of isochrone polygon Features (multi-contour only)
      #
      #   @param geometry [Plaza::Models::GeoJsonGeometry, nil] GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude] orde
      #
      #   @param properties [Plaza::Models::RoutingIsochronePostResponse::Properties, nil] Isochrone metadata
      #
      #   @param type [Symbol, Plaza::Models::RoutingIsochronePostResponse::Type] `Feature` for single contour, `FeatureCollection` for multiple contours

      # @see Plaza::Models::RoutingIsochronePostResponse#properties
      class Properties < Plaza::Internal::Type::BaseModel
        # @!attribute area_m2
        #   Area of the isochrone polygon in square meters (multi-contour features only)
        #
        #   @return [Float, nil]
        optional :area_m2, Float, nil?: true

        # @!attribute max_cost_s
        #   Maximum actual travel cost in seconds to the isochrone boundary (single contour
        #   only)
        #
        #   @return [Float, nil]
        optional :max_cost_s, Float, nil?: true

        # @!attribute mode
        #   Travel mode used for the isochrone calculation
        #
        #   @return [Symbol, Plaza::Models::RoutingIsochronePostResponse::Properties::Mode, nil]
        optional :mode, enum: -> { Plaza::Models::RoutingIsochronePostResponse::Properties::Mode }

        # @!attribute time_seconds
        #   Travel time budget in seconds
        #
        #   @return [Float, nil]
        optional :time_seconds, Float

        # @!attribute vertices_reached
        #   Number of road network vertices within the isochrone
        #
        #   @return [Integer, nil]
        optional :vertices_reached, Integer

        # @!method initialize(area_m2: nil, max_cost_s: nil, mode: nil, time_seconds: nil, vertices_reached: nil)
        #   Some parameter documentations has been truncated, see
        #   {Plaza::Models::RoutingIsochronePostResponse::Properties} for more details.
        #
        #   Isochrone metadata
        #
        #   @param area_m2 [Float, nil] Area of the isochrone polygon in square meters (multi-contour features only)
        #
        #   @param max_cost_s [Float, nil] Maximum actual travel cost in seconds to the isochrone boundary (single contour
        #
        #   @param mode [Symbol, Plaza::Models::RoutingIsochronePostResponse::Properties::Mode] Travel mode used for the isochrone calculation
        #
        #   @param time_seconds [Float] Travel time budget in seconds
        #
        #   @param vertices_reached [Integer] Number of road network vertices within the isochrone

        # Travel mode used for the isochrone calculation
        #
        # @see Plaza::Models::RoutingIsochronePostResponse::Properties#mode
        module Mode
          extend Plaza::Internal::Type::Enum

          AUTO = :auto
          FOOT = :foot
          BICYCLE = :bicycle

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # `Feature` for single contour, `FeatureCollection` for multiple contours
      #
      # @see Plaza::Models::RoutingIsochronePostResponse#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE = :Feature
        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
