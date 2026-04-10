# typed: strong

module Plaza
  module Models
    class LineStringGeometry < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::LineStringGeometry, Plaza::Internal::AnyHash)
        end

      # Array of [lng, lat] or [lng, lat, alt] positions
      sig { returns(T::Array[T::Array[Float]]) }
      attr_accessor :coordinates

      sig { returns(Plaza::LineStringGeometry::Type::OrSymbol) }
      attr_accessor :type

      # GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more
      # positions.
      sig do
        params(
          coordinates: T::Array[T::Array[Float]],
          type: Plaza::LineStringGeometry::Type::OrSymbol
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
            type: Plaza::LineStringGeometry::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::LineStringGeometry::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LINE_STRING =
          T.let(:LineString, Plaza::LineStringGeometry::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::LineStringGeometry::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
