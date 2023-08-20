module Buildkite
  class Build < Object

    class << self

      def list(org: nil, pipeline: nil)
        if org && pipeline
          response = Client.get_request("organizations/#{org}/pipelines/#{pipeline}/builds")
        elsif org
          response = Client.get_request("organizations/#{org}/builds")
        else
          response = Client.get_request("builds")
        end

        if response
          Collection.from_response(response, type: Build)
        end
      end

      def retrieve(org: Buildkite.config.org, pipeline: Buildkite.config.pipeline, number:)
        response = Client.get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}")
        Build.new response.body
      end

      def create(org: Buildkite.config.org, pipeline: Buildkite.config.pipeline, commit:, branch:, **args)
        data = {commit: commit, branch: branch}
        response = Client.post_request("organizations/#{org}/pipelines/#{pipeline}/builds", body: data.merge(args))
        Build.new response.body
      end

      def cancel(org: Buildkite.config.org, pipeline: Buildkite.config.pipeline, number:)
        response = Client.put_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/cancel", body: {})
        Build.new response.body
      end

      def rebuild(org: Buildkite.config.org, pipeline: Buildkite.config.pipeline, number:)
        response = Client.put_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/rebuild", body: {})
        Build.new response.body
      end

    end

  end
end
