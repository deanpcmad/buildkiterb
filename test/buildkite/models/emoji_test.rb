require "test_helper"

class EmojiTest < Minitest::Test

  def test_emoji_list
    emojis = Buildkite::Emoji.list

    assert_equal Buildkite::Collection, emojis.class
    assert_equal Buildkite::Emoji, emojis.data.first.class
    assert_equal "osv", emojis.data.first.name
  end

end
