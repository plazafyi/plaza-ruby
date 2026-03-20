# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::RoutingTest < Plaza::Test::ResourceTest
  def test_isochrone_required_params
    response = @plaza.routing.isochrone(lat: 0, lng: 0, time: 0)

    assert_pattern do
      response => Plaza::Models::RoutingIsochroneResponse
    end

    assert_pattern do
      response => {
        features: ^(Plaza::Internal::Type::ArrayOf[Plaza::GeoJsonFeature]) | nil,
        geometry: Plaza::GeoJsonGeometry | nil,
        properties: Plaza::Models::RoutingIsochroneResponse::Properties | nil,
        type: Plaza::Models::RoutingIsochroneResponse::Type | nil
      }
    end
  end

  def test_isochrone_post_required_params
    response = @plaza.routing.isochrone_post(lat: 0, lng: 0, time: 0)

    assert_pattern do
      response => Plaza::Models::RoutingIsochronePostResponse
    end

    assert_pattern do
      response => {
        features: ^(Plaza::Internal::Type::ArrayOf[Plaza::GeoJsonFeature]) | nil,
        geometry: Plaza::GeoJsonGeometry | nil,
        properties: Plaza::Models::RoutingIsochronePostResponse::Properties | nil,
        type: Plaza::Models::RoutingIsochronePostResponse::Type | nil
      }
    end
  end

  def test_matrix_required_params
    response =
      @plaza.routing.matrix(
        destinations: [{lat: 48.8584, lng: 2.2945}],
        origins: [{lat: 48.8566, lng: 2.3522}, {lat: 48.8606, lng: 2.3376}]
      )

    assert_pattern do
      response => ^(Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown])
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

  def test_nearest_post_required_params
    response = @plaza.routing.nearest_post(lat: 0, lng: 0)

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
      @plaza.routing.route(destination: {lat: 48.8584, lng: 2.2945}, origin: {lat: 48.8566, lng: 2.3522})

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
