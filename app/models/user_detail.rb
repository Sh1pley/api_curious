class UserDetail
    attr_reader :public_repos,
                :followers,
                :following

  def initialize(attrs = {})
    @public_repos = attrs[:public_repos]
    @followers    = attrs[:followers]
    @following    = attrs[:following]
  end

  def self.get_details(user)
    data = GithubService.request_user(user)
    new(data)
  end
end