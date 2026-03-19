# typed: strong

module Plaza
  module Models
    GeocodeBatchResponse = T.let(T.anything, Plaza::Internal::Type::Converter)
  end
end
