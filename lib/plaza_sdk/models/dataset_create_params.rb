# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Datasets#create
    class DatasetCreateParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

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

      # @!method initialize(name:, slug:, attribution: nil, description: nil, license: nil, source_url: nil, request_options: {})
      #   @param name [String] Dataset name
      #
      #   @param slug [String] URL-friendly slug
      #
      #   @param attribution [String, nil] Attribution text
      #
      #   @param description [String, nil] Dataset description
      #
      #   @param license [String, nil] License identifier
      #
      #   @param source_url [String, nil] Source data URL
      #
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
