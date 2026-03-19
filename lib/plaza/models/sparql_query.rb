# frozen_string_literal: true

module Plaza
  module Models
    class SparqlQuery < Plaza::Internal::Type::BaseModel
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
