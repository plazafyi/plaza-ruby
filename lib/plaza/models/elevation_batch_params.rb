# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elevation#batch
    class ElevationBatchParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute coordinates
      #   Coordinates to look up elevations for (max 50)
      #
      #   @return [Array<Plaza::Models::ElevationBatchParams::Coordinate>]
      required :coordinates, -> { Plaza::Internal::Type::ArrayOf[Plaza::ElevationBatchParams::Coordinate] }

      # @!method initialize(coordinates:, request_options: {})
      #   @param coordinates [Array<Plaza::Models::ElevationBatchParams::Coordinate>] Coordinates to look up elevations for (max 50)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]

      class Coordinate < Plaza::Internal::Type::BaseModel
        # @!attribute lat
        #   Latitude in decimal degrees (-90 to 90)
        #
        #   @return [Float]
        required :lat, Float

        # @!attribute lng
        #   Longitude in decimal degrees (-180 to 180)
        #
        #   @return [Float]
        required :lng, Float

        # @!method initialize(lat:, lng:)
        #   Geographic coordinate as a JSON object with `lat` and `lng` fields.
        #
        #   @param lat [Float] Latitude in decimal degrees (-90 to 90)
        #
        #   @param lng [Float] Longitude in decimal degrees (-180 to 180)
      end
    end
  end
end
