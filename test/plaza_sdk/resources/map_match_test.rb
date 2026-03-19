# frozen_string_literal: true

require_relative "../test_helper"

class PlazaSDK::Test::Resources::MapMatchTest < PlazaSDK::Test::ResourceTest
  def test_match_required_params
    response = @plaza.map_match.match(trace: {coordinates: [0], type: :Point})

    assert_pattern do
      response => PlazaSDK::MapMatchResult
    end

    assert_pattern do
      response => {
        geometry: PlazaSDK::GeoJsonGeometry,
        properties: PlazaSDK::MapMatchResult::Properties,
        type: PlazaSDK::MapMatchResult::Type,
        legs: ^(PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::HashOf[PlazaSDK::Internal::Type::Unknown]]) | nil
      }
    end
  end
end
