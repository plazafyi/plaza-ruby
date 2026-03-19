# typed: strong

module Plaza
  module Models
    class GeoJsonGeometry < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::GeoJsonGeometry, Plaza::Internal::AnyHash) }

      # GeoJSON coordinates array (nesting depth varies by geometry type)
      sig { returns(Plaza::GeoJsonGeometry::Coordinates::Variants) }
      attr_accessor :coordinates

      sig { returns(Plaza::GeoJsonGeometry::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          coordinates: Plaza::GeoJsonGeometry::Coordinates::Variants,
          type: Plaza::GeoJsonGeometry::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON coordinates array (nesting depth varies by geometry type)
        coordinates:,
        type:
      )
      end

      sig do
        override.returns(
          {
            coordinates: Plaza::GeoJsonGeometry::Coordinates::Variants,
            type: Plaza::GeoJsonGeometry::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      # GeoJSON coordinates array (nesting depth varies by geometry type)
      module Coordinates
        extend Plaza::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Array[Float],
              T::Array[T::Array[Float]],
              T::Array[T::Array[T::Array[Float]]],
              T::Array[T::Array[T::Array[T::Array[Float]]]]
            )
          end

        sig do
          override.returns(
            T::Array[Plaza::GeoJsonGeometry::Coordinates::Variants]
          )
        end
        def self.variants
        end

        FloatArray =
          T.let(
            Plaza::Internal::Type::ArrayOf[Float],
            Plaza::Internal::Type::Converter
          )

        UnionMember1Array =
          T.let(
            Plaza::Internal::Type::ArrayOf[
              Plaza::Internal::Type::ArrayOf[Float]
            ],
            Plaza::Internal::Type::Converter
          )

        UnionMember2Array =
          T.let(
            Plaza::Internal::Type::ArrayOf[
              Plaza::Internal::Type::ArrayOf[
                Plaza::Internal::Type::ArrayOf[Float]
              ]
            ],
            Plaza::Internal::Type::Converter
          )

        UnionMember3Array =
          T.let(
            Plaza::Internal::Type::ArrayOf[
              Plaza::Internal::Type::ArrayOf[
                Plaza::Internal::Type::ArrayOf[
                  Plaza::Internal::Type::ArrayOf[Float]
                ]
              ]
            ],
            Plaza::Internal::Type::Converter
          )
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::GeoJsonGeometry::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        POINT = T.let(:Point, Plaza::GeoJsonGeometry::Type::TaggedSymbol)
        LINE_STRING =
          T.let(:LineString, Plaza::GeoJsonGeometry::Type::TaggedSymbol)
        POLYGON = T.let(:Polygon, Plaza::GeoJsonGeometry::Type::TaggedSymbol)
        MULTI_POINT =
          T.let(:MultiPoint, Plaza::GeoJsonGeometry::Type::TaggedSymbol)
        MULTI_LINE_STRING =
          T.let(:MultiLineString, Plaza::GeoJsonGeometry::Type::TaggedSymbol)
        MULTI_POLYGON =
          T.let(:MultiPolygon, Plaza::GeoJsonGeometry::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::GeoJsonGeometry::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
