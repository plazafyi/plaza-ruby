# typed: strong

module Plaza
  module Models
    class MultiLineStringGeometry < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::MultiLineStringGeometry, Plaza::Internal::AnyHash)
        end

      # Array of LineString coordinate arrays
      sig { returns(T::Array[T::Array[T::Array[Float]]]) }
      attr_accessor :coordinates

      sig { returns(Plaza::MultiLineStringGeometry::Type::OrSymbol) }
      attr_accessor :type

      # GeoJSON MultiLineString geometry per RFC 7946. An array of LineString coordinate
      # arrays.
      sig do
        params(
          coordinates: T::Array[T::Array[T::Array[Float]]],
          type: Plaza::MultiLineStringGeometry::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of LineString coordinate arrays
        coordinates:,
        type:
      )
      end

      sig do
        override.returns(
          {
            coordinates: T::Array[T::Array[T::Array[Float]]],
            type: Plaza::MultiLineStringGeometry::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::MultiLineStringGeometry::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MULTI_LINE_STRING =
          T.let(
            :MultiLineString,
            Plaza::MultiLineStringGeometry::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Plaza::MultiLineStringGeometry::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
