# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Features#retrieve
    class FeatureRetrieveParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

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
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
