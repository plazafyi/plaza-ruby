# frozen_string_literal: true

require_relative "../test_helper"

class PlazaSDK::Test::Resources::RoutingTest < PlazaSDK::Test::ResourceTest
  def test_isochrone_required_params
    response = @plaza.routing.isochrone(lat: 0, lng: 0, time: 0)

    assert_pattern do
      response => PlazaSDK::GeoJsonFeature
    end

    assert_pattern do
      response => {
        geometry: PlazaSDK::GeoJsonGeometry,
        properties: ^(PlazaSDK::Internal::Type::HashOf[PlazaSDK::Internal::Type::Unknown]),
        type: PlazaSDK::GeoJsonFeature::Type,
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
      response => PlazaSDK::MatrixResult
    end

    assert_pattern do
      response => {
        distances: ^(PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::ArrayOf[Float, nil?: true]]),
        durations: ^(PlazaSDK::Internal::Type::ArrayOf[PlazaSDK::Internal::Type::ArrayOf[Float, nil?: true]])
      }
    end
  end

  def test_nearest_required_params
    response = @plaza.routing.nearest(lat: 0, lng: 0)

    assert_pattern do
      response => PlazaSDK::NearestResult
    end

    assert_pattern do
      response => {
        geometry: PlazaSDK::GeoJsonGeometry,
        properties: PlazaSDK::NearestResult::Properties,
        type: PlazaSDK::NearestResult::Type
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
      response => PlazaSDK::RouteResult
    end

    assert_pattern do
      response => {
        geometry: PlazaSDK::GeoJsonGeometry,
        properties: PlazaSDK::RouteResult::Properties,
        type: PlazaSDK::RouteResult::Type
      }
    end
  end
end
