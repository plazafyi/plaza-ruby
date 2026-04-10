# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::MapMatchTest < Plaza::Test::ResourceTest
  def test_match_required_params
    response =
      @plaza.map_match.match(
        geometry: {coordinates: [[2.3522, 48.8566], [2.353, 48.857], [2.354, 48.8575]], type: :LineString}
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
