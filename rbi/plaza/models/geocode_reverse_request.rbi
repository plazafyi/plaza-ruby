# typed: strong

module Plaza
  module Models
    class GeocodeReverseRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::GeocodeReverseRequest, Plaza::Internal::AnyHash)
        end

      # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
      # order. Optional third element is altitude in meters.
      sig { returns(Plaza::PointGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::PointGeometry::OrHash).void }
      attr_writer :geometry

      # Preferred response language (ISO 639-1)
      sig { returns(T.nilable(String)) }
      attr_accessor :lang

      # Maximum number of results (default: 1, max: 50)
      sig { returns(T.nilable(Integer)) }
      attr_accessor :limit

      # Search radius in meters (default: 100)
      sig { returns(T.nilable(Float)) }
      attr_accessor :radius

      # Request body for reverse geocoding. Converts coordinates to addresses or place
      # names.
      sig do
        params(
          geometry: Plaza::PointGeometry::OrHash,
          lang: T.nilable(String),
          limit: T.nilable(Integer),
          radius: T.nilable(Float)
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON Point geometry per RFC 7946. Coordinates use [longitude, latitude]
        # order. Optional third element is altitude in meters.
        geometry:,
        # Preferred response language (ISO 639-1)
        lang: nil,
        # Maximum number of results (default: 1, max: 50)
        limit: nil,
        # Search radius in meters (default: 100)
        radius: nil
      )
      end

      sig do
        override.returns(
          {
            geometry: Plaza::PointGeometry,
            lang: T.nilable(String),
            limit: T.nilable(Integer),
            radius: T.nilable(Float)
          }
        )
      end
      def to_hash
      end
    end
  end
end
