# typed: strong

module Plaza
  module Models
    class SearchQueryParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::SearchQueryParams, Plaza::Internal::AnyHash)
        end

      # Search query string
      sig { returns(String) }
      attr_accessor :q

      # Cursor for pagination
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum results (default 25, max 100)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          q: String,
          cursor: String,
          limit: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Search query string
        q:,
        # Cursor for pagination
        cursor: nil,
        # Maximum results (default 25, max 100)
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            q: String,
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
