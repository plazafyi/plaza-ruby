# frozen_string_literal: true

module Plaza
  module Models
    # Optimization response — either a completed FeatureCollection with the optimized
    # route, or an async job reference to poll.
    #
    # @see Plaza::Resources::Optimize#create
    module OptimizeResult
      extend Plaza::Internal::Type::Union

      # Completed optimization result as a GeoJSON FeatureCollection. Each Feature is a waypoint in optimized visit order. Top-level fields provide summary statistics.
      variant -> { Plaza::OptimizeCompletedResult }

      # Async optimization in progress. Poll `GET /api/v1/optimize/{job_id}` until the status changes to `completed` or `failed`.
      variant -> { Plaza::OptimizeProcessingResult }

      # @!method self.variants
      #   @return [Array(Plaza::Models::OptimizeCompletedResult, Plaza::Models::OptimizeProcessingResult)]
    end
  end
end
