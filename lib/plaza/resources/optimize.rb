# frozen_string_literal: true

module Plaza
  module Resources
    class Optimize
      # Some parameter documentations has been truncated, see
      # {Plaza::Models::OptimizeCreateParams} for more details.
      #
      # Optimize route through waypoints
      #
      # @overload create(waypoints:, format_: nil, mode: nil, roundtrip: nil, request_options: {})
      #
      # @param waypoints [Array<Plaza::Models::OptimizeRequest::Waypoint>] Body param: Waypoints to visit in optimized order (2-50 points)
      #
      # @param format_ [String] Query param: Response format: json (default), geojson, csv, ndjson
      #
      # @param mode [Symbol, Plaza::Models::OptimizeRequest::Mode] Body param: Travel mode (default: `auto`)
      #
      # @param roundtrip [Boolean] Body param: Whether the route should return to the starting waypoint (default: t
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::OptimizeCompletedResult, Plaza::Models::OptimizeProcessingResult]
      #
      # @see Plaza::Models::OptimizeCreateParams
      def create(params)
        query_params = [:format_]
        parsed, options = Plaza::OptimizeCreateParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :post,
          path: "api/v1/optimize",
          query: query.transform_keys(format_: "format"),
          body: parsed.except(*query_params),
          model: Plaza::OptimizeResult,
          options: options
        )
      end

      # Get async optimization result
      #
      # @overload retrieve(job_id, request_options: {})
      #
      # @param job_id [String]
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::OptimizeJobStatus]
      #
      # @see Plaza::Models::OptimizeRetrieveParams
      def retrieve(job_id, params = {})
        @client.request(
          method: :get,
          path: ["api/v1/optimize/%1$s", job_id],
          model: Plaza::OptimizeJobStatus,
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
