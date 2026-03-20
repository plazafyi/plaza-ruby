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

  def test_autocomplete_post_required_params
    response = @plaza.geocode.autocomplete_post(q: "q")

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
      response => Plaza::Models::GeocodeBatchResponse
    end

    assert_pattern do
      response => {
        count: Integer,
        results: ^(Plaza::Internal::Type::ArrayOf[Plaza::GeocodeResult])
      }
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

  def test_forward_post_required_params
    response = @plaza.geocode.forward_post(q: "q")

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

  def test_reverse
    response = @plaza.geocode.reverse

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

  def test_reverse_post
    response = @plaza.geocode.reverse_post

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
