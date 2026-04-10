# frozen_string_literal: true

module Plaza
  module Models
    class ElevationProfileRequest < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more
      #   positions.
      #
      #   @return [Plaza::Models::LineStringGeometry]
      required :geometry, -> { Plaza::LineStringGeometry }

      # @!method initialize(geometry:)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::ElevationProfileRequest} for more details.
      #
      #   Request body for elevation profile along a path. Provide a GeoJSON LineString
      #   geometry defining the path.
      #
      #   @param geometry [Plaza::Models::LineStringGeometry] GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more pos
    end
  end
end
