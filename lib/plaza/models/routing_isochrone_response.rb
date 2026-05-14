# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#isochrone
    class RoutingIsochroneResponse < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #   Array of isochrone polygon Features, one per contour
      #
      #   @return [Array<Plaza::Models::GeoJsonFeature>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::GeoJsonFeature] }

      # @!attribute type
      #   Always `FeatureCollection`
      #
      #   @return [Symbol, Plaza::Models::RoutingIsochroneResponse::Type]
      required :type, enum: -> { Plaza::Models::RoutingIsochroneResponse::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of isochrone polygons — areas reachable within the
      #   specified travel time(s). Each Feature is a Polygon contour with travel time and
      #   area metadata in properties.
      #
      #   @param features [Array<Plaza::Models::GeoJsonFeature>] Array of isochrone polygon Features, one per contour
      #
      #   @param type [Symbol, Plaza::Models::RoutingIsochroneResponse::Type] Always `FeatureCollection`

      # Always `FeatureCollection`
      #
      # @see Plaza::Models::RoutingIsochroneResponse#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
