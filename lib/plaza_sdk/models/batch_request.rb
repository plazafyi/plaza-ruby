# frozen_string_literal: true

module PlazaSDK
  module Models
    class BatchRequest < PlazaSDK::Internal::Type::BaseModel
      # @!attribute elements
      #
      #   @return [Array<PlazaSDK::Models::BatchRequest::Element>]
      required :elements, -> { PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::BatchRequest::Element] }

      # @!method initialize(elements:)
      #   @param elements [Array<PlazaSDK::Models::BatchRequest::Element>]

      class Element < PlazaSDK::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [Integer]
        required :id, Integer

        # @!attribute type
        #
        #   @return [Symbol, PlazaSDK::Models::BatchRequest::Element::Type]
        required :type, enum: -> { PlazaSDK::BatchRequest::Element::Type }

        # @!method initialize(id:, type:)
        #   @param id [Integer]
        #   @param type [Symbol, PlazaSDK::Models::BatchRequest::Element::Type]

        # @see PlazaSDK::Models::BatchRequest::Element#type
        module Type
          extend PlazaSDK::Internal::Type::Enum

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
