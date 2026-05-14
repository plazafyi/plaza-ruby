# typed: strong

module Plaza
  module Models
    class MatrixRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::MatrixRequest, Plaza::Internal::AnyHash) }

      # Array of destination coordinates as GeoJSON Points (max 50)
      sig { returns(T::Array[Plaza::PointGeometry]) }
      attr_accessor :destinations

      # Array of origin coordinates as GeoJSON Points (max 50)
      sig { returns(T::Array[Plaza::PointGeometry]) }
      attr_accessor :origins

      # Comma-separated list of annotations to include: `duration` (always included),
      # `distance`. Example: `duration,distance`.
      sig { returns(T.nilable(String)) }
      attr_reader :annotations

      sig { params(annotations: String).void }
      attr_writer :annotations

      # Fallback speed in km/h for pairs where no route exists. When set, unreachable
      # pairs get estimated values instead of null.
      sig { returns(T.nilable(Float)) }
      attr_accessor :fallback_speed

      # Travel mode (default: `auto`)
      sig { returns(T.nilable(Plaza::MatrixRequest::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: Plaza::MatrixRequest::Mode::OrSymbol).void }
      attr_writer :mode

      # Request body for distance matrix calculation. Computes travel durations (and
      # optionally distances) between every origin-destination pair. Maximum 2,500 pairs
      # (origins × destinations), each list capped at 50 coordinates.
      sig do
        params(
          destinations: T::Array[Plaza::PointGeometry::OrHash],
          origins: T::Array[Plaza::PointGeometry::OrHash],
          annotations: String,
          fallback_speed: T.nilable(Float),
          mode: Plaza::MatrixRequest::Mode::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of destination coordinates as GeoJSON Points (max 50)
        destinations:,
        # Array of origin coordinates as GeoJSON Points (max 50)
        origins:,
        # Comma-separated list of annotations to include: `duration` (always included),
        # `distance`. Example: `duration,distance`.
        annotations: nil,
        # Fallback speed in km/h for pairs where no route exists. When set, unreachable
        # pairs get estimated values instead of null.
        fallback_speed: nil,
        # Travel mode (default: `auto`)
        mode: nil
      )
      end

      sig do
        override.returns(
          {
            destinations: T::Array[Plaza::PointGeometry],
            origins: T::Array[Plaza::PointGeometry],
            annotations: String,
            fallback_speed: T.nilable(Float),
            mode: Plaza::MatrixRequest::Mode::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Travel mode (default: `auto`)
      module Mode
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::MatrixRequest::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Plaza::MatrixRequest::Mode::TaggedSymbol)
        FOOT = T.let(:foot, Plaza::MatrixRequest::Mode::TaggedSymbol)
        BICYCLE = T.let(:bicycle, Plaza::MatrixRequest::Mode::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::MatrixRequest::Mode::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
