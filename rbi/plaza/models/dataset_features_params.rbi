# typed: strong

module Plaza
  module Models
    class DatasetFeaturesParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::DatasetFeaturesParams, Plaza::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Cursor for pagination
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum results
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          id: String,
          cursor: String,
          limit: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Cursor for pagination
        cursor: nil,
        # Maximum results
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            cursor: String,
            limit: Integer,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
