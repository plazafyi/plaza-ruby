# typed: strong

module Plaza
  module Models
    class ReverseGeocodeResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::ReverseGeocodeResult, Plaza::Internal::AnyHash)
        end

      # Reverse geocoding results ordered by distance
      sig { returns(T::Array[Plaza::GeocodingFeature]) }
      attr_accessor :features

      sig { returns(Plaza::ReverseGeocodeResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON FeatureCollection of reverse geocoding results, ordered by distance from
      # the query point. Content-Type: `application/geo+json`.
      sig do
        params(
          features: T::Array[Plaza::GeocodingFeature::OrHash],
          type: Plaza::ReverseGeocodeResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Reverse geocoding results ordered by distance
        features:,
        type:
      )
      end

      sig do
        override.returns(
          {
            features: T::Array[Plaza::GeocodingFeature],
            type: Plaza::ReverseGeocodeResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::ReverseGeocodeResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(
            :FeatureCollection,
            Plaza::ReverseGeocodeResult::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Plaza::ReverseGeocodeResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
