# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Datasets#list
    class DatasetList < PlazaSDK::Internal::Type::BaseModel
      # @!attribute datasets
      #
      #   @return [Array<PlazaSDK::Models::Dataset>]
      required :datasets, -> { PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Dataset] }

      # @!method initialize(datasets:)
      #   @param datasets [Array<PlazaSDK::Models::Dataset>]
    end
  end
end
