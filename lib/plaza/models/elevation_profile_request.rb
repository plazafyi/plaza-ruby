# frozen_string_literal: true

module Plaza
  module Models
    class ElevationProfileRequest < Plaza::Internal::Type::BaseModel
      # @!attribute coordinates
      #   Path coordinates in order of travel (min 2, max 50)
      #
      #   @return [Array<Plaza::Models::ElevationProfileRequest::Coordinate>]
      required :coordinates, -> { Plaza::Internal::Type::ArrayOf[Plaza::ElevationProfileRequest::Coordinate] }

      # @!method initialize(coordinates:)
      #   Request body for elevation profile along a path. Provide at least 2 coordinates
      #   defining the path. Maximum 50 coordinates per request.
      #
      #   @param coordinates [Array<Plaza::Models::ElevationProfileRequest::Coordinate>] Path coordinates in order of travel (min 2, max 50)

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
