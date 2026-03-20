# typed: strong

module Plaza
  module Models
    class QueryExecuteParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::QueryExecuteParams, Plaza::Internal::AnyHash)
        end

      # Ordered list of query steps to execute
      sig { returns(T::Array[Plaza::QueryExecuteParams::Step]) }
      attr_accessor :steps

      sig do
        params(
          steps: T::Array[Plaza::QueryExecuteParams::Step::OrHash],
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Ordered list of query steps to execute
        steps:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            steps: T::Array[Plaza::QueryExecuteParams::Step],
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Step < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::QueryExecuteParams::Step, Plaza::Internal::AnyHash)
          end

        # Step type: `overpass`, `sparql`, `filter`, or `transform`
        sig { returns(Plaza::QueryExecuteParams::Step::Type::OrSymbol) }
        attr_accessor :type

        # Query string for this step (required for overpass/sparql steps)
        sig { returns(T.nilable(String)) }
        attr_reader :query

        sig { params(query: String).void }
        attr_writer :query

        # A single pipeline step
        sig do
          params(
            type: Plaza::QueryExecuteParams::Step::Type::OrSymbol,
            query: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Step type: `overpass`, `sparql`, `filter`, or `transform`
          type:,
          # Query string for this step (required for overpass/sparql steps)
          query: nil
        )
        end

        sig do
          override.returns(
            {
              type: Plaza::QueryExecuteParams::Step::Type::OrSymbol,
              query: String
            }
          )
        end
        def to_hash
        end

        # Step type: `overpass`, `sparql`, `filter`, or `transform`
        module Type
          extend Plaza::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Plaza::QueryExecuteParams::Step::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OVERPASS =
            T.let(
              :overpass,
              Plaza::QueryExecuteParams::Step::Type::TaggedSymbol
            )
          SPARQL =
            T.let(:sparql, Plaza::QueryExecuteParams::Step::Type::TaggedSymbol)
          FILTER =
            T.let(:filter, Plaza::QueryExecuteParams::Step::Type::TaggedSymbol)
          TRANSFORM =
            T.let(
              :transform,
              Plaza::QueryExecuteParams::Step::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Plaza::QueryExecuteParams::Step::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
