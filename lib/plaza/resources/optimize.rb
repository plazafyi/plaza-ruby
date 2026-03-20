# frozen_string_literal: true

module Plaza
  module Resources
    class Optimize
      # Optimize route through waypoints
      #
      # @overload create(waypoints:, mode: nil, roundtrip: nil, request_options: {})
      #
      # @param waypoints [Array<Plaza::Models::OptimizeRequest::Waypoint>] Waypoints to visit in optimized order (2-50 points)
      #
      # @param mode [Symbol, Plaza::Models::OptimizeRequest::Mode] Travel mode (default: `auto`)
      #
      # @param roundtrip [Boolean] Whether the route should return to the starting waypoint (default: true)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::OptimizeCompletedResult, Plaza::Models::OptimizeProcessingResult]
      #
      # @see Plaza::Models::OptimizeCreateParams
      def create(params)
        parsed, options = Plaza::OptimizeCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/optimize",
          body: parsed,
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
