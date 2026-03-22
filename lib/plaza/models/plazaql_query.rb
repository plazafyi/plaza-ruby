# frozen_string_literal: true

module Plaza
  module Models
    class PlazaqlQuery < Plaza::Internal::Type::BaseModel
      # @!attribute data
      #   PlazaQL query string
      #
      #   @return [String]
      required :data, String

      # @!method initialize(data:)
      #   PlazaQL query request. The query is executed against Plaza's OSM database and
      #   results are returned as GeoJSON.
      #
      #   @param data [String] PlazaQL query string
    end
  end
end
