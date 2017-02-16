class GithubService

  def self.github_request(params)
    Faraday.get("https://api.github.com/#{params}")
  end

  attr_reader :user
  def initialize(user)
    @user = user
  end

  def conn
    Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.params[:access_token] = user.token
    end
  end

  def request_followers
    @followers ||= parse_get("users/#{user.login}/followers")
  end

  def parse_get(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.request_followers(user)
    new(user).request_followers
  end

  def request_repos
    @repos ||= parse_get("users/#{user.login}/repos")
  end

  def self.request_repos(user)
    new(user).request_repos
  end

  def self.request_user(user)
    response = github_request("users/#{user.login}?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_repo(repo_name, user)
    response = github_request("repos/#{user.login}/#{repo_name}?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_commits(repo_name, user)
    response = github_request("repos/#{user.login}/#{repo_name}/commits?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end


  def self.request_following(user)
    response = github_request("users/#{user.login}/following?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
