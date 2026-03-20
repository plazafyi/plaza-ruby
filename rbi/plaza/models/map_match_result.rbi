# typed: strong

module Plaza
  module Models
    class MapMatchResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::MapMatchResult, Plaza::Internal::AnyHash) }

      # Snapped tracepoint Features in input order
      sig { returns(T::Array[Plaza::MapMatchResult::Feature]) }
      attr_accessor :features

      # Matched sub-routes. Each matching connects a contiguous sequence of tracepoints
      # that could be matched to roads.
      sig { returns(T::Array[T::Hash[Symbol, T.anything]]) }
      attr_accessor :matchings

      sig { returns(Plaza::MapMatchResult::Type::TaggedSymbol) }
      attr_accessor :type

      # Map matching result as a GeoJSON FeatureCollection. Each Feature is a snapped
      # tracepoint. The top-level `matchings` array contains the matched sub-routes
      # connecting consecutive tracepoints.
      sig do
        params(
          features: T::Array[Plaza::MapMatchResult::Feature::OrHash],
          matchings: T::Array[T::Hash[Symbol, T.anything]],
          type: Plaza::MapMatchResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Snapped tracepoint Features in input order
        features:,
        # Matched sub-routes. Each matching connects a contiguous sequence of tracepoints
        # that could be matched to roads.
        matchings:,
        type:
      )
      end

      sig do
        override.returns(
          {
            features: T::Array[Plaza::MapMatchResult::Feature],
            matchings: T::Array[T::Hash[Symbol, T.anything]],
            type: Plaza::MapMatchResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Feature < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::MapMatchResult::Feature, Plaza::Internal::AnyHash)
          end

        # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
        # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
        sig { returns(Plaza::GeoJsonGeometry) }
        attr_reader :geometry

        sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
        attr_writer :geometry

        sig { returns(Plaza::MapMatchResult::Feature::Properties) }
        attr_reader :properties

        sig do
          params(
            properties: Plaza::MapMatchResult::Feature::Properties::OrHash
          ).void
        end
        attr_writer :properties

        sig { returns(Plaza::MapMatchResult::Feature::Type::TaggedSymbol) }
        attr_accessor :type

        # GeoJSON Point Feature representing a GPS point snapped to the road network.
        sig do
          params(
            geometry: Plaza::GeoJsonGeometry::OrHash,
            properties: Plaza::MapMatchResult::Feature::Properties::OrHash,
            type: Plaza::MapMatchResult::Feature::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
          # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
          geometry:,
          properties:,
          type:
        )
        end

        sig do
          override.returns(
            {
              geometry: Plaza::GeoJsonGeometry,
              properties: Plaza::MapMatchResult::Feature::Properties,
              type: Plaza::MapMatchResult::Feature::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        class Properties < Plaza::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Plaza::MapMatchResult::Feature::Properties,
                Plaza::Internal::AnyHash
              )
            end

          # Distance from the original GPS point to the snapped point in meters
          sig { returns(T.nilable(Float)) }
          attr_reader :distance_m

          sig { params(distance_m: Float).void }
          attr_writer :distance_m

          # Road edge ID the point was snapped to
          sig { returns(T.nilable(Integer)) }
          attr_reader :edge_id

          sig { params(edge_id: Integer).void }
          attr_writer :edge_id

          # Index into the `matchings` array indicating which matching sub-route this point
          # belongs to
          sig { returns(T.nilable(Integer)) }
          attr_reader :matchings_index

          sig { params(matchings_index: Integer).void }
          attr_writer :matchings_index

          # Road name at the snapped point
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Original GPS coordinate as [lng, lat]
          sig { returns(T.nilable(T::Array[Float])) }
          attr_reader :original

          sig { params(original: T::Array[Float]).void }
          attr_writer :original

          # Index of this tracepoint in the original `coordinates` array
          sig { returns(T.nilable(Integer)) }
          attr_reader :waypoint_index

          sig { params(waypoint_index: Integer).void }
          attr_writer :waypoint_index

          sig do
            params(
              distance_m: Float,
              edge_id: Integer,
              matchings_index: Integer,
              name: T.nilable(String),
              original: T::Array[Float],
              waypoint_index: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Distance from the original GPS point to the snapped point in meters
            distance_m: nil,
            # Road edge ID the point was snapped to
            edge_id: nil,
            # Index into the `matchings` array indicating which matching sub-route this point
            # belongs to
            matchings_index: nil,
            # Road name at the snapped point
            name: nil,
            # Original GPS coordinate as [lng, lat]
            original: nil,
            # Index of this tracepoint in the original `coordinates` array
            waypoint_index: nil
          )
          end

          sig do
            override.returns(
              {
                distance_m: Float,
                edge_id: Integer,
                matchings_index: Integer,
                name: T.nilable(String),
                original: T::Array[Float],
                waypoint_index: Integer
              }
            )
          end
          def to_hash
          end
        end

        module Type
          extend Plaza::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Plaza::MapMatchResult::Feature::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FEATURE =
            T.let(:Feature, Plaza::MapMatchResult::Feature::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Plaza::MapMatchResult::Feature::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::MapMatchResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(:FeatureCollection, Plaza::MapMatchResult::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::MapMatchResult::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
