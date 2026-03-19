# typed: strong

module PlazaSDK
  module Models
    class GeoJsonGeometry < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::GeoJsonGeometry, PlazaSDK::Internal::AnyHash)
        end

      # GeoJSON coordinates array (nesting depth varies by geometry type)
      sig { returns(PlazaSDK::GeoJsonGeometry::Coordinates::Variants) }
      attr_accessor :coordinates

      sig { returns(PlazaSDK::GeoJsonGeometry::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          coordinates: PlazaSDK::GeoJsonGeometry::Coordinates::Variants,
          type: PlazaSDK::GeoJsonGeometry::Type::OrSymbol
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
            coordinates: PlazaSDK::GeoJsonGeometry::Coordinates::Variants,
            type: PlazaSDK::GeoJsonGeometry::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      # GeoJSON coordinates array (nesting depth varies by geometry type)
      module Coordinates
        extend PlazaSDK::Internal::Type::Union

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
            T::Array[PlazaSDK::GeoJsonGeometry::Coordinates::Variants]
          )
        end
        def self.variants
        end

        FloatArray =
          T.let(
            PlazaSDK::Internal::Type::ArrayOf[Float],
            PlazaSDK::Internal::Type::Converter
          )

        UnionMember1Array =
          T.let(
            PlazaSDK::Internal::Type::ArrayOf[
              PlazaSDK::Internal::Type::ArrayOf[Float]
            ],
            PlazaSDK::Internal::Type::Converter
          )

        UnionMember2Array =
          T.let(
            PlazaSDK::Internal::Type::ArrayOf[
              PlazaSDK::Internal::Type::ArrayOf[
                PlazaSDK::Internal::Type::ArrayOf[Float]
              ]
            ],
            PlazaSDK::Internal::Type::Converter
          )

        UnionMember3Array =
          T.let(
            PlazaSDK::Internal::Type::ArrayOf[
              PlazaSDK::Internal::Type::ArrayOf[
                PlazaSDK::Internal::Type::ArrayOf[
                  PlazaSDK::Internal::Type::ArrayOf[Float]
                ]
              ]
            ],
            PlazaSDK::Internal::Type::Converter
          )
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::GeoJsonGeometry::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        POINT = T.let(:Point, PlazaSDK::GeoJsonGeometry::Type::TaggedSymbol)
        LINE_STRING =
          T.let(:LineString, PlazaSDK::GeoJsonGeometry::Type::TaggedSymbol)
        POLYGON = T.let(:Polygon, PlazaSDK::GeoJsonGeometry::Type::TaggedSymbol)
        MULTI_POINT =
          T.let(:MultiPoint, PlazaSDK::GeoJsonGeometry::Type::TaggedSymbol)
        MULTI_LINE_STRING =
          T.let(:MultiLineString, PlazaSDK::GeoJsonGeometry::Type::TaggedSymbol)
        MULTI_POLYGON =
          T.let(:MultiPolygon, PlazaSDK::GeoJsonGeometry::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::GeoJsonGeometry::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
