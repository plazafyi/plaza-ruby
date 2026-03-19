# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Tiles#get
    class TileGetParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      # @!attribute z
      #
      #   @return [Integer]
      required :z, Integer

      # @!attribute x
      #
      #   @return [Integer]
      required :x, Integer

      # @!attribute y_
      #
      #   @return [Integer]
      required :y_, Integer

      # @!method initialize(z:, x:, y_:, request_options: {})
      #   @param z [Integer]
      #   @param x [Integer]
      #   @param y_ [Integer]
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
