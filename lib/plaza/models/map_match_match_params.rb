# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::MapMatch#match
    class MapMatchMatchParams < Plaza::Models::MapMatchRequest
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
