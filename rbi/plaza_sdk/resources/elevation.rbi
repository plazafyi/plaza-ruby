# typed: strong

module PlazaSDK
  module Resources
    class Elevation
      # Look up elevation for multiple coordinates
      sig do
        params(
          geometry: PlazaSDK::GeoJsonGeometry::OrHash,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::ElevationBatchResult)
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
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::ElevationLookupResult)
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
          geometry: PlazaSDK::GeoJsonGeometry::OrHash,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::ElevationProfileResult)
      end
      def profile(
        # Path to profile (GeoJSON LineString geometry, minimum 2 points)
        geometry:,
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
