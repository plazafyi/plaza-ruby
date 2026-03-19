# frozen_string_literal: true

module PlazaSDK
  module Models
    class GeocodingFeature < PlazaSDK::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :geometry, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [PlazaSDK::Models::GeocodingFeature::Properties]
      required :properties, -> { PlazaSDK::GeocodingFeature::Properties }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::GeocodingFeature::Type]
      required :type, enum: -> { PlazaSDK::GeocodingFeature::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   @param geometry [PlazaSDK::Models::GeoJsonGeometry]
      #   @param properties [PlazaSDK::Models::GeocodingFeature::Properties]
      #   @param type [Symbol, PlazaSDK::Models::GeocodingFeature::Type]

      # @see PlazaSDK::Models::GeocodingFeature#properties
      class Properties < PlazaSDK::Internal::Type::BaseModel
        # @!attribute country_code
        #   ISO 3166-1 alpha-2 country code
        #
        #   @return [String, nil]
        optional :country_code, String, nil?: true

        # @!attribute display_name
        #   Formatted address or place name
        #
        #   @return [String, nil]
        optional :display_name, String

        # @!attribute distance_m
        #   Distance in meters
        #
        #   @return [Float, nil]
        optional :distance_m, Float, nil?: true

        # @!attribute osm_id
        #   OpenStreetMap ID
        #
        #   @return [Integer, nil]
        optional :osm_id, Integer, nil?: true

        # @!attribute osm_type
        #   OSM element type
        #
        #   @return [String, nil]
        optional :osm_type, String, nil?: true

        # @!attribute score
        #   Match confidence score
        #
        #   @return [Float, nil]
        optional :score, Float, nil?: true

        # @!attribute source
        #   Result source (address, place, interpolation)
        #
        #   @return [String, nil]
        optional :source, String, nil?: true

        # @!method initialize(country_code: nil, display_name: nil, distance_m: nil, osm_id: nil, osm_type: nil, score: nil, source: nil)
        #   @param country_code [String, nil] ISO 3166-1 alpha-2 country code
        #
        #   @param display_name [String] Formatted address or place name
        #
        #   @param distance_m [Float, nil] Distance in meters
        #
        #   @param osm_id [Integer, nil] OpenStreetMap ID
        #
        #   @param osm_type [String, nil] OSM element type
        #
        #   @param score [Float, nil] Match confidence score
        #
        #   @param source [String, nil] Result source (address, place, interpolation)
      end

      # @see PlazaSDK::Models::GeocodingFeature#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
