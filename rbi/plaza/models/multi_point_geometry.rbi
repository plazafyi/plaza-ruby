# typed: strong

module Plaza
  module Models
    class MultiPointGeometry < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::MultiPointGeometry, Plaza::Internal::AnyHash)
        end

      # Array of [lng, lat] or [lng, lat, alt] positions
      sig { returns(T::Array[T::Array[Float]]) }
      attr_accessor :coordinates

      sig { returns(Plaza::MultiPointGeometry::Type::OrSymbol) }
      attr_accessor :type

      # GeoJSON MultiPoint geometry per RFC 7946. An array of positions.
      sig do
        params(
          coordinates: T::Array[T::Array[Float]],
          type: Plaza::MultiPointGeometry::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of [lng, lat] or [lng, lat, alt] positions
        coordinates:,
        type:
      )
      end

      sig do
        override.returns(
          {
            coordinates: T::Array[T::Array[Float]],
            type: Plaza::MultiPointGeometry::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::MultiPointGeometry::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MULTI_POINT =
          T.let(:MultiPoint, Plaza::MultiPointGeometry::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::MultiPointGeometry::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
