# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::GeocodeTest < Plaza::Test::ResourceTest
  def test_autocomplete_required_params
    response = @plaza.geocode.autocomplete(q: "q")

    assert_pattern do
      response => Plaza::AutocompleteResult
    end

    assert_pattern do
      response => {
        features: ^(Plaza::Internal::Type::ArrayOf[Plaza::GeocodingFeature]),
        type: Plaza::AutocompleteResult::Type
      }
    end
  end

  def test_batch_required_params
    response = @plaza.geocode.batch(addresses: ["string"])

    assert_pattern do
      response => Plaza::Internal::Type::Unknown
    end
  end

  def test_forward_required_params
    response = @plaza.geocode.forward(q: "q")

    assert_pattern do
      response => Plaza::GeocodeResult
    end

    assert_pattern do
      response => {
        features: ^(Plaza::Internal::Type::ArrayOf[Plaza::GeocodingFeature]),
        type: Plaza::GeocodeResult::Type
      }
    end
  end

  def test_reverse_required_params
    response = @plaza.geocode.reverse(lat: 0, lng: 0)

    assert_pattern do
      response => Plaza::ReverseGeocodeResult
    end

    assert_pattern do
      response => {
        features: ^(Plaza::Internal::Type::ArrayOf[Plaza::GeocodingFeature]),
        type: Plaza::ReverseGeocodeResult::Type
      }
    end
  end
end
