# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::MapMatch#match
    class MapMatchMatchParams < PlazaSDK::Models::MapMatchRequest
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
