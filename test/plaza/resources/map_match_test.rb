# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::MapMatchTest < Plaza::Test::ResourceTest
  def test_match_required_params
    response =
      @plaza.map_match.match(
        coordinates: [{lat: 48.8566, lng: 2.3522}, {lat: 48.857, lng: 2.353}, {lat: 48.8575, lng: 2.354}]
      )

    assert_pattern do
      response => Plaza::MapMatchResult
    end

    assert_pattern do
      response => {
        features: ^(Plaza::Internal::Type::ArrayOf[Plaza::MapMatchResult::Feature]),
        matchings: ^(Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]]),
        type: Plaza::MapMatchResult::Type
      }
    end
  end
end
