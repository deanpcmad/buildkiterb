require "test_helper"

class ClientTest < Minitest::Test
  def test_token
    client = Buildkite::Client.new token: "abc123"
    assert_equal "abc123", client.token
  end
end
