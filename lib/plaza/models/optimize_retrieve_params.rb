# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Optimize#retrieve
    class OptimizeRetrieveParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute job_id
      #
      #   @return [String]
      required :job_id, String

      # @!method initialize(job_id:, request_options: {})
      #   @param job_id [String]
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
