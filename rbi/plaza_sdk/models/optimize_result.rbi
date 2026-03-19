# typed: strong

module PlazaSDK
  module Models
    # Optimization response — either a completed GeoJSON Feature route or an async job
    # reference
    module OptimizeResult
      extend PlazaSDK::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            PlazaSDK::OptimizeCompletedResult,
            PlazaSDK::OptimizeProcessingResult
          )
        end

      sig { override.returns(T::Array[PlazaSDK::OptimizeResult::Variants]) }
      def self.variants
      end
    end
  end
end
