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

      # URL-friendly identifier
      sig { returns(String) }
      attr_accessor :slug

      # Last update timestamp (UTC)
      sig { returns(Time) }
      attr_accessor :updated_at

      # Required attribution text
      sig { returns(T.nilable(String)) }
      attr_accessor :attribution

      # Dataset description
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # License identifier (e.g. CC-BY-4.0)
      sig { returns(T.nilable(String)) }
      attr_accessor :license

      # URL of the original data source
      sig { returns(T.nilable(String)) }
      attr_accessor :source_url

      # Metadata for a custom dataset. Datasets contain user-uploaded geospatial
      # features separate from the OSM data.
      sig do
        params(
          id: String,
          inserted_at: Time,
          name: String,
          slug: String,
          updated_at: Time,
          attribution: T.nilable(String),
          description: T.nilable(String),
          license: T.nilable(String),
          source_url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Dataset UUID
        id:,
        # Creation timestamp (UTC)
        inserted_at:,
        # Human-readable dataset name
        name:,
        # URL-friendly identifier
        slug:,
        # Last update timestamp (UTC)
        updated_at:,
        # Required attribution text
        attribution: nil,
        # Dataset description
        description: nil,
        # License identifier (e.g. CC-BY-4.0)
        license: nil,
        # URL of the original data source
        source_url: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            inserted_at: Time,
            name: String,
            slug: String,
            updated_at: Time,
            attribution: T.nilable(String),
            description: T.nilable(String),
            license: T.nilable(String),
            source_url: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
