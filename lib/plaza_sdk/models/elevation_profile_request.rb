# frozen_string_literal: true

module PlazaSDK
  module Models
    class ElevationProfileRequest < PlazaSDK::Internal::Type::BaseModel
      # @!attribute geometry
      #   Path to profile (GeoJSON LineString geometry, minimum 2 points)
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :geometry, -> { PlazaSDK::GeoJsonGeometry }

      # @!method initialize(geometry:)
      #   Request body for elevation profile
      #
      #   @param geometry [PlazaSDK::Models::GeoJsonGeometry] Path to profile (GeoJSON LineString geometry, minimum 2 points)
    end
  end
end
