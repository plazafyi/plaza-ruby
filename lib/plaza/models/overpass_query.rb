# frozen_string_literal: true

module Plaza
  module Models
    class OverpassQuery < Plaza::Internal::Type::BaseModel
      # @!attribute data
      #   Overpass QL query string
      #
      #   @return [String]
      required :data, String

      # @!method initialize(data:)
      #   @param data [String] Overpass QL query string
    end
  end
end
