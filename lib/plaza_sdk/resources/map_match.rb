# frozen_string_literal: true

module PlazaSDK
  module Resources
    class MapMatch
      # Match GPS coordinates to the road network
      #
      # @overload match(trace:, radiuses: nil, request_options: {})
      #
      # @param trace [PlazaSDK::Models::GeoJsonGeometry] GPS trace (GeoJSON LineString geometry)
      #
      # @param radiuses [Array<Float>, nil] Search radius per coordinate in meters (optional, default 50)
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::MapMatchResult]
      #
      # @see PlazaSDK::Models::MapMatchMatchParams
      def match(params)
        parsed, options = PlazaSDK::MapMatchMatchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/map-match",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: PlazaSDK::MapMatchResult,
          options: options
        )
      end

      # @api private
      #
      # @param client [PlazaSDK::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
