# typed: strong

module Plaza
  module Models
    class FeatureCollection < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::FeatureCollection, Plaza::Internal::AnyHash)
        end

      sig { returns(T::Array[Plaza::GeoJsonFeature]) }
      attr_accessor :features

      sig { returns(Plaza::FeatureCollection::Type::TaggedSymbol) }
      attr_accessor :type

      # Bare GeoJSON FeatureCollection. Pagination metadata is returned in HTTP headers
      # (X-Limit, X-Has-More, X-Next-Cursor, X-Next-Offset, Link).
      sig do
        params(
          features: T::Array[Plaza::GeoJsonFeature::OrHash],
          type: Plaza::FeatureCollection::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(features:, type:)
      end

      sig do
        override.returns(
          {
            features: T::Array[Plaza::GeoJsonFeature],
            type: Plaza::FeatureCollection::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::FeatureCollection::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(
            :FeatureCollection,
            Plaza::FeatureCollection::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Plaza::FeatureCollection::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
