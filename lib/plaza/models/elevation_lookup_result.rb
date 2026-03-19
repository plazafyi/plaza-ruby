# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elevation#lookup
    class ElevationLookupResult < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :geometry, -> { Plaza::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [Plaza::Models::ElevationLookupResult::Properties]
      required :properties, -> { Plaza::ElevationLookupResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::ElevationLookupResult::Type]
      required :type, enum: -> { Plaza::ElevationLookupResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   GeoJSON Point Feature with 3D coordinate [lng, lat, elevation] (RFC 7946 §3.1.1)
      #
      #   @param geometry [Plaza::Models::GeoJsonGeometry]
      #   @param properties [Plaza::Models::ElevationLookupResult::Properties]
      #   @param type [Symbol, Plaza::Models::ElevationLookupResult::Type]

      # @see Plaza::Models::ElevationLookupResult#properties
      class Properties < Plaza::Internal::Type::BaseModel
        # @!attribute elevation_m
        #   Elevation in meters above mean sea level
        #
        #   @return [Float, nil]
        optional :elevation_m, Float

        # @!method initialize(elevation_m: nil)
        #   @param elevation_m [Float] Elevation in meters above mean sea level
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
