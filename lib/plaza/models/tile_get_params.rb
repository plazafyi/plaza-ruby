# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Tiles#get
    class TileGetParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

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
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
