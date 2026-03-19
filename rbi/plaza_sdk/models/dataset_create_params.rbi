# typed: strong

module PlazaSDK
  module Models
    class DatasetCreateParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(PlazaSDK::DatasetCreateParams, PlazaSDK::Internal::AnyHash)
        end

      # Dataset name
      sig { returns(String) }
      attr_accessor :name

      # URL-friendly slug
      sig { returns(String) }
      attr_accessor :slug

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
          name: String,
          slug: String,
          attribution: T.nilable(String),
          description: T.nilable(String),
          license: T.nilable(String),
          source_url: T.nilable(String),
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Dataset name
        name:,
        # URL-friendly slug
        slug:,
        # Attribution text
        attribution: nil,
        # Dataset description
        description: nil,
        # License identifier
        license: nil,
        # Source data URL
        source_url: nil,
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
            request_options: PlazaSDK::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
