require "test_helper"

class ClusterTokenTest < Minitest::Test

  def test_cluster_token_list
    cluster_tokens = Buildkite::ClusterToken.list(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1")

    assert_equal Buildkite::Collection, cluster_tokens.class
    assert_equal Buildkite::ClusterToken, cluster_tokens.data.first.class
    assert_equal "Test Token", cluster_tokens.data.first.description
  end

  def test_cluster_token_retrieve
    cluster_token = Buildkite::ClusterToken.retrieve(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1", id: "9b1649bb-54fc-4e59-9918-53a0e7246414")

    assert_equal Buildkite::ClusterToken, cluster_token.class
    assert_equal "9b1649bb-54fc-4e59-9918-53a0e7246414", cluster_token.id
    assert_equal "Test Token", cluster_token.description
  end

  def test_cluster_token_create
    cluster_token = Buildkite::ClusterToken.create(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1", description: "Windows Agents")

    assert_equal Buildkite::ClusterToken, cluster_token.class
    assert_equal "Windows Agents", cluster_token.description
  end

  def test_cluster_token_update
    cluster_token = Buildkite::ClusterToken.update(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1", id: "95ad0d3f-bc8b-430b-9550-3f755def0a79", allowed_ip_addresses: "1.1.1.1")

    assert_equal Buildkite::ClusterToken, cluster_token.class
    assert_equal "1.1.1.1", cluster_token.allowed_ip_addresses
  end

  def test_cluster_token_delete
    cluster_token = Buildkite::ClusterToken.delete(cluster: "d346006f-74d3-4497-8a64-543ec5fefcc1", id: "95ad0d3f-bc8b-430b-9550-3f755def0a79")

    assert cluster_token
  end

end
