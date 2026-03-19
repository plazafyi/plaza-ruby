# frozen_string_literal: true

require_relative "../test_helper"

class PlazaSDK::Test::Resources::QueryTest < PlazaSDK::Test::ResourceTest
  def test_overpass_required_params
    response = @plaza.query.overpass(data: "data")

    assert_pattern do
      response => PlazaSDK::FeatureCollection
    end

    assert_pattern do
      response => {
        features: ^(PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::GeoJsonFeature]),
        type: PlazaSDK::FeatureCollection::Type
      }
    end
  end

  def test_sparql_required_params
    response = @plaza.query.sparql(query: "query")

    assert_pattern do
      response => PlazaSDK::SparqlResult
    end

    assert_pattern do
      response => {
        features: ^(PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::GeoJsonFeature]),
        type: PlazaSDK::SparqlResult::Type
      }
    end
  end
end
