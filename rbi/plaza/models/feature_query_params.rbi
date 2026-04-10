# typed: strong

module Plaza
  module Models
    class FeatureQueryParams < Plaza::Models::SpatialPredicate
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::FeatureQueryParams, Plaza::Internal::AnyHash)
        end

      # Cursor for pagination
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Response format. json (default) returns paginated GeoJSON. geojson/csv/ndjson
      # stream via chunked transfer encoding.
      sig { returns(T.nilable(String)) }
      attr_reader :format_

      sig { params(format_: String).void }
      attr_writer :format_

      # Legacy shorthand. H3 cell index. Use spatial predicates instead.
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
          cursor: String,
          format_: String,
          h3: String,
          limit: Integer,
          type: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cursor for pagination
        cursor: nil,
        # Response format. json (default) returns paginated GeoJSON. geojson/csv/ndjson
        # stream via chunked transfer encoding.
        format_: nil,
        # Legacy shorthand. H3 cell index. Use spatial predicates instead.
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
            cursor: String,
            format_: String,
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
