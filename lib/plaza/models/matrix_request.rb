# frozen_string_literal: true

module Plaza
  module Models
    class MatrixRequest < Plaza::Internal::Type::BaseModel
      # @!attribute destinations
      #   Destination points (GeoJSON MultiPoint geometry)
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :destinations, -> { Plaza::GeoJsonGeometry }

      # @!attribute origins
      #   Origin points (GeoJSON MultiPoint geometry)
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :origins, -> { Plaza::GeoJsonGeometry }

      # @!attribute mode
      #   Travel mode
      #
      #   @return [Symbol, Plaza::Models::MatrixRequest::Mode, nil]
      optional :mode, enum: -> { Plaza::MatrixRequest::Mode }

      # @!method initialize(destinations:, origins:, mode: nil)
      #   @param destinations [Plaza::Models::GeoJsonGeometry] Destination points (GeoJSON MultiPoint geometry)
      #
      #   @param origins [Plaza::Models::GeoJsonGeometry] Origin points (GeoJSON MultiPoint geometry)
      #
      #   @param mode [Symbol, Plaza::Models::MatrixRequest::Mode] Travel mode

      # Travel mode
      #
      # @see Plaza::Models::MatrixRequest#mode
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
