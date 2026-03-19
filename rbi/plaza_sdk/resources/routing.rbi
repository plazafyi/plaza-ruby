# typed: strong

module PlazaSDK
  module Resources
    class Routing
      # Calculate an isochrone from a point
      sig do
        params(
          lat: Float,
          lng: Float,
          time: Float,
          mode: String,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::GeoJsonFeature)
      end
      def isochrone(
        # Latitude
        lat:,
        # Longitude
        lng:,
        # Travel time in seconds (1-7200)
        time:,
        # Travel mode (auto, foot, bicycle)
        mode: nil,
        request_options: {}
      )
      end

      # Calculate a distance matrix between points
      sig do
        params(
          destinations: PlazaSDK::GeoJsonGeometry::OrHash,
          origins: PlazaSDK::GeoJsonGeometry::OrHash,
          mode: PlazaSDK::MatrixRequest::Mode::OrSymbol,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::MatrixResult)
      end
      def matrix(
        # Destination points (GeoJSON MultiPoint geometry)
        destinations:,
        # Origin points (GeoJSON MultiPoint geometry)
        origins:,
        # Travel mode
        mode: nil,
        request_options: {}
      )
      end

      # Snap a coordinate to the nearest road
      sig do
        params(
          lat: Float,
          lng: Float,
          radius: Integer,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::NearestResult)
      end
      def nearest(
        # Latitude
        lat:,
        # Longitude
        lng:,
        # Search radius in meters (default 500, max 5000)
        radius: nil,
        request_options: {}
      )
      end

      # Calculate a route between two points
      sig do
        params(
          destination: PlazaSDK::GeoJsonGeometry::OrHash,
          origin: PlazaSDK::GeoJsonGeometry::OrHash,
          mode: PlazaSDK::RouteRequest::Mode::OrSymbol,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::RouteResult)
      end
      def route(
        # Destination point (GeoJSON Point geometry)
        destination:,
        # Origin point (GeoJSON Point geometry)
        origin:,
        mode: nil,
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
