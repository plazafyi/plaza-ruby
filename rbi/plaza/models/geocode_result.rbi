# typed: strong

module Plaza
  module Models
    class GeocodeResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::GeocodeResult, Plaza::Internal::AnyHash) }

      # Geocoding results ordered by relevance score
      sig { returns(T::Array[Plaza::GeocodingFeature]) }
      attr_accessor :features

      sig { returns(Plaza::GeocodeResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON FeatureCollection of forward geocoding results, ordered by relevance.
      # Content-Type: `application/geo+json`.
      sig do
        params(
          features: T::Array[Plaza::GeocodingFeature::OrHash],
          type: Plaza::GeocodeResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Geocoding results ordered by relevance score
        features:,
        type:
      )
      end

      sig do
        override.returns(
          {
            features: T::Array[Plaza::GeocodingFeature],
            type: Plaza::GeocodeResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::GeocodeResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(:FeatureCollection, Plaza::GeocodeResult::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::GeocodeResult::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
