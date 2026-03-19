# typed: strong

module Plaza
  module Models
    class RouteResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::RouteResult, Plaza::Internal::AnyHash) }

      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(Plaza::RouteResult::Properties) }
      attr_reader :properties

      sig { params(properties: Plaza::RouteResult::Properties::OrHash).void }
      attr_writer :properties

      sig { returns(Plaza::RouteResult::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          properties: Plaza::RouteResult::Properties::OrHash,
          type: Plaza::RouteResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(geometry:, properties:, type:)
      end

      sig do
        override.returns(
          {
            geometry: Plaza::GeoJsonGeometry,
            properties: Plaza::RouteResult::Properties,
            type: Plaza::RouteResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::RouteResult::Properties, Plaza::Internal::AnyHash)
          end

        # Total distance in meters
        sig { returns(T.nilable(Float)) }
        attr_reader :distance

        sig { params(distance: Float).void }
        attr_writer :distance

        # Estimated duration in seconds
        sig { returns(T.nilable(Float)) }
        attr_reader :duration

        sig { params(duration: Float).void }
        attr_writer :duration

        # Travel mode used
        sig { returns(T.nilable(String)) }
        attr_reader :mode

        sig { params(mode: String).void }
        attr_writer :mode

        sig do
          params(distance: Float, duration: Float, mode: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Total distance in meters
          distance: nil,
          # Estimated duration in seconds
          duration: nil,
          # Travel mode used
          mode: nil
        )
        end

        sig do
          override.returns({ distance: Float, duration: Float, mode: String })
        end
        def to_hash
        end
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Plaza::RouteResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE = T.let(:Feature, Plaza::RouteResult::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::RouteResult::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
