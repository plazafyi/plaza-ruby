# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Elevation#profile
    class ElevationProfileResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :geometry, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [PlazaSDK::Models::ElevationProfileResult::Properties]
      required :properties, -> { PlazaSDK::ElevationProfileResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::ElevationProfileResult::Type]
      required :type, enum: -> { PlazaSDK::ElevationProfileResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   GeoJSON LineString Feature with 3D coordinates representing an elevation profile
      #
      #   @param geometry [PlazaSDK::Models::GeoJsonGeometry]
      #   @param properties [PlazaSDK::Models::ElevationProfileResult::Properties]
      #   @param type [Symbol, PlazaSDK::Models::ElevationProfileResult::Type]

      # @see PlazaSDK::Models::ElevationProfileResult#properties
      class Properties < PlazaSDK::Internal::Type::BaseModel
        # @!attribute avg_elevation_m
        #   Average elevation along profile
        #
        #   @return [Float, nil]
        optional :avg_elevation_m, Float

        # @!attribute max_elevation_m
        #   Maximum elevation along profile
        #
        #   @return [Float, nil]
        optional :max_elevation_m, Float

        # @!attribute min_elevation_m
        #   Minimum elevation along profile
        #
        #   @return [Float, nil]
        optional :min_elevation_m, Float

        # @!attribute total_ascent_m
        #   Total elevation gain in meters
        #
        #   @return [Float, nil]
        optional :total_ascent_m, Float

        # @!attribute total_descent_m
        #   Total elevation loss in meters
        #
        #   @return [Float, nil]
        optional :total_descent_m, Float

        # @!method initialize(avg_elevation_m: nil, max_elevation_m: nil, min_elevation_m: nil, total_ascent_m: nil, total_descent_m: nil)
        #   @param avg_elevation_m [Float] Average elevation along profile
        #
        #   @param max_elevation_m [Float] Maximum elevation along profile
        #
        #   @param min_elevation_m [Float] Minimum elevation along profile
        #
        #   @param total_ascent_m [Float] Total elevation gain in meters
        #
        #   @param total_descent_m [Float] Total elevation loss in meters
      end

      # @see PlazaSDK::Models::ElevationProfileResult#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
