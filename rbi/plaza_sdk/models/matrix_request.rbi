# typed: strong

module PlazaSDK
  module Models
    class MatrixRequest < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::MatrixRequest, PlazaSDK::Internal::AnyHash)
        end

      # Destination points (GeoJSON MultiPoint geometry)
      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :destinations

      sig { params(destinations: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :destinations

      # Origin points (GeoJSON MultiPoint geometry)
      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :origins

      sig { params(origins: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :origins

      # Travel mode
      sig { returns(T.nilable(PlazaSDK::MatrixRequest::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: PlazaSDK::MatrixRequest::Mode::OrSymbol).void }
      attr_writer :mode

      sig do
        params(
          destinations: PlazaSDK::GeoJsonGeometry::OrHash,
          origins: PlazaSDK::GeoJsonGeometry::OrHash,
          mode: PlazaSDK::MatrixRequest::Mode::OrSymbol
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
            destinations: PlazaSDK::GeoJsonGeometry,
            origins: PlazaSDK::GeoJsonGeometry,
            mode: PlazaSDK::MatrixRequest::Mode::OrSymbol
          }
        )
      end
      def to_hash
      end

      # Travel mode
      module Mode
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::MatrixRequest::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, PlazaSDK::MatrixRequest::Mode::TaggedSymbol)
        FOOT = T.let(:foot, PlazaSDK::MatrixRequest::Mode::TaggedSymbol)
        BICYCLE = T.let(:bicycle, PlazaSDK::MatrixRequest::Mode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::MatrixRequest::Mode::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
