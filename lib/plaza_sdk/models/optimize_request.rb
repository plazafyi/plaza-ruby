# frozen_string_literal: true

module PlazaSDK
  module Models
    class OptimizeRequest < PlazaSDK::Internal::Type::BaseModel
      # @!attribute waypoints
      #   Waypoints to visit (GeoJSON MultiPoint geometry, minimum 2 points)
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :waypoints, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute mode
      #   Travel mode (default: auto)
      #
      #   @return [Symbol, PlazaSDK::Models::OptimizeRequest::Mode, nil]
      optional :mode, enum: -> { PlazaSDK::OptimizeRequest::Mode }

      # @!attribute roundtrip
      #   Whether route returns to start (default: true)
      #
      #   @return [Boolean, nil]
      optional :roundtrip, PlazaSDK::Internal::Type::Boolean

      # @!method initialize(waypoints:, mode: nil, roundtrip: nil)
      #   Route optimization request through waypoints
      #
      #   @param waypoints [PlazaSDK::Models::GeoJsonGeometry] Waypoints to visit (GeoJSON MultiPoint geometry, minimum 2 points)
      #
      #   @param mode [Symbol, PlazaSDK::Models::OptimizeRequest::Mode] Travel mode (default: auto)
      #
      #   @param roundtrip [Boolean] Whether route returns to start (default: true)

      # Travel mode (default: auto)
      #
      # @see PlazaSDK::Models::OptimizeRequest#mode
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
