# typed: strong

module PlazaSDK
  module Models
    class OverpassQuery < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::OverpassQuery, PlazaSDK::Internal::AnyHash)
        end

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
