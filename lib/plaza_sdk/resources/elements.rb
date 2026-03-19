# frozen_string_literal: true

module PlazaSDK
  module Resources
    class Elements
      # Get feature by type and ID
      #
      # @overload retrieve(id, type:, request_options: {})
      #
      # @param id [Integer] OSM ID
      #
      # @param type [String] Element type (node, way, relation)
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::GeoJsonFeature]
      #
      # @see PlazaSDK::Models::ElementRetrieveParams
      def retrieve(id, params)
        parsed, options = PlazaSDK::ElementRetrieveParams.dump_request(params)
        type =
          parsed.delete(:type) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["api/v1/features/%1$s/%2$s", type, id],
          headers: {"accept" => "application/geo+json"},
          model: PlazaSDK::GeoJsonFeature,
          options: options
        )
      end

      # Fetch multiple features by type and ID
      #
      # @overload batch(elements:, request_options: {})
      #
      # @param elements [Array<PlazaSDK::Models::BatchRequest::Element>]
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::FeatureCollection]
      #
      # @see PlazaSDK::Models::ElementBatchParams
      def batch(params)
        parsed, options = PlazaSDK::ElementBatchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "api/v1/features/batch",
          headers: {"accept" => "application/geo+json"},
          body: parsed,
          model: PlazaSDK::FeatureCollection,
          options: options
        )
      end

      # Find features near a geographic point
      #
      # @overload nearby(lat:, lng:, limit: nil, radius: nil, request_options: {})
      #
      # @param lat [Float] Latitude (-90 to 90)
      #
      # @param lng [Float] Longitude (-180 to 180)
      #
      # @param limit [Integer] Maximum results (default 20, max 100)
      #
      # @param radius [Integer] Search radius in meters (default 500, max 10000)
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::FeatureCollection]
      #
      # @see PlazaSDK::Models::ElementNearbyParams
      def nearby(params)
        parsed, options = PlazaSDK::ElementNearbyParams.dump_request(params)
        query = PlazaSDK::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/features/nearby",
          query: query,
          headers: {"accept" => "application/geo+json"},
          model: PlazaSDK::FeatureCollection,
          options: options
        )
      end

      # Query features by bounding box or H3 cell
      #
      # @overload query(bbox: nil, cursor: nil, h3: nil, limit: nil, type: nil, request_options: {})
      #
      # @param bbox [String] Bounding box: south,west,north,east. At least one of bbox or h3 is required.
      #
      # @param cursor [String] Cursor for pagination
      #
      # @param h3 [String] H3 cell index. At least one of bbox or h3 is required.
      #
      # @param limit [Integer] Maximum results (default 100, max 10000)
      #
      # @param type [String] Element types (comma-separated: node,way,relation)
      #
      # @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [PlazaSDK::Models::FeatureCollection]
      #
      # @see PlazaSDK::Models::ElementQueryParams
      def query(params = {})
        parsed, options = PlazaSDK::ElementQueryParams.dump_request(params)
        query = PlazaSDK::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "api/v1/features",
          query: query,
          headers: {"accept" => "application/geo+json"},
          model: PlazaSDK::FeatureCollection,
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
