module Buildkite
  class Client
    BASE_URL = "https://api.buildkite.com/v2"

    attr_reader :access_token, :adapter

    def initialize(access_token:, adapter: Faraday.default_adapter, stubs: nil)
      @access_token = access_token
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def organizations
      OrganizationsResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, access_token
        
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
