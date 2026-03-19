# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Datasets#list
    class DatasetList < Plaza::Internal::Type::BaseModel
      # @!attribute datasets
      #
      #   @return [Array<Plaza::Models::Dataset>]
      required :datasets, -> { Plaza::Internal::Type::ArrayOf[Plaza::Dataset] }

      # @!method initialize(datasets:)
      #   @param datasets [Array<Plaza::Models::Dataset>]
    end
  end
end
