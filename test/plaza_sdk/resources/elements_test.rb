# frozen_string_literal: true

require_relative "../test_helper"

class PlazaSDK::Test::Resources::ElementsTest < PlazaSDK::Test::ResourceTest
  def test_retrieve_required_params
    response = @plaza.elements.retrieve(0, type: "type")

    assert_pattern do
      response => PlazaSDK::GeoJsonFeature
    end

    assert_pattern do
      response => {
        geometry: PlazaSDK::GeoJsonGeometry,
        properties: ^(PlazaSDK::Internal::Type::HashOf[PlazaSDK::Internal::Type::Unknown]),
        type: PlazaSDK::GeoJsonFeature::Type,
        id: String | nil,
        osm_id: Integer | nil
      }
    end
  end

  def test_batch_required_params
    response = @plaza.elements.batch(elements: [{id: 0, type: :node}])

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

  def test_nearby_required_params
    response = @plaza.elements.nearby(lat: 0, lng: 0)

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

  def test_query
    response = @plaza.elements.query

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
