# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Elevation#lookup
    class ElevationLookupResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :geometry, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [PlazaSDK::Models::ElevationLookupResult::Properties]
      required :properties, -> { PlazaSDK::ElevationLookupResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::ElevationLookupResult::Type]
      required :type, enum: -> { PlazaSDK::ElevationLookupResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   GeoJSON Point Feature with 3D coordinate [lng, lat, elevation] (RFC 7946 §3.1.1)
      #
      #   @param geometry [PlazaSDK::Models::GeoJsonGeometry]
      #   @param properties [PlazaSDK::Models::ElevationLookupResult::Properties]
      #   @param type [Symbol, PlazaSDK::Models::ElevationLookupResult::Type]

      # @see PlazaSDK::Models::ElevationLookupResult#properties
      class Properties < PlazaSDK::Internal::Type::BaseModel
        # @!attribute elevation_m
        #   Elevation in meters above mean sea level
        #
        #   @return [Float, nil]
        optional :elevation_m, Float

        # @!method initialize(elevation_m: nil)
        #   @param elevation_m [Float] Elevation in meters above mean sea level
      end

      # @see PlazaSDK::Models::ElevationLookupResult#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
