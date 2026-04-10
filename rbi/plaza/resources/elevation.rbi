# typed: strong

module Plaza
  module Resources
    class Elevation
      # Look up elevation at one or more points
      sig do
        params(
          geometry:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash
            ),
          format_: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ElevationLookupResult)
      end
      def lookup(
        # Body param: Point or MultiPoint geometry to look up elevations for
        geometry:,
        # Query param: Response format: json (default), geojson, csv, ndjson
        format_: nil,
        request_options: {}
      )
      end

      # Elevation profile along coordinates
      sig do
        params(
          geometry: Plaza::LineStringGeometry::OrHash,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ElevationProfileResult)
      end
      def profile(
        # GeoJSON LineString geometry per RFC 7946. An ordered sequence of two or more
        # positions.
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
