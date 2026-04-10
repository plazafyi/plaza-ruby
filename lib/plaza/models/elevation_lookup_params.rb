# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Elevation#lookup
    class ElevationLookupParams < Plaza::Models::ElevationLookupRequest
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute format_
      #   Response format: json (default), geojson, csv, ndjson
      #
      #   @return [String, nil]
      optional :format_, String

      # @!method initialize(format_: nil, request_options: {})
      #   @param format_ [String] Response format: json (default), geojson, csv, ndjson
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
