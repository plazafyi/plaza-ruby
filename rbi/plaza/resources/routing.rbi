# typed: strong

module Plaza
  module Resources
    class Routing
      # Calculate an isochrone from a point
      sig do
        params(
          lat: Float,
          lng: Float,
          time: Float,
          mode: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::GeoJsonFeature)
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
          destinations: Plaza::GeoJsonGeometry::OrHash,
          origins: Plaza::GeoJsonGeometry::OrHash,
          mode: Plaza::MatrixRequest::Mode::OrSymbol,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::MatrixResult)
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
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::NearestResult)
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
          destination: Plaza::GeoJsonGeometry::OrHash,
          origin: Plaza::GeoJsonGeometry::OrHash,
          mode: Plaza::RouteRequest::Mode::OrSymbol,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::RouteResult)
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
      sig { params(client: Plaza::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
