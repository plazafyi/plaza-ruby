# frozen_string_literal: true

module Plaza
  module Models
    class BatchRequest < Plaza::Internal::Type::BaseModel
      # @!attribute elements
      #
      #   @return [Array<Plaza::Models::BatchRequest::Element>]
      required :elements, -> { Plaza::Internal::Type::ArrayOf[Plaza::BatchRequest::Element] }

      # @!method initialize(elements:)
      #   @param elements [Array<Plaza::Models::BatchRequest::Element>]

      class Element < Plaza::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [Integer]
        required :id, Integer

        # @!attribute type
        #
        #   @return [Symbol, Plaza::Models::BatchRequest::Element::Type]
        required :type, enum: -> { Plaza::BatchRequest::Element::Type }

        # @!method initialize(id:, type:)
        #   @param id [Integer]
        #   @param type [Symbol, Plaza::Models::BatchRequest::Element::Type]

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
