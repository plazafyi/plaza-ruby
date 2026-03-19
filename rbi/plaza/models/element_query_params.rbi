# typed: strong

module Plaza
  module Models
    class ElementQueryParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::ElementQueryParams, Plaza::Internal::AnyHash)
        end

      # Bounding box: south,west,north,east. At least one of bbox or h3 is required.
      sig { returns(T.nilable(String)) }
      attr_reader :bbox

      sig { params(bbox: String).void }
      attr_writer :bbox

      # Cursor for pagination
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # H3 cell index. At least one of bbox or h3 is required.
      sig { returns(T.nilable(String)) }
      attr_reader :h3

      sig { params(h3: String).void }
      attr_writer :h3

      # Maximum results (default 100, max 10000)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Element types (comma-separated: node,way,relation)
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      sig do
        params(
          bbox: String,
          cursor: String,
          h3: String,
          limit: Integer,
          type: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Bounding box: south,west,north,east. At least one of bbox or h3 is required.
        bbox: nil,
        # Cursor for pagination
        cursor: nil,
        # H3 cell index. At least one of bbox or h3 is required.
        h3: nil,
        # Maximum results (default 100, max 10000)
        limit: nil,
        # Element types (comma-separated: node,way,relation)
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            bbox: String,
            cursor: String,
            h3: String,
            limit: Integer,
            type: String,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
