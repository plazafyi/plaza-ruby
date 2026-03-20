# typed: strong

module Plaza
  module Models
    class RoutingIsochronePostParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::RoutingIsochronePostParams, Plaza::Internal::AnyHash)
        end

      # Latitude
      sig { returns(Float) }
      attr_accessor :lat

      # Longitude
      sig { returns(Float) }
      attr_accessor :lng

      # Travel time in seconds (1-7200)
      sig { returns(Float) }
      attr_accessor :time

      # Response format: json (default), geojson, csv, ndjson
      sig { returns(T.nilable(String)) }
      attr_reader :format_

      sig { params(format_: String).void }
      attr_writer :format_

      # Travel mode (auto, foot, bicycle)
      sig { returns(T.nilable(String)) }
      attr_reader :mode

      sig { params(mode: String).void }
      attr_writer :mode

      # Comma-separated property fields to include
      sig { returns(T.nilable(String)) }
      attr_reader :output_fields

      sig { params(output_fields: String).void }
      attr_writer :output_fields

      # Include geometry (default true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :output_geometry

      sig { params(output_geometry: T::Boolean).void }
      attr_writer :output_geometry

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

      # Simplify geometry tolerance in meters
      sig { returns(T.nilable(Float)) }
      attr_reader :output_simplify

      sig { params(output_simplify: Float).void }
      attr_writer :output_simplify

      sig do
        params(
          lat: Float,
          lng: Float,
          time: Float,
          format_: String,
          mode: String,
          output_fields: String,
          output_geometry: T::Boolean,
          output_include: String,
          output_precision: Integer,
          output_simplify: Float,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Latitude
        lat:,
        # Longitude
        lng:,
        # Travel time in seconds (1-7200)
        time:,
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
        # Travel mode (auto, foot, bicycle)
        mode: nil,
        # Comma-separated property fields to include
        output_fields: nil,
        # Include geometry (default true)
        output_geometry: nil,
        # Extra computed fields: bbox, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Simplify geometry tolerance in meters
        output_simplify: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lat: Float,
            lng: Float,
            time: Float,
            format_: String,
            mode: String,
            output_fields: String,
            output_geometry: T::Boolean,
            output_include: String,
            output_precision: Integer,
            output_simplify: Float,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
