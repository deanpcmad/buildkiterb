require "test_helper"

class ClusterTest < Minitest::Test

  def test_cluster_list
    clusters = Buildkite::Cluster.list

    assert_equal Buildkite::Collection, clusters.class
    assert_equal Buildkite::Cluster, clusters.data.first.class
    assert_equal "d346006f-74d3-4497-8a64-543ec5fefcc1", clusters.data.first.id
    assert_equal "Open Source", clusters.data.first.name
  end

  def test_cluster_retrieve
    cluster = Buildkite::Cluster.retrieve(id: "d346006f-74d3-4497-8a64-543ec5fefcc1")

    assert_equal Buildkite::Cluster, cluster.class
    assert_equal "Open Source", cluster.name
  end

  def test_cluster_create
    cluster = Buildkite::Cluster.create(name: "Private Apps")

    assert_equal Buildkite::Cluster, cluster.class
    assert_equal "Private Apps", cluster.name
  end

  def test_cluster_update
    cluster = Buildkite::Cluster.update(id: "efae9c9f-fe3a-4cb4-b470-ac3b8641d1c8", description: "Updated description")

    assert_equal Buildkite::Cluster, cluster.class
    assert_equal "Updated description", cluster.description
  end

  def test_cluster_delete
    cluster = Buildkite::Cluster.delete(id: "efae9c9f-fe3a-4cb4-b470-ac3b8641d1c8")

    assert cluster
  end

end
