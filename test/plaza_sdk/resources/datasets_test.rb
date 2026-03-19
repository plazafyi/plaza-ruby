# frozen_string_literal: true

require_relative "../test_helper"

class PlazaSDK::Test::Resources::DatasetsTest < PlazaSDK::Test::ResourceTest
  def test_create_required_params
    response = @plaza.datasets.create(name: "name", slug: "slug")

    assert_pattern do
      response => PlazaSDK::Dataset
    end

    assert_pattern do
      response => {
        id: String,
        inserted_at: Time,
        name: String,
        slug: String,
        updated_at: Time,
        attribution: String | nil,
        description: String | nil,
        license: String | nil,
        source_url: String | nil
      }
    end
  end

  def test_retrieve
    response = @plaza.datasets.retrieve("id")

    assert_pattern do
      response => PlazaSDK::Dataset
    end

    assert_pattern do
      response => {
        id: String,
        inserted_at: Time,
        name: String,
        slug: String,
        updated_at: Time,
        attribution: String | nil,
        description: String | nil,
        license: String | nil,
        source_url: String | nil
      }
    end
  end

  def test_list
    response = @plaza.datasets.list

    assert_pattern do
      response => PlazaSDK::DatasetList
    end

    assert_pattern do
      response => {
        datasets: ^(PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Dataset])
      }
    end
  end

  def test_delete
    response = @plaza.datasets.delete("id")

    assert_pattern do
      response => nil
    end
  end

  def test_features
    response = @plaza.datasets.features("id")

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
