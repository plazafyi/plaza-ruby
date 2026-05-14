# typed: strong

module Plaza
  module Models
    class PlazaqlQuery < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::PlazaqlQuery, Plaza::Internal::AnyHash) }

      # PlazaQL query string
      sig { returns(String) }
      attr_accessor :data

      # PlazaQL query request. The query is executed against Plaza's OSM database and
      # results are returned as GeoJSON.
      sig { params(data: String).returns(T.attached_class) }
      def self.new(
        # PlazaQL query string
        data:
      )
      end

      sig { override.returns({ data: String }) }
      def to_hash
      end
    end
  end
end
