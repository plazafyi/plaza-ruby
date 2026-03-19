# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Elements#retrieve
    class ElementRetrieveParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      # @!attribute type
      #
      #   @return [String]
      required :type, String

      # @!attribute id
      #
      #   @return [Integer]
      required :id, Integer

      # @!method initialize(type:, id:, request_options: {})
      #   @param type [String]
      #   @param id [Integer]
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
