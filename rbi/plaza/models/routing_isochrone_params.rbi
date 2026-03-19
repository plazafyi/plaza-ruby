# typed: strong

module Plaza
  module Models
    class RoutingIsochroneParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::RoutingIsochroneParams, Plaza::Internal::AnyHash)
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

      # Travel mode (auto, foot, bicycle)
      sig { returns(T.nilable(String)) }
      attr_reader :mode

      sig { params(mode: String).void }
      attr_writer :mode

      sig do
        params(
          lat: Float,
          lng: Float,
          time: Float,
          mode: String,
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
        # Travel mode (auto, foot, bicycle)
        mode: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lat: Float,
            lng: Float,
            time: Float,
            mode: String,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
