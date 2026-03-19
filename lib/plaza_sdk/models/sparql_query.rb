# frozen_string_literal: true

module PlazaSDK
  module Models
    class SparqlQuery < PlazaSDK::Internal::Type::BaseModel
      # @!attribute query
      #   SPARQL query string
      #
      #   @return [String]
      required :query, String

      # @!method initialize(query:)
      #   @param query [String] SPARQL query string
    end
  end
end
