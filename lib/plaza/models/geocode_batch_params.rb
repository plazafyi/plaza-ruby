# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Geocode#batch
    class GeocodeBatchParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute addresses
      #
      #   @return [Array<String>]
      required :addresses, Plaza::Internal::Type::ArrayOf[String]

      # @!method initialize(addresses:, request_options: {})
      #   @param addresses [Array<String>]
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
