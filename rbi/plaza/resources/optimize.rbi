# typed: strong

module Plaza
  module Resources
    class Optimize
      # Optimize route through waypoints
      sig do
        params(
          waypoints: Plaza::MultiPointGeometry::OrHash,
          format_: String,
          mode: Plaza::OptimizeRequest::Mode::OrSymbol,
          roundtrip: T::Boolean,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::OptimizeResult::Variants)
      end
      def create(
        # Body param: GeoJSON MultiPoint geometry per RFC 7946. An array of positions.
        waypoints:,
        # Query param: Response format: json (default), geojson, csv, ndjson
        format_: nil,
        # Body param: Travel mode (default: `auto`)
        mode: nil,
        # Body param: Whether the route should return to the starting waypoint (default:
        # true)
        roundtrip: nil,
        request_options: {}
      )
      end

      # Get async optimization result
      sig do
        params(
          job_id: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::OptimizeJobStatus)
      end
      def retrieve(job_id, request_options: {})
      end

      # @api private
      sig { params(client: Plaza::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
