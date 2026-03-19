# typed: strong

module PlazaSDK
  module Models
    class TileGetParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(PlazaSDK::TileGetParams, PlazaSDK::Internal::AnyHash)
        end

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
          request_options: PlazaSDK::RequestOptions::OrHash
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
            request_options: PlazaSDK::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
