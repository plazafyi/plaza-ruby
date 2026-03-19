# typed: strong

module PlazaSDK
  class Client < PlazaSDK::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    ENVIRONMENTS =
      T.let(
        { production: "https://plaza.fyi", local: "http://localhost:4000" },
        T::Hash[Symbol, String]
      )

    # Plaza API key
    sig { returns(String) }
    attr_reader :api_key

    sig { returns(PlazaSDK::Resources::Elements) }
    attr_reader :elements

    sig { returns(PlazaSDK::Resources::Datasets) }
    attr_reader :datasets

    sig { returns(PlazaSDK::Resources::Geocode) }
    attr_reader :geocode

    sig { returns(PlazaSDK::Resources::Search) }
    attr_reader :search

    sig { returns(PlazaSDK::Resources::Routing) }
    attr_reader :routing

    sig { returns(PlazaSDK::Resources::Elevation) }
    attr_reader :elevation

    sig { returns(PlazaSDK::Resources::MapMatch) }
    attr_reader :map_match

    sig { returns(PlazaSDK::Resources::Optimize) }
    attr_reader :optimize

    sig { returns(PlazaSDK::Resources::Query) }
    attr_reader :query

    sig { returns(PlazaSDK::Resources::Tiles) }
    attr_reader :tiles

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        environment: T.nilable(T.any(Symbol, String)),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Plaza API key Defaults to `ENV["PLAZA_API_KEY"]`
      api_key: ENV["PLAZA_API_KEY"],
      # Specifies the environment to use for the API.
      #
      # Each environment maps to a different base URL:
      #
      # - `production` corresponds to `https://plaza.fyi`
      # - `local` corresponds to `http://localhost:4000`
      environment: nil,
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["PLAZA_BASE_URL"]`
      base_url: ENV["PLAZA_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: PlazaSDK::Client::DEFAULT_MAX_RETRIES,
      timeout: PlazaSDK::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: PlazaSDK::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: PlazaSDK::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
