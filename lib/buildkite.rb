require "faraday"
require "json"
require "buildkite/version"

module Buildkite

  autoload :Client, "buildkite/client"
  autoload :Collection, "buildkite/collection"
  autoload :Error, "buildkite/error"
  autoload :Resource, "buildkite/resource"
  autoload :Object, "buildkite/object"
  
  autoload :AccessTokenResource, "buildkite/resources/access_token"
  autoload :OrganizationsResource, "buildkite/resources/organizations"
  autoload :PipelinesResource, "buildkite/resources/pipelines"

  autoload :AccessToken, "buildkite/objects/access_token"
  autoload :Organization, "buildkite/objects/organization"
  autoload :Pipeline, "buildkite/objects/pipeline"

end
