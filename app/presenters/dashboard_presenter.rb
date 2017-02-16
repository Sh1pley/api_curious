class DashboardPresenter
  extend Forwardable

  def_delegator :database_user, :username

  def initialize(database_user)
    @database_user = database_user
  end

  def repos
    GithubRepo.gather_repos(database_user).sort_by {|repo| repo.updated_at}.reverse.take(5)
  end

  def followers
    GithubFollow.get_followers(database_user)
  end

  def following
    GithubFollow.see_following(database_user)
  end

  def name
    username.upcase
  end

  def avatar
    database_user.avatar
  end

  private
    attr_reader :database_user
end
