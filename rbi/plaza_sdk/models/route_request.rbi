# typed: strong

module PlazaSDK
  module Models
    class RouteRequest < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::RouteRequest, PlazaSDK::Internal::AnyHash)
        end

      # Destination point (GeoJSON Point geometry)
      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :destination

      sig { params(destination: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :destination

      # Origin point (GeoJSON Point geometry)
      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :origin

      sig { params(origin: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :origin

      sig { returns(T.nilable(PlazaSDK::RouteRequest::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: PlazaSDK::RouteRequest::Mode::OrSymbol).void }
      attr_writer :mode

      sig do
        params(
          destination: PlazaSDK::GeoJsonGeometry::OrHash,
          origin: PlazaSDK::GeoJsonGeometry::OrHash,
          mode: PlazaSDK::RouteRequest::Mode::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Destination point (GeoJSON Point geometry)
        destination:,
        # Origin point (GeoJSON Point geometry)
        origin:,
        mode: nil
      )
      end

      sig do
        override.returns(
          {
            destination: PlazaSDK::GeoJsonGeometry,
            origin: PlazaSDK::GeoJsonGeometry,
            mode: PlazaSDK::RouteRequest::Mode::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Mode
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::RouteRequest::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, PlazaSDK::RouteRequest::Mode::TaggedSymbol)
        FOOT = T.let(:foot, PlazaSDK::RouteRequest::Mode::TaggedSymbol)
        BICYCLE = T.let(:bicycle, PlazaSDK::RouteRequest::Mode::TaggedSymbol)

        sig do
          override.returns(T::Array[PlazaSDK::RouteRequest::Mode::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
