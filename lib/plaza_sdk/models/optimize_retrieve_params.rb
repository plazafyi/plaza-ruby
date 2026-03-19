# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Optimize#retrieve
    class OptimizeRetrieveParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      # @!attribute job_id
      #
      #   @return [String]
      required :job_id, String

      # @!method initialize(job_id:, request_options: {})
      #   @param job_id [String]
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
