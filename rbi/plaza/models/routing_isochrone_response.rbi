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

      # Array of isochrone polygon Features (multi-contour only)
      sig { returns(T.nilable(T::Array[Plaza::GeoJsonFeature])) }
      attr_accessor :features

      # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
      # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
      sig { returns(T.nilable(Plaza::GeoJsonGeometry)) }
      attr_reader :geometry

      sig { params(geometry: T.nilable(Plaza::GeoJsonGeometry::OrHash)).void }
      attr_writer :geometry

      # Isochrone metadata
      sig do
        returns(T.nilable(Plaza::Models::RoutingIsochroneResponse::Properties))
      end
      attr_reader :properties

      sig do
        params(
          properties:
            T.nilable(
              Plaza::Models::RoutingIsochroneResponse::Properties::OrHash
            )
        ).void
      end
      attr_writer :properties

      # `Feature` for single contour, `FeatureCollection` for multiple contours
      sig do
        returns(
          T.nilable(Plaza::Models::RoutingIsochroneResponse::Type::TaggedSymbol)
        )
      end
      attr_reader :type

      sig do
        params(
          type: Plaza::Models::RoutingIsochroneResponse::Type::OrSymbol
        ).void
      end
      attr_writer :type

      # GeoJSON Feature or FeatureCollection representing isochrone polygons — areas
      # reachable within the specified travel time(s). Single time value returns a
      # Feature; comma-separated times return a FeatureCollection with one polygon per
      # contour.
      sig do
        params(
          features: T.nilable(T::Array[Plaza::GeoJsonFeature::OrHash]),
          geometry: T.nilable(Plaza::GeoJsonGeometry::OrHash),
          properties:
            T.nilable(
              Plaza::Models::RoutingIsochroneResponse::Properties::OrHash
            ),
          type: Plaza::Models::RoutingIsochroneResponse::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of isochrone polygon Features (multi-contour only)
        features: nil,
        # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
        # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
        geometry: nil,
        # Isochrone metadata
        properties: nil,
        # `Feature` for single contour, `FeatureCollection` for multiple contours
        type: nil
      )
      end

      sig do
        override.returns(
          {
            features: T.nilable(T::Array[Plaza::GeoJsonFeature]),
            geometry: T.nilable(Plaza::GeoJsonGeometry),
            properties:
              T.nilable(Plaza::Models::RoutingIsochroneResponse::Properties),
            type: Plaza::Models::RoutingIsochroneResponse::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Plaza::Models::RoutingIsochroneResponse::Properties,
              Plaza::Internal::AnyHash
            )
          end

        # Area of the isochrone polygon in square meters (multi-contour features only)
        sig { returns(T.nilable(Float)) }
        attr_accessor :area_m2

        # Maximum actual travel cost in seconds to the isochrone boundary (single contour
        # only)
        sig { returns(T.nilable(Float)) }
        attr_accessor :max_cost_s

        # Travel mode used for the isochrone calculation
        sig do
          returns(
            T.nilable(
              Plaza::Models::RoutingIsochroneResponse::Properties::Mode::TaggedSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode:
              Plaza::Models::RoutingIsochroneResponse::Properties::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Travel time budget in seconds
        sig { returns(T.nilable(Float)) }
        attr_reader :time_seconds

        sig { params(time_seconds: Float).void }
        attr_writer :time_seconds

        # Number of road network vertices within the isochrone
        sig { returns(T.nilable(Integer)) }
        attr_reader :vertices_reached

        sig { params(vertices_reached: Integer).void }
        attr_writer :vertices_reached

        # Isochrone metadata
        sig do
          params(
            area_m2: T.nilable(Float),
            max_cost_s: T.nilable(Float),
            mode:
              Plaza::Models::RoutingIsochroneResponse::Properties::Mode::OrSymbol,
            time_seconds: Float,
            vertices_reached: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Area of the isochrone polygon in square meters (multi-contour features only)
          area_m2: nil,
          # Maximum actual travel cost in seconds to the isochrone boundary (single contour
          # only)
          max_cost_s: nil,
          # Travel mode used for the isochrone calculation
          mode: nil,
          # Travel time budget in seconds
          time_seconds: nil,
          # Number of road network vertices within the isochrone
          vertices_reached: nil
        )
        end

        sig do
          override.returns(
            {
              area_m2: T.nilable(Float),
              max_cost_s: T.nilable(Float),
              mode:
                Plaza::Models::RoutingIsochroneResponse::Properties::Mode::TaggedSymbol,
              time_seconds: Float,
              vertices_reached: Integer
            }
          )
        end
        def to_hash
        end

        # Travel mode used for the isochrone calculation
        module Mode
          extend Plaza::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Plaza::Models::RoutingIsochroneResponse::Properties::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AUTO =
            T.let(
              :auto,
              Plaza::Models::RoutingIsochroneResponse::Properties::Mode::TaggedSymbol
            )
          FOOT =
            T.let(
              :foot,
              Plaza::Models::RoutingIsochroneResponse::Properties::Mode::TaggedSymbol
            )
          BICYCLE =
            T.let(
              :bicycle,
              Plaza::Models::RoutingIsochroneResponse::Properties::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Plaza::Models::RoutingIsochroneResponse::Properties::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # `Feature` for single contour, `FeatureCollection` for multiple contours
      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Plaza::Models::RoutingIsochroneResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE =
          T.let(
            :Feature,
            Plaza::Models::RoutingIsochroneResponse::Type::TaggedSymbol
          )
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
