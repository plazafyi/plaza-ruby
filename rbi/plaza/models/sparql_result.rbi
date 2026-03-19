# typed: strong

module Plaza
  module Models
    class SparqlResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::SparqlResult, Plaza::Internal::AnyHash) }

      # GeoJSON features from SPARQL query
      sig { returns(T::Array[Plaza::GeoJsonFeature]) }
      attr_accessor :features

      sig { returns(Plaza::SparqlResult::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON FeatureCollection of SPARQL query results
      sig do
        params(
          features: T::Array[Plaza::GeoJsonFeature::OrHash],
          type: Plaza::SparqlResult::Type::OrSymbol
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
            features: T::Array[Plaza::GeoJsonFeature],
            type: Plaza::SparqlResult::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Plaza::SparqlResult::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE_COLLECTION =
          T.let(:FeatureCollection, Plaza::SparqlResult::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Plaza::SparqlResult::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
