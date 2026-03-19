# frozen_string_literal: true

module Plaza
  module Models
    class MapMatchRequest < Plaza::Internal::Type::BaseModel
      # @!attribute trace
      #   GPS trace (GeoJSON LineString geometry)
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :trace, -> { Plaza::GeoJsonGeometry }

      # @!attribute radiuses
      #   Search radius per coordinate in meters (optional, default 50)
      #
      #   @return [Array<Float>, nil]
      optional :radiuses, Plaza::Internal::Type::ArrayOf[Float], nil?: true

      # @!method initialize(trace:, radiuses: nil)
      #   GPS trace to match against the road network
      #
      #   @param trace [Plaza::Models::GeoJsonGeometry] GPS trace (GeoJSON LineString geometry)
      #
      #   @param radiuses [Array<Float>, nil] Search radius per coordinate in meters (optional, default 50)
    end
  end
end
