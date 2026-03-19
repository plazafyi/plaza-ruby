# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Datasets#features
    class DatasetFeaturesParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

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
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
