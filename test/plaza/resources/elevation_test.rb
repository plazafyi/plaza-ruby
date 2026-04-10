# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::ElevationTest < Plaza::Test::ResourceTest
  def test_lookup_required_params
    response = @plaza.elevation.lookup(geometry: {coordinates: [2.3522, 48.8566], type: :Point})

    assert_pattern do
      response => Plaza::ElevationLookupResult
    end

    assert_pattern do
      response => {
        geometry: Plaza::Geometry,
        properties: Plaza::ElevationLookupResult::Properties,
        type: Plaza::ElevationLookupResult::Type
      }
    end
  end

  def test_profile_required_params
    response =
      @plaza.elevation.profile(
        geometry: {coordinates: [[2.3522, 48.8566], [2.34, 48.858], [2.2945, 48.8584]], type: :LineString}
      )

    assert_pattern do
      response => Plaza::ElevationProfileResult
    end

    assert_pattern do
      response => {
        geometry: Plaza::Geometry,
        properties: Plaza::ElevationProfileResult::Properties,
        type: Plaza::ElevationProfileResult::Type
      }
    end
  end
end
