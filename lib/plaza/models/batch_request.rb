# frozen_string_literal: true

module Plaza
  module Models
    class BatchRequest < Plaza::Internal::Type::BaseModel
      # @!attribute elements
      #   Array of element references to fetch
      #
      #   @return [Array<Plaza::Models::BatchRequest::Element>]
      required :elements, -> { Plaza::Internal::Type::ArrayOf[Plaza::BatchRequest::Element] }

      # @!method initialize(elements:)
      #   Fetch multiple OSM elements by their type and ID in a single request. Maximum
      #   100 elements per batch.
      #
      #   @param elements [Array<Plaza::Models::BatchRequest::Element>] Array of element references to fetch

      class Element < Plaza::Internal::Type::BaseModel
        # @!attribute id
        #   OSM element ID
        #
        #   @return [Integer]
        required :id, Integer

        # @!attribute type
        #   OSM element type
        #
        #   @return [Symbol, Plaza::Models::BatchRequest::Element::Type]
        required :type, enum: -> { Plaza::BatchRequest::Element::Type }

        # @!method initialize(id:, type:)
        #   Reference to a single OSM element
        #
        #   @param id [Integer] OSM element ID
        #
        #   @param type [Symbol, Plaza::Models::BatchRequest::Element::Type] OSM element type

        # OSM element type
        #
        # @see Plaza::Models::BatchRequest::Element#type
        module Type
          extend Plaza::Internal::Type::Enum

          NODE = :node
          WAY = :way
          RELATION = :relation

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
