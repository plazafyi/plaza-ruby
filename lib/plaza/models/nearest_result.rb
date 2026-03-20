# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#nearest
    class NearestResult < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #   GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
      #   order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :geometry, -> { Plaza::GeoJsonGeometry }

      # @!attribute properties
      #   Snap result metadata
      #
      #   @return [Plaza::Models::NearestResult::Properties]
      required :properties, -> { Plaza::NearestResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::NearestResult::Type]
      required :type, enum: -> { Plaza::NearestResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::NearestResult} for more details.
      #
      #   GeoJSON Point Feature representing the nearest point on the road network to the
      #   input coordinate. Used for snapping GPS coordinates to roads.
      #
      #   @param geometry [Plaza::Models::GeoJsonGeometry] GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude] orde
      #
      #   @param properties [Plaza::Models::NearestResult::Properties] Snap result metadata
      #
      #   @param type [Symbol, Plaza::Models::NearestResult::Type]

      # @see Plaza::Models::NearestResult#properties
      class Properties < Plaza::Internal::Type::BaseModel
        # @!attribute distance_m
        #   Distance from the input coordinate to the snapped point in meters
        #
        #   @return [Float, nil]
        optional :distance_m, Float

        # @!attribute edge_id
        #   ID of the road network edge that was snapped to
        #
        #   @return [Integer, nil]
        optional :edge_id, Integer

        # @!attribute edge_length_m
        #   Length of the matched road edge in meters
        #
        #   @return [Float, nil]
        optional :edge_length_m, Float

        # @!attribute highway
        #   OSM highway tag value (e.g. `residential`, `primary`, `motorway`)
        #
        #   @return [String, nil]
        optional :highway, String, nil?: true

        # @!attribute osm_way_id
        #   OSM way ID of the matched road segment
        #
        #   @return [Integer, nil]
        optional :osm_way_id, Integer

        # @!attribute surface
        #   OSM surface tag value (e.g. `asphalt`, `gravel`, `paved`)
        #
        #   @return [String, nil]
        optional :surface, String, nil?: true

        # @!method initialize(distance_m: nil, edge_id: nil, edge_length_m: nil, highway: nil, osm_way_id: nil, surface: nil)
        #   Snap result metadata
        #
        #   @param distance_m [Float] Distance from the input coordinate to the snapped point in meters
        #
        #   @param edge_id [Integer] ID of the road network edge that was snapped to
        #
        #   @param edge_length_m [Float] Length of the matched road edge in meters
        #
        #   @param highway [String, nil] OSM highway tag value (e.g. `residential`, `primary`, `motorway`)
        #
        #   @param osm_way_id [Integer] OSM way ID of the matched road segment
        #
        #   @param surface [String, nil] OSM surface tag value (e.g. `asphalt`, `gravel`, `paved`)
      end

      # @see Plaza::Models::NearestResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
