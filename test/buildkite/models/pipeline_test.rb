require "test_helper"

class PipelineTest < Minitest::Test

  def test_pipeline_list
    pipelines = Buildkite::Pipeline.list

    assert_equal Buildkite::Collection, pipelines.class
    assert_equal Buildkite::Pipeline, pipelines.data.first.class
    assert_equal "Starter", pipelines.data.first.name
  end

  def test_pipeline_retrieve
    pipeline = Buildkite::Pipeline.retrieve(pipeline: "starter")

    assert_equal Buildkite::Pipeline, pipeline.class
    assert_equal "Starter", pipeline.name
  end

  def test_pipeline_retrieve_with_config
    Buildkite.config.pipeline = "starter"

    pipeline = Buildkite::Pipeline.retrieve

    assert_equal Buildkite::Pipeline, pipeline.class
    assert_equal "Starter", pipeline.name
  end

  def test_pipeline_create
    pipeline = Buildkite::Pipeline.create(
      name: "Starter Buildkite Pipeline",
      repository: "https://github.com/deanpcmad/starter.git",
      description: "This is a starter pipeline",
      configuration: "steps:\n  - label: \":pipeline:\"\n    command: \"buildkite-agent pipeline upload\""
    )

    assert_equal Buildkite::Pipeline, pipeline.class
    assert_equal "Starter Buildkite Pipeline", pipeline.name
    assert_equal "https://github.com/deanpcmad/starter.git", pipeline.repository
  end

  def test_pipeline_update
    pipeline = Buildkite::Pipeline.update(pipeline: "starter-buildkite-pipeline", description: "Updated description")

    assert_equal Buildkite::Pipeline, pipeline.class
    assert_equal "Updated description", pipeline.description
  end

  def test_pipeline_archive
    pipeline = Buildkite::Pipeline.archive(pipeline: "starter-buildkite-pipeline")

    assert_equal Buildkite::Pipeline, pipeline.class
    refute_nil pipeline.archived_at
  end

  def test_pipeline_unarchive
    pipeline = Buildkite::Pipeline.unarchive(pipeline: "starter-buildkite-pipeline")

    assert_equal Buildkite::Pipeline, pipeline.class
    assert_nil pipeline.archived_at
  end

  def test_pipeline_webhook
    pipeline = Buildkite::Pipeline.webhook(pipeline: "starter-buildkite-pipeline")

    assert pipeline
  end

  def test_pipeline_delete
    pipeline = Buildkite::Pipeline.delete(pipeline: "starter-buildkite-pipeline")

    assert pipeline
  end

end
