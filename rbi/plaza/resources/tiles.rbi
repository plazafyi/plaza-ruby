# typed: strong

module Plaza
  module Resources
    class Tiles
      # Get a Mapbox Vector Tile
      sig do
        params(
          y_: Integer,
          z: Integer,
          x: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(StringIO)
      end
      def get(
        # Tile Y coordinate
        y_,
        # Zoom level (0-22)
        z:,
        # Tile X coordinate
        x:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Plaza::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
