# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::SearchTest < Plaza::Test::ResourceTest
  def test_query_required_params
    response = @plaza.search.query(q: "q")

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
end
