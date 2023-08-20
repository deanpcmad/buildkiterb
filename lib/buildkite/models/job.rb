module Buildkite
  class JobsResource < Resource

    def retry(org:, pipeline:, number:, job:)
      Job.new put_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/jobs/#{job}/retry", body: {}).body
    end

    def unblock(org:, pipeline:, number:, job:, **args)
      Job.new put_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/jobs/#{job}/unblock", body: args).body
    end

    def log(org:, pipeline:, number:, job:)
      JobLog.new get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/jobs/#{job}/log").body
    end

    def delete_log(org:, pipeline:, number:, job:)
      delete_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/jobs/#{job}/log")
    end

    def env(org:, pipeline:, number:, job:)
      JobEnv.new get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/jobs/#{job}/env").body["env"]
    end

  end
end
