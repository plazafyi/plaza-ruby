# frozen_string_literal: true

module Plaza
  module Models
    # @see Plaza::Resources::Query#execute
    class QueryExecuteParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      # @!attribute steps
      #   Ordered list of query steps to execute
      #
      #   @return [Array<Plaza::Models::QueryExecuteParams::Step>]
      required :steps, -> { Plaza::Internal::Type::ArrayOf[Plaza::QueryExecuteParams::Step] }

      # @!method initialize(steps:, request_options: {})
      #   @param steps [Array<Plaza::Models::QueryExecuteParams::Step>] Ordered list of query steps to execute
      #
      #   @param request_options [Plaza::RequestOptions, Hash{Symbol=>Object}]

      class Step < Plaza::Internal::Type::BaseModel
        # @!attribute type
        #   Step type: `overpass`, `filter`, or `transform`
        #
        #   @return [Symbol, Plaza::Models::QueryExecuteParams::Step::Type]
        required :type, enum: -> { Plaza::QueryExecuteParams::Step::Type }

        # @!attribute query
        #   Query string for this step (required for overpass steps)
        #
        #   @return [String, nil]
        optional :query, String

        # @!method initialize(type:, query: nil)
        #   A single pipeline step
        #
        #   @param type [Symbol, Plaza::Models::QueryExecuteParams::Step::Type] Step type: `overpass`, `filter`, or `transform`
        #
        #   @param query [String] Query string for this step (required for overpass steps)

        # Step type: `overpass`, `filter`, or `transform`
        #
        # @see Plaza::Models::QueryExecuteParams::Step#type
        module Type
          extend Plaza::Internal::Type::Enum

          OVERPASS = :overpass
          FILTER = :filter
          TRANSFORM = :transform

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
