# typed: strong

module PlazaSDK
  module Models
    class ReverseGeocodeResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::ReverseGeocodeResult, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(T::Array[PlazaSDK::GeocodingFeature]) }
      attr_accessor :features

      sig { returns(PlazaSDK::ReverseGeocodeResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON FeatureCollection of reverse geocoding results
      sig do
        params(
          features: T::Array[PlazaSDK::GeocodingFeature::OrHash],
          type: PlazaSDK::ReverseGeocodeResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(features:, type:)
      end

      sig do
        override.returns(
          {
            features: T::Array[PlazaSDK::GeocodingFeature],
            type: PlazaSDK::ReverseGeocodeResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::ReverseGeocodeResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(
            :FeatureCollection,
            PlazaSDK::ReverseGeocodeResult::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[PlazaSDK::ReverseGeocodeResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
