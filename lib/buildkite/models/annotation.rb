module Buildkite
  class Annotation < Object

    class << self

      def list(org: Buildkite.config.org, pipeline: Buildkite.config.pipeline, build:)
        response = Client.get_request("organizations/#{org}/pipelines/#{pipeline}/builds/#{build}/annotations")
        Collection.from_response(response, type: Annotation)
      end

    end

  end
end
