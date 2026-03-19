# frozen_string_literal: true

require_relative "../test_helper"

class PlazaSDK::Test::Resources::ElevationTest < PlazaSDK::Test::ResourceTest
  def test_batch_required_params
    response = @plaza.elevation.batch(geometry: {coordinates: [0], type: :Point})

    assert_pattern do
      response => PlazaSDK::ElevationBatchResult
    end

    assert_pattern do
      response => {
        features: ^(PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::ElevationLookupResult]),
        type: PlazaSDK::ElevationBatchResult::Type
      }
    end
  end

  def test_lookup
    response = @plaza.elevation.lookup

    assert_pattern do
      response => PlazaSDK::ElevationLookupResult
    end

    assert_pattern do
      response => {
        geometry: PlazaSDK::GeoJsonGeometry,
        properties: PlazaSDK::ElevationLookupResult::Properties,
        type: PlazaSDK::ElevationLookupResult::Type
      }
    end
  end

  def test_profile_required_params
    response = @plaza.elevation.profile(geometry: {coordinates: [0], type: :Point})

    assert_pattern do
      response => PlazaSDK::ElevationProfileResult
    end

    assert_pattern do
      response => {
        geometry: PlazaSDK::GeoJsonGeometry,
        properties: PlazaSDK::ElevationProfileResult::Properties,
        type: PlazaSDK::ElevationProfileResult::Type
      }
    end
  end
end
