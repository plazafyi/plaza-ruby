# typed: strong

module Plaza
  module Models
    class BatchRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::BatchRequest, Plaza::Internal::AnyHash) }

      sig { returns(T::Array[Plaza::BatchRequest::Element]) }
      attr_accessor :elements

      sig do
        params(
          elements: T::Array[Plaza::BatchRequest::Element::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(elements:)
      end

      sig do
        override.returns({ elements: T::Array[Plaza::BatchRequest::Element] })
      end
      def to_hash
      end

      class Element < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::BatchRequest::Element, Plaza::Internal::AnyHash)
          end

        sig { returns(Integer) }
        attr_accessor :id

        sig { returns(Plaza::BatchRequest::Element::Type::OrSymbol) }
        attr_accessor :type

        sig do
          params(
            id: Integer,
            type: Plaza::BatchRequest::Element::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(id:, type:)
        end

        sig do
          override.returns(
            { id: Integer, type: Plaza::BatchRequest::Element::Type::OrSymbol }
          )
        end
        def to_hash
        end

        module Type
          extend Plaza::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Plaza::BatchRequest::Element::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NODE = T.let(:node, Plaza::BatchRequest::Element::Type::TaggedSymbol)
          WAY = T.let(:way, Plaza::BatchRequest::Element::Type::TaggedSymbol)
          RELATION =
            T.let(:relation, Plaza::BatchRequest::Element::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Plaza::BatchRequest::Element::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
