# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Datasets#delete
    class DatasetDeleteParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   @param id [String]
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
