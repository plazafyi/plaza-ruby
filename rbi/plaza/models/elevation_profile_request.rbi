# typed: strong

module Plaza
  module Models
    class ElevationProfileRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationProfileRequest, Plaza::Internal::AnyHash)
        end

      # Path coordinates in order of travel (min 2, max 50)
      sig { returns(T::Array[Plaza::ElevationProfileRequest::Coordinate]) }
      attr_accessor :coordinates

      # Request body for elevation profile along a path. Provide at least 2 coordinates
      # defining the path. Maximum 50 coordinates per request.
      sig do
        params(
          coordinates:
            T::Array[Plaza::ElevationProfileRequest::Coordinate::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Path coordinates in order of travel (min 2, max 50)
        coordinates:
      )
      end

      sig do
        override.returns(
          { coordinates: T::Array[Plaza::ElevationProfileRequest::Coordinate] }
        )
      end
      def to_hash
      end

      class Coordinate < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Plaza::ElevationProfileRequest::Coordinate,
              Plaza::Internal::AnyHash
            )
          end

        # Latitude in decimal degrees (-90 to 90)
        sig { returns(Float) }
        attr_accessor :lat

        # Longitude in decimal degrees (-180 to 180)
        sig { returns(Float) }
        attr_accessor :lng

        # Geographic coordinate as a JSON object with `lat` and `lng` fields.
        sig { params(lat: Float, lng: Float).returns(T.attached_class) }
        def self.new(
          # Latitude in decimal degrees (-90 to 90)
          lat:,
          # Longitude in decimal degrees (-180 to 180)
          lng:
        )
        end

        sig { override.returns({ lat: Float, lng: Float }) }
        def to_hash
        end
      end
    end
  end
end
