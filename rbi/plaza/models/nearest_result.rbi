# typed: strong

module Plaza
  module Models
    class NearestResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::NearestResult, Plaza::Internal::AnyHash) }

      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(Plaza::NearestResult::Properties) }
      attr_reader :properties

      sig { params(properties: Plaza::NearestResult::Properties::OrHash).void }
      attr_writer :properties

      sig { returns(Plaza::NearestResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON Point Feature snapped to the nearest road segment
      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          properties: Plaza::NearestResult::Properties::OrHash,
          type: Plaza::NearestResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(geometry:, properties:, type:)
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

        # Distance to nearest road in meters
        sig { returns(T.nilable(Float)) }
        attr_reader :distance_m

        sig { params(distance_m: Float).void }
        attr_writer :distance_m

        # Road edge ID
        sig { returns(T.nilable(Integer)) }
        attr_accessor :edge_id

        sig do
          params(distance_m: Float, edge_id: T.nilable(Integer)).returns(
            T.attached_class
          )
        end
        def self.new(
          # Distance to nearest road in meters
          distance_m: nil,
          # Road edge ID
          edge_id: nil
        )
        end

        sig do
          override.returns({ distance_m: Float, edge_id: T.nilable(Integer) })
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
