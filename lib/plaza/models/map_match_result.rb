# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::MapMatch#match
    class MapMatchResult < Plaza::Internal::Type::BaseModel
      # @!attribute features
      #   Snapped tracepoint Features in input order
      #
      #   @return [Array<Plaza::Models::MapMatchResult::Feature>]
      required :features, -> { Plaza::Internal::Type::ArrayOf[Plaza::MapMatchResult::Feature] }

      # @!attribute matchings
      #   Matched sub-routes. Each matching connects a contiguous sequence of tracepoints
      #   that could be matched to roads.
      #
      #   @return [Array<Hash{Symbol=>Object}>]
      required :matchings,
               Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]]

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::MapMatchResult::Type]
      required :type, enum: -> { Plaza::MapMatchResult::Type }

      # @!method initialize(features:, matchings:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Plaza::Models::MapMatchResult} for more details.
      #
      #   Map matching result as a GeoJSON FeatureCollection. Each Feature is a snapped
      #   tracepoint. The top-level `matchings` array contains the matched sub-routes
      #   connecting consecutive tracepoints.
      #
      #   @param features [Array<Plaza::Models::MapMatchResult::Feature>] Snapped tracepoint Features in input order
      #
      #   @param matchings [Array<Hash{Symbol=>Object}>] Matched sub-routes. Each matching connects a contiguous sequence of tracepoints
      #
      #   @param type [Symbol, Plaza::Models::MapMatchResult::Type]

      class Feature < Plaza::Internal::Type::BaseModel
        # @!attribute geometry
        #   GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude]
        #   order. 3D coordinates [lng, lat, elevation] are used for elevation endpoints.
        #
        #   @return [Plaza::Models::GeoJsonGeometry]
        required :geometry, -> { Plaza::GeoJsonGeometry }

        # @!attribute properties
        #
        #   @return [Plaza::Models::MapMatchResult::Feature::Properties]
        required :properties, -> { Plaza::MapMatchResult::Feature::Properties }

        # @!attribute type
        #
        #   @return [Symbol, Plaza::Models::MapMatchResult::Feature::Type]
        required :type, enum: -> { Plaza::MapMatchResult::Feature::Type }

        # @!method initialize(geometry:, properties:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Plaza::Models::MapMatchResult::Feature} for more details.
        #
        #   GeoJSON Point Feature representing a GPS point snapped to the road network.
        #
        #   @param geometry [Plaza::Models::GeoJsonGeometry] GeoJSON Geometry object per RFC 7946. Coordinates use [longitude, latitude] orde
        #
        #   @param properties [Plaza::Models::MapMatchResult::Feature::Properties]
        #
        #   @param type [Symbol, Plaza::Models::MapMatchResult::Feature::Type]

        # @see Plaza::Models::MapMatchResult::Feature#properties
        class Properties < Plaza::Internal::Type::BaseModel
          # @!attribute distance_m
          #   Distance from the original GPS point to the snapped point in meters
          #
          #   @return [Float, nil]
          optional :distance_m, Float

          # @!attribute edge_id
          #   Road edge ID the point was snapped to
          #
          #   @return [Integer, nil]
          optional :edge_id, Integer

          # @!attribute matchings_index
          #   Index into the `matchings` array indicating which matching sub-route this point
          #   belongs to
          #
          #   @return [Integer, nil]
          optional :matchings_index, Integer

          # @!attribute name
          #   Road name at the snapped point
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!attribute original
          #   Original GPS coordinate as [lng, lat]
          #
          #   @return [Array<Float>, nil]
          optional :original, Plaza::Internal::Type::ArrayOf[Float]

          # @!attribute waypoint_index
          #   Index of this tracepoint in the original `coordinates` array
          #
          #   @return [Integer, nil]
          optional :waypoint_index, Integer

          # @!method initialize(distance_m: nil, edge_id: nil, matchings_index: nil, name: nil, original: nil, waypoint_index: nil)
          #   Some parameter documentations has been truncated, see
          #   {Plaza::Models::MapMatchResult::Feature::Properties} for more details.
          #
          #   @param distance_m [Float] Distance from the original GPS point to the snapped point in meters
          #
          #   @param edge_id [Integer] Road edge ID the point was snapped to
          #
          #   @param matchings_index [Integer] Index into the `matchings` array indicating which matching sub-route this point
          #
          #   @param name [String, nil] Road name at the snapped point
          #
          #   @param original [Array<Float>] Original GPS coordinate as [lng, lat]
          #
          #   @param waypoint_index [Integer] Index of this tracepoint in the original `coordinates` array
        end

        # @see Plaza::Models::MapMatchResult::Feature#type
        module Type
          extend Plaza::Internal::Type::Enum

          FEATURE = :Feature

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Plaza::Models::MapMatchResult#type
      module Type
        extend Plaza::Internal::Type::Enum

        FEATURE_COLLECTION = :FeatureCollection

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
