# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::GeocodeTest < Plaza::Test::ResourceTest
  def test_autocomplete_required_params
    response = @plaza.geocode.autocomplete(q: "221B Bak")

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
    response = @plaza.geocode.forward(q: "221B Baker Street, London")

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
    response = @plaza.geocode.reverse(geometry: {coordinates: [2.3522, 48.8566], type: :Point})

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
