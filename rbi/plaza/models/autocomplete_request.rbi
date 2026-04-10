# typed: strong

module Plaza
  module Models
    class AutocompleteRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::AutocompleteRequest, Plaza::Internal::AnyHash)
        end

      # Partial address or place name input
      sig { returns(String) }
      attr_accessor :q

      # ISO 3166-1 alpha-2 country code to restrict results
      sig { returns(T.nilable(String)) }
      attr_accessor :country_code

      # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
      # order. Optional third element is altitude in meters.
      sig { returns(T.nilable(Plaza::PointGeometry)) }
      attr_reader :focus

      sig { params(focus: T.nilable(Plaza::PointGeometry::OrHash)).void }
      attr_writer :focus

      # Preferred response language (ISO 639-1)
      sig { returns(T.nilable(String)) }
      attr_accessor :lang

      # Filter by result layer (e.g. `address`, `place`, `poi`)
      sig { returns(T.nilable(String)) }
      attr_accessor :layer

      # Maximum number of suggestions (default: 5, max: 20)
      sig { returns(T.nilable(Integer)) }
      attr_accessor :limit

      # Request body for autocomplete suggestions. Optimized for low-latency type-ahead
      # UIs.
      sig do
        params(
          q: String,
          country_code: T.nilable(String),
          focus: T.nilable(Plaza::PointGeometry::OrHash),
          lang: T.nilable(String),
          layer: T.nilable(String),
          limit: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # Partial address or place name input
        q:,
        # ISO 3166-1 alpha-2 country code to restrict results
        country_code: nil,
        # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
        # order. Optional third element is altitude in meters.
        focus: nil,
        # Preferred response language (ISO 639-1)
        lang: nil,
        # Filter by result layer (e.g. `address`, `place`, `poi`)
        layer: nil,
        # Maximum number of suggestions (default: 5, max: 20)
        limit: nil
      )
      end

      sig do
        override.returns(
          {
            q: String,
            country_code: T.nilable(String),
            focus: T.nilable(Plaza::PointGeometry),
            lang: T.nilable(String),
            layer: T.nilable(String),
            limit: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
