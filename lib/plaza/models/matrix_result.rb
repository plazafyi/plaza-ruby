# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#matrix
    class MatrixResult < Plaza::Internal::Type::BaseModel
      # @!attribute distances
      #   Distance matrix (meters), origins x destinations
      #
      #   @return [Array<Array<Float, nil>>]
      required :distances, Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float, nil?: true]]

      # @!attribute durations
      #   Duration matrix (seconds), origins x destinations
      #
      #   @return [Array<Array<Float, nil>>]
      required :durations, Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float, nil?: true]]

      # @!method initialize(distances:, durations:)
      #   @param distances [Array<Array<Float, nil>>] Distance matrix (meters), origins x destinations
      #
      #   @param durations [Array<Array<Float, nil>>] Duration matrix (seconds), origins x destinations
    end
  end
end
