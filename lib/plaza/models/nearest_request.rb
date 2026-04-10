# frozen_string_literal: true

module Plaza
  module Models
    class NearestRequest < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
      #   order. Optional third element is altitude in meters.
      #
      #   @return [Plaza::Models::PointGeometry]
      required :geometry, -> { Plaza::PointGeometry }

      # @!attribute radius
      #   Maximum search radius in meters (default: 100)
      #
      #   @return [Float, nil]
      optional :radius, Float, nil?: true

      # @!method initialize(geometry:, radius: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::NearestRequest} for more details.
      #
      #   Request body for nearest-road-segment lookup. Snaps a point to the road network.
      #
      #   @param geometry [Plaza::Models::PointGeometry] GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude] order
      #
      #   @param radius [Float, nil] Maximum search radius in meters (default: 100)
    end
  end
end
