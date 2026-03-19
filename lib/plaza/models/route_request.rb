# frozen_string_literal: true

module Plaza
  module Models
    class RouteRequest < Plaza::Internal::Type::BaseModel
      # @!attribute destination
      #   Destination point (GeoJSON Point geometry)
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :destination, -> { Plaza::GeoJsonGeometry }

      # @!attribute origin
      #   Origin point (GeoJSON Point geometry)
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :origin, -> { Plaza::GeoJsonGeometry }

      # @!attribute mode
      #
      #   @return [Symbol, Plaza::Models::RouteRequest::Mode, nil]
      optional :mode, enum: -> { Plaza::RouteRequest::Mode }

      # @!method initialize(destination:, origin:, mode: nil)
      #   @param destination [Plaza::Models::GeoJsonGeometry] Destination point (GeoJSON Point geometry)
      #
      #   @param origin [Plaza::Models::GeoJsonGeometry] Origin point (GeoJSON Point geometry)
      #
      #   @param mode [Symbol, Plaza::Models::RouteRequest::Mode]

      # @see Plaza::Models::RouteRequest#mode
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
