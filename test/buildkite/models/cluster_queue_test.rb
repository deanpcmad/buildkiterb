require "test_helper"

class ClusterQueueTest < Minitest::Test

  def test_cluster_queue_list
    cluster_queues = Buildkite::ClusterQueue.list(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1")

    assert_equal Buildkite::Collection, cluster_queues.class
    assert_equal Buildkite::ClusterQueue, cluster_queues.data.first.class
    assert_equal "default", cluster_queues.data.first.key
  end

  def test_cluster_queue_retrieve
    cluster_queue = Buildkite::ClusterQueue.retrieve(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1", id: "1705cf68-e513-4336-a3a6-0c30b160a0d6")

    assert_equal Buildkite::ClusterQueue, cluster_queue.class
    assert_equal "default", cluster_queue.key
  end

  def test_cluster_queue_create
    cluster_queue = Buildkite::ClusterQueue.create(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1", key: "arm64")

    assert_equal Buildkite::ClusterQueue, cluster_queue.class
    assert_equal "arm64", cluster_queue.key
  end

  def test_cluster_queue_update
    cluster_queue = Buildkite::ClusterQueue.update(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1", id: "828f06ff-bb08-4258-8083-b6c65c7e2b29", description: "Queue for ARM builds")

    assert_equal Buildkite::ClusterQueue, cluster_queue.class
    assert_equal "Queue for ARM builds", cluster_queue.description
  end

  def test_cluster_queue_pause
    cluster_queue = Buildkite::ClusterQueue.pause(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1", id: "828f06ff-bb08-4258-8083-b6c65c7e2b29", note: "Paused while we investigate a security issue")

    assert_equal Buildkite::ClusterQueue, cluster_queue.class
    assert cluster_queue.dispatch_paused
  end

  def test_cluster_queue_resume
    cluster_queue = Buildkite::ClusterQueue.resume(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1", id: "828f06ff-bb08-4258-8083-b6c65c7e2b29")

    assert_equal Buildkite::ClusterQueue, cluster_queue.class
    refute cluster_queue.dispatch_paused
  end

  def test_cluster_queue_delete
    cluster_queue = Buildkite::ClusterQueue.delete(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1", id: "828f06ff-bb08-4258-8083-b6c65c7e2b29")

    assert cluster_queue
  end

end
