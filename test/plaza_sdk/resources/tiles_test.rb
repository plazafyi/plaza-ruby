# frozen_string_literal: true

require_relative "../test_helper"

class PlazaSDK::Test::Resources::TilesTest < PlazaSDK::Test::ResourceTest
  def test_get_required_params
    response = @plaza.tiles.get(0, z: 0, x: 0)

    assert_pattern do
      response => StringIO
    end
  end
end
