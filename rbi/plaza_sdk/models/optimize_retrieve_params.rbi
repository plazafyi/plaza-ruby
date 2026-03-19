# typed: strong

module PlazaSDK
  module Models
    class OptimizeRetrieveParams < PlazaSDK::Internal::Type::BaseModel
      extend PlazaSDK::Internal::Type::RequestParameters::Converter
      include PlazaSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(PlazaSDK::OptimizeRetrieveParams, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :job_id

      sig do
        params(
          job_id: String,
          request_options: PlazaSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(job_id:, request_options: {})
      end

      sig do
        override.returns(
          { job_id: String, request_options: PlazaSDK::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
