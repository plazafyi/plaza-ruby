# typed: strong

module Plaza
  module Models
    class GeocodeReverseParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::GeocodeReverseParams, Plaza::Internal::AnyHash)
        end

      # Latitude
      sig { returns(Float) }
      attr_accessor :lat

      # Longitude
      sig { returns(Float) }
      attr_accessor :lng

      # Language code for localized names (e.g. en, de, fr)
      sig { returns(T.nilable(String)) }
      attr_reader :lang

      sig { params(lang: String).void }
      attr_writer :lang

      # Filter by layer: house or poi
      sig { returns(T.nilable(String)) }
      attr_reader :layer

      sig { params(layer: String).void }
      attr_writer :layer

      # Maximum results (default 1, max 20)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Search radius in meters (default 200, max 5000)
      sig { returns(T.nilable(Integer)) }
      attr_reader :radius

      sig { params(radius: Integer).void }
      attr_writer :radius

      sig do
        params(
          lat: Float,
          lng: Float,
          lang: String,
          layer: String,
          limit: Integer,
          radius: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Latitude
        lat:,
        # Longitude
        lng:,
        # Language code for localized names (e.g. en, de, fr)
        lang: nil,
        # Filter by layer: house or poi
        layer: nil,
        # Maximum results (default 1, max 20)
        limit: nil,
        # Search radius in meters (default 200, max 5000)
        radius: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lat: Float,
            lng: Float,
            lang: String,
            layer: String,
            limit: Integer,
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
