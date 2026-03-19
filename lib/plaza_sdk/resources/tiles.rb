# frozen_string_literal: true

module PlazaSDK
  module Resources
    class Tiles
      # Get a Mapbox Vector Tile
      #
      # @overload get(y_, z:, x:, request_options: {})
      #
      # @param y_ [Integer] Tile Y coordinate
      #
      # @param z [Integer] Zoom level (0-22)
      #
      # @param x [Integer] Tile X coordinate
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see PlazaSDK::Models::TileGetParams
      def get(y_, params)
        parsed, options = PlazaSDK::TileGetParams.dump_request(params)
        z =
          parsed.delete(:z) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        x =
          parsed.delete(:x) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["api/v1/tiles/%1$s/%2$s/%3$s", z, x, y_],
          headers: {"accept" => "application/vnd.mapbox-vector-tile"},
          model: StringIO,
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
