$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "buildkite"

require "minitest/autorun"
require "faraday"
require "json"
require "vcr"
require "dotenv/load"

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :faraday

  config.filter_sensitive_data("<AUTHORIZATION>") { ENV["BUILDKITE_TOKEN"] }
end

Buildkite.configure do |config|
  config.token = ENV["BUILDKITE_TOKEN"]
end

class Minitest::Test

  def setup
    VCR.insert_cassette(name)
  end

  def teardown
    VCR.eject_cassette
  end

end
