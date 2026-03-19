# frozen_string_literal: true

module Plaza
  module Models
    class OptimizeRequest < Plaza::Internal::Type::BaseModel
      # @!attribute waypoints
      #   Waypoints to visit (GeoJSON MultiPoint geometry, minimum 2 points)
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :waypoints, -> { Plaza::GeoJsonGeometry }

      # @!attribute mode
      #   Travel mode (default: auto)
      #
      #   @return [Symbol, Plaza::Models::OptimizeRequest::Mode, nil]
      optional :mode, enum: -> { Plaza::OptimizeRequest::Mode }

      # @!attribute roundtrip
      #   Whether route returns to start (default: true)
      #
      #   @return [Boolean, nil]
      optional :roundtrip, Plaza::Internal::Type::Boolean

      # @!method initialize(waypoints:, mode: nil, roundtrip: nil)
      #   Route optimization request through waypoints
      #
      #   @param waypoints [Plaza::Models::GeoJsonGeometry] Waypoints to visit (GeoJSON MultiPoint geometry, minimum 2 points)
      #
      #   @param mode [Symbol, Plaza::Models::OptimizeRequest::Mode] Travel mode (default: auto)
      #
      #   @param roundtrip [Boolean] Whether route returns to start (default: true)

      # Travel mode (default: auto)
      #
      # @see Plaza::Models::OptimizeRequest#mode
      module Mode
        extend Plaza::Internal::Type::Enum

        AUTO = :auto
        FOOT = :foot
        BICYCLE = :bicycle

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
