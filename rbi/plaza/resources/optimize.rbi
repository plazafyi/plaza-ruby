# typed: strong

module Plaza
  module Resources
    class Optimize
      # Optimize route through waypoints
      sig do
        params(
          waypoints: Plaza::GeoJsonGeometry::OrHash,
          mode: Plaza::OptimizeRequest::Mode::OrSymbol,
          roundtrip: T::Boolean,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::OptimizeResult::Variants)
      end
      def create(
        # Waypoints to visit (GeoJSON MultiPoint geometry, minimum 2 points)
        waypoints:,
        # Travel mode (default: auto)
        mode: nil,
        # Whether route returns to start (default: true)
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
