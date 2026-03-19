# typed: strong

module PlazaSDK
  module Models
    class FeatureCollection < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::FeatureCollection, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(T::Array[PlazaSDK::GeoJsonFeature]) }
      attr_accessor :features

      sig { returns(PlazaSDK::FeatureCollection::Type::TaggedSymbol) }
      attr_accessor :type

      # Bare GeoJSON FeatureCollection. Pagination metadata is returned in HTTP headers
      # (X-Limit, X-Has-More, X-Next-Cursor, X-Next-Offset, Link).
      sig do
        params(
          features: T::Array[PlazaSDK::GeoJsonFeature::OrHash],
          type: PlazaSDK::FeatureCollection::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(features:, type:)
      end

      sig do
        override.returns(
          {
            features: T::Array[PlazaSDK::GeoJsonFeature],
            type: PlazaSDK::FeatureCollection::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::FeatureCollection::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(
            :FeatureCollection,
            PlazaSDK::FeatureCollection::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[PlazaSDK::FeatureCollection::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
