# typed: strong

module PlazaSDK
  module Models
    class SparqlResult < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::SparqlResult, PlazaSDK::Internal::AnyHash)
        end

      # GeoJSON features from SPARQL query
      sig { returns(T::Array[PlazaSDK::GeoJsonFeature]) }
      attr_accessor :features

      sig { returns(PlazaSDK::SparqlResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON FeatureCollection of SPARQL query results
      sig do
        params(
          features: T::Array[PlazaSDK::GeoJsonFeature::OrHash],
          type: PlazaSDK::SparqlResult::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON features from SPARQL query
        features:,
        type:
      )
      end

      sig do
        override.returns(
          {
            features: T::Array[PlazaSDK::GeoJsonFeature],
            type: PlazaSDK::SparqlResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::SparqlResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(:FeatureCollection, PlazaSDK::SparqlResult::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[PlazaSDK::SparqlResult::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
