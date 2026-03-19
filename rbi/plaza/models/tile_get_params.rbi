# typed: strong

module Plaza
  module Models
    class TileGetParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(Plaza::TileGetParams, Plaza::Internal::AnyHash) }

      sig { returns(Integer) }
      attr_accessor :z

      sig { returns(Integer) }
      attr_accessor :x

      sig { returns(Integer) }
      attr_accessor :y_

      sig do
        params(
          z: Integer,
          x: Integer,
          y_: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(z:, x:, y_:, request_options: {})
      end

      sig do
        override.returns(
          {
            z: Integer,
            x: Integer,
            y_: Integer,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
