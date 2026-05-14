# frozen_string_literal: true

module Plaza
  module Models
    # GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
    # determines the coordinate structure.
    module Geometry
      extend Plaza::Internal::Type::Union

      discriminator :type

      # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude] order. Optional third element is altitude in meters.
      variant :Point, -> { Plaza::PointGeometry }

      # GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more positions.
      variant :LineString, -> { Plaza::LineStringGeometry }

      # GeoJSON Polygon geometry per RFC 7946. An array of linear rings where the first ring is the exterior boundary and subsequent rings are holes. Each ring must have at least 4 positions with the first and last being identical.
      variant :Polygon, -> { Plaza::PolygonGeometry }

      # GeoJSON MultiPoint geometry per RFC 7946. An array of positions.
      variant :MultiPoint, -> { Plaza::MultiPointGeometry }

      # GeoJSON MultiLineString geometry per RFC 7946. An array of LineString coordinate arrays.
      variant :MultiLineString, -> { Plaza::MultiLineStringGeometry }

      # GeoJSON MultiPolygon geometry per RFC 7946. An array of Polygon coordinate arrays.
      variant :MultiPolygon, -> { Plaza::MultiPolygonGeometry }

      # @!method self.variants
      #   @return [Array(Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry)]
    end
  end
end
