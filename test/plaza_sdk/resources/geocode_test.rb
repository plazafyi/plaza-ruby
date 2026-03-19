# frozen_string_literal: true

require_relative "../test_helper"

class PlazaSDK::Test::Resources::GeocodeTest < PlazaSDK::Test::ResourceTest
  def test_autocomplete_required_params
    response = @plaza.geocode.autocomplete(q: "q")

    assert_pattern do
      response => PlazaSDK::AutocompleteResult
    end

    assert_pattern do
      response => {
        features: ^(PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::GeocodingFeature]),
        type: PlazaSDK::AutocompleteResult::Type
      }
    end
  end

  def test_batch_required_params
    response = @plaza.geocode.batch(addresses: ["string"])

    assert_pattern do
      response => PlazaSDK::Internal::Type::Unknown
    end
  end

  def test_forward_required_params
    response = @plaza.geocode.forward(q: "q")

    assert_pattern do
      response => PlazaSDK::GeocodeResult
    end

    assert_pattern do
      response => {
        features: ^(PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::GeocodingFeature]),
        type: PlazaSDK::GeocodeResult::Type
      }
    end
  end

  def test_reverse_required_params
    response = @plaza.geocode.reverse(lat: 0, lng: 0)

    assert_pattern do
      response => PlazaSDK::ReverseGeocodeResult
    end

    assert_pattern do
      response => {
        features: ^(PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::GeocodingFeature]),
        type: PlazaSDK::ReverseGeocodeResult::Type
      }
    end
  end
end
