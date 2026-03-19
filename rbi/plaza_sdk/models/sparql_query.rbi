# typed: strong

module PlazaSDK
  module Models
    class SparqlQuery < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::SparqlQuery, PlazaSDK::Internal::AnyHash)
        end

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
