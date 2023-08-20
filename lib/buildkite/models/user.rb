module Buildkite
  class UserResource < Resource
    
    def get
      User.new get_request("user").body
    end

  end
end
