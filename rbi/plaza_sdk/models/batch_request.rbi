# typed: strong

module PlazaSDK
  module Models
    class BatchRequest < PlazaSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(PlazaSDK::BatchRequest, PlazaSDK::Internal::AnyHash)
        end

      sig { returns(T::Array[PlazaSDK::BatchRequest::Element]) }
      attr_accessor :elements

      sig do
        params(
          elements: T::Array[PlazaSDK::BatchRequest::Element::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(elements:)
      end

      sig do
        override.returns(
          { elements: T::Array[PlazaSDK::BatchRequest::Element] }
        )
      end
      def to_hash
      end

      class Element < PlazaSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(PlazaSDK::BatchRequest::Element, PlazaSDK::Internal::AnyHash)
          end

        sig { returns(Integer) }
        attr_accessor :id

        sig { returns(PlazaSDK::BatchRequest::Element::Type::OrSymbol) }
        attr_accessor :type

        sig do
          params(
            id: Integer,
            type: PlazaSDK::BatchRequest::Element::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(id:, type:)
        end

        sig do
          override.returns(
            {
              id: Integer,
              type: PlazaSDK::BatchRequest::Element::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend PlazaSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, PlazaSDK::BatchRequest::Element::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NODE =
            T.let(:node, PlazaSDK::BatchRequest::Element::Type::TaggedSymbol)
          WAY = T.let(:way, PlazaSDK::BatchRequest::Element::Type::TaggedSymbol)
          RELATION =
            T.let(
              :relation,
              PlazaSDK::BatchRequest::Element::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[PlazaSDK::BatchRequest::Element::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
