# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::DatasetsTest < Plaza::Test::ResourceTest
  def test_create_required_params
    response = @plaza.datasets.create(name: "NYC Bike Lanes", slug: "nyc-bike-lanes")

    assert_pattern do
      response => Plaza::Dataset
    end

    assert_pattern do
      response => {
        id: String,
        inserted_at: Time,
        name: String,
        scope: Plaza::Dataset::Scope,
        slug: String,
        status: Plaza::Dataset::Status,
        updated_at: Time,
        address_count: Integer | nil,
        attribution: String | nil,
        description: String | nil,
        edge_count: Integer | nil,
        error_message: String | nil,
        feature_count: Integer | nil,
        license: String | nil,
        schema_definition: Plaza::Internal::Type::Unknown | nil,
        source_format: String | nil,
        source_url: String | nil,
        storage_bytes: Integer | nil,
        strict_mode: Plaza::Internal::Type::Boolean | nil
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
        scope: Plaza::Dataset::Scope,
        slug: String,
        status: Plaza::Dataset::Status,
        updated_at: Time,
        address_count: Integer | nil,
        attribution: String | nil,
        description: String | nil,
        edge_count: Integer | nil,
        error_message: String | nil,
        feature_count: Integer | nil,
        license: String | nil,
        schema_definition: Plaza::Internal::Type::Unknown | nil,
        source_format: String | nil,
        source_url: String | nil,
        storage_bytes: Integer | nil,
        strict_mode: Plaza::Internal::Type::Boolean | nil
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
end
