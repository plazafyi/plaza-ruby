# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Datasets#create
    class DatasetCreateParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute name
      #   Human-readable dataset name
      #
      #   @return [String]
      required :name, String

      # @!attribute slug
      #   URL-friendly identifier (lowercase, hyphens, no spaces)
      #
      #   @return [String]
      required :slug, String

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
      #   Source data URL
      #
      #   @return [String, nil]
      optional :source_url, String, nil?: true

      # @!method initialize(name:, slug:, attribution: nil, description: nil, license: nil, source_url: nil, request_options: {})
      #   @param name [String] Human-readable dataset name
      #
      #   @param slug [String] URL-friendly identifier (lowercase, hyphens, no spaces)
      #
      #   @param attribution [String, nil] Required attribution text
      #
      #   @param description [String, nil] Dataset description
      #
      #   @param license [String, nil] License identifier (e.g. CC-BY-4.0)
      #
      #   @param source_url [String, nil] Source data URL
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
