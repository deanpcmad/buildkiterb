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
and then set it like so: 

```ruby
@client = Buildkite::Client.new(token: "abc123")
```

### Access Token

```ruby
# Get details of the current token
@client.access_token.get

# Revoke the current token
@client.access_token.revoke
```

### Organizations

```ruby
# List all of your organizations
@client.organizations.list

# Retrieves an organization
@client.organizations.get slug: "my-org-slug"
```

### Pipelines

```ruby
# List all pipelines for an org
@client.pipelines.list org: "org-slug"
#=> #<Buildkite::Collection...

# Get a pipeline
@client.pipelines.get org: "org-slug", slug: "pipeline-slug"

# Create a Pipeline. View the 2 docs links for the correct params
# Docs: https://buildkite.com/docs/apis/rest-api/pipelines#create-a-yaml-pipeline
# Docs: https://buildkite.com/docs/apis/rest-api/pipelines#create-a-visual-step-pipeline
@client.pipelines.create org: "org-slug", name: "my pipeline", repository: "git@github.com:user/repo.git", configuration: {}

# Update a pipeline
# Docs: https://buildkite.com/docs/apis/rest-api/pipelines#update-a-pipeline
@client.pipelines.update org: "org-slug", slug: "my-pipeline", {}

# Archive a pipeline
@client.pipelines.archive org: "org-slug", slug: "my-pipeline"

# Unarchive a pipeline
@client.pipelines.unarchive org: "org-slug", slug: "my-pipeline"

# Delete a pipeline
@client.pipelines.delete org: "org-slug", slug: "my-pipeline"

# Setup automatic webhooks
# Returns 422 if not supported or cannot be done
@client.pipelines.webhook org: "org-slug", slug: "my-pipeline"
```

### Builds

```ruby
# List all builds
@client.builds.list

# List all builds for an org
@client.builds.list org: "org-slug"

# List all builds for a pipeline
@client.builds.list org: "org-slug", pipeline: "pipeline-slug"

# Get a build
# The Build Number is used, not the ID
@client.builds.get org: "org-slug", pipeline: "pipeline-slug", number: 123

# Create a Build
# Docs: https://buildkite.com/docs/apis/rest-api/builds#create-a-build
@client.builds.create org: "org-slug", pipeline: "pipeline-slug", commit: "abc123", branch: "master"

# Cancel a build
@client.builds.cancel org: "org-slug", pipeline: "pipeline-slug", number: 123

# Rebuild a build
@client.builds.rebuild org: "org-slug", pipeline: "pipeline-slug", number: 123
```

### Agents

```ruby
# List all agents for an org
@client.agents.list org: "org-slug"

# Get an agent
@client.agents.get org: "org-slug", id: "abc123"

# Stop an agent
# To force an agent to stop, add `force: true`
@client.agents.get org: "org-slug", id: "abc123"
```

### Jobs

```ruby
# Retry a job
@client.jobs.retry org: "org-slug", pipeline: "pipeline-slug", number: 123, job: "abc123"

# Unblock a job
# Docs: https://buildkite.com/docs/apis/rest-api/jobs#unblock-a-job
@client.jobs.unblock org: "org-slug", pipeline: "pipeline-slug", number: 123, job: "abc123", {}

# Get a job's logs
@client.jobs.log org: "org-slug", pipeline: "pipeline-slug", number: 123, job: "abc123"

# Delete a job's log
@client.jobs.delete_log org: "org-slug", pipeline: "pipeline-slug", number: 123, job: "abc123"

# Get a job's environment variables
@client.jobs.env org: "org-slug", pipeline: "pipeline-slug", number: 123, job: "abc123"
```

### Annotations

```ruby
# List annotations for a build
@client.annotations.list org: "org-slug", pipeline: "pipeline-slug", number: 123
```

### Artifacts

```ruby
# List artifacts for a build
@client.artifacts.list org: "org-slug", pipeline: "pipeline-slug", number: 123

# List artifacts for a build job
@client.artifacts.list org: "org-slug", pipeline: "pipeline-slug", number: 123, job: "abc123"

# Get an artifact
@client.artifacts.get org: "org-slug", pipeline: "pipeline-slug", number: 123, job: "abc123", id: "123abc"

# Download an artifact
@client.artifacts.download org: "org-slug", pipeline: "pipeline-slug", number: 123, job: "abc123", id: "123abc"

# Delete an artifact
@client.artifacts.delete org: "org-slug", pipeline: "pipeline-slug", number: 123, job: "abc123", id: "123abc"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/buildkiterb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
