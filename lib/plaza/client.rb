# frozen_string_literal: true

module Plaza
  class Client < Plaza::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # rubocop:disable Style/MutableConstant
    # @type [Hash{Symbol=>String}]
    ENVIRONMENTS = {production: "https://plaza.fyi", local: "http://localhost:4000"}
    # rubocop:enable Style/MutableConstant

    # Plaza API key
    # @return [String]
    attr_reader :api_key

    # @return [Plaza::Resources::Elements]
    attr_reader :elements

    # @return [Plaza::Resources::Datasets]
    attr_reader :datasets

    # @return [Plaza::Resources::Geocode]
    attr_reader :geocode

    # @return [Plaza::Resources::Search]
    attr_reader :search

    # @return [Plaza::Resources::Routing]
    attr_reader :routing

    # @return [Plaza::Resources::Elevation]
    attr_reader :elevation

    # @return [Plaza::Resources::MapMatch]
    attr_reader :map_match

    # @return [Plaza::Resources::Optimize]
    attr_reader :optimize

    # @return [Plaza::Resources::Query]
    attr_reader :query

    # @return [Plaza::Resources::Tiles]
    attr_reader :tiles

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Plaza API key Defaults to `ENV["PLAZA_API_KEY"]`
    #
    # @param environment [:production, :local, nil] Specifies the environment to use for the API.
    #
    # Each environment maps to a different base URL:
    #
    # - `production` corresponds to `https://plaza.fyi`
    # - `local` corresponds to `http://localhost:4000`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["PLAZA_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["PLAZA_API_KEY"],
      environment: nil,
      base_url: ENV["PLAZA_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= Plaza::Client::ENVIRONMENTS.fetch(environment&.to_sym || :production) do
        message = "environment must be one of #{Plaza::Client::ENVIRONMENTS.keys}, got #{environment}"
        raise ArgumentError.new(message)
      end

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"PLAZA_API_KEY\"")
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @elements = Plaza::Resources::Elements.new(client: self)
      @datasets = Plaza::Resources::Datasets.new(client: self)
      @geocode = Plaza::Resources::Geocode.new(client: self)
      @search = Plaza::Resources::Search.new(client: self)
      @routing = Plaza::Resources::Routing.new(client: self)
      @elevation = Plaza::Resources::Elevation.new(client: self)
      @map_match = Plaza::Resources::MapMatch.new(client: self)
      @optimize = Plaza::Resources::Optimize.new(client: self)
      @query = Plaza::Resources::Query.new(client: self)
      @tiles = Plaza::Resources::Tiles.new(client: self)
    end
  end
end
