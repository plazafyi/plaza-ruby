# frozen_string_literal: true

module Plaza
  module Models
    class ElevationLookupRequest < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   Point or MultiPoint geometry to look up elevations for
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::MultiPointGeometry]
      required :geometry, union: -> { Plaza::ElevationLookupRequest::Geometry }

      # @!method initialize(geometry:)
      #   Request body for elevation lookup. Accepts a single Point or a MultiPoint
      #   geometry.
      #
      #   @param geometry [Plaza::Models::PointGeometry, Plaza::Models::MultiPointGeometry] Point or MultiPoint geometry to look up elevations for

      # Point or MultiPoint geometry to look up elevations for
      #
      # @see Plaza::Models::ElevationLookupRequest#geometry
      module Geometry
        extend Plaza::Internal::Type::Union

        # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude] order. Optional third element is altitude in meters.
        variant -> { Plaza::PointGeometry }

        # GeoJSON MultiPoint geometry per RFC 7946. An array of positions.
        variant -> { Plaza::MultiPointGeometry }

        # @!method self.variants
        #   @return [Array(Plaza::Models::PointGeometry, Plaza::Models::MultiPointGeometry)]
      end
    end
  end
end
