# typed: strong

module Plaza
  module Models
    class ElevationLookupPostParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationLookupPostParams, Plaza::Internal::AnyHash)
        end

      # Response format: json (default), geojson, csv, ndjson
      sig { returns(T.nilable(String)) }
      attr_reader :format_

      sig { params(format_: String).void }
      attr_writer :format_

      # Latitude (single point)
      sig { returns(T.nilable(Float)) }
      attr_reader :lat

      sig { params(lat: Float).void }
      attr_writer :lat

      # Longitude (single point)
      sig { returns(T.nilable(Float)) }
      attr_reader :lng

      sig { params(lng: Float).void }
      attr_writer :lng

      # Pipe-separated lng,lat pairs (batch)
      sig { returns(T.nilable(String)) }
      attr_reader :locations

      sig { params(locations: String).void }
      attr_writer :locations

      # Comma-separated property fields to include
      sig { returns(T.nilable(String)) }
      attr_reader :output_fields

      sig { params(output_fields: String).void }
      attr_writer :output_fields

      # Extra computed fields: bbox, center
      sig { returns(T.nilable(String)) }
      attr_reader :output_include

      sig { params(output_include: String).void }
      attr_writer :output_include

      # Coordinate decimal precision (1-15, default 7)
      sig { returns(T.nilable(Integer)) }
      attr_reader :output_precision

      sig { params(output_precision: Integer).void }
      attr_writer :output_precision

      sig do
        params(
          format_: String,
          lat: Float,
          lng: Float,
          locations: String,
          output_fields: String,
          output_include: String,
          output_precision: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
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

      sig do
        override.returns(
          {
            format_: String,
            lat: Float,
            lng: Float,
            locations: String,
            output_fields: String,
            output_include: String,
            output_precision: Integer,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
