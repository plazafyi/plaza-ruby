# typed: strong

module Plaza
  module Models
    class MapMatchRequest < Plaza::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Plaza::MapMatchRequest, Plaza::Internal::AnyHash) }

      # GPS coordinates to match, in order of travel (max 50 points)
      sig { returns(T::Array[Plaza::MapMatchRequest::Coordinate]) }
      attr_accessor :coordinates

      # Search radius per coordinate in meters. Must have the same length as
      # `coordinates` or be omitted entirely. Default: 50m per point.
      sig { returns(T.nilable(T::Array[Float])) }
      attr_accessor :radiuses

      # GPS trace to snap to the road network. Provide an array of coordinate objects
      # representing the GPS points. Maximum 50 points per request.
      sig do
        params(
          coordinates: T::Array[Plaza::MapMatchRequest::Coordinate::OrHash],
          radiuses: T.nilable(T::Array[Float])
        ).returns(T.attached_class)
      end
      def self.new(
        # GPS coordinates to match, in order of travel (max 50 points)
        coordinates:,
        # Search radius per coordinate in meters. Must have the same length as
        # `coordinates` or be omitted entirely. Default: 50m per point.
        radiuses: nil
      )
      end

      sig do
        override.returns(
          {
            coordinates: T::Array[Plaza::MapMatchRequest::Coordinate],
            radiuses: T.nilable(T::Array[Float])
          }
        )
      end
      def to_hash
      end

      class Coordinate < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Plaza::MapMatchRequest::Coordinate, Plaza::Internal::AnyHash)
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
