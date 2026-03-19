# typed: strong

module Plaza
  module Models
    # Optimization response — either a completed GeoJSON Feature route or an async job
    # reference
    module OptimizeResult
      extend Plaza::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(Plaza::OptimizeCompletedResult, Plaza::OptimizeProcessingResult)
        end

      sig { override.returns(T::Array[Plaza::OptimizeResult::Variants]) }
      def self.variants
      end
    end
  end
end
