# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::ElevationTest < Plaza::Test::ResourceTest
  def test_batch_required_params
    response = @plaza.elevation.batch(coordinates: [{lat: 48.8566, lng: 2.3522}, {lat: 45.764, lng: 4.8357}])

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

  def test_lookup_post
    response = @plaza.elevation.lookup_post

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
    response =
      @plaza.elevation.profile(
        coordinates: [{lat: 48.8566, lng: 2.3522}, {lat: 48.858, lng: 2.34}, {lat: 48.8584, lng: 2.2945}]
      )

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
