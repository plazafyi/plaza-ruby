# frozen_string_literal: true

module PlazaSDK
  module Models
    class OverpassQuery < PlazaSDK::Internal::Type::BaseModel
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
