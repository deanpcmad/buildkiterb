module Buildkite
  class EmojisResource < Resource
    
    def list(org:)
      response = get_request("organizations/#{org}/emojis")
      Collection.from_response(response, type: Emoji)
    end

  end
end
