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

      # @!attribute scope
      #   Dataset scope: plaza (managed by Plaza) or user (user-owned)
      #
      #   @return [Symbol, Plaza::Models::Dataset::Scope]
      required :scope, enum: -> { Plaza::Dataset::Scope }

      # @!attribute slug
      #   URL-friendly identifier
      #
      #   @return [String]
      required :slug, String

      # @!attribute status
      #   Current processing status
      #
      #   @return [Symbol, Plaza::Models::Dataset::Status]
      required :status, enum: -> { Plaza::Dataset::Status }

      # @!attribute updated_at
      #   Last update timestamp (UTC)
      #
      #   @return [Time]
      required :updated_at, Time

      # @!attribute address_count
      #   Number of addresses in this dataset
      #
      #   @return [Integer, nil]
      optional :address_count, Integer

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

      # @!attribute edge_count
      #   Number of routing edges in this dataset
      #
      #   @return [Integer, nil]
      optional :edge_count, Integer

      # @!attribute error_message
      #   Error message if status is 'error'
      #
      #   @return [String, nil]
      optional :error_message, String, nil?: true

      # @!attribute feature_count
      #   Number of features in this dataset
      #
      #   @return [Integer, nil]
      optional :feature_count, Integer

      # @!attribute license
      #   License identifier (e.g. CC-BY-4.0)
      #
      #   @return [String, nil]
      optional :license, String, nil?: true

      # @!attribute schema_definition
      #   Detected or user-defined property schema
      #
      #   @return [Object, nil]
      optional :schema_definition, Plaza::Internal::Type::Unknown, nil?: true

      # @!attribute source_format
      #   Data format (geojson)
      #
      #   @return [String, nil]
      optional :source_format, String, nil?: true

      # @!attribute source_url
      #   URL of the original data source
      #
      #   @return [String, nil]
      optional :source_url, String, nil?: true

      # @!attribute storage_bytes
      #   Total storage consumed in bytes
      #
      #   @return [Integer, nil]
      optional :storage_bytes, Integer

      # @!attribute strict_mode
      #   Whether strict schema validation is enabled
      #
      #   @return [Boolean, nil]
      optional :strict_mode, Plaza::Internal::Type::Boolean

      # @!method initialize(id:, inserted_at:, name:, scope:, slug:, status:, updated_at:, address_count: nil, attribution: nil, description: nil, edge_count: nil, error_message: nil, feature_count: nil, license: nil, schema_definition: nil, source_format: nil, source_url: nil, storage_bytes: nil, strict_mode: nil)
      #   Metadata for a custom dataset. Datasets contain user-uploaded geospatial
      #   features separate from the OSM data.
      #
      #   @param id [String] Dataset UUID
      #
      #   @param inserted_at [Time] Creation timestamp (UTC)
      #
      #   @param name [String] Human-readable dataset name
      #
      #   @param scope [Symbol, Plaza::Models::Dataset::Scope] Dataset scope: plaza (managed by Plaza) or user (user-owned)
      #
      #   @param slug [String] URL-friendly identifier
      #
      #   @param status [Symbol, Plaza::Models::Dataset::Status] Current processing status
      #
      #   @param updated_at [Time] Last update timestamp (UTC)
      #
      #   @param address_count [Integer] Number of addresses in this dataset
      #
      #   @param attribution [String, nil] Required attribution text
      #
      #   @param description [String, nil] Dataset description
      #
      #   @param edge_count [Integer] Number of routing edges in this dataset
      #
      #   @param error_message [String, nil] Error message if status is 'error'
      #
      #   @param feature_count [Integer] Number of features in this dataset
      #
      #   @param license [String, nil] License identifier (e.g. CC-BY-4.0)
      #
      #   @param schema_definition [Object, nil] Detected or user-defined property schema
      #
      #   @param source_format [String, nil] Data format (geojson)
      #
      #   @param source_url [String, nil] URL of the original data source
      #
      #   @param storage_bytes [Integer] Total storage consumed in bytes
      #
      #   @param strict_mode [Boolean] Whether strict schema validation is enabled

      # Dataset scope: plaza (managed by Plaza) or user (user-owned)
      #
      # @see Plaza::Models::Dataset#scope
      module Scope
        extend Plaza::Internal::Type::Enum

        PLAZA = :plaza
        USER = :user

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Current processing status
      #
      # @see Plaza::Models::Dataset#status
      module Status
        extend Plaza::Internal::Type::Enum

        PENDING = :pending
        PROCESSING = :processing
        READY = :ready
        ERROR = :error

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
