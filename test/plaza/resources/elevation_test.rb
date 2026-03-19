# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::ElevationTest < Plaza::Test::ResourceTest
  def test_batch_required_params
    response = @plaza.elevation.batch(geometry: {coordinates: [0], type: :Point})

    assert_pattern do
      response => Plaza::ElevationBatchResult
    end

    assert_pattern do
      response => {
        features: ^(Plaza::Internal::Type::ArrayOf[Plaza::ElevationLookupResult]),
        type: Plaza::ElevationBatchResult::Type
      }
    end
  end

  def test_lookup
    response = @plaza.elevation.lookup

    assert_pattern do
      response => Plaza::ElevationLookupResult
    end

    assert_pattern do
      response => {
        geometry: Plaza::GeoJsonGeometry,
        properties: Plaza::ElevationLookupResult::Properties,
        type: Plaza::ElevationLookupResult::Type
      }
    end
  end

  def test_profile_required_params
    response = @plaza.elevation.profile(geometry: {coordinates: [0], type: :Point})

    assert_pattern do
      response => Plaza::ElevationProfileResult
    end

    assert_pattern do
      response => {
        geometry: Plaza::GeoJsonGeometry,
        properties: Plaza::ElevationProfileResult::Properties,
        type: Plaza::ElevationProfileResult::Type
      }
    end
  end
end
