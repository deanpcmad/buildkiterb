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
@client = Buildkite::Client.new(access_token: "")
```

### Organizations

```ruby
# List all of your organizations
@client.organizations.list

# Retrieves an organization
@client.organizations.get slug: "my-org-slug"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/buildkiterb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
