# typed: strong

module Plaza
  module Models
    MatrixResult =
      T.let(
        Plaza::Internal::Type::HashOf[Plaza::Internal::Type::Unknown],
        Plaza::Internal::Type::Converter
      )
  end
end
