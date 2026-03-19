# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::RoutingTest < Plaza::Test::ResourceTest
  def test_isochrone_required_params
    response = @plaza.routing.isochrone(lat: 0, lng: 0, time: 0)

    assert_pattern do
      response => Plaza::GeoJsonFeature
    end

    assert_pattern do
      response => {
        geometry: Plaza::GeoJsonGeometry,
        properties: ^(Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown]),
        type: Plaza::GeoJsonFeature::Type,
        id: String | nil,
        osm_id: Integer | nil
      }
    end
  end

  def test_matrix_required_params
    response =
      @plaza.routing.matrix(
        destinations: {coordinates: [0], type: :Point},
        origins: {coordinates: [0], type: :Point}
      )

    assert_pattern do
      response => Plaza::MatrixResult
    end

    assert_pattern do
      response => {
        distances: ^(Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float, nil?: true]]),
        durations: ^(Plaza::Internal::Type::ArrayOf[Plaza::Internal::Type::ArrayOf[Float, nil?: true]])
      }
    end
  end

  def test_nearest_required_params
    response = @plaza.routing.nearest(lat: 0, lng: 0)

    assert_pattern do
      response => Plaza::NearestResult
    end

    assert_pattern do
      response => {
        geometry: Plaza::GeoJsonGeometry,
        properties: Plaza::NearestResult::Properties,
        type: Plaza::NearestResult::Type
      }
    end
  end

  def test_route_required_params
    response =
      @plaza.routing.route(
        destination: {coordinates: [0], type: :Point},
        origin: {coordinates: [0], type: :Point}
      )

    assert_pattern do
      response => Plaza::RouteResult
    end

    assert_pattern do
      response => {
        geometry: Plaza::GeoJsonGeometry,
        properties: Plaza::RouteResult::Properties,
        type: Plaza::RouteResult::Type
      }
    end
  end
end
