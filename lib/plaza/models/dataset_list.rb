# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Datasets#list
    class DatasetList < Plaza::Internal::Type::BaseModel
      # @!attribute datasets
      #   Array of dataset metadata objects
      #
      #   @return [Array<Plaza::Models::Dataset>]
      required :datasets, -> { Plaza::Internal::Type::ArrayOf[Plaza::Dataset] }

      # @!method initialize(datasets:)
      #   List of datasets visible to the authenticated user.
      #
      #   @param datasets [Array<Plaza::Models::Dataset>] Array of dataset metadata objects
    end
  end
end
