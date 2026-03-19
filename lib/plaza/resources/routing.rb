# frozen_string_literal: true

module Plaza
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
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::GeoJsonFeature]
      #
      # @see Plaza::Models::RoutingIsochroneParams
      def isochrone(params)
        parsed, options = Plaza::RoutingIsochroneParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/isochrone",
          query: query,
          headers: {"accept" => "application/geo+json"},
          model: Plaza::GeoJsonFeature,
          options: options
        )
      end

      # Calculate a distance matrix between points
      #
      # @overload matrix(destinations:, origins:, mode: nil, request_options: {})
      #
      # @param destinations [Plaza::Models::GeoJsonGeometry] Destination points (GeoJSON MultiPoint geometry)
      #
      # @param origins [Plaza::Models::GeoJsonGeometry] Origin points (GeoJSON MultiPoint geometry)
      #
      # @param mode [Symbol, Plaza::Models::MatrixRequest::Mode] Travel mode
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::MatrixResult]
      #
      # @see Plaza::Models::RoutingMatrixParams
      def matrix(params)
        parsed, options = Plaza::RoutingMatrixParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/matrix",
          body: parsed,
          model: Plaza::MatrixResult,
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
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::NearestResult]
      #
      # @see Plaza::Models::RoutingNearestParams
      def nearest(params)
        parsed, options = Plaza::RoutingNearestParams.dump_request(params)
        query = Plaza::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/nearest",
          query: query,
          model: Plaza::NearestResult,
          options: options
        )
      end

      # Calculate a route between two points
      #
      # @overload route(destination:, origin:, mode: nil, request_options: {})
      #
      # @param destination [Plaza::Models::GeoJsonGeometry] Destination point (GeoJSON Point geometry)
      #
      # @param origin [Plaza::Models::GeoJsonGeometry] Origin point (GeoJSON Point geometry)
      #
      # @param mode [Symbol, Plaza::Models::RouteRequest::Mode]
      #
      # @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Plaza::Models::RouteResult]
      #
      # @see Plaza::Models::RoutingRouteParams
      def route(params)
        parsed, options = Plaza::RoutingRouteParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/route",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: Plaza::RouteResult,
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
