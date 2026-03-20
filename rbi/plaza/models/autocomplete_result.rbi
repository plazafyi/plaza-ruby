# typed: strong

module Plaza
  module Models
    class AutocompleteResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::AutocompleteResult, Plaza::Internal::AnyHash)
        end

      # Autocomplete suggestions ordered by relevance
      sig { returns(T::Array[Plaza::GeocodingFeature]) }
      attr_accessor :features

      sig { returns(Plaza::AutocompleteResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON FeatureCollection of autocomplete suggestions for partial address input.
      # Optimized for low-latency type-ahead UIs. Content-Type: `application/geo+json`.
      sig do
        params(
          features: T::Array[Plaza::GeocodingFeature::OrHash],
          type: Plaza::AutocompleteResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Autocomplete suggestions ordered by relevance
        features:,
        type:
      )
      end

      sig do
        override.returns(
          {
            features: T::Array[Plaza::GeocodingFeature],
            type: Plaza::AutocompleteResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::AutocompleteResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(
            :FeatureCollection,
            Plaza::AutocompleteResult::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Plaza::AutocompleteResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
