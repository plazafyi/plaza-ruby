# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::FeaturesTest < Plaza::Test::ResourceTest
  def test_retrieve_required_params
    response = @plaza.features.retrieve(0, type: "type")

    assert_pattern do
      response => Plaza::GeoJsonFeature
    end

    assert_pattern do
      response => {
        geometry: Plaza::Geometry,
        properties: ^(Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]),
        type: Plaza::GeoJsonFeature::Type,
        id: String | nil
      }
    end
  end

  def test_batch_required_params
    response = @plaza.features.batch(elements: [{id: 21_154_906, type: :node}, {id: 4_589_123, type: :way}])

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
    response = @plaza.features.query

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
