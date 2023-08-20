module Buildkite
  class User < Object

    class << self

      def retrieve
        response = Client.get_request("user")
        User.new response.body
      end

    end

  end
end
