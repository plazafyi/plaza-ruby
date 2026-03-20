# frozen_string_literal: true

module Plaza
  module Resources
    class Datasets
      # Create a new dataset (admin only)
      #
      # @overload create(name:, slug:, attribution: nil, description: nil, license: nil, source_url: nil, request_options: {})
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

      # List all datasets
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::DatasetList]
      #
      # @see Plaza::Models::DatasetListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "api/v1/datasets",
          model: Plaza::DatasetList,
          options: params[:request_options]
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

      # Query features in a dataset
      #
      # @overload features(id, cursor: nil, format_: nil, limit: nil, output_buffer: nil, output_centroid: nil, output_fields: nil, output_geometry: nil, output_include: nil, output_precision: nil, output_simplify: nil, output_sort: nil, request_options: {})
      #
      # @param id [String] Dataset ID
      #
      # @param cursor [String] Cursor for pagination
      #
      # @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      # @param limit [Integer] Maximum results
      #
      # @param output_buffer [Float] Buffer geometry by meters
      #
      # @param output_centroid [Boolean] Replace geometry with centroid
      #
      # @param output_fields [String] Comma-separated property fields to include
      #
      # @param output_geometry [Boolean] Include geometry (default true)
      #
      # @param output_include [String] Extra computed fields: bbox, distance, center
      #
      # @param output_precision [Integer] Coordinate decimal precision (1-15, default 7)
      #
      # @param output_simplify [Float] Simplify geometry tolerance in meters
      #
      # @param output_sort [String] Sort by: distance, name, osm_id
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::FeatureCollection]
      #
      # @see Plaza::Models::DatasetFeaturesParams
      def features(id, params = {})
        parsed, options = Plaza::DatasetFeaturesParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["api/v1/datasets/%1$s/features", id],
          query: query.transform_keys(
            format_: "format",
            output_buffer: "output[buffer]",
            output_centroid: "output[centroid]",
            output_fields: "output[fields]",
            output_geometry: "output[geometry]",
            output_include: "output[include]",
            output_precision: "output[precision]",
            output_simplify: "output[simplify]",
            output_sort: "output[sort]"
          ),
          model: Plaza::FeatureCollection,
          options: options
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
