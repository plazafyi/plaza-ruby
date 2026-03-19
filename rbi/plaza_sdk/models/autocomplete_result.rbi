# typed: strong

module PlazaSDK
  module Models
    class AutocompleteResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::AutocompleteResult, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(T::Array[PlazaSDK::GeocodingFeature]) }
      attr_accessor :features

      sig { returns(PlazaSDK::AutocompleteResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON FeatureCollection of autocomplete suggestions
      sig do
        params(
          features: T::Array[PlazaSDK::GeocodingFeature::OrHash],
          type: PlazaSDK::AutocompleteResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(features:, type:)
      end

      sig do
        override.returns(
          {
            features: T::Array[PlazaSDK::GeocodingFeature],
            type: PlazaSDK::AutocompleteResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::AutocompleteResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(
            :FeatureCollection,
            PlazaSDK::AutocompleteResult::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[PlazaSDK::AutocompleteResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
