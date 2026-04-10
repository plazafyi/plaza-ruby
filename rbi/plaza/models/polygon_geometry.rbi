# typed: strong

module Plaza
  module Models
    class PolygonGeometry < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::PolygonGeometry, Plaza::Internal::AnyHash) }

      # Array of linear rings (first = exterior, rest = holes)
      sig { returns(T::Array[T::Array[T::Array[Float]]]) }
      attr_accessor :coordinates

      sig { returns(Plaza::PolygonGeometry::Type::OrSymbol) }
      attr_accessor :type

      # GeoJSON Polygon geometry per RFC 7946. An array of linear rings where the first
      # ring is the exterior boundary and subsequent rings are holes. Each ring must
      # have at least 4 positions with the first and last being identical.
      sig do
        params(
          coordinates: T::Array[T::Array[T::Array[Float]]],
          type: Plaza::PolygonGeometry::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of linear rings (first = exterior, rest = holes)
        coordinates:,
        type:
      )
      end

      sig do
        override.returns(
          {
            coordinates: T::Array[T::Array[T::Array[Float]]],
            type: Plaza::PolygonGeometry::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::PolygonGeometry::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        POLYGON = T.let(:Polygon, Plaza::PolygonGeometry::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::PolygonGeometry::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
