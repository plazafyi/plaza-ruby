# typed: strong

module Plaza
  module Resources
    class Datasets
      # Create a new dataset (admin only)
      sig do
        params(
          name: String,
          slug: String,
          attribution: T.nilable(String),
          description: T.nilable(String),
          license: T.nilable(String),
          source_url: T.nilable(String),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::Dataset)
      end
      def create(
        # Human-readable dataset name
        name:,
        # URL-friendly identifier (lowercase, hyphens, no spaces)
        slug:,
        # Required attribution text
        attribution: nil,
        # Dataset description
        description: nil,
        # License identifier (e.g. CC-BY-4.0)
        license: nil,
        # Source data URL
        source_url: nil,
        request_options: {}
      )
      end

      # Get dataset by ID
      sig do
        params(
          id: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::Dataset)
      end
      def retrieve(
        # Dataset ID
        id,
        request_options: {}
      )
      end

      # List all datasets
      sig do
        params(request_options: Plaza::RequestOptions::OrHash).returns(
          Plaza::DatasetList
        )
      end
      def list(request_options: {})
      end

      # Delete a dataset
      sig do
        params(id: String, request_options: Plaza::RequestOptions::OrHash).void
      end
      def delete(
        # Dataset ID
        id,
        request_options: {}
      )
      end

      # Query features in a dataset
      sig do
        params(
          id: String,
          cursor: String,
          format_: String,
          limit: Integer,
          output_buffer: Float,
          output_centroid: T::Boolean,
          output_fields: String,
          output_geometry: T::Boolean,
          output_include: String,
          output_precision: Integer,
          output_simplify: Float,
          output_sort: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::FeatureCollection)
      end
      def features(
        # Dataset ID
        id,
        # Cursor for pagination
        cursor: nil,
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
        # Maximum results
        limit: nil,
        # Buffer geometry by meters
        output_buffer: nil,
        # Replace geometry with centroid
        output_centroid: nil,
        # Comma-separated property fields to include
        output_fields: nil,
        # Include geometry (default true)
        output_geometry: nil,
        # Extra computed fields: bbox, distance, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Simplify geometry tolerance in meters
        output_simplify: nil,
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
