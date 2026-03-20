# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Datasets#create
    class Dataset < Plaza::Internal::Type::BaseModel
      # @!attribute id
      #   Dataset UUID
      #
      #   @return [String]
      required :id, String

      # @!attribute inserted_at
      #   Creation timestamp (UTC)
      #
      #   @return [Time]
      required :inserted_at, Time

      # @!attribute name
      #   Human-readable dataset name
      #
      #   @return [String]
      required :name, String

      # @!attribute slug
      #   URL-friendly identifier
      #
      #   @return [String]
      required :slug, String

      # @!attribute updated_at
      #   Last update timestamp (UTC)
      #
      #   @return [Time]
      required :updated_at, Time

      # @!attribute attribution
      #   Required attribution text
      #
      #   @return [String, nil]
      optional :attribution, String, nil?: true

      # @!attribute description
      #   Dataset description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute license
      #   License identifier (e.g. CC-BY-4.0)
      #
      #   @return [String, nil]
      optional :license, String, nil?: true

      # @!attribute source_url
      #   URL of the original data source
      #
      #   @return [String, nil]
      optional :source_url, String, nil?: true

      # @!method initialize(id:, inserted_at:, name:, slug:, updated_at:, attribution: nil, description: nil, license: nil, source_url: nil)
      #   Metadata for a custom dataset. Datasets contain user-uploaded geospatial
      #   features separate from the OSM data.
      #
      #   @param id [String] Dataset UUID
      #
      #   @param inserted_at [Time] Creation timestamp (UTC)
      #
      #   @param name [String] Human-readable dataset name
      #
      #   @param slug [String] URL-friendly identifier
      #
      #   @param updated_at [Time] Last update timestamp (UTC)
      #
      #   @param attribution [String, nil] Required attribution text
      #
      #   @param description [String, nil] Dataset description
      #
      #   @param license [String, nil] License identifier (e.g. CC-BY-4.0)
      #
      #   @param source_url [String, nil] URL of the original data source
    end
  end
end
