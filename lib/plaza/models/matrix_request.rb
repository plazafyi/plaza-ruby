# frozen_string_literal: true

module Plaza
  module Models
    class MatrixRequest < Plaza::Internal::Type::BaseModel
      # @!attribute destinations
      #   Array of destination coordinates (max 50)
      #
      #   @return [Array<Plaza::Models::MatrixRequest::Destination>]
      required :destinations, -> { Plaza::Internal::Type::ArrayOf[Plaza::MatrixRequest::Destination] }

      # @!attribute origins
      #   Array of origin coordinates (max 50)
      #
      #   @return [Array<Plaza::Models::MatrixRequest::Origin>]
      required :origins, -> { Plaza::Internal::Type::ArrayOf[Plaza::MatrixRequest::Origin] }

      # @!attribute annotations
      #   Comma-separated list of annotations to include: `duration` (always included),
      #   `distance`. Example: `duration,distance`.
      #
      #   @return [String, nil]
      optional :annotations, String

      # @!attribute fallback_speed
      #   Fallback speed in km/h for pairs where no route exists. When set, unreachable
      #   pairs get estimated values instead of null.
      #
      #   @return [Float, nil]
      optional :fallback_speed, Float, nil?: true

      # @!attribute mode
      #   Travel mode (default: `auto`)
      #
      #   @return [Symbol, Plaza::Models::MatrixRequest::Mode, nil]
      optional :mode, enum: -> { Plaza::MatrixRequest::Mode }

      # @!method initialize(destinations:, origins:, annotations: nil, fallback_speed: nil, mode: nil)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::MatrixRequest} for more details.
      #
      #   Request body for distance matrix calculation. Computes travel durations (and
      #   optionally distances) between every origin-destination pair. Maximum 2,500 pairs
      #   (origins × destinations), each list capped at 50 coordinates.
      #
      #   @param destinations [Array<Plaza::Models::MatrixRequest::Destination>] Array of destination coordinates (max 50)
      #
      #   @param origins [Array<Plaza::Models::MatrixRequest::Origin>] Array of origin coordinates (max 50)
      #
      #   @param annotations [String] Comma-separated list of annotations to include: `duration` (always included), `d
      #
      #   @param fallback_speed [Float, nil] Fallback speed in km/h for pairs where no route exists. When set, unreachable pa
      #
      #   @param mode [Symbol, Plaza::Models::MatrixRequest::Mode] Travel mode (default: `auto`)

      class Destination < Plaza::Internal::Type::BaseModel
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

      class Origin < Plaza::Internal::Type::BaseModel
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

      # Travel mode (default: `auto`)
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
