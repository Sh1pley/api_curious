class GithubFollow
  attr_reader :login,
              :url,
              :avatar

  def initialize(attrs = {})
    @login  = attrs[:login]
    @url    = attrs[:url]
    @avatar = attrs[:avatar_url]
  end

  def self.get_followers(user)
    GithubService.request_followers(user).map do |follower|
      new(follower)
    end
  end

  def self.see_following(user)
    GithubService.request_following(user).map do |following|
      new(following)
    end
  end
end