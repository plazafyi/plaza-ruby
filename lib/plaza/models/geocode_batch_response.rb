# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Geocode#batch
    class GeocodeBatchResponse < Plaza::Internal::Type::BaseModel
      # @!attribute count
      #   Number of addresses processed (always equals length of results)
      #
      #   @return [Integer]
      required :count, Integer

      # @!attribute results
      #   Array of FeatureCollections, one per input address. Empty FeatureCollections
      #   indicate no match.
      #
      #   @return [Array<Plaza::Models::GeocodeResult>]
      required :results, -> { Plaza::Internal::Type::ArrayOf[Plaza::GeocodeResult] }

      # @!method initialize(count:, results:)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::GeocodeBatchResponse} for more details.
      #
      #   Batch geocoding result. Each entry in `results` is a FeatureCollection
      #   corresponding to the input address at the same index. Order is preserved.
      #
      #   @param count [Integer] Number of addresses processed (always equals length of results)
      #
      #   @param results [Array<Plaza::Models::GeocodeResult>] Array of FeatureCollections, one per input address. Empty FeatureCollections ind
    end
  end
end
