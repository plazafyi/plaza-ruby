# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::QueryTest < Plaza::Test::ResourceTest
  def test_execute_required_params
    response =
      @plaza.query.execute(
        data: "$$ = search(node, amenity: \"cafe\").around(distance: 500, geometry: point(48.8566, 2.3522));"
      )

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
