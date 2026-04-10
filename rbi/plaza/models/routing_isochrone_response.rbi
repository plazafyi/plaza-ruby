# typed: strong

module Plaza
  module Models
    class RoutingIsochroneResponse < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Plaza::Models::RoutingIsochroneResponse,
            Plaza::Internal::AnyHash
          )
        end

      # Array of isochrone polygon Features, one per contour
      sig { returns(T::Array[Plaza::GeoJsonFeature]) }
      attr_accessor :features

      # Always `FeatureCollection`
      sig do
        returns(Plaza::Models::RoutingIsochroneResponse::Type::TaggedSymbol)
      end
      attr_accessor :type

      # GeoJSON FeatureCollection of isochrone polygons — areas reachable within the
      # specified travel time(s). Each Feature is a Polygon contour with travel time and
      # area metadata in properties.
      sig do
        params(
          features: T::Array[Plaza::GeoJsonFeature::OrHash],
          type: Plaza::Models::RoutingIsochroneResponse::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of isochrone polygon Features, one per contour
        features:,
        # Always `FeatureCollection`
        type:
      )
      end

      sig do
        override.returns(
          {
            features: T::Array[Plaza::GeoJsonFeature],
            type: Plaza::Models::RoutingIsochroneResponse::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Always `FeatureCollection`
      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Plaza::Models::RoutingIsochroneResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(
            :FeatureCollection,
            Plaza::Models::RoutingIsochroneResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Plaza::Models::RoutingIsochroneResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
