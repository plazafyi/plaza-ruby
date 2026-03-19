# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Query#sparql
    class SparqlResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute features
      #   GeoJSON features from SPARQL query
      #
      #   @return [Array<PlazaSDK::Models::GeoJsonFeature>]
      required :features, -> { PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::GeoJsonFeature] }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::SparqlResult::Type]
      required :type, enum: -> { PlazaSDK::SparqlResult::Type }

      # @!method initialize(features:, type:)
      #   GeoJSON FeatureCollection of SPARQL query results
      #
      #   @param features [Array<PlazaSDK::Models::GeoJsonFeature>] GeoJSON features from SPARQL query
      #
      #   @param type [Symbol, PlazaSDK::Models::SparqlResult::Type]

      # @see PlazaSDK::Models::SparqlResult#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
