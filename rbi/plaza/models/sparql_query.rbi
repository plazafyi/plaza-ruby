# typed: strong

module Plaza
  module Models
    class SparqlQuery < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::SparqlQuery, Plaza::Internal::AnyHash) }

      # SPARQL query string
      sig { returns(String) }
      attr_accessor :query

      sig { params(query: String).returns(T.attached_class) }
      def self.new(
        # SPARQL query string
        query:
      )
      end

      sig { override.returns({ query: String }) }
      def to_hash
      end
    end
  end
end
