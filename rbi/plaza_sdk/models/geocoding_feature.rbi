# typed: strong

module PlazaSDK
  module Models
    class GeocodingFeature < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::GeocodingFeature, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(PlazaSDK::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: PlazaSDK::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      sig { returns(PlazaSDK::GeocodingFeature::Properties) }
      attr_reader :properties

      sig do
        params(properties: PlazaSDK::GeocodingFeature::Properties::OrHash).void
      end
      attr_writer :properties

      sig { returns(PlazaSDK::GeocodingFeature::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          geometry: PlazaSDK::GeoJsonGeometry::OrHash,
          properties: PlazaSDK::GeocodingFeature::Properties::OrHash,
          type: PlazaSDK::GeocodingFeature::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(geometry:, properties:, type:)
      end

      sig do
        override.returns(
          {
            geometry: PlazaSDK::GeoJsonGeometry,
            properties: PlazaSDK::GeocodingFeature::Properties,
            type: PlazaSDK::GeocodingFeature::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < PlazaSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              PlazaSDK::GeocodingFeature::Properties,
              PlazaSDK::Internal::AnyHash
            )
          end

        # ISO 3166-1 alpha-2 country code
        sig { returns(T.nilable(String)) }
        attr_accessor :country_code

        # Formatted address or place name
        sig { returns(T.nilable(String)) }
        attr_reader :display_name

        sig { params(display_name: String).void }
        attr_writer :display_name

        # Distance in meters
        sig { returns(T.nilable(Float)) }
        attr_accessor :distance_m

        # OpenStreetMap ID
        sig { returns(T.nilable(Integer)) }
        attr_accessor :osm_id

        # OSM element type
        sig { returns(T.nilable(String)) }
        attr_accessor :osm_type

        # Match confidence score
        sig { returns(T.nilable(Float)) }
        attr_accessor :score

        # Result source (address, place, interpolation)
        sig { returns(T.nilable(String)) }
        attr_accessor :source

        sig do
          params(
            country_code: T.nilable(String),
            display_name: String,
            distance_m: T.nilable(Float),
            osm_id: T.nilable(Integer),
            osm_type: T.nilable(String),
            score: T.nilable(Float),
            source: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # ISO 3166-1 alpha-2 country code
          country_code: nil,
          # Formatted address or place name
          display_name: nil,
          # Distance in meters
          distance_m: nil,
          # OpenStreetMap ID
          osm_id: nil,
          # OSM element type
          osm_type: nil,
          # Match confidence score
          score: nil,
          # Result source (address, place, interpolation)
          source: nil
        )
        end

        sig do
          override.returns(
            {
              country_code: T.nilable(String),
              display_name: String,
              distance_m: T.nilable(Float),
              osm_id: T.nilable(Integer),
              osm_type: T.nilable(String),
              score: T.nilable(Float),
              source: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      module Type
        extend PlazaSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, PlazaSDK::GeocodingFeature::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE =
          T.let(:Feature, PlazaSDK::GeocodingFeature::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[PlazaSDK::GeocodingFeature::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
