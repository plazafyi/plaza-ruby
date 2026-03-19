# frozen_string_literal: true

module PlazaSDK
  [PlazaSDK::Internal::Type::BaseModel, *PlazaSDK::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, PlazaSDK::Internal::AnyHash) } }
  end

  PlazaSDK::Internal::Util.walk_namespaces(PlazaSDK::Models).each do |mod|
    case mod
    in PlazaSDK::Internal::Type::Enum | PlazaSDK::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  PlazaSDK::Internal::Util.walk_namespaces(PlazaSDK::Models)
                          .lazy
                          .grep(PlazaSDK::Internal::Type::Union)
                          .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  AutocompleteResult = PlazaSDK::Models::AutocompleteResult

  BatchRequest = PlazaSDK::Models::BatchRequest

  Dataset = PlazaSDK::Models::Dataset

  DatasetCreateParams = PlazaSDK::Models::DatasetCreateParams

  DatasetDeleteParams = PlazaSDK::Models::DatasetDeleteParams

  DatasetFeaturesParams = PlazaSDK::Models::DatasetFeaturesParams

  DatasetList = PlazaSDK::Models::DatasetList

  DatasetListParams = PlazaSDK::Models::DatasetListParams

  DatasetRetrieveParams = PlazaSDK::Models::DatasetRetrieveParams

  ElementBatchParams = PlazaSDK::Models::ElementBatchParams

  ElementNearbyParams = PlazaSDK::Models::ElementNearbyParams

  ElementQueryParams = PlazaSDK::Models::ElementQueryParams

  ElementRetrieveParams = PlazaSDK::Models::ElementRetrieveParams

  ElevationBatchParams = PlazaSDK::Models::ElevationBatchParams

  ElevationBatchResult = PlazaSDK::Models::ElevationBatchResult

  ElevationLookupParams = PlazaSDK::Models::ElevationLookupParams

  ElevationLookupResult = PlazaSDK::Models::ElevationLookupResult

  ElevationProfileParams = PlazaSDK::Models::ElevationProfileParams

  ElevationProfileRequest = PlazaSDK::Models::ElevationProfileRequest

  ElevationProfileResult = PlazaSDK::Models::ElevationProfileResult

  Error = PlazaSDK::Models::Error

  FeatureCollection = PlazaSDK::Models::FeatureCollection

  GeocodeAutocompleteParams = PlazaSDK::Models::GeocodeAutocompleteParams

  GeocodeBatchParams = PlazaSDK::Models::GeocodeBatchParams

  GeocodeForwardParams = PlazaSDK::Models::GeocodeForwardParams

  GeocodeResult = PlazaSDK::Models::GeocodeResult

  GeocodeReverseParams = PlazaSDK::Models::GeocodeReverseParams

  GeocodingFeature = PlazaSDK::Models::GeocodingFeature

  GeoJsonFeature = PlazaSDK::Models::GeoJsonFeature

  GeoJsonGeometry = PlazaSDK::Models::GeoJsonGeometry

  MapMatchMatchParams = PlazaSDK::Models::MapMatchMatchParams

  MapMatchRequest = PlazaSDK::Models::MapMatchRequest

  MapMatchResult = PlazaSDK::Models::MapMatchResult

  MatrixRequest = PlazaSDK::Models::MatrixRequest

  MatrixResult = PlazaSDK::Models::MatrixResult

  NearestResult = PlazaSDK::Models::NearestResult

  OptimizeCompletedResult = PlazaSDK::Models::OptimizeCompletedResult

  OptimizeCreateParams = PlazaSDK::Models::OptimizeCreateParams

  OptimizeJobStatus = PlazaSDK::Models::OptimizeJobStatus

  OptimizeProcessingResult = PlazaSDK::Models::OptimizeProcessingResult

  OptimizeRequest = PlazaSDK::Models::OptimizeRequest

  OptimizeResult = PlazaSDK::Models::OptimizeResult

  OptimizeRetrieveParams = PlazaSDK::Models::OptimizeRetrieveParams

  OverpassQuery = PlazaSDK::Models::OverpassQuery

  QueryOverpassParams = PlazaSDK::Models::QueryOverpassParams

  QuerySparqlParams = PlazaSDK::Models::QuerySparqlParams

  ReverseGeocodeResult = PlazaSDK::Models::ReverseGeocodeResult

  RouteRequest = PlazaSDK::Models::RouteRequest

  RouteResult = PlazaSDK::Models::RouteResult

  RoutingIsochroneParams = PlazaSDK::Models::RoutingIsochroneParams

  RoutingMatrixParams = PlazaSDK::Models::RoutingMatrixParams

  RoutingNearestParams = PlazaSDK::Models::RoutingNearestParams

  RoutingRouteParams = PlazaSDK::Models::RoutingRouteParams

  SearchQueryParams = PlazaSDK::Models::SearchQueryParams

  SparqlQuery = PlazaSDK::Models::SparqlQuery

  SparqlResult = PlazaSDK::Models::SparqlResult

  TileGetParams = PlazaSDK::Models::TileGetParams
end
