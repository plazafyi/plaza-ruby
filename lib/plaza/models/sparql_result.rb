# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Query#sparql
    class SparqlResult < Plaza::Internal::Type::BaseModel
      # @!attribute results
      #   Array of GeoJSON Features matching the SPARQL query. Features include `@type`
      #   and `@id` metadata when the source element type is known, but may contain only
      #   tags as properties for untyped results.
      #
      #   @return [Array<Plaza::Models::SparqlResult::Result>]
      required :results, -> { Plaza::Internal::Type::ArrayOf[Plaza::SparqlResult::Result] }

      # @!method initialize(results:)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::SparqlResult} for more details.
      #
      #   SPARQL query result. Contains a `results` array of GeoJSON Feature objects.
      #   Unlike REST feature endpoints, SPARQL results may omit `@type`, `@id`, and
      #   compound `id` fields depending on the query shape.
      #
      #   @param results [Array<Plaza::Models::SparqlResult::Result>] Array of GeoJSON Features matching the SPARQL query. Features include `@type` an

      class Result < Plaza::Internal::Type::BaseModel
        # @!attribute geometry
        #   GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
        #   order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
        #
        #   @return [Plaza::Models::GeoJsonGeometry]
        required :geometry, -> { Plaza::GeoJsonGeometry }

        # @!attribute properties
        #   OSM tags as key-value pairs, optionally with `@type` and `@id` metadata
        #
        #   @return [Hash{Symbol=>Object}]
        required :properties, Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]

        # @!attribute type
        #   Always `Feature`
        #
        #   @return [Symbol, Plaza::Models::SparqlResult::Result::Type]
        required :type, enum: -> { Plaza::SparqlResult::Result::Type }

        # @!attribute id
        #   Compound identifier in `type/osm_id` format (present when element type is known)
        #
        #   @return [String, nil]
        optional :id, String, nil?: true

        # @!method initialize(geometry:, properties:, type:, id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Plaza::Models::SparqlResult::Result} for more details.
        #
        #   GeoJSON Feature (may lack @type/@id metadata for untyped results)
        #
        #   @param geometry [Plaza::Models::GeoJsonGeometry] GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude] orde
        #
        #   @param properties [Hash{Symbol=>Object}] OSM tags as key-value pairs, optionally with `@type` and `@id` metadata
        #
        #   @param type [Symbol, Plaza::Models::SparqlResult::Result::Type] Always `Feature`
        #
        #   @param id [String, nil] Compound identifier in `type/osm_id` format (present when element type is known)

        # Always `Feature`
        #
        # @see Plaza::Models::SparqlResult::Result#type
        module Type
          extend Plaza::Internal::Type::Enum

          FEATURE = :Feature

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
