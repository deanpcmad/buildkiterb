module Buildkite
  class AgentsResource < Resource
    
    def list(org:)
      response = get_request("organizations/#{org}/agents")
      Collection.from_response(response, type: Agent)
    end

    def get(org:, id:)
      Agent.new get_request("organizations/#{org}/agents/#{id}").body
    end

    def stop(org:, id:, **args)
      put_request("organizations/#{org}/agents/#{id}/stop", body: args)
    end

  end
end
