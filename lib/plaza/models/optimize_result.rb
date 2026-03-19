# frozen_string_literal: true

module Plaza
  module Models
    # Optimization response — either a completed GeoJSON Feature route or an async job
    # reference
    #
    # @see Plaza::Resources::Optimize#create
    module OptimizeResult
      extend Plaza::Internal::Type::Union

      # Completed optimization — GeoJSON Feature with optimized route
      variant -> { Plaza::OptimizeCompletedResult }

      # Async optimization in progress — poll with the job_id
      variant -> { Plaza::OptimizeProcessingResult }

      # @!method self.variants
      #   @return [Array(Plaza::Models::OptimizeCompletedResult, Plaza::Models::OptimizeProcessingResult)]
    end
  end
end
