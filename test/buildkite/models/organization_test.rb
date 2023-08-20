require "test_helper"

class OrganizationTest < Minitest::Test

  def test_organization_retrieve
    organization = Buildkite::Organization.retrieve(slug: "dean-test")

    assert_equal Buildkite::Organization, organization.class
    assert_equal "dean-test", organization.slug
    assert_equal "Dean Test", organization.name
  end

end
