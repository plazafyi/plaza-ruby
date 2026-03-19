# typed: strong

module Plaza
  module Models
    class ElementNearbyParams < Plaza::Internal::Type::BaseModel
      extend Plaza::Internal::Type::RequestParameters::Converter
      include Plaza::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Plaza::ElementNearbyParams, Plaza::Internal::AnyHash)
        end

      # Latitude (-90 to 90)
      sig { returns(Float) }
      attr_accessor :lat

      # Longitude (-180 to 180)
      sig { returns(Float) }
      attr_accessor :lng

      # Maximum results (default 20, max 100)
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Search radius in meters (default 500, max 10000)
      sig { returns(T.nilable(Integer)) }
      attr_reader :radius

      sig { params(radius: Integer).void }
      attr_writer :radius

      sig do
        params(
          lat: Float,
          lng: Float,
          limit: Integer,
          radius: Integer,
          request_options: Plaza::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Latitude (-90 to 90)
        lat:,
        # Longitude (-180 to 180)
        lng:,
        # Maximum results (default 20, max 100)
        limit: nil,
        # Search radius in meters (default 500, max 10000)
        radius: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            lat: Float,
            lng: Float,
            limit: Integer,
            radius: Integer,
            request_options: Plaza::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
