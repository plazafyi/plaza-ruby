# typed: strong

module PlazaSDK
  module Models
    class NearestResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::NearestResult, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(PlazaSDK::NearestResult::Properties) }
      attr_reader :properties

      sig do
        params(properties: PlazaSDK::NearestResult::Properties::OrHash).void
      end
      attr_writer :properties

      sig { returns(PlazaSDK::NearestResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON Point Feature snapped to the nearest road segment
      sig do
        params(
          geometry: PlazaSDK::GeoJsonGeometry::OrHash,
          properties: PlazaSDK::NearestResult::Properties::OrHash,
          type: PlazaSDK::NearestResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(geometry:, properties:, type:)
      end

      sig do
        override.returns(
          {
            geometry: PlazaSDK::GeoJsonGeometry,
            properties: PlazaSDK::NearestResult::Properties,
            type: PlazaSDK::NearestResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < PlazaSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              PlazaSDK::NearestResult::Properties,
              PlazaSDK::Internal::AnyHash
            )
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
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::NearestResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE = T.let(:Feature, PlazaSDK::NearestResult::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::NearestResult::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
