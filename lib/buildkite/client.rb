module Buildkite
  class Client
    BASE_URL = "https://api.buildkite.com/v2"

    attr_reader :token, :adapter

    def initialize(token:, adapter: Faraday.default_adapter, stubs: nil)
      @token = token
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def access_token
      AccessTokenResource.new(self)
    end

    def organizations
      OrganizationsResource.new(self)
    end

    def pipelines
      PipelinesResource.new(self)
    end

    def builds
      BuildsResource.new(self)
    end

    def jobs
      JobsResource.new(self)
    end

    def agents
      AgentsResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, token
        
        conn.headers = {
          "User-Agent" => "buildkiterb/v#{VERSION} (github.com/deanpcmad/buildkiterb)"
        }
        
        conn.request :json

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end

  end
end
