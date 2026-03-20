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

      # Comma-separated property fields to include
      sig { returns(T.nilable(String)) }
      attr_reader :output_fields

      sig { params(output_fields: String).void }
      attr_writer :output_fields

      # Extra computed fields: bbox, distance, center
      sig { returns(T.nilable(String)) }
      attr_reader :output_include

      sig { params(output_include: String).void }
      attr_writer :output_include

      # Coordinate decimal precision (1-15, default 7)
      sig { returns(T.nilable(Integer)) }
      attr_reader :output_precision

      sig { params(output_precision: Integer).void }
      attr_writer :output_precision

      # Sort by: distance, name, osm_id
      sig { returns(T.nilable(String)) }
      attr_reader :output_sort

      sig { params(output_sort: String).void }
      attr_writer :output_sort

      sig do
        params(
          q: String,
          cursor: String,
          limit: Integer,
          output_fields: String,
          output_include: String,
          output_precision: Integer,
          output_sort: String,
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
        # Comma-separated property fields to include
        output_fields: nil,
        # Extra computed fields: bbox, distance, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Sort by: distance, name, osm_id
        output_sort: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            q: String,
            cursor: String,
            limit: Integer,
            output_fields: String,
            output_include: String,
            output_precision: Integer,
            output_sort: String,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
