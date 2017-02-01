class User < ApplicationRecord
  attr_reader :public_repos,
              :followers,
              :following

  def initialize(attrs = {})
    @public_repos = attrs[:public_repos]
    @followers    = attrs[:followers]
    @following    = attrs[:following]
  end

  def self.register(auth)
    User.find_or_create_by(uid: auth["uid"]) do |user|
      user.username = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
      user.avatar = auth["info"]["image"]
      user.login = auth["extra"]["raw_info"]["login"]
    end
  end

  def self.get_details(login)
    data = (GithubService.request_user(login))
    new(data)
  end
end
