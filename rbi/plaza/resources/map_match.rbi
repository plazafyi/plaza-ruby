# typed: strong

module Plaza
  module Resources
    class MapMatch
      # Match GPS coordinates to the road network
      sig do
        params(
          coordinates: T::Array[Plaza::MapMatchRequest::Coordinate::OrHash],
          radiuses: T.nilable(T::Array[Float]),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::MapMatchResult)
      end
      def match(
        # GPS coordinates to match, in order of travel (max 50 points)
        coordinates:,
        # Search radius per coordinate in meters. Must have the same length as
        # `coordinates` or be omitted entirely. Default: 50m per point.
        radiuses: nil,
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
