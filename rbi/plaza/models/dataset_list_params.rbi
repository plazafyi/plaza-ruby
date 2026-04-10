# typed: strong

module Plaza
  module Models
    class DatasetListParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::DatasetListParams, Plaza::Internal::AnyHash)
        end

      # Filter by scope: plaza, user. Default shows user's own + plaza datasets.
      sig { returns(T.nilable(String)) }
      attr_reader :scope

      sig { params(scope: String).void }
      attr_writer :scope

      sig do
        params(
          scope: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter by scope: plaza, user. Default shows user's own + plaza datasets.
        scope: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { scope: String, request_options: Plaza::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
