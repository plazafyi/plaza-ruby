# typed: strong

module PlazaSDK
  module Models
    GeocodeBatchResponse =
      T.let(T.anything, PlazaSDK::Internal::Type::Converter)
  end
end
