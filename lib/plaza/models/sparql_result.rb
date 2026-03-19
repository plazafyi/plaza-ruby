# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Query#sparql
    class SparqlResult < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #   GeoJSON features from SPARQL query
      #
      #   @return [Array<Plaza::Models::GeoJsonFeature>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::GeoJsonFeature] }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::SparqlResult::Type]
      required :type, enum: -> { Plaza::SparqlResult::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of SPARQL query results
      #
      #   @param features [Array<Plaza::Models::GeoJsonFeature>] GeoJSON features from SPARQL query
      #
      #   @param type [Symbol, Plaza::Models::SparqlResult::Type]

      # @see Plaza::Models::SparqlResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
