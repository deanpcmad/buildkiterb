module Buildkite
  class AnnotationsResource < Resource
    
    def list(org:, pipeline:, build:)
      response = get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{build}/annotations")
      Collection.from_response(response, type: Annotation)
    end

  end
end
