# frozen_string_literal: true

module PlazaSDK
  module Models
    # @see PlazaSDK::Resources::Elements#query
    class ElementQueryParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      # @!attribute bbox
      #   Bounding box: south,west,north,east. At least one of bbox or h3 is required.
      #
      #   @return [String, nil]
      optional :bbox, String

      # @!attribute cursor
      #   Cursor for pagination
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute h3
      #   H3 cell index. At least one of bbox or h3 is required.
      #
      #   @return [String, nil]
      optional :h3, String

      # @!attribute limit
      #   Maximum results (default 100, max 10000)
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute type
      #   Element types (comma-separated: node,way,relation)
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(bbox: nil, cursor: nil, h3: nil, limit: nil, type: nil, request_options: {})
      #   @param bbox [String] Bounding box: south,west,north,east. At least one of bbox or h3 is required.
      #
      #   @param cursor [String] Cursor for pagination
      #
      #   @param h3 [String] H3 cell index. At least one of bbox or h3 is required.
      #
      #   @param limit [Integer] Maximum results (default 100, max 10000)
      #
      #   @param type [String] Element types (comma-separated: node,way,relation)
      #
      #   @param request_options [PlazaSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
