# typed: strong

module PlazaSDK
  module Models
    class OptimizeRequest < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::OptimizeRequest, PlazaSDK::Internal::AnyHash)
        end

      # Waypoints to visit (GeoJSON MultiPoint geometry, minimum 2 points)
      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :waypoints

      sig { params(waypoints: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :waypoints

      # Travel mode (default: auto)
      sig { returns(T.nilable(PlazaSDK::OptimizeRequest::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: PlazaSDK::OptimizeRequest::Mode::OrSymbol).void }
      attr_writer :mode

      # Whether route returns to start (default: true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :roundtrip

      sig { params(roundtrip: T::Boolean).void }
      attr_writer :roundtrip

      # Route optimization request through waypoints
      sig do
        params(
          waypoints: PlazaSDK::GeoJsonGeometry::OrHash,
          mode: PlazaSDK::OptimizeRequest::Mode::OrSymbol,
          roundtrip: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Waypoints to visit (GeoJSON MultiPoint geometry, minimum 2 points)
        waypoints:,
        # Travel mode (default: auto)
        mode: nil,
        # Whether route returns to start (default: true)
        roundtrip: nil
      )
      end

      sig do
        override.returns(
          {
            waypoints: PlazaSDK::GeoJsonGeometry,
            mode: PlazaSDK::OptimizeRequest::Mode::OrSymbol,
            roundtrip: T::Boolean
          }
        )
      end
      def to_hash
      end

      # Travel mode (default: auto)
      module Mode
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::OptimizeRequest::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, PlazaSDK::OptimizeRequest::Mode::TaggedSymbol)
        FOOT = T.let(:foot, PlazaSDK::OptimizeRequest::Mode::TaggedSymbol)
        BICYCLE = T.let(:bicycle, PlazaSDK::OptimizeRequest::Mode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::OptimizeRequest::Mode::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
