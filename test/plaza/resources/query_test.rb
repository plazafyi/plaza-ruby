# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::QueryTest < Plaza::Test::ResourceTest
  def test_execute_required_params
    response = @plaza.query.execute(steps: [{type: :overpass}])

    assert_pattern do
      response => Plaza::Models::QueryExecuteResponse
    end

    assert_pattern do
      response => {
        steps: ^(Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]])
      }
    end
  end

  def test_overpass_required_params
    response =
      @plaza.query.overpass(data: "[out:json];node[amenity=cafe](around:500,48.8566,2.3522);out body;")

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
    response =
      @plaza.query.sparql(
        query: "SELECT ?s ?name WHERE { ?s osm:name ?name . ?s osm:amenity \"cafe\" } LIMIT 10"
      )

    assert_pattern do
      response => Plaza::SparqlResult
    end

    assert_pattern do
      response => {
        results: ^(Plaza::Internal::Type::ArrayOf[Plaza::SparqlResult::Result])
      }
    end
  end
end
