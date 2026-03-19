# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Search#query
    class SearchQueryParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute q
      #   Search query string
      #
      #   @return [String]
      required :q, String

      # @!attribute cursor
      #   Cursor for pagination
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Maximum results (default 25, max 100)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(q:, cursor: nil, limit: nil, request_options: {})
      #   @param q [String] Search query string
      #
      #   @param cursor [String] Cursor for pagination
      #
      #   @param limit [Integer] Maximum results (default 25, max 100)
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
