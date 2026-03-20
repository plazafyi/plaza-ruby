# typed: strong

module Plaza
  module Models
    class RoutingNearestParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::RoutingNearestParams, Plaza::Internal::AnyHash)
        end

      # Latitude
      sig { returns(Float) }
      attr_accessor :lat

      # Longitude
      sig { returns(Float) }
      attr_accessor :lng

      # Comma-separated property fields to include
      sig { returns(T.nilable(String)) }
      attr_reader :output_fields

      sig { params(output_fields: String).void }
      attr_writer :output_fields

      # Extra computed fields: bbox, distance, center
      sig { returns(T.nilable(String)) }
      attr_reader :output_include

      sig { params(output_include: String).void }
      attr_writer :output_include

      # Coordinate decimal precision (1-15, default 7)
      sig { returns(T.nilable(Integer)) }
      attr_reader :output_precision

      sig { params(output_precision: Integer).void }
      attr_writer :output_precision

      # Search radius in meters (default 500, max 5000)
      sig { returns(T.nilable(Integer)) }
      attr_reader :radius

      sig { params(radius: Integer).void }
      attr_writer :radius

      sig do
        params(
          lat: Float,
          lng: Float,
          output_fields: String,
          output_include: String,
          output_precision: Integer,
          radius: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Latitude
        lat:,
        # Longitude
        lng:,
        # Comma-separated property fields to include
        output_fields: nil,
        # Extra computed fields: bbox, distance, center
        output_include: nil,
        # Coordinate decimal precision (1-15, default 7)
        output_precision: nil,
        # Search radius in meters (default 500, max 5000)
        radius: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lat: Float,
            lng: Float,
            output_fields: String,
            output_include: String,
            output_precision: Integer,
            radius: Integer,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
