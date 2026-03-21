# frozen_string_literal: true

module Plaza
  [Plaza::Internal::Type::BaseModel, *Plaza::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Plaza::Internal::AnyHash) } }
  end

  Plaza::Internal::Util.walk_namespaces(Plaza::Models).each do |mod|
    case mod
    in Plaza::Internal::Type::Enum | Plaza::Internal::Type::Union
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

  Plaza::Internal::Util.walk_namespaces(Plaza::Models)
                       .lazy
                       .grep(Plaza::Internal::Type::Union)
                       .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

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

  # @type [Plaza::Internal::Type::Converter]
  MatrixResult = Plaza::Models::MatrixResult

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

  TileGetParams = Plaza::Models::TileGetParams
end
