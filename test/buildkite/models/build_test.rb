require "test_helper"

class BuildTest < Minitest::Test

  def test_build_list_all
    builds = Buildkite::Build.list

    assert_equal Buildkite::Collection, builds.class
    assert_equal Buildkite::Build, builds.data.first.class
    assert_equal "018a1474-63cd-41f8-9b87-a66a72fe7034", builds.data.first.id
  end

  def test_build_list_org
    builds = Buildkite::Build.list(org: "dean-test")

    assert_equal Buildkite::Collection, builds.class
    assert_equal Buildkite::Build, builds.data.first.class
    assert_equal "018a1474-63cd-41f8-9b87-a66a72fe7034", builds.data.first.id
  end

  def test_build_list_pipeline
    builds = Buildkite::Build.list(org: "dean-test", pipeline: "starter-buildkite-pipeline")

    assert_equal Buildkite::Collection, builds.class
    assert_equal Buildkite::Build, builds.data.first.class
    assert_equal "018a1474-29cb-4d8a-af27-92fa5ba89d93", builds.data.first.id
  end

  def test_build_retrieve
    agent = Buildkite::Build.retrieve(pipeline: "starter-buildkite-pipeline", number: 1)

    assert_equal Buildkite::Build, agent.class
    assert_equal 1, agent.number
    assert_equal "passed", agent.state
  end

  def test_build_create
    agent = Buildkite::Build.create(pipeline: "starter-buildkite-pipeline", commit: "1234567890", branch: "master")

    assert_equal Buildkite::Build, agent.class
    assert_equal 2, agent.number
    assert_equal "scheduled", agent.state
    assert_equal "1234567890", agent.commit
  end

  def test_build_cancel
    agent = Buildkite::Build.cancel(pipeline: "starter-buildkite-pipeline", number: 5)

    assert_equal Buildkite::Build, agent.class
    assert_equal "canceling", agent.state
  end

  def test_build_rebuild
    agent = Buildkite::Build.rebuild(pipeline: "starter-buildkite-pipeline", number: 5)

    assert_equal Buildkite::Build, agent.class
    assert_equal 6, agent.number
    assert_equal "scheduled", agent.state
  end

end
