# typed: strong

module Plaza
  module Models
    class MultiPolygonGeometry < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::MultiPolygonGeometry, Plaza::Internal::AnyHash)
        end

      # Array of Polygon coordinate arrays
      sig { returns(T::Array[T::Array[T::Array[T::Array[Float]]]]) }
      attr_accessor :coordinates

      sig { returns(Plaza::MultiPolygonGeometry::Type::OrSymbol) }
      attr_accessor :type

      # GeoJSON MultiPolygon geometry per RFC 7946. An array of Polygon coordinate
      # arrays.
      sig do
        params(
          coordinates: T::Array[T::Array[T::Array[T::Array[Float]]]],
          type: Plaza::MultiPolygonGeometry::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of Polygon coordinate arrays
        coordinates:,
        type:
      )
      end

      sig do
        override.returns(
          {
            coordinates: T::Array[T::Array[T::Array[T::Array[Float]]]],
            type: Plaza::MultiPolygonGeometry::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::MultiPolygonGeometry::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MULTI_POLYGON =
          T.let(:MultiPolygon, Plaza::MultiPolygonGeometry::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::MultiPolygonGeometry::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
