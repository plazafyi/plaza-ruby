# typed: strong

module Plaza
  module Models
    class OverpassQuery < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::OverpassQuery, Plaza::Internal::AnyHash) }

      # Overpass QL query string
      sig { returns(String) }
      attr_accessor :data

      sig { params(data: String).returns(T.attached_class) }
      def self.new(
        # Overpass QL query string
        data:
      )
      end

      sig { override.returns({ data: String }) }
      def to_hash
      end
    end
  end
end
