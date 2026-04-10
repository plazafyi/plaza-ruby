# frozen_string_literal: true

require_relative "../test_helper"

class Plaza::Test::Resources::RoutingTest < Plaza::Test::ResourceTest
  def test_isochrone_required_params
    response = @plaza.routing.isochrone(geometry: {coordinates: [2.3522, 48.8566], type: :Point}, time: [1])

    assert_pattern do
      response => Plaza::Models::RoutingIsochroneResponse
    end

    assert_pattern do
      response => {
        features: ^(Plaza::Internal::Type::ArrayOf[Plaza::GeoJsonFeature]),
        type: Plaza::Models::RoutingIsochroneResponse::Type
      }
    end
  end

  def test_matrix_required_params
    response =
      @plaza.routing.matrix(
        destinations: [{coordinates: [2.2945, 48.8584], type: :Point}],
        origins: [
          {coordinates: [2.3522, 48.8566], type: :Point},
          {coordinates: [2.3376, 48.8606], type: :Point}
        ]
      )

    assert_pattern do
      response => ^(Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown])
    end
  end

  def test_nearest_required_params
    response = @plaza.routing.nearest(geometry: {coordinates: [2.3522, 48.8566], type: :Point})

    assert_pattern do
      response => Plaza::NearestResult
    end

    assert_pattern do
      response => {
        geometry: Plaza::Geometry,
        properties: Plaza::NearestResult::Properties,
        type: Plaza::NearestResult::Type
      }
    end
  end

  def test_route_required_params
    response =
      @plaza.routing.route(
        destination: {coordinates: [2.2945, 48.8584], type: :Point},
        origin: {coordinates: [2.3522, 48.8566], type: :Point}
      )

    assert_pattern do
      response => Plaza::RouteResult
    end

    assert_pattern do
      response => {
        geometry: Plaza::Geometry,
        properties: Plaza::RouteResult::Properties,
        type: Plaza::RouteResult::Type
      }
    end
  end
end
