module Buildkite
  class AccessTokenResource < Resource
    
    def get
      AccessToken.new get_request("access-token").body
    end

    def revoke
      delete_request("access-token")
    end

  end
end
