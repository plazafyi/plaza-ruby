# typed: strong

module Plaza
  module Models
    class NearestResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::NearestResult, Plaza::Internal::AnyHash) }

      # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
      # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      # Snap result metadata
      sig { returns(Plaza::NearestResult::Properties) }
      attr_reader :properties

      sig { params(properties: Plaza::NearestResult::Properties::OrHash).void }
      attr_writer :properties

      sig { returns(Plaza::NearestResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON Point Feature representing the nearest point on the road network to the
      # input coordinate. Used for snapping GPS coordinates to roads.
      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          properties: Plaza::NearestResult::Properties::OrHash,
          type: Plaza::NearestResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
        # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
        geometry:,
        # Snap result metadata
        properties:,
        type:
      )
      end

      sig do
        override.returns(
          {
            geometry: Plaza::GeoJsonGeometry,
            properties: Plaza::NearestResult::Properties,
            type: Plaza::NearestResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::NearestResult::Properties, Plaza::Internal::AnyHash)
          end

        # Distance from the input coordinate to the snapped point in meters
        sig { returns(T.nilable(Float)) }
        attr_reader :distance_m

        sig { params(distance_m: Float).void }
        attr_writer :distance_m

        # ID of the road network edge that was snapped to
        sig { returns(T.nilable(Integer)) }
        attr_reader :edge_id

        sig { params(edge_id: Integer).void }
        attr_writer :edge_id

        # Length of the matched road edge in meters
        sig { returns(T.nilable(Float)) }
        attr_reader :edge_length_m

        sig { params(edge_length_m: Float).void }
        attr_writer :edge_length_m

        # OSM highway tag value (e.g. `residential`, `primary`, `motorway`)
        sig { returns(T.nilable(String)) }
        attr_accessor :highway

        # OSM way ID of the matched road segment
        sig { returns(T.nilable(Integer)) }
        attr_reader :osm_way_id

        sig { params(osm_way_id: Integer).void }
        attr_writer :osm_way_id

        # OSM surface tag value (e.g. `asphalt`, `gravel`, `paved`)
        sig { returns(T.nilable(String)) }
        attr_accessor :surface

        # Snap result metadata
        sig do
          params(
            distance_m: Float,
            edge_id: Integer,
            edge_length_m: Float,
            highway: T.nilable(String),
            osm_way_id: Integer,
            surface: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Distance from the input coordinate to the snapped point in meters
          distance_m: nil,
          # ID of the road network edge that was snapped to
          edge_id: nil,
          # Length of the matched road edge in meters
          edge_length_m: nil,
          # OSM highway tag value (e.g. `residential`, `primary`, `motorway`)
          highway: nil,
          # OSM way ID of the matched road segment
          osm_way_id: nil,
          # OSM surface tag value (e.g. `asphalt`, `gravel`, `paved`)
          surface: nil
        )
        end

        sig do
          override.returns(
            {
              distance_m: Float,
              edge_id: Integer,
              edge_length_m: Float,
              highway: T.nilable(String),
              osm_way_id: Integer,
              surface: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::NearestResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE = T.let(:Feature, Plaza::NearestResult::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::NearestResult::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
