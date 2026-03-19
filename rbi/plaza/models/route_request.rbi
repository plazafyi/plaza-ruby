# typed: strong

module Plaza
  module Models
    class RouteRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::RouteRequest, Plaza::Internal::AnyHash) }

      # Destination point (GeoJSON Point geometry)
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :destination

      sig { params(destination: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :destination

      # Origin point (GeoJSON Point geometry)
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :origin

      sig { params(origin: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :origin

      sig { returns(T.nilable(Plaza::RouteRequest::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: Plaza::RouteRequest::Mode::OrSymbol).void }
      attr_writer :mode

      sig do
        params(
          destination: Plaza::GeoJsonGeometry::OrHash,
          origin: Plaza::GeoJsonGeometry::OrHash,
          mode: Plaza::RouteRequest::Mode::OrSymbol
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
            destination: Plaza::GeoJsonGeometry,
            origin: Plaza::GeoJsonGeometry,
            mode: Plaza::RouteRequest::Mode::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Mode
        extend Plaza::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Plaza::RouteRequest::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Plaza::RouteRequest::Mode::TaggedSymbol)
        FOOT = T.let(:foot, Plaza::RouteRequest::Mode::TaggedSymbol)
        BICYCLE = T.let(:bicycle, Plaza::RouteRequest::Mode::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::RouteRequest::Mode::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
