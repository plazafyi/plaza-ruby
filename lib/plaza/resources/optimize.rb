# frozen_string_literal: true

module Plaza
  module Resources
    class Optimize
      # Optimize route through waypoints
      #
      # @overload create(waypoints:, mode: nil, roundtrip: nil, request_options: {})
      #
      # @param waypoints [Plaza::Models::GeoJsonGeometry] Waypoints to visit (GeoJSON MultiPoint geometry, minimum 2 points)
      #
      # @param mode [Symbol, Plaza::Models::OptimizeRequest::Mode] Travel mode (default: auto)
      #
      # @param roundtrip [Boolean] Whether route returns to start (default: true)
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
          headers: {"accept" => "application/geo+json"},
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
