# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Routing#nearest
    class NearestResult < PlazaSDK::Internal::Type::BaseModel
      # @!attribute geometry
      #
      #   @return [PlazaSDK::Models::GeoJsonGeometry]
      required :geometry, -> { PlazaSDK::GeoJsonGeometry }

      # @!attribute properties
      #
      #   @return [PlazaSDK::Models::NearestResult::Properties]
      required :properties, -> { PlazaSDK::NearestResult::Properties }

      # @!attribute type
      #
      #   @return [Symbol, PlazaSDK::Models::NearestResult::Type]
      required :type, enum: -> { PlazaSDK::NearestResult::Type }

      # @!method initialize(geometry:, properties:, type:)
      #   GeoJSON Point Feature snapped to the nearest road segment
      #
      #   @param geometry [PlazaSDK::Models::GeoJsonGeometry]
      #   @param properties [PlazaSDK::Models::NearestResult::Properties]
      #   @param type [Symbol, PlazaSDK::Models::NearestResult::Type]

      # @see PlazaSDK::Models::NearestResult#properties
      class Properties < PlazaSDK::Internal::Type::BaseModel
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

      # @see PlazaSDK::Models::NearestResult#type
      module Type
        extend PlazaSDK::Internal::Type::Enum

        FEATURE = :Feature

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
