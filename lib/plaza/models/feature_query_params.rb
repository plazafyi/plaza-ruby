# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Features#query
    class FeatureQueryParams < Plaza::Models::SpatialPredicate
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Cursor for pagination
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute format_
      #   Response format. json (default) returns paginated GeoJSON. geojson/csv/ndjson
      #   stream via chunked transfer encoding.
      #
      #   @return [String, nil]
      optional :format_, String

      # @!attribute h3
      #   Legacy shorthand. H3 cell index. Use spatial predicates instead.
      #
      #   @return [String, nil]
      optional :h3, String

      # @!attribute limit
      #   Maximum results (default 100, max 10000)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute type
      #   Element types (comma-separated: node,way,relation)
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(cursor: nil, format_: nil, h3: nil, limit: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::FeatureQueryParams} for more details.
      #
      #   @param cursor [String] Cursor for pagination
      #
      #   @param format_ [String] Response format. json (default) returns paginated GeoJSON. geojson/csv/ndjson st
      #
      #   @param h3 [String] Legacy shorthand. H3 cell index. Use spatial predicates instead.
      #
      #   @param limit [Integer] Maximum results (default 100, max 10000)
      #
      #   @param type [String] Element types (comma-separated: node,way,relation)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
