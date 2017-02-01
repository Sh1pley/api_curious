class GithubRepo < ApplicationRecord

  def self.gather_repos(user)
    GithubService.request_repos(user.login)
  end
end
