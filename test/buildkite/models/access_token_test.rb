require "test_helper"

class AccessTokenTest < Minitest::Test

  def test_access_token_retrieve
    access_token = Buildkite::AccessToken.retrieve

    assert_equal Buildkite::AccessToken, access_token.class
    assert_equal "read_agents", access_token.scopes.first
  end

  def test_access_token_revoke
    access_token = Buildkite::AccessToken.revoke

    assert access_token
  end

end
