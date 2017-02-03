class GithubService

  def self.github_request(params)
    Faraday.get("https://api.github.com/#{params}")
  end

  def self.request_repos(user)
    response = github_request("users/#{user.login}/repos?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
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

  def self.request_followers(user)
    response = github_request("users/#{user.login}/followers?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.request_following(user)
    response = github_request("users/#{user.login}/following?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end
end