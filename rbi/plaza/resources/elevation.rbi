# typed: strong

module Plaza
  module Resources
    class Elevation
      # Look up elevation for multiple coordinates
      sig do
        params(
          coordinates:
            T::Array[Plaza::ElevationBatchParams::Coordinate::OrHash],
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ElevationBatchResult)
      end
      def batch(
        # Coordinates to look up elevations for (max 50)
        coordinates:,
        request_options: {}
      )
      end

      # Look up elevation at one or more points
      sig do
        params(
          lat: Float,
          lng: Float,
          locations: String,
          output_fields: String,
          output_include: String,
          output_precision: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ElevationLookupResult)
      end
      def lookup(
        # Latitude (single point)
        lat: nil,
        # Longitude (single point)
        lng: nil,
        # Pipe-separated lng,lat pairs (batch)
        locations: nil,
        # Comma-separated property fields to include
        output_fields: nil,
        # Extra computed fields: bbox, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        request_options: {}
      )
      end

      # Look up elevation at one or more points
      sig do
        params(
          lat: Float,
          lng: Float,
          locations: String,
          output_fields: String,
          output_include: String,
          output_precision: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ElevationLookupResult)
      end
      def lookup_post(
        # Latitude (single point)
        lat: nil,
        # Longitude (single point)
        lng: nil,
        # Pipe-separated lng,lat pairs (batch)
        locations: nil,
        # Comma-separated property fields to include
        output_fields: nil,
        # Extra computed fields: bbox, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        request_options: {}
      )
      end

      # Elevation profile along coordinates
      sig do
        params(
          coordinates:
            T::Array[Plaza::ElevationProfileRequest::Coordinate::OrHash],
          request_options: Plaza::RequestOptions::OrHash
        ).returns(Plaza::ElevationProfileResult)
      end
      def profile(
        # Path coordinates in order of travel (min 2, max 50)
        coordinates:,
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
