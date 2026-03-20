# typed: strong

module Plaza
  module Models
    class ElevationBatchResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationBatchResult, Plaza::Internal::AnyHash)
        end

      # Elevation results in the same order as input coordinates
      sig { returns(T::Array[Plaza::ElevationLookupResult]) }
      attr_accessor :features

      sig { returns(Plaza::ElevationBatchResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON FeatureCollection of elevation Point Features with 3D coordinates. Order
      # matches the input coordinates array.
      sig do
        params(
          features: T::Array[Plaza::ElevationLookupResult::OrHash],
          type: Plaza::ElevationBatchResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Elevation results in the same order as input coordinates
        features:,
        type:
      )
      end

      sig do
        override.returns(
          {
            features: T::Array[Plaza::ElevationLookupResult],
            type: Plaza::ElevationBatchResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::ElevationBatchResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(
            :FeatureCollection,
            Plaza::ElevationBatchResult::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Plaza::ElevationBatchResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
