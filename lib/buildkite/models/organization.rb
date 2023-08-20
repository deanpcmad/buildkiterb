module Buildkite
  class Organization < Object

    class << self

      def list
        response = Client.get_request("organizations")
        Collection.from_response(response, type: Organization)
      end

      def retrieve(slug:)
        response = Client.get_request("organizations/#{slug}")
        Organization.new(response.body)
      end

    end

  end
end
