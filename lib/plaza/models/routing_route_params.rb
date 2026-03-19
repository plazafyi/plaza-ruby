# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#route
    class RoutingRouteParams < Plaza::Models::RouteRequest
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
