# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::ElementsTest < Plaza::Test::ResourceTest
  def test_retrieve_required_params
    response = @plaza.elements.retrieve(0, type: "type")

    assert_pattern do
      response => Plaza::GeoJsonFeature
    end

    assert_pattern do
      response => {
        geometry: Plaza::GeoJsonGeometry,
        properties: ^(Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]),
        type: Plaza::GeoJsonFeature::Type,
        id: String | nil,
        osm_id: Integer | nil
      }
    end
  end

  def test_batch_required_params
    response = @plaza.elements.batch(elements: [{id: 0, type: :node}])

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

  def test_nearby_required_params
    response = @plaza.elements.nearby(lat: 0, lng: 0)

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

  def test_query
    response = @plaza.elements.query

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
