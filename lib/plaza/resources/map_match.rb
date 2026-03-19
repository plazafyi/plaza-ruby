# frozen_string_literal: true

module Plaza
  module Resources
    class MapMatch
      # Match GPS coordinates to the road network
      #
      # @overload match(trace:, radiuses: nil, request_options: {})
      #
      # @param trace [Plaza::Models::GeoJsonGeometry] GPS trace (GeoJSON LineString geometry)
      #
      # @param radiuses [Array<Float>, nil] Search radius per coordinate in meters (optional, default 50)
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::MapMatchResult]
      #
      # @see Plaza::Models::MapMatchMatchParams
      def match(params)
        parsed, options = Plaza::MapMatchMatchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/map-match",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: Plaza::MapMatchResult,
          options: options
        )
      end

      # @api private
      #
      # @param client [Plaza::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
