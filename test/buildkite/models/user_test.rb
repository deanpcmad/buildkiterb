require "test_helper"

class UserTest < Minitest::Test

  def test_user_retrieve
    user = Buildkite::User.retrieve

    assert_equal Buildkite::User, user.class
    assert_equal "Dean", user.name
  end

end
