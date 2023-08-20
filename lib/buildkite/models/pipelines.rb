module Buildkite
  class PipelinesResource < Resource
    
    def list(org:)
      response = get_request("organizations/#{org}/pipelines")
      Collection.from_response(response, type: Pipeline)
    end

    def get(org:, slug:)
      Pipeline.new get_request("organizations/#{org}/pipelines/#{slug}").body
    end

    def create(org:, name:, repository:, configuration:, **args)
      data = {name: name, repository: repository, configuration: configuration}
      Pipeline.new post_request("organizations/#{org}/pipelines", body: data.merge(args)).body
    end

    def update(org:, slug:, **args)
      Pipeline.new patch_request("organizations/#{org}/pipelines/#{slug}", body: args).body
    end

    def archive(org:, slug:)
      Pipeline.new post_request("organizations/#{org}/pipelines/#{slug}/archive", body: {}).body
    end

    def unarchive(org:, slug:)
      Pipeline.new post_request("organizations/#{org}/pipelines/#{slug}/unarchive", body: {}).body
    end

    def delete(org:, slug:)
      delete_request("organizations/#{org}/pipelines/#{slug}")
    end

    def webhook(org:, slug:)
      post_request("organizations/#{org}/pipelines/#{slug}/webhook", body: {})
    end

  end
end
