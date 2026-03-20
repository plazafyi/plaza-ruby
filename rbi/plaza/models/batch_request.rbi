# typed: strong

module Plaza
  module Models
    class BatchRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::BatchRequest, Plaza::Internal::AnyHash) }

      # Array of element references to fetch
      sig { returns(T::Array[Plaza::BatchRequest::Element]) }
      attr_accessor :elements

      # Fetch multiple OSM elements by their type and ID in a single request. Maximum
      # 100 elements per batch.
      sig do
        params(
          elements: T::Array[Plaza::BatchRequest::Element::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Array of element references to fetch
        elements:
      )
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

        # OSM element ID
        sig { returns(Integer) }
        attr_accessor :id

        # OSM element type
        sig { returns(Plaza::BatchRequest::Element::Type::OrSymbol) }
        attr_accessor :type

        # Reference to a single OSM element
        sig do
          params(
            id: Integer,
            type: Plaza::BatchRequest::Element::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # OSM element ID
          id:,
          # OSM element type
          type:
        )
        end

        sig do
          override.returns(
            { id: Integer, type: Plaza::BatchRequest::Element::Type::OrSymbol }
          )
        end
        def to_hash
        end

        # OSM element type
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
