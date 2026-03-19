# frozen_string_literal: true

module PlazaSDK
  module Models
    # Optimization response — either a completed GeoJSON Feature route or an async job
    # reference
    #
    # @see PlazaSDK::Resources::Optimize#create
    module OptimizeResult
      extend PlazaSDK::Internal::Type::Union

      # Completed optimization — GeoJSON Feature with optimized route
      variant -> { PlazaSDK::OptimizeCompletedResult }

      # Async optimization in progress — poll with the job_id
      variant -> { PlazaSDK::OptimizeProcessingResult }

      # @!method self.variants
      #   @return [Array(PlazaSDK::Models::OptimizeCompletedResult, PlazaSDK::Models::OptimizeProcessingResult)]
    end
  end
end
