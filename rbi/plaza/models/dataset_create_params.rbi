# typed: strong

module Plaza
  module Models
    class DatasetCreateParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::DatasetCreateParams, Plaza::Internal::AnyHash)
        end

      # Human-readable dataset name
      sig { returns(String) }
      attr_accessor :name

      # URL-friendly identifier (lowercase, hyphens, no spaces)
      sig { returns(String) }
      attr_accessor :slug

      # Required attribution text
      sig { returns(T.nilable(String)) }
      attr_accessor :attribution

      # Dataset description
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # License identifier (e.g. CC-BY-4.0)
      sig { returns(T.nilable(String)) }
      attr_accessor :license

      # Source data URL
      sig { returns(T.nilable(String)) }
      attr_accessor :source_url

      # Enable strict schema validation (default true)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :strict_mode

      sig do
        params(
          name: String,
          slug: String,
          attribution: T.nilable(String),
          description: T.nilable(String),
          license: T.nilable(String),
          source_url: T.nilable(String),
          strict_mode: T.nilable(T::Boolean),
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Human-readable dataset name
        name:,
        # URL-friendly identifier (lowercase, hyphens, no spaces)
        slug:,
        # Required attribution text
        attribution: nil,
        # Dataset description
        description: nil,
        # License identifier (e.g. CC-BY-4.0)
        license: nil,
        # Source data URL
        source_url: nil,
        # Enable strict schema validation (default true)
        strict_mode: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            slug: String,
            attribution: T.nilable(String),
            description: T.nilable(String),
            license: T.nilable(String),
            source_url: T.nilable(String),
            strict_mode: T.nilable(T::Boolean),
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
