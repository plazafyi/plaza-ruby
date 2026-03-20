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
      #   SPARQL query request. Queries OSM data using SPARQL syntax. Results are returned
      #   as a JSON object with a `results` array.
      #
      #   @param query [String] SPARQL query string
    end
  end
end
