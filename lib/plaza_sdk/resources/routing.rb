# frozen_string_literal: true

module PlazaSDK
  module Resources
    class Routing
      # Calculate an isochrone from a point
      #
      # @overload isochrone(lat:, lng:, time:, mode: nil, request_options: {})
      #
      # @param lat [Float] Latitude
      #
      # @param lng [Float] Longitude
      #
      # @param time [Float] Travel time in seconds (1-7200)
      #
      # @param mode [String] Travel mode (auto, foot, bicycle)
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::GeoJsonFeature]
      #
      # @see PlazaSDK::Models::RoutingIsochroneParams
      def isochrone(params)
        parsed, options = PlazaSDK::RoutingIsochroneParams.dump_request(params)
        query = PlazaSDK::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/isochrone",
          query: query,
          headers: {"accept" => "application/geo+json"},
          model: PlazaSDK::GeoJsonFeature,
          options: options
        )
      end

      # Calculate a distance matrix between points
      #
      # @overload matrix(destinations:, origins:, mode: nil, request_options: {})
      #
      # @param destinations [PlazaSDK::Models::GeoJsonGeometry] Destination points (GeoJSON MultiPoint geometry)
      #
      # @param origins [PlazaSDK::Models::GeoJsonGeometry] Origin points (GeoJSON MultiPoint geometry)
      #
      # @param mode [Symbol, PlazaSDK::Models::MatrixRequest::Mode] Travel mode
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::MatrixResult]
      #
      # @see PlazaSDK::Models::RoutingMatrixParams
      def matrix(params)
        parsed, options = PlazaSDK::RoutingMatrixParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/matrix",
          body: parsed,
          model: PlazaSDK::MatrixResult,
          options: options
        )
      end

      # Snap a coordinate to the nearest road
      #
      # @overload nearest(lat:, lng:, radius: nil, request_options: {})
      #
      # @param lat [Float] Latitude
      #
      # @param lng [Float] Longitude
      #
      # @param radius [Integer] Search radius in meters (default 500, max 5000)
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::NearestResult]
      #
      # @see PlazaSDK::Models::RoutingNearestParams
      def nearest(params)
        parsed, options = PlazaSDK::RoutingNearestParams.dump_request(params)
        query = PlazaSDK::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/nearest",
          query: query,
          model: PlazaSDK::NearestResult,
          options: options
        )
      end

      # Calculate a route between two points
      #
      # @overload route(destination:, origin:, mode: nil, request_options: {})
      #
      # @param destination [PlazaSDK::Models::GeoJsonGeometry] Destination point (GeoJSON Point geometry)
      #
      # @param origin [PlazaSDK::Models::GeoJsonGeometry] Origin point (GeoJSON Point geometry)
      #
      # @param mode [Symbol, PlazaSDK::Models::RouteRequest::Mode]
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::RouteResult]
      #
      # @see PlazaSDK::Models::RoutingRouteParams
      def route(params)
        parsed, options = PlazaSDK::RoutingRouteParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/route",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: PlazaSDK::RouteResult,
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
