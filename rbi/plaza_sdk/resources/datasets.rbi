# typed: strong

module PlazaSDK
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
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::Dataset)
      end
      def create(
        # Dataset name
        name:,
        # URL-friendly slug
        slug:,
        # Attribution text
        attribution: nil,
        # Dataset description
        description: nil,
        # License identifier
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
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::Dataset)
      end
      def retrieve(
        # Dataset ID
        id,
        request_options: {}
      )
      end

      # List all datasets
      sig do
        params(request_options: PlazaSDK::RequestOptions::OrHash).returns(
          PlazaSDK::DatasetList
        )
      end
      def list(request_options: {})
      end

      # Delete a dataset
      sig do
        params(
          id: String,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).void
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
          limit: Integer,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::FeatureCollection)
      end
      def features(
        # Dataset ID
        id,
        # Cursor for pagination
        cursor: nil,
        # Maximum results
        limit: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: PlazaSDK::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
