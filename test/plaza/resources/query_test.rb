# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::QueryTest < Plaza::Test::ResourceTest
  def test_overpass_required_params
    response = @plaza.query.overpass(data: "data")

    assert_pattern do
      response => Plaza::FeatureCollection
    end

    assert_pattern do
      response => {
        features: ^(Plaza::Internal::Type::ArrayOf[Plaza::GeoJsonFeature]),
        type: Plaza::FeatureCollection::Type
      }
    end
  end

  def test_sparql_required_params
    response = @plaza.query.sparql(query: "query")

    assert_pattern do
      response => Plaza::SparqlResult
    end

    assert_pattern do
      response => {
        features: ^(Plaza::Internal::Type::ArrayOf[Plaza::GeoJsonFeature]),
        type: Plaza::SparqlResult::Type
      }
    end
  end
end
