# typed: strong

module PlazaSDK
  module Models
    class RouteResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::RouteResult, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(PlazaSDK::RouteResult::Properties) }
      attr_reader :properties

      sig { params(properties: PlazaSDK::RouteResult::Properties::OrHash).void }
      attr_writer :properties

      sig { returns(PlazaSDK::RouteResult::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          geometry: PlazaSDK::GeoJsonGeometry::OrHash,
          properties: PlazaSDK::RouteResult::Properties::OrHash,
          type: PlazaSDK::RouteResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(geometry:, properties:, type:)
      end

      sig do
        override.returns(
          {
            geometry: PlazaSDK::GeoJsonGeometry,
            properties: PlazaSDK::RouteResult::Properties,
            type: PlazaSDK::RouteResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < PlazaSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              PlazaSDK::RouteResult::Properties,
              PlazaSDK::Internal::AnyHash
            )
          end

        # Total distance in meters
        sig { returns(T.nilable(Float)) }
        attr_reader :distance

        sig { params(distance: Float).void }
        attr_writer :distance

        # Estimated duration in seconds
        sig { returns(T.nilable(Float)) }
        attr_reader :duration

        sig { params(duration: Float).void }
        attr_writer :duration

        # Travel mode used
        sig { returns(T.nilable(String)) }
        attr_reader :mode

        sig { params(mode: String).void }
        attr_writer :mode

        sig do
          params(distance: Float, duration: Float, mode: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Total distance in meters
          distance: nil,
          # Estimated duration in seconds
          duration: nil,
          # Travel mode used
          mode: nil
        )
        end

        sig do
          override.returns({ distance: Float, duration: Float, mode: String })
        end
        def to_hash
        end
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::RouteResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE = T.let(:Feature, PlazaSDK::RouteResult::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[PlazaSDK::RouteResult::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
