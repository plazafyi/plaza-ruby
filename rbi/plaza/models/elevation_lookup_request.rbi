# typed: strong

module Plaza
  module Models
    class ElevationLookupRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationLookupRequest, Plaza::Internal::AnyHash)
        end

      # Point or MultiPoint geometry to look up elevations for
      sig { returns(T.any(Plaza::PointGeometry, Plaza::MultiPointGeometry)) }
      attr_accessor :geometry

      # Request body for elevation lookup. Accepts a single Point or a MultiPoint
      # geometry.
      sig do
        params(
          geometry:
            T.any(
              Plaza::PointGeometry::OrHash,
              Plaza::MultiPointGeometry::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # Point or MultiPoint geometry to look up elevations for
        geometry:
      )
      end

      sig do
        override.returns(
          { geometry: T.any(Plaza::PointGeometry, Plaza::MultiPointGeometry) }
        )
      end
      def to_hash
      end

      # Point or MultiPoint geometry to look up elevations for
      module Geometry
        extend Plaza::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Plaza::PointGeometry, Plaza::MultiPointGeometry)
          end

        sig do
          override.returns(
            T::Array[Plaza::ElevationLookupRequest::Geometry::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
