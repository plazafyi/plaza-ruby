# typed: strong

module PlazaSDK
  module Models
    class MapMatchResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::MapMatchResult, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(PlazaSDK::MapMatchResult::Properties) }
      attr_reader :properties

      sig do
        params(properties: PlazaSDK::MapMatchResult::Properties::OrHash).void
      end
      attr_writer :properties

      sig { returns(PlazaSDK::MapMatchResult::Type::TaggedSymbol) }
      attr_accessor :type

      # Matched route legs between consecutive trace points
      sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
      attr_reader :legs

      sig { params(legs: T::Array[T::Hash[Symbol, T.anything]]).void }
      attr_writer :legs

      # Map matching result with snapped geometry
      sig do
        params(
          geometry: PlazaSDK::GeoJsonGeometry::OrHash,
          properties: PlazaSDK::MapMatchResult::Properties::OrHash,
          type: PlazaSDK::MapMatchResult::Type::OrSymbol,
          legs: T::Array[T::Hash[Symbol, T.anything]]
        ).returns(T.attached_class)
      end
      def self.new(
        geometry:,
        properties:,
        type:,
        # Matched route legs between consecutive trace points
        legs: nil
      )
      end

      sig do
        override.returns(
          {
            geometry: PlazaSDK::GeoJsonGeometry,
            properties: PlazaSDK::MapMatchResult::Properties,
            type: PlazaSDK::MapMatchResult::Type::TaggedSymbol,
            legs: T::Array[T::Hash[Symbol, T.anything]]
          }
        )
      end
      def to_hash
      end

      class Properties < PlazaSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              PlazaSDK::MapMatchResult::Properties,
              PlazaSDK::Internal::AnyHash
            )
          end

        # Match confidence score
        sig { returns(T.nilable(Float)) }
        attr_reader :confidence

        sig { params(confidence: Float).void }
        attr_writer :confidence

        # Total matched distance in meters
        sig { returns(T.nilable(Float)) }
        attr_reader :distance

        sig { params(distance: Float).void }
        attr_writer :distance

        # Estimated duration in seconds
        sig { returns(T.nilable(Float)) }
        attr_reader :duration

        sig { params(duration: Float).void }
        attr_writer :duration

        sig do
          params(confidence: Float, distance: Float, duration: Float).returns(
            T.attached_class
          )
        end
        def self.new(
          # Match confidence score
          confidence: nil,
          # Total matched distance in meters
          distance: nil,
          # Estimated duration in seconds
          duration: nil
        )
        end

        sig do
          override.returns(
            { confidence: Float, distance: Float, duration: Float }
          )
        end
        def to_hash
        end
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::MapMatchResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE = T.let(:Feature, PlazaSDK::MapMatchResult::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::MapMatchResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
