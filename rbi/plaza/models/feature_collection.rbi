# typed: strong

module Plaza
  module Models
    class FeatureCollection < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::FeatureCollection, Plaza::Internal::AnyHash)
        end

      # Array of GeoJSON Feature objects
      sig { returns(T::Array[Plaza::GeoJsonFeature]) }
      attr_accessor :features

      # Always `FeatureCollection`
      sig { returns(Plaza::FeatureCollection::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON FeatureCollection (RFC 7946). For paginated endpoints, metadata is
      # returned in HTTP response headers rather than the body:
      #
      # | Header          | Description                                      |
      # | --------------- | ------------------------------------------------ |
      # | `X-Limit`       | Requested result limit                           |
      # | `X-Has-More`    | `true` if more results exist                     |
      # | `X-Next-Cursor` | Opaque cursor for next page (cursor pagination)  |
      # | `X-Next-Offset` | Numeric offset for next page (offset pagination) |
      # | `Link`          | RFC 8288 `rel="next"` link to the next page      |
      #
      # Content-Type is `application/geo+json`.
      sig do
        params(
          features: T::Array[Plaza::GeoJsonFeature::OrHash],
          type: Plaza::FeatureCollection::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of GeoJSON Feature objects
        features:,
        # Always `FeatureCollection`
        type:
      )
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

      # Always `FeatureCollection`
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
