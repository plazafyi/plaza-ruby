# frozen_string_literal: true

module PlazaSDK
  module Models
    class RouteRequest < PlazaSDK::Internal::Type::BaseModel
      # @!attribute destination
      #   Destination point (GeoJSON Point geometry)
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :destination, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute origin
      #   Origin point (GeoJSON Point geometry)
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :origin, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute mode
      #
      #   @return [Symbol, PlazaSDK::Models::RouteRequest::Mode, nil]
      optional :mode, enum: -> { PlazaSDK::RouteRequest::Mode }

      # @!method initialize(destination:, origin:, mode: nil)
      #   @param destination [PlazaSDK::Models::GeoJsonGeometry] Destination point (GeoJSON Point geometry)
      #
      #   @param origin [PlazaSDK::Models::GeoJsonGeometry] Origin point (GeoJSON Point geometry)
      #
      #   @param mode [Symbol, PlazaSDK::Models::RouteRequest::Mode]

      # @see PlazaSDK::Models::RouteRequest#mode
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
