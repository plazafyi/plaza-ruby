# typed: strong

module Plaza
  module Models
    class PointGeometry < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::PointGeometry, Plaza::Internal::AnyHash) }

      # [longitude, latitude] or [longitude, latitude, altitude]
      sig { returns(T::Array[Float]) }
      attr_accessor :coordinates

      sig { returns(Plaza::PointGeometry::Type::OrSymbol) }
      attr_accessor :type

      # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
      # order. Optional third element is altitude in meters.
      sig do
        params(
          coordinates: T::Array[Float],
          type: Plaza::PointGeometry::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # [longitude, latitude] or [longitude, latitude, altitude]
        coordinates:,
        type:
      )
      end

      sig do
        override.returns(
          {
            coordinates: T::Array[Float],
            type: Plaza::PointGeometry::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::PointGeometry::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        POINT = T.let(:Point, Plaza::PointGeometry::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::PointGeometry::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
