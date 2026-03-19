# typed: strong

module PlazaSDK
  module Models
    class Dataset < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(PlazaSDK::Dataset, PlazaSDK::Internal::AnyHash) }

      # Dataset ID
      sig { returns(String) }
      attr_accessor :id

      # Creation timestamp
      sig { returns(Time) }
      attr_accessor :inserted_at

      # Dataset name
      sig { returns(String) }
      attr_accessor :name

      # URL-friendly slug
      sig { returns(String) }
      attr_accessor :slug

      # Last update timestamp
      sig { returns(Time) }
      attr_accessor :updated_at

      # Attribution text
      sig { returns(T.nilable(String)) }
      attr_accessor :attribution

      # Dataset description
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # License identifier
      sig { returns(T.nilable(String)) }
      attr_accessor :license

      # Source data URL
      sig { returns(T.nilable(String)) }
      attr_accessor :source_url

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
        # Dataset ID
        id:,
        # Creation timestamp
        inserted_at:,
        # Dataset name
        name:,
        # URL-friendly slug
        slug:,
        # Last update timestamp
        updated_at:,
        # Attribution text
        attribution: nil,
        # Dataset description
        description: nil,
        # License identifier
        license: nil,
        # Source data URL
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
