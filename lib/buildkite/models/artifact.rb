module Buildkite
  class ArtifactsResource < Resource

    def list(org:, pipeline:, build:, job: nil)
      if job
        response = get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{build}/jobs/#{job}/artifacts")
      else
        response = get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{build}/artifacts")
      end

      Collection.from_response(response, type: Artifact)
    end

    def get(org:, pipeline:, build:, job:, id:)
      Artifact.new get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{build}/jobs/#{job}/artifacts/#{id}").body
    end

    def download(org:, pipeline:, build:, job:, id:)
      ArtifactDownload.new get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{build}/jobs/#{job}/artifacts/#{id}/download").body
    end

    def delete(org:, pipeline:, build:, job:, id:)
      delete_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{build}/jobs/#{job}/artifacts/#{id}")
    end

  end
end
