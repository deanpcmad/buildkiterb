module Buildkite
  class Agent < Object

    class << self

      def list(org: Buildkite.config.org)
        response = Client.get_request("organizations/#{org}/agents")
        Collection.from_response(response, type: Agent)
      end

      def retrieve(org: Buildkite.config.org, id:)
        response = Client.get_request("organizations/#{org}/agents/#{id}")
        Agent.new response.body
      end

      def stop(org: Buildkite.config.org, id:, **args)
        Client.put_request("organizations/#{org}/agents/#{id}/stop", body: args)
      end

    end

  end
end
