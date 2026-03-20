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
        id: String | nil
      }
    end
  end

  def test_batch_required_params
    response = @plaza.elements.batch(elements: [{id: 21_154_906, type: :node}, {id: 4_589_123, type: :way}])

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

  def test_lookup
    response = @plaza.elements.lookup

    assert_pattern do
      response => Plaza::GeoJsonFeature
    end

    assert_pattern do
      response => {
        geometry: Plaza::GeoJsonGeometry,
        properties: ^(Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]),
        type: Plaza::GeoJsonFeature::Type,
        id: String | nil
      }
    end
  end

  def test_nearby
    response = @plaza.elements.nearby

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

  def test_nearby_post
    response = @plaza.elements.nearby_post

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

  def test_query_post
    response = @plaza.elements.query_post

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
