# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Geocode#batch
    class GeocodeBatchParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      # @!attribute addresses
      #
      #   @return [Array<String>]
      required :addresses, PlazaSDK::Internal::Type::ArrayOf[String]

      # @!method initialize(addresses:, request_options: {})
      #   @param addresses [Array<String>]
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
