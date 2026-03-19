# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#route
    class RouteResult < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :geometry, -> { Plaza::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [Plaza::Models::RouteResult::Properties]
      required :properties, -> { Plaza::RouteResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::RouteResult::Type]
      required :type, enum: -> { Plaza::RouteResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   @param geometry [Plaza::Models::GeoJsonGeometry]
      #   @param properties [Plaza::Models::RouteResult::Properties]
      #   @param type [Symbol, Plaza::Models::RouteResult::Type]

      # @see Plaza::Models::RouteResult#properties
      class Properties < Plaza::Internal::Type::BaseModel
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

      # @see Plaza::Models::RouteResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
