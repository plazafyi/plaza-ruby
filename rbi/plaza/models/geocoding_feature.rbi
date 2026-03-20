# typed: strong

module Plaza
  module Models
    class GeocodingFeature < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::GeocodingFeature, Plaza::Internal::AnyHash)
        end

      # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
      # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
      sig { returns(Plaza::GeoJsonGeometry) }
      attr_reader :geometry

      sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
      attr_writer :geometry

      # Geocoding result properties
      sig { returns(Plaza::GeocodingFeature::Properties) }
      attr_reader :properties

      sig do
        params(properties: Plaza::GeocodingFeature::Properties::OrHash).void
      end
      attr_writer :properties

      sig { returns(Plaza::GeocodingFeature::Type::TaggedSymbol) }
      attr_accessor :type

      # GeoJSON Feature representing a geocoding result. The geometry is always a Point.
      # Properties include the formatted display name, OSM metadata, confidence score,
      # and source type.
      sig do
        params(
          geometry: Plaza::GeoJsonGeometry::OrHash,
          properties: Plaza::GeocodingFeature::Properties::OrHash,
          type: Plaza::GeocodingFeature::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
        # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
        geometry:,
        # Geocoding result properties
        properties:,
        type:
      )
      end

      sig do
        override.returns(
          {
            geometry: Plaza::GeoJsonGeometry,
            properties: Plaza::GeocodingFeature::Properties,
            type: Plaza::GeocodingFeature::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Properties < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::GeocodingFeature::Properties, Plaza::Internal::AnyHash)
          end

        # Formatted address or place name
        sig { returns(String) }
        attr_accessor :display_name

        # POI category (e.g. restaurant, cafe, park). Present for place results.
        sig { returns(T.nilable(String)) }
        attr_accessor :category

        # City or town name. Present for address results.
        sig { returns(T.nilable(String)) }
        attr_accessor :city

        # Interpolation confidence (0-1). Present only for interpolated results.
        sig { returns(T.nilable(Float)) }
        attr_accessor :confidence

        # Country name. Present for reverse geocode address results.
        sig { returns(T.nilable(String)) }
        attr_accessor :country

        # ISO 3166-1 alpha-2 country code
        sig { returns(T.nilable(String)) }
        attr_accessor :country_code

        # Distance from the query point in meters (reverse geocode / nearby only)
        sig { returns(T.nilable(Float)) }
        attr_accessor :distance_m

        # Complete formatted address from the database. Present for reverse geocode
        # address results.
        sig { returns(T.nilable(String)) }
        attr_accessor :full_address

        # House or building number. Present for address and interpolated results.
        sig { returns(T.nilable(String)) }
        attr_accessor :house_number

        # Whether this result was estimated by address interpolation rather than an exact
        # database match.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :interpolated

        # Place name (raw). Present for reverse geocode place results.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # OpenStreetMap element ID (null for interpolated results)
        sig { returns(T.nilable(Integer)) }
        attr_accessor :osm_id

        # OSM element type (node, way, relation)
        sig do
          returns(
            T.nilable(
              Plaza::GeocodingFeature::Properties::OsmType::TaggedSymbol
            )
          )
        end
        attr_accessor :osm_type

        # Postal code. Present for reverse geocode address results.
        sig { returns(T.nilable(String)) }
        attr_accessor :postcode

        # Relevance score (higher is better). Incorporates text match quality, spatial
        # proximity boost, and popularity signals. Not bounded to 0-1.
        sig { returns(T.nilable(Float)) }
        attr_accessor :score

        # Result source indicating how the result was found: structured (exact field
        # match), bm25 (full-text search), fuzzy (trigram similarity), address (reverse
        # geocode address), place (reverse geocode POI), interpolation (estimated from
        # neighboring addresses)
        sig do
          returns(
            T.nilable(Plaza::GeocodingFeature::Properties::Source::TaggedSymbol)
          )
        end
        attr_accessor :source

        # State or province name. Present for reverse geocode address results.
        sig { returns(T.nilable(String)) }
        attr_accessor :state

        # Street name. Present for address and interpolated results.
        sig { returns(T.nilable(String)) }
        attr_accessor :street

        # POI subcategory. Present for place results.
        sig { returns(T.nilable(String)) }
        attr_accessor :subcategory

        # Raw OSM tags. Present for place results.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_accessor :tags

        # Wikipedia article reference (e.g. en:Eiffel Tower). Present for notable places.
        sig { returns(T.nilable(String)) }
        attr_accessor :wikipedia

        # Geocoding result properties
        sig do
          params(
            display_name: String,
            category: T.nilable(String),
            city: T.nilable(String),
            confidence: T.nilable(Float),
            country: T.nilable(String),
            country_code: T.nilable(String),
            distance_m: T.nilable(Float),
            full_address: T.nilable(String),
            house_number: T.nilable(String),
            interpolated: T.nilable(T::Boolean),
            name: T.nilable(String),
            osm_id: T.nilable(Integer),
            osm_type:
              T.nilable(Plaza::GeocodingFeature::Properties::OsmType::OrSymbol),
            postcode: T.nilable(String),
            score: T.nilable(Float),
            source:
              T.nilable(Plaza::GeocodingFeature::Properties::Source::OrSymbol),
            state: T.nilable(String),
            street: T.nilable(String),
            subcategory: T.nilable(String),
            tags: T.nilable(T::Hash[Symbol, String]),
            wikipedia: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Formatted address or place name
          display_name:,
          # POI category (e.g. restaurant, cafe, park). Present for place results.
          category: nil,
          # City or town name. Present for address results.
          city: nil,
          # Interpolation confidence (0-1). Present only for interpolated results.
          confidence: nil,
          # Country name. Present for reverse geocode address results.
          country: nil,
          # ISO 3166-1 alpha-2 country code
          country_code: nil,
          # Distance from the query point in meters (reverse geocode / nearby only)
          distance_m: nil,
          # Complete formatted address from the database. Present for reverse geocode
          # address results.
          full_address: nil,
          # House or building number. Present for address and interpolated results.
          house_number: nil,
          # Whether this result was estimated by address interpolation rather than an exact
          # database match.
          interpolated: nil,
          # Place name (raw). Present for reverse geocode place results.
          name: nil,
          # OpenStreetMap element ID (null for interpolated results)
          osm_id: nil,
          # OSM element type (node, way, relation)
          osm_type: nil,
          # Postal code. Present for reverse geocode address results.
          postcode: nil,
          # Relevance score (higher is better). Incorporates text match quality, spatial
          # proximity boost, and popularity signals. Not bounded to 0-1.
          score: nil,
          # Result source indicating how the result was found: structured (exact field
          # match), bm25 (full-text search), fuzzy (trigram similarity), address (reverse
          # geocode address), place (reverse geocode POI), interpolation (estimated from
          # neighboring addresses)
          source: nil,
          # State or province name. Present for reverse geocode address results.
          state: nil,
          # Street name. Present for address and interpolated results.
          street: nil,
          # POI subcategory. Present for place results.
          subcategory: nil,
          # Raw OSM tags. Present for place results.
          tags: nil,
          # Wikipedia article reference (e.g. en:Eiffel Tower). Present for notable places.
          wikipedia: nil
        )
        end

        sig do
          override.returns(
            {
              display_name: String,
              category: T.nilable(String),
              city: T.nilable(String),
              confidence: T.nilable(Float),
              country: T.nilable(String),
              country_code: T.nilable(String),
              distance_m: T.nilable(Float),
              full_address: T.nilable(String),
              house_number: T.nilable(String),
              interpolated: T.nilable(T::Boolean),
              name: T.nilable(String),
              osm_id: T.nilable(Integer),
              osm_type:
                T.nilable(
                  Plaza::GeocodingFeature::Properties::OsmType::TaggedSymbol
                ),
              postcode: T.nilable(String),
              score: T.nilable(Float),
              source:
                T.nilable(
                  Plaza::GeocodingFeature::Properties::Source::TaggedSymbol
                ),
              state: T.nilable(String),
              street: T.nilable(String),
              subcategory: T.nilable(String),
              tags: T.nilable(T::Hash[Symbol, String]),
              wikipedia: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # OSM element type (node, way, relation)
        module OsmType
          extend Plaza::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Plaza::GeocodingFeature::Properties::OsmType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NODE =
            T.let(
              :node,
              Plaza::GeocodingFeature::Properties::OsmType::TaggedSymbol
            )
          WAY =
            T.let(
              :way,
              Plaza::GeocodingFeature::Properties::OsmType::TaggedSymbol
            )
          RELATION =
            T.let(
              :relation,
              Plaza::GeocodingFeature::Properties::OsmType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Plaza::GeocodingFeature::Properties::OsmType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Result source indicating how the result was found: structured (exact field
        # match), bm25 (full-text search), fuzzy (trigram similarity), address (reverse
        # geocode address), place (reverse geocode POI), interpolation (estimated from
        # neighboring addresses)
        module Source
          extend Plaza::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Plaza::GeocodingFeature::Properties::Source)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STRUCTURED =
            T.let(
              :structured,
              Plaza::GeocodingFeature::Properties::Source::TaggedSymbol
            )
          BM25 =
            T.let(
              :bm25,
              Plaza::GeocodingFeature::Properties::Source::TaggedSymbol
            )
          FUZZY =
            T.let(
              :fuzzy,
              Plaza::GeocodingFeature::Properties::Source::TaggedSymbol
            )
          ADDRESS =
            T.let(
              :address,
              Plaza::GeocodingFeature::Properties::Source::TaggedSymbol
            )
          PLACE =
            T.let(
              :place,
              Plaza::GeocodingFeature::Properties::Source::TaggedSymbol
            )
          INTERPOLATION =
            T.let(
              :interpolation,
              Plaza::GeocodingFeature::Properties::Source::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Plaza::GeocodingFeature::Properties::Source::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module Type
        extend Plaza::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Plaza::GeocodingFeature::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FEATURE = T.let(:Feature, Plaza::GeocodingFeature::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Plaza::GeocodingFeature::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
