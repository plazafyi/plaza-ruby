# typed: strong

module PlazaSDK
  module Resources
    class MapMatch
      # Match GPS coordinates to the road network
      sig do
        params(
          trace: PlazaSDK::GeoJsonGeometry::OrHash,
          radiuses: T.nilable(T::Array[Float]),
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(PlazaSDK::MapMatchResult)
      end
      def match(
        # GPS trace (GeoJSON LineString geometry)
        trace:,
        # Search radius per coordinate in meters (optional, default 50)
        radiuses: nil,
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
