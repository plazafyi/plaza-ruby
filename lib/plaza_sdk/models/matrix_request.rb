# frozen_string_literal: true

module PlazaSDK
  module Models
    class MatrixRequest < PlazaSDK::Internal::Type::BaseModel
      # @!attribute destinations
      #   Destination points (GeoJSON MultiPoint geometry)
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :destinations, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute origins
      #   Origin points (GeoJSON MultiPoint geometry)
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :origins, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute mode
      #   Travel mode
      #
      #   @return [Symbol, PlazaSDK::Models::MatrixRequest::Mode, nil]
      optional :mode, enum: -> { PlazaSDK::MatrixRequest::Mode }

      # @!method initialize(destinations:, origins:, mode: nil)
      #   @param destinations [PlazaSDK::Models::GeoJsonGeometry] Destination points (GeoJSON MultiPoint geometry)
      #
      #   @param origins [PlazaSDK::Models::GeoJsonGeometry] Origin points (GeoJSON MultiPoint geometry)
      #
      #   @param mode [Symbol, PlazaSDK::Models::MatrixRequest::Mode] Travel mode

      # Travel mode
      #
      # @see PlazaSDK::Models::MatrixRequest#mode
      module Mode
        extend PlazaSDK::Internal::Type::Enum

        AUTO = :auto
        FOOT = :foot
        BICYCLE = :bicycle

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
