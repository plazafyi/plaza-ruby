# typed: strong

module Plaza
  module Models
    class MatrixRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::MatrixRequest, Plaza::Internal::AnyHash) }

      # Array of destination coordinates (max 50)
      sig { returns(T::Array[Plaza::MatrixRequest::Destination]) }
      attr_accessor :destinations

      # Array of origin coordinates (max 50)
      sig { returns(T::Array[Plaza::MatrixRequest::Origin]) }
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
          destinations: T::Array[Plaza::MatrixRequest::Destination::OrHash],
          origins: T::Array[Plaza::MatrixRequest::Origin::OrHash],
          annotations: String,
          fallback_speed: T.nilable(Float),
          mode: Plaza::MatrixRequest::Mode::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of destination coordinates (max 50)
        destinations:,
        # Array of origin coordinates (max 50)
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
            destinations: T::Array[Plaza::MatrixRequest::Destination],
            origins: T::Array[Plaza::MatrixRequest::Origin],
            annotations: String,
            fallback_speed: T.nilable(Float),
            mode: Plaza::MatrixRequest::Mode::OrSymbol
          }
        )
      end
      def to_hash
      end

      class Destination < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::MatrixRequest::Destination, Plaza::Internal::AnyHash)
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

      class Origin < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::MatrixRequest::Origin, Plaza::Internal::AnyHash)
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
