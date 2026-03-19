# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elevation#batch
    class ElevationBatchParams < Plaza::Models::ElevationProfileRequest
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
