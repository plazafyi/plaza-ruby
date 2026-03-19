# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Routing#nearest
    class NearestResult < Plaza::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [Plaza::Models::GeoJsonGeometry]
      required :geometry, -> { Plaza::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [Plaza::Models::NearestResult::Properties]
      required :properties, -> { Plaza::NearestResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, Plaza::Models::NearestResult::Type]
      required :type, enum: -> { Plaza::NearestResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   GeoJSON Point Feature snapped to the nearest road segment
      #
      #   @param geometry [Plaza::Models::GeoJsonGeometry]
      #   @param properties [Plaza::Models::NearestResult::Properties]
      #   @param type [Symbol, Plaza::Models::NearestResult::Type]

      # @see Plaza::Models::NearestResult#properties
      class Properties < Plaza::Internal::Type::BaseModel
        # @!attribute distance_m
        #   Distance to nearest road in meters
        #
        #   @return [Float, nil]
        optional :distance_m, Float

        # @!attribute edge_id
        #   Road edge ID
        #
        #   @return [Integer, nil]
        optional :edge_id, Integer, nil?: true

        # @!method initialize(distance_m: nil, edge_id: nil)
        #   @param distance_m [Float] Distance to nearest road in meters
        #
        #   @param edge_id [Integer, nil] Road edge ID
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
