# typed: strong

module Plaza
  module Models
    class GeocodeBatchResponse < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::Models::GeocodeBatchResponse, Plaza::Internal::AnyHash)
        end

      # Number of addresses processed (always equals length of results)
      sig { returns(Integer) }
      attr_accessor :count

      # Array of FeatureCollections, one per input address. Empty FeatureCollections
      # indicate no match.
      sig { returns(T::Array[Plaza::GeocodeResult]) }
      attr_accessor :results

      # Batch geocoding result. Each entry in `results` is a FeatureCollection
      # corresponding to the input address at the same index. Order is preserved.
      sig do
        params(
          count: Integer,
          results: T::Array[Plaza::GeocodeResult::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of addresses processed (always equals length of results)
        count:,
        # Array of FeatureCollections, one per input address. Empty FeatureCollections
        # indicate no match.
        results:
      )
      end

      sig do
        override.returns(
          { count: Integer, results: T::Array[Plaza::GeocodeResult] }
        )
      end
      def to_hash
      end
    end
  end
end
