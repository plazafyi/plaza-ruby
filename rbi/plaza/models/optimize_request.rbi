# typed: strong

module Plaza
  module Models
    class OptimizeRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::OptimizeRequest, Plaza::Internal::AnyHash) }

      # Waypoints to visit in optimized order (2-50 points)
      sig { returns(T::Array[Plaza::OptimizeRequest::Waypoint]) }
      attr_accessor :waypoints

      # Travel mode (default: `auto`)
      sig { returns(T.nilable(Plaza::OptimizeRequest::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: Plaza::OptimizeRequest::Mode::OrSymbol).void }
      attr_writer :mode

      # Whether the route should return to the starting waypoint (default: true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :roundtrip

      sig { params(roundtrip: T::Boolean).void }
      attr_writer :roundtrip

      # Route optimization (Travelling Salesman) request. Finds the most efficient order
      # to visit a set of waypoints. Minimum 2 waypoints, maximum 50. For large inputs,
      # the request may be processed asynchronously.
      sig do
        params(
          waypoints: T::Array[Plaza::OptimizeRequest::Waypoint::OrHash],
          mode: Plaza::OptimizeRequest::Mode::OrSymbol,
          roundtrip: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Waypoints to visit in optimized order (2-50 points)
        waypoints:,
        # Travel mode (default: `auto`)
        mode: nil,
        # Whether the route should return to the starting waypoint (default: true)
        roundtrip: nil
      )
      end

      sig do
        override.returns(
          {
            waypoints: T::Array[Plaza::OptimizeRequest::Waypoint],
            mode: Plaza::OptimizeRequest::Mode::OrSymbol,
            roundtrip: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Waypoint < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::OptimizeRequest::Waypoint, Plaza::Internal::AnyHash)
          end

        # Latitude in decimal degrees (-90 to 90)
        sig { returns(Float) }
        attr_accessor :lat

        # Longitude in decimal degrees (-180 to 180)
        sig { returns(Float) }
        attr_accessor :lng

        # Geographic coordinate as a JSON object with `lat` and `lng` fields.
        sig { params(lat: Float, lng: Float).returns(T.attached_class) }
        def self.new(
          # Latitude in decimal degrees (-90 to 90)
          lat:,
          # Longitude in decimal degrees (-180 to 180)
          lng:
        )
        end

        sig { override.returns({ lat: Float, lng: Float }) }
        def to_hash
        end
      end

      # Travel mode (default: `auto`)
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
