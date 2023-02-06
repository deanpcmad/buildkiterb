module Buildkite
  class OrganizationsResource < Resource
    
    def list
      response = get_request("organizations")
      Collection.from_response(response, type: Organization)
    end

    def get(slug:)
      Organization.new get_request("organizations/#{slug}").body
    end

  end
end
