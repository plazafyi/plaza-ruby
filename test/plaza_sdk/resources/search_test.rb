# frozen_string_literal: true

require_relative "../test_helper"

class PlazaSDK::Test::Resources::SearchTest < PlazaSDK::Test::ResourceTest
  def test_query_required_params
    response = @plaza.search.query(q: "q")

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
end
