# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::DatasetsTest < Plaza::Test::ResourceTest
  def test_create_required_params
    response = @plaza.datasets.create(name: "name", slug: "slug")

    assert_pattern do
      response => Plaza::Dataset
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
      response => Plaza::Dataset
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
      response => Plaza::DatasetList
    end

    assert_pattern do
      response => {
        datasets: ^(Plaza::Internal::Type::ArrayOf[Plaza::Dataset])
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
