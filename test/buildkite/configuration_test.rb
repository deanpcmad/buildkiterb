require "test_helper"

class ConfigurationTest < Minitest::Test

  def setup
    Buildkite.config.token = "abc123"
  end

  def test_token
    assert_equal "abc123", Buildkite.config.token
  end

end
