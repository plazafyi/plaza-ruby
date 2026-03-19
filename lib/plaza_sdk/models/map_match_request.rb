# frozen_string_literal: true

module PlazaSDK
  module Models
    class MapMatchRequest < PlazaSDK::Internal::Type::BaseModel
      # @!attribute trace
      #   GPS trace (GeoJSON LineString geometry)
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :trace, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute radiuses
      #   Search radius per coordinate in meters (optional, default 50)
      #
      #   @return [Array<Float>, nil]
      optional :radiuses, PlazaSDK::Internal::Type::ArrayOf[Float], nil?: true

      # @!method initialize(trace:, radiuses: nil)
      #   GPS trace to match against the road network
      #
      #   @param trace [PlazaSDK::Models::GeoJsonGeometry] GPS trace (GeoJSON LineString geometry)
      #
      #   @param radiuses [Array<Float>, nil] Search radius per coordinate in meters (optional, default 50)
    end
  end
end
