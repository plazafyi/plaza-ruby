# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Datasets#features
    class DatasetFeaturesParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute cursor
      #   Cursor for pagination
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum results
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(id:, cursor: nil, limit: nil, request_options: {})
      #   @param id [String]
      #
      #   @param cursor [String] Cursor for pagination
      #
      #   @param limit [Integer] Maximum results
      #
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
