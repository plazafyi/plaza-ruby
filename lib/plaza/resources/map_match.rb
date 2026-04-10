# frozen_string_literal: true

module Plaza
  module Resources
    class MapMatch
      # Some parameter documentations has been truncated, see
      # {Plaza::Models::MapMatchMatchParams} for more details.
      #
      # Match GPS coordinates to the road network
      #
      # @overload match(geometry:, radiuses: nil, request_options: {})
      #
      # @param geometry [Plaza::Models::LineStringGeometry] GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more pos
      #
      # @param radiuses [Array<Float>, nil] Search radius per coordinate in meters. Must have the same length as the geometr
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
