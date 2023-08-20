module Buildkite
  class Emoji < Object

    class << self

      def list(org: Buildkite.config.org)
        response = Client.get_request("organizations/#{org}/emojis")
        Collection.from_response(response, type: Emoji)
      end

    end

  end
end
