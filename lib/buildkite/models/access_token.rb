module Buildkite
  class AccessToken < Object

    class << self

      def retrieve
        response = Client.get_request("access-token")
        AccessToken.new response.body
      end

      def revoke
        Client.delete_request("access-token")
      end

    end

  end
end
