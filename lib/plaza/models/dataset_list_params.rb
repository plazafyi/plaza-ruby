# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Datasets#list
    class DatasetListParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute scope
      #   Filter by scope: plaza, user. Default shows user's own + plaza datasets.
      #
      #   @return [String, nil]
      optional :scope, String

      # @!method initialize(scope: nil, request_options: {})
      #   @param scope [String] Filter by scope: plaza, user. Default shows user's own + plaza datasets.
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
