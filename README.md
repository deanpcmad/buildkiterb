# BuildkiteRB

BuiltkiteRB is a Ruby library for the Buildkite API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "buildkiterb"
```

## Usage

### Set Client Details

Firstly you'll need to create an API Token on [Buildkite](https://buildkite.com/user/api-access-tokens)
and then configure it like below.

Buildkite tokens are created for a single organization now, so I recommend setting the `org` the same way,
to tidy up your code.

You can optionally set a pipeline too.

```ruby
Buildkite.configure do |config|
  config.token    = ENV["BUILDKITE_TOKEN"]
  config.org      = ENV["BUILDKITE_ORG"]
  config.pipeline = ENV["BUILDKITE_PIPELINE"]
end

```

### Access Token

```ruby
# Get details of the current token
Buildkite::AccessToken.retrieve

# Revoke the current token
Buildkite::AccessToken.revoke
```

### Organizations

```ruby
# Retrieves an organization
Buildkite::Organization.get slug: "my-org-slug"
```

### Pipelines

```ruby
# List all pipelines for an org
Buildkite::Pipeline.list
#=> #<Buildkite::Collection...

# Get a pipeline
Buildkite::Pipeline.retrieve pipeline: "my pipeline"

# Create a Pipeline. View the 2 docs links for the correct params
# Docs: https://buildkite.com/docs/apis/rest-api/pipelines#create-a-yaml-pipeline
# Docs: https://buildkite.com/docs/apis/rest-api/pipelines#create-a-visual-step-pipeline
Buildkite::Pipeline.create name: "my pipeline", repository: "git@github.com:user/repo.git", configuration: {}

# Update a pipeline
# Docs: https://buildkite.com/docs/apis/rest-api/pipelines#update-a-pipeline
Buildkite::Pipeline.update pipeline: "my-pipeline", {}

# Archive a pipeline
Buildkite::Pipeline.archive pipeline: "my-pipeline"

# Unarchive a pipeline
Buildkite::Pipeline.unarchive pipeline: "my-pipeline"

# Delete a pipeline
Buildkite::Pipeline.delete pipeline: "my-pipeline"

# Setup automatic webhooks
# Returns 422 if not supported or cannot be done
Buildkite::Pipeline.webhook pipeline: "my-pipeline"
```

### Builds

```ruby
# List all builds
Buildkite::Build.list

# List all builds for an org
Buildkite::Build.list org: "org-slug"

# List all builds for a pipeline
Buildkite::Build.list org: "org-slug", pipeline: "pipeline-slug"

# Get a build
# The Build Number is used, not the ID
Buildkite::Build.retrieve pipeline: "pipeline-slug", number: 123

# Create a Build
# Docs: https://buildkite.com/docs/apis/rest-api/builds#create-a-build
Buildkite::Build.create pipeline: "pipeline-slug", commit: "abc123", branch: "master"

# Cancel a build
Buildkite::Build.cancel pipeline: "pipeline-slug", number: 123

# Rebuild a build
Buildkite::Build.rebuild pipeline: "pipeline-slug", number: 123
```

### Agents

```ruby
# List all agents for an org
Buildkite::Agent.list

# Get an agent
Buildkite::Agent.retrieve id: "abc123"

# Stop an agent
# To force an agent to stop, add `force: true`
Buildkite::Agent.stop id: "abc123"
```

### Jobs

```ruby
# Retry a job
Buildkite::Job.retry pipeline: "pipeline-slug", number: 123, job: "abc123"

# Unblock a job
# Docs: https://buildkite.com/docs/apis/rest-api/jobs#unblock-a-job
Buildkite::Job.unblock pipeline: "pipeline-slug", number: 123, job: "abc123", {}

# Get a job's logs
Buildkite::Job.log pipeline: "pipeline-slug", number: 123, job: "abc123"

# Delete a job's log
Buildkite::Job.delete_log pipeline: "pipeline-slug", number: 123, job: "abc123"

# Get a job's environment variables
Buildkite::Job.env pipeline: "pipeline-slug", number: 123, job: "abc123"
```

### Annotations

```ruby
# List annotations for a build
@client.annotations.list org: "org-slug", pipeline: "pipeline-slug", number: 123
```

### Artifacts

```ruby
# List artifacts for a build
Buildkite::Artifact.list pipeline: "pipeline-slug", number: 123

# List artifacts for a build job
Buildkite::Artifact.list pipeline: "pipeline-slug", number: 123, job: "abc123"

# Get an artifact
Buildkite::Artifact.retrieve pipeline: "pipeline-slug", number: 123, job: "abc123", id: "123abc"

# Download an artifact
Buildkite::Artifact.download pipeline: "pipeline-slug", number: 123, job: "abc123", id: "123abc"

# Delete an artifact
Buildkite::Artifact.delete pipeline: "pipeline-slug", number: 123, job: "abc123", id: "123abc"
```

### Emojis

```ruby
# List emojis for an organization
@client.emojis.list org: "org-slug"
```

### User

```ruby
# Get the current user
@client.user.get
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/buildkiterb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
