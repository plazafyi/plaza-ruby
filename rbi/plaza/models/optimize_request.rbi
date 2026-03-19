# typed: strong

module Plaza
  module Models
    class OptimizeRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::OptimizeRequest, Plaza::Internal::AnyHash) }

      # Waypoints to visit (GeoJSON MultiPoint geometry, minimum 2 points)
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :waypoints

      sig { params(waypoints: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :waypoints

      # Travel mode (default: auto)
      sig { returns(T.nilable(Plaza::OptimizeRequest::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: Plaza::OptimizeRequest::Mode::OrSymbol).void }
      attr_writer :mode

      # Whether route returns to start (default: true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :roundtrip

      sig { params(roundtrip: T::Boolean).void }
      attr_writer :roundtrip

      # Route optimization request through waypoints
      sig do
        params(
          waypoints: Plaza::GeoJsonGeometry::OrHash,
          mode: Plaza::OptimizeRequest::Mode::OrSymbol,
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
            waypoints: Plaza::GeoJsonGeometry,
            mode: Plaza::OptimizeRequest::Mode::OrSymbol,
            roundtrip: T::Boolean
          }
        )
      end
      def to_hash
      end

      # Travel mode (default: auto)
      module Mode
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::OptimizeRequest::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Plaza::OptimizeRequest::Mode::TaggedSymbol)
        FOOT = T.let(:foot, Plaza::OptimizeRequest::Mode::TaggedSymbol)
        BICYCLE = T.let(:bicycle, Plaza::OptimizeRequest::Mode::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::OptimizeRequest::Mode::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
