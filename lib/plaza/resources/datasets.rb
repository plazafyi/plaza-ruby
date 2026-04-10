# frozen_string_literal: true

module Plaza
  module Resources
    class Datasets
      # Create a new dataset
      #
      # @overload create(name:, slug:, attribution: nil, description: nil, license: nil, source_url: nil, strict_mode: nil, request_options: {})
      #
      # @param name [String] Human-readable dataset name
      #
      # @param slug [String] URL-friendly identifier (lowercase, hyphens, no spaces)
      #
      # @param attribution [String, nil] Required attribution text
      #
      # @param description [String, nil] Dataset description
      #
      # @param license [String, nil] License identifier (e.g. CC-BY-4.0)
      #
      # @param source_url [String, nil] Source data URL
      #
      # @param strict_mode [Boolean, nil] Enable strict schema validation (default true)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::Dataset]
      #
      # @see Plaza::Models::DatasetCreateParams
      def create(params)
        parsed, options = Plaza::DatasetCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/datasets",
          body: parsed,
          model: Plaza::Dataset,
          options: options
        )
      end

      # Get dataset by ID
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Dataset ID
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::Dataset]
      #
      # @see Plaza::Models::DatasetRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["api/v1/datasets/%1$s", id],
          model: Plaza::Dataset,
          options: params[:request_options]
        )
      end

      # List datasets
      #
      # @overload list(scope: nil, request_options: {})
      #
      # @param scope [String] Filter by scope: plaza, user. Default shows user's own + plaza datasets.
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::DatasetList]
      #
      # @see Plaza::Models::DatasetListParams
      def list(params = {})
        parsed, options = Plaza::DatasetListParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/datasets",
          query: query,
          model: Plaza::DatasetList,
          options: options
        )
      end

      # Delete a dataset
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] Dataset ID
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Plaza::Models::DatasetDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["api/v1/datasets/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Plaza::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
