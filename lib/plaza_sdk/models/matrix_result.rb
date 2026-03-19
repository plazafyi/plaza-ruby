# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Routing#matrix
    class MatrixResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute distances
      #   Distance matrix (meters), origins x destinations
      #
      #   @return [Array<Array<Float, nil>>]
      required :distances,
               PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::ArrayOf[Float, nil?: true]]

      # @!attribute durations
      #   Duration matrix (seconds), origins x destinations
      #
      #   @return [Array<Array<Float, nil>>]
      required :durations,
               PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::ArrayOf[Float, nil?: true]]

      # @!method initialize(distances:, durations:)
      #   @param distances [Array<Array<Float, nil>>] Distance matrix (meters), origins x destinations
      #
      #   @param durations [Array<Array<Float, nil>>] Duration matrix (seconds), origins x destinations
    end
  end
end
