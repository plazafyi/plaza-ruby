# frozen_string_literal: true

module Plaza
  module Models
    class MapMatchRequest < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more
      #   positions.
      #
      #   @return [Plaza::Models::LineStringGeometry]
      required :geometry, -> { Plaza::LineStringGeometry }

      # @!attribute radiuses
      #   Search radius per coordinate in meters. Must have the same length as the
      #   geometry coordinates or be omitted entirely. Default: 50m per point.
      #
      #   @return [Array<Float>, nil]
      optional :radiuses, Plaza::Internal::Type::ArrayOf[Float], nil?: true

      # @!method initialize(geometry:, radiuses: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::MapMatchRequest} for more details.
      #
      #   GPS trace to snap to the road network. Provide a GeoJSON LineString geometry
      #   representing the GPS trace.
      #
      #   @param geometry [Plaza::Models::LineStringGeometry] GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more pos
      #
      #   @param radiuses [Array<Float>, nil] Search radius per coordinate in meters. Must have the same length as the geometr
    end
  end
end
