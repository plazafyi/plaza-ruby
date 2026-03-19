# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Routing#matrix
    class RoutingMatrixParams < PlazaSDK::Models::MatrixRequest
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
