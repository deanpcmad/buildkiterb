module Buildkite
  class Job < Object

    class << self

      def retry(org: Buildkite.config.org, pipeline: Buildkite.config.pipeline, number:, job:)
        response = Client.put_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/jobs/#{job}/retry", body: {})
        Job.new response.body
      end

      def unblock(org: Buildkite.config.org, pipeline: Buildkite.config.pipeline, number:, job:, **args)
        response = Client.put_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/jobs/#{job}/unblock", body: args)
        Job.new response.body
      end

      def log(org: Buildkite.config.org, pipeline: Buildkite.config.pipeline, number:, job:)
        response = Client.get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/jobs/#{job}/log")
        JobLog.new response.body
      end

      def delete_log(org: Buildkite.config.org, pipeline: Buildkite.config.pipeline, number:, job:)
        Client.delete_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/jobs/#{job}/log")
      end

      def env(org: Buildkite.config.org, pipeline: Buildkite.config.pipeline, number:, job:)
        response = Client.get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/jobs/#{job}/env")
        JobEnv.new response.body["env"]
      end

    end

  end
end
