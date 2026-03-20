# typed: strong

module Plaza
  module Models
    class SparqlResult < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::SparqlResult, Plaza::Internal::AnyHash) }

      # Array of GeoJSON Features matching the SPARQL query. Features include `@type`
      # and `@id` metadata when the source element type is known, but may contain only
      # tags as properties for untyped results.
      sig { returns(T::Array[Plaza::SparqlResult::Result]) }
      attr_accessor :results

      # SPARQL query result. Contains a `results` array of GeoJSON Feature objects.
      # Unlike REST feature endpoints, SPARQL results may omit `@type`, `@id`, and
      # compound `id` fields depending on the query shape.
      sig do
        params(results: T::Array[Plaza::SparqlResult::Result::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(
        # Array of GeoJSON Features matching the SPARQL query. Features include `@type`
        # and `@id` metadata when the source element type is known, but may contain only
        # tags as properties for untyped results.
        results:
      )
      end

      sig do
        override.returns({ results: T::Array[Plaza::SparqlResult::Result] })
      end
      def to_hash
      end

      class Result < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::SparqlResult::Result, Plaza::Internal::AnyHash)
          end

        # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
        # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
        sig { returns(Plaza::GeoJsonGeometry) }
        attr_reader :geometry

        sig { params(geometry: Plaza::GeoJsonGeometry::OrHash).void }
        attr_writer :geometry

        # OSM tags as key-value pairs, optionally with `@type` and `@id` metadata
        sig { returns(T::Hash[Symbol, T.anything]) }
        attr_accessor :properties

        # Always `Feature`
        sig { returns(Plaza::SparqlResult::Result::Type::TaggedSymbol) }
        attr_accessor :type

        # Compound identifier in `type/osm_id` format (present when element type is known)
        sig { returns(T.nilable(String)) }
        attr_accessor :id

        # GeoJSON Feature (may lack @type/@id metadata for untyped results)
        sig do
          params(
            geometry: Plaza::GeoJsonGeometry::OrHash,
            properties: T::Hash[Symbol, T.anything],
            type: Plaza::SparqlResult::Result::Type::OrSymbol,
            id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
          # order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
          geometry:,
          # OSM tags as key-value pairs, optionally with `@type` and `@id` metadata
          properties:,
          # Always `Feature`
          type:,
          # Compound identifier in `type/osm_id` format (present when element type is known)
          id: nil
        )
        end

        sig do
          override.returns(
            {
              geometry: Plaza::GeoJsonGeometry,
              properties: T::Hash[Symbol, T.anything],
              type: Plaza::SparqlResult::Result::Type::TaggedSymbol,
              id: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Always `Feature`
        module Type
          extend Plaza::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Plaza::SparqlResult::Result::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FEATURE =
            T.let(:Feature, Plaza::SparqlResult::Result::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Plaza::SparqlResult::Result::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
