# typed: strong

module Plaza
  module Models
    class ElevationBatchParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::ElevationBatchParams, Plaza::Internal::AnyHash)
        end

      # Coordinates to look up elevations for (max 50)
      sig { returns(T::Array[Plaza::ElevationBatchParams::Coordinate]) }
      attr_accessor :coordinates

      # Response format: json (default), geojson, csv, ndjson
      sig { returns(T.nilable(String)) }
      attr_reader :format_

      sig { params(format_: String).void }
      attr_writer :format_

      sig do
        params(
          coordinates:
            T::Array[Plaza::ElevationBatchParams::Coordinate::OrHash],
          format_: String,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Coordinates to look up elevations for (max 50)
        coordinates:,
        # Response format: json (default), geojson, csv, ndjson
        format_: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            coordinates: T::Array[Plaza::ElevationBatchParams::Coordinate],
            format_: String,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Coordinate < Plaza::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Plaza::ElevationBatchParams::Coordinate,
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
