# typed: strong

module PlazaSDK
  module Resources
    class Tiles
      # Get a Mapbox Vector Tile
      sig do
        params(
          y_: Integer,
          z: Integer,
          x: Integer,
          request_options: PlazaSDK::RequestOptions::OrHash
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
      sig { params(client: PlazaSDK::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
