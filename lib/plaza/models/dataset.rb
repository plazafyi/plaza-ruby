# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Datasets#create
    class Dataset < Plaza::Internal::Type::BaseModel
      # @!attribute id
      #   Dataset ID
      #
      #   @return [String]
      required :id, String

      # @!attribute inserted_at
      #   Creation timestamp
      #
      #   @return [Time]
      required :inserted_at, Time

      # @!attribute name
      #   Dataset name
      #
      #   @return [String]
      required :name, String

      # @!attribute slug
      #   URL-friendly slug
      #
      #   @return [String]
      required :slug, String

      # @!attribute updated_at
      #   Last update timestamp
      #
      #   @return [Time]
      required :updated_at, Time

      # @!attribute attribution
      #   Attribution text
      #
      #   @return [String, nil]
      optional :attribution, String, nil?: true

      # @!attribute description
      #   Dataset description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute license
      #   License identifier
      #
      #   @return [String, nil]
      optional :license, String, nil?: true

      # @!attribute source_url
      #   Source data URL
      #
      #   @return [String, nil]
      optional :source_url, String, nil?: true

      # @!method initialize(id:, inserted_at:, name:, slug:, updated_at:, attribution: nil, description: nil, license: nil, source_url: nil)
      #   @param id [String] Dataset ID
      #
      #   @param inserted_at [Time] Creation timestamp
      #
      #   @param name [String] Dataset name
      #
      #   @param slug [String] URL-friendly slug
      #
      #   @param updated_at [Time] Last update timestamp
      #
      #   @param attribution [String, nil] Attribution text
      #
      #   @param description [String, nil] Dataset description
      #
      #   @param license [String, nil] License identifier
      #
      #   @param source_url [String, nil] Source data URL
    end
  end
end
