# typed: strong

module Plaza
  module Models
    class Dataset < Plaza::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(Plaza::Dataset, Plaza::Internal::AnyHash) }

      # Dataset UUID
      sig { returns(String) }
      attr_accessor :id

      # Creation timestamp (UTC)
      sig { returns(Time) }
      attr_accessor :inserted_at

      # Human-readable dataset name
      sig { returns(String) }
      attr_accessor :name

      # Dataset scope: plaza (managed by Plaza) or user (user-owned)
      sig { returns(Plaza::Dataset::Scope::TaggedSymbol) }
      attr_accessor :scope

      # URL-friendly identifier
      sig { returns(String) }
      attr_accessor :slug

      # Current processing status
      sig { returns(Plaza::Dataset::Status::TaggedSymbol) }
      attr_accessor :status

      # Last update timestamp (UTC)
      sig { returns(Time) }
      attr_accessor :updated_at

      # Number of addresses in this dataset
      sig { returns(T.nilable(Integer)) }
      attr_reader :address_count

      sig { params(address_count: Integer).void }
      attr_writer :address_count

      # Required attribution text
      sig { returns(T.nilable(String)) }
      attr_accessor :attribution

      # Dataset description
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Number of routing edges in this dataset
      sig { returns(T.nilable(Integer)) }
      attr_reader :edge_count

      sig { params(edge_count: Integer).void }
      attr_writer :edge_count

      # Error message if status is 'error'
      sig { returns(T.nilable(String)) }
      attr_accessor :error_message

      # Number of features in this dataset
      sig { returns(T.nilable(Integer)) }
      attr_reader :feature_count

      sig { params(feature_count: Integer).void }
      attr_writer :feature_count

      # License identifier (e.g. CC-BY-4.0)
      sig { returns(T.nilable(String)) }
      attr_accessor :license

      # Detected or user-defined property schema
      sig { returns(T.nilable(T.anything)) }
      attr_accessor :schema_definition

      # Data format (geojson)
      sig { returns(T.nilable(String)) }
      attr_accessor :source_format

      # URL of the original data source
      sig { returns(T.nilable(String)) }
      attr_accessor :source_url

      # Total storage consumed in bytes
      sig { returns(T.nilable(Integer)) }
      attr_reader :storage_bytes

      sig { params(storage_bytes: Integer).void }
      attr_writer :storage_bytes

      # Whether strict schema validation is enabled
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :strict_mode

      sig { params(strict_mode: T::Boolean).void }
      attr_writer :strict_mode

      # Metadata for a custom dataset. Datasets contain user-uploaded geospatial
      # features separate from the OSM data.
      sig do
        params(
          id: String,
          inserted_at: Time,
          name: String,
          scope: Plaza::Dataset::Scope::OrSymbol,
          slug: String,
          status: Plaza::Dataset::Status::OrSymbol,
          updated_at: Time,
          address_count: Integer,
          attribution: T.nilable(String),
          description: T.nilable(String),
          edge_count: Integer,
          error_message: T.nilable(String),
          feature_count: Integer,
          license: T.nilable(String),
          schema_definition: T.nilable(T.anything),
          source_format: T.nilable(String),
          source_url: T.nilable(String),
          storage_bytes: Integer,
          strict_mode: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Dataset UUID
        id:,
        # Creation timestamp (UTC)
        inserted_at:,
        # Human-readable dataset name
        name:,
        # Dataset scope: plaza (managed by Plaza) or user (user-owned)
        scope:,
        # URL-friendly identifier
        slug:,
        # Current processing status
        status:,
        # Last update timestamp (UTC)
        updated_at:,
        # Number of addresses in this dataset
        address_count: nil,
        # Required attribution text
        attribution: nil,
        # Dataset description
        description: nil,
        # Number of routing edges in this dataset
        edge_count: nil,
        # Error message if status is 'error'
        error_message: nil,
        # Number of features in this dataset
        feature_count: nil,
        # License identifier (e.g. CC-BY-4.0)
        license: nil,
        # Detected or user-defined property schema
        schema_definition: nil,
        # Data format (geojson)
        source_format: nil,
        # URL of the original data source
        source_url: nil,
        # Total storage consumed in bytes
        storage_bytes: nil,
        # Whether strict schema validation is enabled
        strict_mode: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            inserted_at: Time,
            name: String,
            scope: Plaza::Dataset::Scope::TaggedSymbol,
            slug: String,
            status: Plaza::Dataset::Status::TaggedSymbol,
            updated_at: Time,
            address_count: Integer,
            attribution: T.nilable(String),
            description: T.nilable(String),
            edge_count: Integer,
            error_message: T.nilable(String),
            feature_count: Integer,
            license: T.nilable(String),
            schema_definition: T.nilable(T.anything),
            source_format: T.nilable(String),
            source_url: T.nilable(String),
            storage_bytes: Integer,
            strict_mode: T::Boolean
          }
        )
      end
      def to_hash
      end

      # Dataset scope: plaza (managed by Plaza) or user (user-owned)
      module Scope
        extend Plaza::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Plaza::Dataset::Scope) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PLAZA = T.let(:plaza, Plaza::Dataset::Scope::TaggedSymbol)
        USER = T.let(:user, Plaza::Dataset::Scope::TaggedSymbol)

        sig { override.returns(T::Array[Plaza::Dataset::Scope::TaggedSymbol]) }
        def self.values
        end
      end

      # Current processing status
      module Status
        extend Plaza::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Plaza::Dataset::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING = T.let(:pending, Plaza::Dataset::Status::TaggedSymbol)
        PROCESSING = T.let(:processing, Plaza::Dataset::Status::TaggedSymbol)
        READY = T.let(:ready, Plaza::Dataset::Status::TaggedSymbol)
        ERROR = T.let(:error, Plaza::Dataset::Status::TaggedSymbol)

        sig { override.returns(T::Array[Plaza::Dataset::Status::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
