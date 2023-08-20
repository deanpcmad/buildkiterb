require "test_helper"

class JobTest < Minitest::Test

  def test_job_retry
    job = Buildkite::Job.retry(pipeline: "starter-buildkite-pipeline", number: 2, job: "018a1478-a14e-481c-b71e-588fd81027d2")

    assert_equal Buildkite::Job, job.class
    assert_equal "scheduled", job.state
  end

  def test_job_unblock
    job = Buildkite::Job.unblock(pipeline: "starter-buildkite-pipeline", number: 7, job: "018a147f-3801-464d-bfe2-d45b7cdb3178")

    assert_equal Buildkite::Job, job.class
    assert_equal "unblocked", job.state
  end

  def test_job_log
    job_log = Buildkite::Job.log(pipeline: "starter-buildkite-pipeline", number: 7, job: "018a147f-3803-4ade-8282-34aeaf0117e7")

    assert_equal Buildkite::JobLog, job_log.class
  end

  def test_job_delete_log
    job_log = Buildkite::Job.delete_log(pipeline: "starter-buildkite-pipeline", number: 7, job: "018a147f-3803-4ade-8282-34aeaf0117e7")

    assert job_log
  end

  def test_job_env
    job_env = Buildkite::Job.env(pipeline: "starter-buildkite-pipeline", number: 7, job: "018a147f-3803-4ade-8282-34aeaf0117e7")

    assert_equal Buildkite::JobEnv, job_env.class
    assert job_env.CI
    assert job_env.BUILDKITE
  end

end
