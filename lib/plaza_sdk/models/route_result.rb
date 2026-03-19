# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Routing#route
    class RouteResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :geometry, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [PlazaSDK::Models::RouteResult::Properties]
      required :properties, -> { PlazaSDK::RouteResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::RouteResult::Type]
      required :type, enum: -> { PlazaSDK::RouteResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   @param geometry [PlazaSDK::Models::GeoJsonGeometry]
      #   @param properties [PlazaSDK::Models::RouteResult::Properties]
      #   @param type [Symbol, PlazaSDK::Models::RouteResult::Type]

      # @see PlazaSDK::Models::RouteResult#properties
      class Properties < PlazaSDK::Internal::Type::BaseModel
        # @!attribute distance
        #   Total distance in meters
        #
        #   @return [Float, nil]
        optional :distance, Float

        # @!attribute duration
        #   Estimated duration in seconds
        #
        #   @return [Float, nil]
        optional :duration, Float

        # @!attribute mode
        #   Travel mode used
        #
        #   @return [String, nil]
        optional :mode, String

        # @!method initialize(distance: nil, duration: nil, mode: nil)
        #   @param distance [Float] Total distance in meters
        #
        #   @param duration [Float] Estimated duration in seconds
        #
        #   @param mode [String] Travel mode used
      end

      # @see PlazaSDK::Models::RouteResult#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
