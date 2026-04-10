# frozen_string_literal: true

module Plaza
  module Models
    class GeocodingFeature < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field
      #   determines the coordinate structure.
      #
      #   @return [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry]
      required :geometry, union: -> { Plaza::Geometry }

      # @!attribute properties
      #   Geocoding result properties
      #
      #   @return [Plaza::Models::GeocodingFeature::Properties]
      required :properties, -> { Plaza::GeocodingFeature::Properties }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::GeocodingFeature::Type]
      required :type, enum: -> { Plaza::GeocodingFeature::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::GeocodingFeature} for more details.
      #
      #   GeoJSON Feature representing a geocoding result. The geometry is always a Point.
      #   Properties include the formatted display name, OSM metadata, confidence score,
      #   and source type.
      #
      #   @param geometry [Plaza::Models::PointGeometry, Plaza::Models::LineStringGeometry, Plaza::Models::PolygonGeometry, Plaza::Models::MultiPointGeometry, Plaza::Models::MultiLineStringGeometry, Plaza::Models::MultiPolygonGeometry] GeoJSON Geometry object per RFC 7946. Discriminated union — the `type` field det
      #
      #   @param properties [Plaza::Models::GeocodingFeature::Properties] Geocoding result properties
      #
      #   @param type [Symbol, Plaza::Models::GeocodingFeature::Type]

      # @see Plaza::Models::GeocodingFeature#properties
      class Properties < Plaza::Internal::Type::BaseModel
        # @!attribute display_name
        #   Formatted address or place name
        #
        #   @return [String]
        required :display_name, String

        # @!attribute category
        #   POI category (e.g. restaurant, cafe, park). Present for place results.
        #
        #   @return [String, nil]
        optional :category, String, nil?: true

        # @!attribute city
        #   City or town name. Present for address results.
        #
        #   @return [String, nil]
        optional :city, String, nil?: true

        # @!attribute confidence
        #   Interpolation confidence (0-1). Present only for interpolated results.
        #
        #   @return [Float, nil]
        optional :confidence, Float, nil?: true

        # @!attribute country
        #   Country name. Present for reverse geocode address results.
        #
        #   @return [String, nil]
        optional :country, String, nil?: true

        # @!attribute country_code
        #   ISO 3166-1 alpha-2 country code
        #
        #   @return [String, nil]
        optional :country_code, String, nil?: true

        # @!attribute distance_m
        #   Distance from the query point in meters (reverse geocode / nearby only)
        #
        #   @return [Float, nil]
        optional :distance_m, Float, nil?: true

        # @!attribute full_address
        #   Complete formatted address from the database. Present for reverse geocode
        #   address results.
        #
        #   @return [String, nil]
        optional :full_address, String, nil?: true

        # @!attribute house_number
        #   House or building number. Present for address and interpolated results.
        #
        #   @return [String, nil]
        optional :house_number, String, nil?: true

        # @!attribute interpolated
        #   Whether this result was estimated by address interpolation rather than an exact
        #   database match.
        #
        #   @return [Boolean, nil]
        optional :interpolated, Plaza::Internal::Type::Boolean, nil?: true

        # @!attribute name
        #   Place name (raw). Present for reverse geocode place results.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute osm_id
        #   OpenStreetMap element ID (null for interpolated results)
        #
        #   @return [Integer, nil]
        optional :osm_id, Integer, nil?: true

        # @!attribute osm_type
        #   OSM element type (node, way, relation)
        #
        #   @return [Symbol, Plaza::Models::GeocodingFeature::Properties::OsmType, nil]
        optional :osm_type, enum: -> { Plaza::GeocodingFeature::Properties::OsmType }, nil?: true

        # @!attribute postcode
        #   Postal code. Present for reverse geocode address results.
        #
        #   @return [String, nil]
        optional :postcode, String, nil?: true

        # @!attribute score
        #   Relevance score (higher is better). Incorporates text match quality, spatial
        #   proximity boost, and popularity signals. Not bounded to 0-1.
        #
        #   @return [Float, nil]
        optional :score, Float, nil?: true

        # @!attribute source
        #   Result source indicating how the result was found: structured (exact field
        #   match), fuzzy (trigram similarity), address (reverse geocode address), place
        #   (reverse geocode POI), interpolation (estimated from neighboring addresses)
        #
        #   @return [Symbol, Plaza::Models::GeocodingFeature::Properties::Source, nil]
        optional :source, enum: -> { Plaza::GeocodingFeature::Properties::Source }, nil?: true

        # @!attribute state
        #   State or province name. Present for reverse geocode address results.
        #
        #   @return [String, nil]
        optional :state, String, nil?: true

        # @!attribute street
        #   Street name. Present for address and interpolated results.
        #
        #   @return [String, nil]
        optional :street, String, nil?: true

        # @!attribute subcategory
        #   POI subcategory. Present for place results.
        #
        #   @return [String, nil]
        optional :subcategory, String, nil?: true

        # @!attribute tags
        #   Raw OSM tags. Present for place results.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :tags, Plaza::Internal::Type::HashOf[String], nil?: true

        # @!attribute wikipedia
        #   Wikipedia article reference (e.g. en:Eiffel Tower). Present for notable places.
        #
        #   @return [String, nil]
        optional :wikipedia, String, nil?: true

        # @!method initialize(display_name:, category: nil, city: nil, confidence: nil, country: nil, country_code: nil, distance_m: nil, full_address: nil, house_number: nil, interpolated: nil, name: nil, osm_id: nil, osm_type: nil, postcode: nil, score: nil, source: nil, state: nil, street: nil, subcategory: nil, tags: nil, wikipedia: nil)
        #   Some parameter documentations has been truncated, see
        #   {Plaza::Models::GeocodingFeature::Properties} for more details.
        #
        #   Geocoding result properties
        #
        #   @param display_name [String] Formatted address or place name
        #
        #   @param category [String, nil] POI category (e.g. restaurant, cafe, park). Present for place results.
        #
        #   @param city [String, nil] City or town name. Present for address results.
        #
        #   @param confidence [Float, nil] Interpolation confidence (0-1). Present only for interpolated results.
        #
        #   @param country [String, nil] Country name. Present for reverse geocode address results.
        #
        #   @param country_code [String, nil] ISO 3166-1 alpha-2 country code
        #
        #   @param distance_m [Float, nil] Distance from the query point in meters (reverse geocode / nearby only)
        #
        #   @param full_address [String, nil] Complete formatted address from the database. Present for reverse geocode addres
        #
        #   @param house_number [String, nil] House or building number. Present for address and interpolated results.
        #
        #   @param interpolated [Boolean, nil] Whether this result was estimated by address interpolation rather than an exact
        #
        #   @param name [String, nil] Place name (raw). Present for reverse geocode place results.
        #
        #   @param osm_id [Integer, nil] OpenStreetMap element ID (null for interpolated results)
        #
        #   @param osm_type [Symbol, Plaza::Models::GeocodingFeature::Properties::OsmType, nil] OSM element type (node, way, relation)
        #
        #   @param postcode [String, nil] Postal code. Present for reverse geocode address results.
        #
        #   @param score [Float, nil] Relevance score (higher is better). Incorporates text match quality, spatial pro
        #
        #   @param source [Symbol, Plaza::Models::GeocodingFeature::Properties::Source, nil] Result source indicating how the result was found: structured (exact field match
        #
        #   @param state [String, nil] State or province name. Present for reverse geocode address results.
        #
        #   @param street [String, nil] Street name. Present for address and interpolated results.
        #
        #   @param subcategory [String, nil] POI subcategory. Present for place results.
        #
        #   @param tags [Hash{Symbol=>String}, nil] Raw OSM tags. Present for place results.
        #
        #   @param wikipedia [String, nil] Wikipedia article reference (e.g. en:Eiffel Tower). Present for notable places.

        # OSM element type (node, way, relation)
        #
        # @see Plaza::Models::GeocodingFeature::Properties#osm_type
        module OsmType
          extend Plaza::Internal::Type::Enum

          NODE = :node
          WAY = :way
          RELATION = :relation

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Result source indicating how the result was found: structured (exact field
        # match), fuzzy (trigram similarity), address (reverse geocode address), place
        # (reverse geocode POI), interpolation (estimated from neighboring addresses)
        #
        # @see Plaza::Models::GeocodingFeature::Properties#source
        module Source
          extend Plaza::Internal::Type::Enum

          STRUCTURED = :structured
          FUZZY = :fuzzy
          ADDRESS = :address
          PLACE = :place
          INTERPOLATION = :interpolation

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Plaza::Models::GeocodingFeature#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
