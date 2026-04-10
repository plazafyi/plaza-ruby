# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elevation#profile
    class ElevationProfileResult < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry]
      required :geometry, union: -> { Plaza::Geometry }

      # @!attribute properties
      #   Elevation profile summary statistics
      #
      #   @return [Plaza::Models::ElevationProfileResult::Properties]
      required :properties, -> { Plaza::ElevationProfileResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::ElevationProfileResult::Type]
      required :type, enum: -> { Plaza::ElevationProfileResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::ElevationProfileResult} for more details.
      #
      #   GeoJSON LineString Feature with 3D coordinates [lng, lat, elevation]
      #   representing the elevation profile along the input path. Summary statistics are
      #   in properties.
      #
      #   @param geometry [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param properties [Plaza::Models::ElevationProfileResult::Properties] Elevation profile summary statistics
      #
      #   @param type [Symbol, Plaza::Models::ElevationProfileResult::Type]

      # @see Plaza::Models::ElevationProfileResult#properties
      class Properties < Plaza::Internal::Type::BaseModel
        # @!attribute avg_elevation_m
        #   Average elevation along the profile in meters
        #
        #   @return [Float]
        required :avg_elevation_m, Float

        # @!attribute max_elevation_m
        #   Maximum elevation along the profile in meters
        #
        #   @return [Float]
        required :max_elevation_m, Float

        # @!attribute min_elevation_m
        #   Minimum elevation along the profile in meters
        #
        #   @return [Float]
        required :min_elevation_m, Float

        # @!attribute total_ascent_m
        #   Total cumulative elevation gain in meters
        #
        #   @return [Float]
        required :total_ascent_m, Float

        # @!attribute total_descent_m
        #   Total cumulative elevation loss in meters
        #
        #   @return [Float]
        required :total_descent_m, Float

        # @!method initialize(avg_elevation_m:, max_elevation_m:, min_elevation_m:, total_ascent_m:, total_descent_m:)
        #   Elevation profile summary statistics
        #
        #   @param avg_elevation_m [Float] Average elevation along the profile in meters
        #
        #   @param max_elevation_m [Float] Maximum elevation along the profile in meters
        #
        #   @param min_elevation_m [Float] Minimum elevation along the profile in meters
        #
        #   @param total_ascent_m [Float] Total cumulative elevation gain in meters
        #
        #   @param total_descent_m [Float] Total cumulative elevation loss in meters
      end

      # @see Plaza::Models::ElevationProfileResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
