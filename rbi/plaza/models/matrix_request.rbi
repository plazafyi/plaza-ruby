# typed: strong

module Plaza
  module Models
    class MatrixRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::MatrixRequest, Plaza::Internal::AnyHash) }

      # Destination points (GeoJSON MultiPoint geometry)
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :destinations

      sig { params(destinations: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :destinations

      # Origin points (GeoJSON MultiPoint geometry)
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :origins

      sig { params(origins: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :origins

      # Travel mode
      sig { returns(T.nilable(Plaza::MatrixRequest::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: Plaza::MatrixRequest::Mode::OrSymbol).void }
      attr_writer :mode

      sig do
        params(
          destinations: Plaza::GeoJsonGeometry::OrHash,
          origins: Plaza::GeoJsonGeometry::OrHash,
          mode: Plaza::MatrixRequest::Mode::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Destination points (GeoJSON MultiPoint geometry)
        destinations:,
        # Origin points (GeoJSON MultiPoint geometry)
        origins:,
        # Travel mode
        mode: nil
      )
      end

      sig do
        override.returns(
          {
            destinations: Plaza::GeoJsonGeometry,
            origins: Plaza::GeoJsonGeometry,
            mode: Plaza::MatrixRequest::Mode::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Travel mode
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
