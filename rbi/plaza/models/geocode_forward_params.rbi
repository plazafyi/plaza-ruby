# typed: strong

module Plaza
  module Models
    class GeocodeForwardParams < Plaza::Models::GeocodeForwardRequest
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::GeocodeForwardParams, Plaza::Internal::AnyHash)
        end

      # Response format: json (default), geojson, csv, ndjson
      sig { returns(T.nilable(String)) }
      attr_reader :format_

      sig { params(format_: String).void }
      attr_writer :format_

      sig do
        params(
          format_: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { format_: String, request_options: Plaza::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
