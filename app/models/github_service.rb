class GithubService

  def self.request_repos(user)
    response = Faraday.get("https://api.github.com/users/#{user.login}/repos?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.request_user(user)
    response = Faraday.get("https://api.github.com/users/#{user.login}?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_repo(repo_name, user)
    response = Faraday.get("https://api.github.com/repos/#{user.login}/#{repo_name}?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_commits(repo_name, user)
    response = Faraday.get("https://api.github.com/repos/#{user.login}/#{repo_name}/commits?access_token=#{user.token}")
    JSON.parse(response.body, symbolize_names: true)
  end
end