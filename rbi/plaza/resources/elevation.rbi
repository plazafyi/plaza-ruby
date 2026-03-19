# typed: strong

module Plaza
  module Resources
    class Elevation
      # Look up elevation for multiple coordinates
      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ElevationBatchResult)
      end
      def batch(
        # Path to profile (GeoJSON LineString geometry, minimum 2 points)
        geometry:,
        request_options: {}
      )
      end

      # Look up elevation at one or more points
      sig do
        params(
          lat: Float,
          lng: Float,
          locations: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ElevationLookupResult)
      end
      def lookup(
        # Latitude (single point)
        lat: nil,
        # Longitude (single point)
        lng: nil,
        # Pipe-separated lng,lat pairs (batch)
        locations: nil,
        request_options: {}
      )
      end

      # Elevation profile along coordinates
      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ElevationProfileResult)
      end
      def profile(
        # Path to profile (GeoJSON LineString geometry, minimum 2 points)
        geometry:,
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
