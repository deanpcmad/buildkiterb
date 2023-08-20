require "test_helper"

class AgentTest < Minitest::Test

  def test_agent_list
    agents = Buildkite::Agent.list

    assert_equal Buildkite::Collection, agents.class
    assert_equal Buildkite::Agent, agents.data.first.class
    assert_equal "018a1453-7390-4148-958d-72ac5568f9c1", agents.data.first.id
  end

  def test_agent_retrieve
    agent = Buildkite::Agent.retrieve(id: "018a1453-7390-4148-958d-72ac5568f9c1")

    assert_equal Buildkite::Agent, agent.class
    assert_equal "connected", agent.connection_state
  end

  def test_agent_stop
    agent = Buildkite::Agent.stop(id: "018a1453-7390-4148-958d-72ac5568f9c1")

    assert agent
  end

end
