# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::MapMatchTest < Plaza::Test::ResourceTest
  def test_match_required_params
    response = @plaza.map_match.match(trace: {coordinates: [0], type: :Point})

    assert_pattern do
      response => Plaza::MapMatchResult
    end

    assert_pattern do
      response => {
        geometry: Plaza::GeoJsonGeometry,
        properties: Plaza::MapMatchResult::Properties,
        type: Plaza::MapMatchResult::Type,
        legs: ^(Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]]) | nil
      }
    end
  end
end
