# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Search#query
    class SearchQueryParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute q
      #   Search query string
      #
      #   @return [String]
      required :q, String

      # @!attribute cursor
      #   Cursor for pagination
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute format_
      #   Response format: json (default), geojson, csv, ndjson
      #
      #   @return [String, nil]
      optional :format_, String

      # @!attribute limit
      #   Maximum results (default 25, max 100)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute output_fields
      #   Comma-separated property fields to include
      #
      #   @return [String, nil]
      optional :output_fields, String

      # @!attribute output_include
      #   Extra computed fields: bbox, distance, center
      #
      #   @return [String, nil]
      optional :output_include, String

      # @!attribute output_precision
      #   Coordinate decimal precision (1-15, default 7)
      #
      #   @return [Integer, nil]
      optional :output_precision, Integer

      # @!attribute output_sort
      #   Sort by: distance, name, osm_id
      #
      #   @return [String, nil]
      optional :output_sort, String

      # @!method initialize(q:, cursor: nil, format_: nil, limit: nil, output_fields: nil, output_include: nil, output_precision: nil, output_sort: nil, request_options: {})
      #   @param q [String] Search query string
      #
      #   @param cursor [String] Cursor for pagination
      #
      #   @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      #   @param limit [Integer] Maximum results (default 25, max 100)
      #
      #   @param output_fields [String] Comma-separated property fields to include
      #
      #   @param output_include [String] Extra computed fields: bbox, distance, center
      #
      #   @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      #   @param output_sort [String] Sort by: distance, name, osm_id
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
