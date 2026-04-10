# typed: strong

module Plaza
  module Models
    class IsochroneRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::IsochroneRequest, Plaza::Internal::AnyHash)
        end

      # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
      # order. Optional third element is altitude in meters.
      sig { returns(Plaza::PointGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::PointGeometry::OrHash).void }
      attr_writer :geometry

      # Travel time budgets in seconds. Each value produces one contour polygon.
      sig { returns(T::Array[Integer]) }
      attr_accessor :time

      # Travel mode (default: `auto`)
      sig { returns(T.nilable(Plaza::IsochroneRequest::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: Plaza::IsochroneRequest::Mode::OrSymbol).void }
      attr_writer :mode

      # Request body for isochrone calculation. Computes areas reachable from a point
      # within the given travel time(s).
      sig do
        params(
          geometry: Plaza::PointGeometry::OrHash,
          time: T::Array[Integer],
          mode: Plaza::IsochroneRequest::Mode::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
        # order. Optional third element is altitude in meters.
        geometry:,
        # Travel time budgets in seconds. Each value produces one contour polygon.
        time:,
        # Travel mode (default: `auto`)
        mode: nil
      )
      end

      sig do
        override.returns(
          {
            geometry: Plaza::PointGeometry,
            time: T::Array[Integer],
            mode: Plaza::IsochroneRequest::Mode::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Travel mode (default: `auto`)
      module Mode
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::IsochroneRequest::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Plaza::IsochroneRequest::Mode::TaggedSymbol)
        FOOT = T.let(:foot, Plaza::IsochroneRequest::Mode::TaggedSymbol)
        BICYCLE = T.let(:bicycle, Plaza::IsochroneRequest::Mode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::IsochroneRequest::Mode::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
