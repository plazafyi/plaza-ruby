# typed: strong

module Plaza
  module Resources
    class Search
      # Search OSM features by name
      sig do
        params(
          q: String,
          cursor: String,
          format_: String,
          limit: Integer,
          output_fields: String,
          output_include: String,
          output_precision: Integer,
          output_sort: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def query(
        # Search query string
        q:,
        # Cursor for pagination
        cursor: nil,
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
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

      # Search OSM features by name
      sig do
        params(
          q: String,
          cursor: String,
          format_: String,
          limit: Integer,
          output_fields: String,
          output_include: String,
          output_precision: Integer,
          output_sort: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def query_post(
        # Search query string
        q:,
        # Cursor for pagination
        cursor: nil,
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
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

      # @api private
      sig { params(client: Plaza::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
