# typed: strong

module Plaza
  module Models
    class OptimizeRetrieveParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::OptimizeRetrieveParams, Plaza::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :job_id

      sig do
        params(
          job_id: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(job_id:, request_options: {})
      end

      sig do
        override.returns(
          { job_id: String, request_options: Plaza::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
