# frozen_string_literal: true

module Plaza
  module Models
    class ElevationProfileRequest < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   Path to profile (GeoJSON LineString geometry, minimum 2 points)
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :geometry, -> { Plaza::GeoJsonGeometry }

      # @!method initialize(geometry:)
      #   Request body for elevation profile
      #
      #   @param geometry [Plaza::Models::GeoJsonGeometry] Path to profile (GeoJSON LineString geometry, minimum 2 points)
    end
  end
end
