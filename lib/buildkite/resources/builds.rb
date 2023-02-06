module Buildkite
  class BuildsResource < Resource
    
    def list(org: nil, pipeline: nil)
      if org && pipeline
        response = get_request("organizations/#{org}/pipelines/#{pipeline}/builds")
      elsif org
        response = get_request("organizations/#{org}/builds")
      else
        response = get_request("builds")
      end
        
      if response
        Collection.from_response(response, type: Build)
      end
    end

    def get(org:, pipeline:, number:)
      Build.new get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}").body
    end

    def create(org:, pipeline:, commit:, branch:, **args)
      data = {commit: commit, branch: branch}
      Build.new post_request("organizations/#{org}/pipelines/#{pipeline}/builds", body: data.merge(args)).body
    end

    def cancel(org:, pipeline:, number:)
      Build.new put_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/cancel", body: {}).body
    end

    def rebuild(org:, pipeline:, number:)
      Build.new put_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{number}/rebuild", body: {}).body
    end

  end
end
