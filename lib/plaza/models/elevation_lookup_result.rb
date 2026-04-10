# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elevation#lookup
    class ElevationLookupResult < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry]
      required :geometry, union: -> { Plaza::Geometry }

      # @!attribute properties
      #
      #   @return [Plaza::Models::ElevationLookupResult::Properties]
      required :properties, -> { Plaza::ElevationLookupResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::ElevationLookupResult::Type]
      required :type, enum: -> { Plaza::ElevationLookupResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::ElevationLookupResult} for more details.
      #
      #   GeoJSON Point Feature with a 3D coordinate [lng, lat, elevation] per RFC 7946
      #   §3.1.1. The elevation is also available in `properties.elevation_m` for
      #   convenience.
      #
      #   @param geometry [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param properties [Plaza::Models::ElevationLookupResult::Properties]
      #
      #   @param type [Symbol, Plaza::Models::ElevationLookupResult::Type]

      # @see Plaza::Models::ElevationLookupResult#properties
      class Properties < Plaza::Internal::Type::BaseModel
        # @!attribute elevation_m
        #   Elevation in meters above mean sea level (WGS84 EGM96 geoid)
        #
        #   @return [Float]
        required :elevation_m, Float

        # @!method initialize(elevation_m:)
        #   @param elevation_m [Float] Elevation in meters above mean sea level (WGS84 EGM96 geoid)
      end

      # @see Plaza::Models::ElevationLookupResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
