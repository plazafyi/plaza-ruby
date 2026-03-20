# typed: strong

module Plaza
  AutocompleteResult = Plaza::Models::AutocompleteResult

  BatchRequest = Plaza::Models::BatchRequest

  Dataset = Plaza::Models::Dataset

  DatasetCreateParams = Plaza::Models::DatasetCreateParams

  DatasetDeleteParams = Plaza::Models::DatasetDeleteParams

  DatasetFeaturesParams = Plaza::Models::DatasetFeaturesParams

  DatasetList = Plaza::Models::DatasetList

  DatasetListParams = Plaza::Models::DatasetListParams

  DatasetRetrieveParams = Plaza::Models::DatasetRetrieveParams

  ElementBatchParams = Plaza::Models::ElementBatchParams

  ElementLookupParams = Plaza::Models::ElementLookupParams

  ElementNearbyParams = Plaza::Models::ElementNearbyParams

  ElementNearbyPostParams = Plaza::Models::ElementNearbyPostParams

  ElementQueryParams = Plaza::Models::ElementQueryParams

  ElementQueryPostParams = Plaza::Models::ElementQueryPostParams

  ElementRetrieveParams = Plaza::Models::ElementRetrieveParams

  ElevationBatchParams = Plaza::Models::ElevationBatchParams

  ElevationBatchResult = Plaza::Models::ElevationBatchResult

  ElevationLookupParams = Plaza::Models::ElevationLookupParams

  ElevationLookupPostParams = Plaza::Models::ElevationLookupPostParams

  ElevationLookupResult = Plaza::Models::ElevationLookupResult

  ElevationProfileParams = Plaza::Models::ElevationProfileParams

  ElevationProfileRequest = Plaza::Models::ElevationProfileRequest

  ElevationProfileResult = Plaza::Models::ElevationProfileResult

  Error = Plaza::Models::Error

  FeatureCollection = Plaza::Models::FeatureCollection

  GeocodeAutocompleteParams = Plaza::Models::GeocodeAutocompleteParams

  GeocodeAutocompletePostParams = Plaza::Models::GeocodeAutocompletePostParams

  GeocodeBatchParams = Plaza::Models::GeocodeBatchParams

  GeocodeForwardParams = Plaza::Models::GeocodeForwardParams

  GeocodeForwardPostParams = Plaza::Models::GeocodeForwardPostParams

  GeocodeResult = Plaza::Models::GeocodeResult

  GeocodeReverseParams = Plaza::Models::GeocodeReverseParams

  GeocodeReversePostParams = Plaza::Models::GeocodeReversePostParams

  GeocodingFeature = Plaza::Models::GeocodingFeature

  GeoJsonFeature = Plaza::Models::GeoJsonFeature

  GeoJsonGeometry = Plaza::Models::GeoJsonGeometry

  MapMatchMatchParams = Plaza::Models::MapMatchMatchParams

  MapMatchRequest = Plaza::Models::MapMatchRequest

  MapMatchResult = Plaza::Models::MapMatchResult

  MatrixRequest = Plaza::Models::MatrixRequest

  MatrixResult =
    T.let(Plaza::Models::MatrixResult, Plaza::Internal::Type::Converter)

  NearestResult = Plaza::Models::NearestResult

  OptimizeCompletedResult = Plaza::Models::OptimizeCompletedResult

  OptimizeCreateParams = Plaza::Models::OptimizeCreateParams

  OptimizeJobStatus = Plaza::Models::OptimizeJobStatus

  OptimizeProcessingResult = Plaza::Models::OptimizeProcessingResult

  OptimizeRequest = Plaza::Models::OptimizeRequest

  OptimizeResult = Plaza::Models::OptimizeResult

  OptimizeRetrieveParams = Plaza::Models::OptimizeRetrieveParams

  OverpassQuery = Plaza::Models::OverpassQuery

  QueryExecuteParams = Plaza::Models::QueryExecuteParams

  QueryOverpassParams = Plaza::Models::QueryOverpassParams

  QuerySparqlParams = Plaza::Models::QuerySparqlParams

  ReverseGeocodeResult = Plaza::Models::ReverseGeocodeResult

  RouteRequest = Plaza::Models::RouteRequest

  RouteResult = Plaza::Models::RouteResult

  RoutingIsochroneParams = Plaza::Models::RoutingIsochroneParams

  RoutingIsochronePostParams = Plaza::Models::RoutingIsochronePostParams

  RoutingMatrixParams = Plaza::Models::RoutingMatrixParams

  RoutingNearestParams = Plaza::Models::RoutingNearestParams

  RoutingNearestPostParams = Plaza::Models::RoutingNearestPostParams

  RoutingRouteParams = Plaza::Models::RoutingRouteParams

  SearchQueryParams = Plaza::Models::SearchQueryParams

  SearchQueryPostParams = Plaza::Models::SearchQueryPostParams

  SparqlQuery = Plaza::Models::SparqlQuery

  SparqlResult = Plaza::Models::SparqlResult

  TileGetParams = Plaza::Models::TileGetParams
end
