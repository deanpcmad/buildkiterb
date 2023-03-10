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
  autoload :BuildsResource, "buildkite/resources/builds"
  autoload :JobsResource, "buildkite/resources/jobs"
  autoload :AgentsResource, "buildkite/resources/agents"
  autoload :AnnotationsResource, "buildkite/resources/annotations"
  autoload :ArtifactsResource, "buildkite/resources/artifacts"
  autoload :EmojisResource, "buildkite/resources/emojis"
  autoload :UserResource, "buildkite/resources/user"

  autoload :AccessToken, "buildkite/objects/access_token"
  autoload :Organization, "buildkite/objects/organization"
  autoload :Pipeline, "buildkite/objects/pipeline"
  autoload :Build, "buildkite/objects/build"
  autoload :Job, "buildkite/objects/job"
  autoload :JobLog, "buildkite/objects/job_log"
  autoload :JobEnv, "buildkite/objects/job_env"
  autoload :Agent, "buildkite/objects/agent"
  autoload :Annotation, "buildkite/objects/annotation"
  autoload :Artifact, "buildkite/objects/artifact"
  autoload :ArtifactDownload, "buildkite/objects/artifact_download"
  autoload :Emoji, "buildkite/objects/emoji"
  autoload :User, "buildkite/objects/user"

end
