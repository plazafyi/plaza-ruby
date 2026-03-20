# frozen_string_literal: true

module Plaza
  module Models
    class MapMatchRequest < Plaza::Internal::Type::BaseModel
      # @!attribute coordinates
      #   GPS coordinates to match, in order of travel (max 50 points)
      #
      #   @return [Array<Plaza::Models::MapMatchRequest::Coordinate>]
      required :coordinates, -> { Plaza::Internal::Type::ArrayOf[Plaza::MapMatchRequest::Coordinate] }

      # @!attribute radiuses
      #   Search radius per coordinate in meters. Must have the same length as
      #   `coordinates` or be omitted entirely. Default: 50m per point.
      #
      #   @return [Array<Float>, nil]
      optional :radiuses, Plaza::Internal::Type::ArrayOf[Float], nil?: true

      # @!method initialize(coordinates:, radiuses: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::MapMatchRequest} for more details.
      #
      #   GPS trace to snap to the road network. Provide an array of coordinate objects
      #   representing the GPS points. Maximum 50 points per request.
      #
      #   @param coordinates [Array<Plaza::Models::MapMatchRequest::Coordinate>] GPS coordinates to match, in order of travel (max 50 points)
      #
      #   @param radiuses [Array<Float>, nil] Search radius per coordinate in meters. Must have the same length as `coordinate

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
