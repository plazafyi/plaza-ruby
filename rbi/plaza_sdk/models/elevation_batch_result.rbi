# typed: strong

module PlazaSDK
  module Models
    class ElevationBatchResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::ElevationBatchResult, PlazaSDK::Internal::AnyHash)
        end

      # Elevation Point Features for each queried point
      sig { returns(T::Array[PlazaSDK::ElevationLookupResult]) }
      attr_accessor :features

      sig { returns(PlazaSDK::ElevationBatchResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON FeatureCollection of elevation Point Features with 3D coordinates
      sig do
        params(
          features: T::Array[PlazaSDK::ElevationLookupResult::OrHash],
          type: PlazaSDK::ElevationBatchResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Elevation Point Features for each queried point
        features:,
        type:
      )
      end

      sig do
        override.returns(
          {
            features: T::Array[PlazaSDK::ElevationLookupResult],
            type: PlazaSDK::ElevationBatchResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::ElevationBatchResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(
            :FeatureCollection,
            PlazaSDK::ElevationBatchResult::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[PlazaSDK::ElevationBatchResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
