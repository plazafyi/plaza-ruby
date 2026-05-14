# typed: strong

module Plaza
  module Resources
    class Datasets
      # Create a new dataset
      sig do
        params(
          name: String,
          slug: String,
          attribution: T.nilable(String),
          description: T.nilable(String),
          license: T.nilable(String),
          source_url: T.nilable(String),
          strict_mode: T.nilable(T::Boolean),
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
        # Enable strict schema validation (default true)
        strict_mode: nil,
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

      # List datasets
      sig do
        params(
          scope: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::DatasetList)
      end
      def list(
        # Filter by scope: plaza, user. Default shows user's own + plaza datasets.
        scope: nil,
        request_options: {}
      )
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

      # @api private
      sig { params(client: Plaza::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
